

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

public class voterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		DatabaseManager db = new DatabaseManager();
		java.sql.Connection con = db.getConnection();
		
		try {
			Statement ps1 = con.createStatement();
			ResultSet rs1 = ps1.executeQuery("select email,password from users where email='"+email+"'  and password = '" + password + "';");
			if(rs1.next()) {
				Cookie cookie = new Cookie("email", email);
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);
				response.sendRedirect("homepage.jsp");
			} else {
				out.println("<body>" +
						"<script>alert('Wrong Password / invalid email address.')</script>" +
						"<a href='index.jsp'> Go back </a>" +
						"</body>");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

}
