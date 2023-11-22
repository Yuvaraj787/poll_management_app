import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {

	public Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/voteapp","postgres","");
			return conn;
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
}
