package servlet;

import model.user.RegularUser;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.UUID;

public class UserRegistrationServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || email == null || password == null) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check for duplicate email
        for (String[] user : FileUtil.readAll(USER_FILE)) {
            if (user.length >= 3 && user[2].equalsIgnoreCase(email)) {
                request.setAttribute("error", "An account with this email already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
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
