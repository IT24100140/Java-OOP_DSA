package servlet;

import model.user.User;
import util.FileUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DeleteProfileServlet extends HttpServlet {

    private static final String USER_FILE = System.getProperty("user.home") + "/hotelapp/users.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> users = FileUtil.readAll(USER_FILE);
        List<String> updated = new ArrayList<>();

        for (String[] row : users) {
            if (row.length >= 5 && !row[0].equals(user.getId())) {
                updated.add(String.join("|", row));
            }
        }

        FileUtil.overwrite(USER_FILE, updated);

        session.invalidate(); // log the user out
        response.sendRedirect("goodbye.jsp"); // redirect to farewell page
    }
}
