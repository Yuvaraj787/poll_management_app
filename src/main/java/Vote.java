

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Vote extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String voterID = request.getParameter("voterID");
		String candidate = request.getParameter("candidate");
		
		DatabaseManager db = new DatabaseManager();
		java.sql.Connection con = db.getConnection();
		
		try {
			Statement ps1 = con.createStatement();
			ResultSet rs1 = ps1.executeQuery("select voter_card_number from temp_vc_number where voter_card_number='"+voterID+"'");
			if(rs1.next()) {
				
				response.sendRedirect("votercheck.jsp?voterid="+voterID);
				
			}else{
				
				Statement ps2 = con.createStatement();
				ResultSet rs2 = ps2.executeQuery("select voter_card_number from registered_voters where voter_card_number='"+voterID+"'");
				if(rs2.next()) {
					Statement ps3 = con.createStatement();
					ps3.executeQuery("insert into temp_vc_number(voter_card_number) values ('"+voterID+"')");
					Statement ps4 = con.createStatement();
					ps4.executeQuery("insert into vote(voter_card_number,candidate) values ('"+voterID+"','"+candidate+"')");
					response.sendRedirect("Thanks.jsp");
				} else {
					response.sendRedirect("wrongID.jsp");
				}
			}
		}catch(SQLException e) {
			out.println("Error by me " + e.getMessage());
		}
	}

}
