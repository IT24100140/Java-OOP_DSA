package servlet;

import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ToggleRoomAvailabilityServlet extends HttpServlet {
    private static final String ROOM_FILE = System.getProperty("user.home") + "/hotelapp/rooms.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNo = request.getParameter("roomNo");

        List<String[]> allRooms = FileUtil.readAll(ROOM_FILE);
        List<String> updated = new ArrayList<>();

        for (String[] row : allRooms) {
            if (row.length >= 5 && row[0].equals(roomNo)) {
                // Toggle availability
                row[3] = String.valueOf(!Boolean.parseBoolean(row[3]));
            }
            updated.add(String.join("|", row));
        }

        FileUtil.overwrite(ROOM_FILE, updated);
        response.sendRedirect("admin-rooms");
    }
}