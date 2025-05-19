package servlet;

import model.user.RegularUser;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class RegisterServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        List<String[]> users = FileUtil.readAll(USER_FILE);

        // Check for duplicate email
        for (String[] row : users) {
            if (row.length >= 3 && row[2].equalsIgnoreCase(email)) {
                request.setAttribute("error", "Email already exists.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }
        }

        String userId = "U" + UUID.randomUUID().toString().substring(0, 4);
        RegularUser user = new RegularUser(userId, name, email, password);

        String line = String.join("|", user.getId(), user.getName(), user.getEmail(), user.getPasswordHash(), user.getRole());
        FileUtil.append(USER_FILE, line);

        response.sendRedirect("login.jsp");
    }
}
