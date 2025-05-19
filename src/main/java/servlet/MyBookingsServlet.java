package servlet;

import model.reservation.Reservation;
import util.FileUtil;
import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MyBookingsServlet extends HttpServlet {

    private static final String RESERVATION_FILE = System.getProperty("user.home") + "/hotelapp/reservations.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> rows = FileUtil.readAll(RESERVATION_FILE);
        List<Reservation> myBookings = new ArrayList<>();

        for (String[] row : rows) {
            if (row.length >= 5 && row[1].equals(user.getId())) {
                myBookings.add(new Reservation(row[0], row[1], Integer.parseInt(row[2]), row[3], row[4]));
            }
        }

        request.setAttribute("myBookings", myBookings);
        request.getRequestDispatcher("mybookings.jsp").forward(request, response);
    }
}
