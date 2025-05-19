package servlet;

import model.reservation.Reservation;
import model.reservation.ReservationSorter;
import model.user.AdminUser;
import model.user.RegularUser;
import model.user.User;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

public class AdminDashboardServlet extends HttpServlet {

    private static final String RESERVATION_FILE = System.getProperty("user.home") + "/hotelapp/reservations.txt";
    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || !"admin".equalsIgnoreCase(loggedInUser.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        System.out.println("======================================");
        System.out.println("USER_HOME = " + System.getProperty("user.home"));
        System.out.println("Reading users from: " + USER_FILE);
        System.out.println("Reading reservations from: " + RESERVATION_FILE);
        System.out.println("======================================");

        // === Load reservations ===
        List<Reservation> reservations = new ArrayList<>();
        try {
            List<String[]> rows = FileUtil.readAll(RESERVATION_FILE);
            for (String[] row : rows) {
                if (row.length >= 5) {
                    reservations.add(new Reservation(
                            row[0], row[1], Integer.parseInt(row[2]), row[3], row[4]
                    ));
                }
            }
            ReservationSorter.quickSort(reservations, 0, reservations.size() - 1);
        } catch (Exception e) {
            System.out.println("❌ Failed to read reservations.txt: " + e.getMessage());
        }

        System.out.println("✅ Loaded " + reservations.size() + " reservations");

        // === Load users ===
        List<User> allUsers = new ArrayList<>();
        try {
            List<String> rawLines = Files.readAllLines(Path.of(USER_FILE));
            System.out.println("Raw users.txt contents:");
            for (String line : rawLines) {
                System.out.println("RAW LINE: >" + line + "<");
            }

            List<String[]> userRows = FileUtil.readAll(USER_FILE);
            for (String[] row : userRows) {
                System.out.println("ROW: " + Arrays.toString(row));
                if (row.length >= 5) {
                    User user = "admin".equalsIgnoreCase(row[4])
                            ? new AdminUser(row[0], row[1], row[2], row[3])
                            : new RegularUser(row[0], row[1], row[2], row[3]);
                    allUsers.add(user);
                    System.out.println("✅ Parsed user: " + user.getEmail());
                } else {
                    System.out.println("⚠️ Skipped invalid user row: " + Arrays.toString(row));
                }
            }
        } catch (Exception e) {
            System.out.println("❌ Failed to read users.txt: " + e.getMessage());
        }

        System.out.println("✅ Loaded " + allUsers.size() + " users");

        // === Pass to JSP ===
        request.setAttribute("reservations", reservations);
        request.setAttribute("allUsers", allUsers);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
