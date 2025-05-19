package servlet;

import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DeleteUserServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdToDelete = request.getParameter("userId");

        if (userIdToDelete == null || userIdToDelete.isEmpty()) {
            response.sendRedirect("admin"); // fallback
            return;
        }

        List<String[]> users = FileUtil.readAll(USER_FILE);
        List<String> updated = new ArrayList<>();

        for (String[] row : users) {
            if (row.length >= 1 && !row[0].equals(userIdToDelete)) {
                updated.add(String.join("|", row));
            }
        }

        FileUtil.overwrite(USER_FILE, updated);

        response.sendRedirect("admin"); // refresh admin dashboard
    }
}
