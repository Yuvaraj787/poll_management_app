

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

public class addPoll extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        try(PrintWriter out = response.getWriter()){

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int num = Integer.parseInt(request.getParameter("numOptions"));
            Cookie[] cookies = request.getCookies();

            boolean f = false;
            String email = "";
            if (cookies == null) {
                out.println(
                        "<h1>You are new user, go to home page and submit your institute's name"
                );
                return;
            } else {
                for (Cookie c : cookies) {
                    String tname = c.getName();
                    if (tname.equals("email")) {
                        f = true;
                        email = c.getValue();
                    }
                }
            }

            DatabaseManager db = new DatabaseManager();
            java.sql.Connection con = db.getConnection();

            PreparedStatement ps = null;
            String query = "create table " + title + "(description varchar(200)";
            String insertQuery = "insert into " + title + " values (?";
            for (int i = 1; i <= num; i++) {
                query += "," + request.getParameter("option" + i) + " int";
                insertQuery += ", 0";
            }
            query += ");";
            insertQuery += ");";
            try {
                ps = con.prepareStatement("insert into poll_entry values (?,?)");
                ps.setString(1, email);
                ps.setString(2, title);
                ps.executeUpdate();
                Statement s2 = con.createStatement();
                s2.executeUpdate(query);
                ps = con.prepareStatement(insertQuery);
                ps.setString(1, description);
                ps.executeUpdate();
                response.sendRedirect("homepage.jsp");
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                out.println("<div><h1>"+e.getMessage()+ "</h1><h2>"+query+"</h2><div>");
                e.printStackTrace();
            }
        }
    }
}
