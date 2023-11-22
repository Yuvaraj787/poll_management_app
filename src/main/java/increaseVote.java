

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.management.StandardEmitterMBean;
import java.util.concurrent.TimeUnit;

public class increaseVote extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = request.getParameter("title");
        String opt_value = request.getParameter("opt_value");
        DatabaseManager db = new DatabaseManager();
        java.sql.Connection con = db.getConnection();

        try {
            Statement s2 = null;
            try {
                s2 = con.createStatement();
                s2.executeUpdate("update " + title + " set " + opt_value + " = " + opt_value + " + 1");
                response.sendRedirect("homepage.jsp");
            } catch (SQLException ex) {
                out.println("<h1> option : " + title+ "opt : " + opt_value + ex.getMessage()+"</h1>");
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

}
