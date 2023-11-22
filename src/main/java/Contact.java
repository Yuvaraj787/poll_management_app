

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String pnumber = request.getParameter("pnumber");
		String email = request.getParameter("email");
		String comment = request.getParameter("comment");
		
		DatabaseManager db = new DatabaseManager();
		Connection con = db.getConnection();
		
		Statement ps = null;

		try {
			ps = con.createStatement();
			ps.executeQuery("insert into contact(name,pnumber,email,cmnt) values ('"+name+"','"+pnumber+"','"+email+"','"+comment+"')");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		response.sendRedirect("index.jsp");
	}

}
