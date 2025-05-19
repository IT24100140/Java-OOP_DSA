package servlet;

import model.room.Room;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RoomsServlet extends HttpServlet {

    private static final String ROOM_FILE = System.getProperty("user.home") + "/hotelapp/rooms.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String[]> rawRooms = FileUtil.readAll(ROOM_FILE);
        List<Room> allRooms = new ArrayList<>();

        for (String[] row : rawRooms) {
            if (row.length >= 5) {
                int roomNo = Integer.parseInt(row[0]);
                String type = row[1];
                double price = Double.parseDouble(row[2]);
                boolean available = Boolean.parseBoolean(row[3]);
                int maxGuests = Integer.parseInt(row[4]);

                Room room = new Room(roomNo, type, price, available, maxGuests);
                allRooms.add(room);
            }
        }

        request.setAttribute("allRooms", allRooms);
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
    }
}
