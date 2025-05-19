package servlet;

import model.user.*;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

public class UserLoginServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            List<String[]> users = FileUtil.readAll(USER_FILE);
            boolean matched = false;

            for (String[] row : users) {
                if (row.length >= 5 && row[2].equals(email) && row[3].equals(password)) {
                    // Match found
                    User user = "admin".equalsIgnoreCase(row[4])
                            ? new AdminUser(row[0], row[1], row[2], row[3])
                            : new RegularUser(row[0], row[1], row[2], row[3]);

                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);

                    // ✅ Redirect based on role
                    if ("admin".equalsIgnoreCase(user.getRole())) {
                        response.sendRedirect("admin");
                    } else {
                        response.sendRedirect("dashboard.jsp");
                    }

                    matched = true;
                    break; // ✅ Stop checking after match
                }
            }

            if (!matched) {
                // ❌ If no match found
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to read user data.");
        }
    }
}
