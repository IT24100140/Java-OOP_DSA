package model.room;

import model.room.Room;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class RoomsAdminServlet extends HttpServlet {
    private static final String ROOM_FILE = System.getProperty("user.home") + "/hotelapp/rooms.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> rows = FileUtil.readAll(ROOM_FILE);
        List<Room> allRooms = new ArrayList<>();

        for (String[] row : rows) {
            if (row.length >= 5) {
                allRooms.add(new Room(
                        Integer.parseInt(row[0]),
                        row[1],
                        Double.parseDouble(row[2]),
                        Boolean.parseBoolean(row[3]),
                        Integer.parseInt(row[4])
                ));
            }
        }

        request.setAttribute("allRooms", allRooms);
        request.getRequestDispatcher("admin-rooms.jsp").forward(request, response);
    }
}