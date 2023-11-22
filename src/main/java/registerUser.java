

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class registerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){

			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			DatabaseManager db = new DatabaseManager();
			java.sql.Connection con = db.getConnection();
			
			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement("insert into users values (?,?)");
				ps.setString(1, email);
				ps.setString(2, password);
				ps.executeUpdate();
				response.sendRedirect("index.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println("<h1>"+e.getMessage()+"</h1>");
				e.printStackTrace();
			}
		}
		
	}

}
