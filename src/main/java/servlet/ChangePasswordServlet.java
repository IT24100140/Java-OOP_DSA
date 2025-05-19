package servlet;

import model.user.User;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ChangePasswordServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        List<String[]> users = FileUtil.readAll(USER_FILE);
        List<String> updated = new ArrayList<>();

        for (String[] row : users) {
            if (row.length >= 5 && row[0].equals(user.getId())) {
                row[3] = newPassword; // update password
            }
            updated.add(String.join("|", row));
        }

        FileUtil.overwrite(USER_FILE, updated);
        user.setPasswordHash(newPassword); // update session
        session.setAttribute("user", user);

        response.sendRedirect("dashboard.jsp");
    }
}
