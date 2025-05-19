package servlet;

import model.room.Room;
import model.room.RoomBST;
import util.FileUtil;
import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

public class ReservationServlet extends HttpServlet {

    private static final String ROOM_FILE = System.getProperty("user.home") + "/hotelapp/rooms.txt";
    private static final String RESERVATION_FILE = System.getProperty("user.home") + "/hotelapp/reservations.txt";
    private static final String ALERT_FILE = System.getProperty("user.home") + "/hotelapp/admin_alerts.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomBST bst = new RoomBST();
        List<String[]> lines = FileUtil.readAll(ROOM_FILE);

        String guestParam = request.getParameter("guests");
        int guestCount = 0;
        if (guestParam != null && !guestParam.isEmpty()) {
            try {
                guestCount = Integer.parseInt(guestParam);
            } catch (NumberFormatException ignored) {}
        }

        for (String[] row : lines) {
            if (row.length >= 5) {
                int roomNo = Integer.parseInt(row[0]);
                String type = row[1];
                double price = Double.parseDouble(row[2]);
                boolean available = Boolean.parseBoolean(row[3]);
                int maxOccupants = Integer.parseInt(row[4]);

                if (available && (guestCount == 0 || guestCount <= maxOccupants)) {
                    Room room = new Room(roomNo, type, price, true, maxOccupants);
                    bst.insert(room);
                }
            }
        }

        List<Room> availableRooms = bst.inOrder();

        if (availableRooms.isEmpty()) {
            request.setAttribute("noRooms", true);
            FileUtil.append(ALERT_FILE, "ALERT: No rooms available for " + guestCount + " guests on " + new Date());
        }

        request.setAttribute("rooms", availableRooms);
        request.getRequestDispatcher("reserve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNoStr = request.getParameter("roomNo");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String guestCountStr = request.getParameter("guests");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (roomNoStr == null || checkIn == null || checkOut == null || guestCountStr == null || user == null) {
            response.sendRedirect("OOP_Final_war_exploded/reserve.jsp");
            return;
        }

        int guestCount = Integer.parseInt(guestCountStr);
        double pricePerNight = 0;
        String roomType = "";
        boolean capacityOk = false;

        List<String[]> allRooms = FileUtil.readAll(ROOM_FILE);

        for (String[] row : allRooms) {
            if (row.length >= 5 && row[0].equals(roomNoStr)) {
                int maxGuests = Integer.parseInt(row[4]);
                if (guestCount <= maxGuests) {
                    pricePerNight = Double.parseDouble(row[2]);
                    roomType = row[1];
                    capacityOk = true;
                } else {
                    request.setAttribute("error", "This room can accommodate up to " + maxGuests + " guests only.");
                    doGet(request, response);
                    return;
                }
                break;
            }
        }

        if (!capacityOk) {
            request.setAttribute("error", "Room data not found or capacity issue.");
            doGet(request, response);
            return;
        }

        // Calculate total price
        LocalDate in = LocalDate.parse(checkIn);
        LocalDate out = LocalDate.parse(checkOut);
        long nights = ChronoUnit.DAYS.between(in, out);
        double totalPrice = nights * pricePerNight;

        // Save reservation
        String reservationId = "R" + UUID.randomUUID().toString().substring(0, 4);
        String resLine = String.join("|", reservationId, user.getId(), roomNoStr, checkIn, checkOut, String.valueOf(guestCount));
        FileUtil.append(RESERVATION_FILE, resLine);

        // Update room availability
        List<String> updatedRooms = new ArrayList<>();
        for (String[] row : allRooms) {
            if (row.length >= 4 && row[0].equals(roomNoStr)) {
                row[3] = "false";
            }
            updatedRooms.add(String.join("|", row));
        }
        FileUtil.overwrite(ROOM_FILE, updatedRooms);

        // Redirect to reservation-summary.jsp with URL-safe parameters
        String redirectUrl = "reservation-summary.jsp"
                + "?room=" + URLEncoder.encode(roomNoStr, StandardCharsets.UTF_8)
                + "&type=" + URLEncoder.encode(roomType, StandardCharsets.UTF_8)
                + "&price=" + URLEncoder.encode(String.format("%.2f", pricePerNight), StandardCharsets.UTF_8)
                + "&guests=" + URLEncoder.encode(String.valueOf(guestCount), StandardCharsets.UTF_8)
                + "&checkIn=" + URLEncoder.encode(checkIn, StandardCharsets.UTF_8)
                + "&checkOut=" + URLEncoder.encode(checkOut, StandardCharsets.UTF_8)
                + "&total=" + URLEncoder.encode(String.format("%.2f", totalPrice), StandardCharsets.UTF_8);

        response.sendRedirect(redirectUrl);
    }
}