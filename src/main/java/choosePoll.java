

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Optional;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class choosePoll extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        String voteTitle = request.getParameter("voteTitle");
        try(PrintWriter out = response.getWriter()){
            try {
                Cookie voteCookie = new Cookie("vote", voteTitle);
                response.addCookie(voteCookie);
                response.sendRedirect("votepage.jsp");
            } catch (Exception e) {
                // TODO Auto-generated catch block
                out.println("<div>"+e.getMessage()+ "<div>");
                e.printStackTrace();
            }
        }
    }
}
