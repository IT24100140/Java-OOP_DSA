package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // File location: webapp/data/contacts.txt
        String filePath = System.getProperty("user.home") + "/hotelapp/contacts.txt";


        File file = new File(filePath);
        file.getParentFile().mkdirs(); // ensure /data exists

        try (PrintWriter writer = new PrintWriter(new FileWriter(file, true))) {
            writer.println("Name: " + name);
            writer.println("Email: " + email);
            writer.println("Subject: " + subject);
            writer.println("Message: " + message);
            writer.println("----------");
        }
        System.out.println("Saving to: " + filePath);


        response.sendRedirect("thankyou.jsp");

    }
}
