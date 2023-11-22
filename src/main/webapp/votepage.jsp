<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vote the Poll</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body style="font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; ">
<div class="vote-poll-container">
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection (replace with your database credentials)
            String url = "jdbc:postgresql://localhost:5432/voteapp";
            String username = "postgres";
            String password = "";
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Get poll description and options from the 'vote' cookie
            Cookie[] cookies = request.getCookies();
            String tableName = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("vote")) {
                        tableName = cookie.getValue();
                        break;
                    }
                }
            }

            // Fetch description and options from the specified table
            String query = "SELECT description, * FROM " + tableName;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String description = rs.getString("description");

                out.println("<p classname='title' style='font-size: 43px;\n" +
                        "            color: #007bff; /* Blue color for title */\n" +
                        "            text-align: center; font-weight: 900;\n" +
                        "            margin-top: 30px;'>" + tableName + "</p>");
                out.println("<p classname='desc' style='font-size: 28px;\n" +
                        "            color: #333; /* Darker text color for description */\n" +
                        "            text-align: center;\n" +
                        "            margin-bottom: 30px;'>" + description + "</p>");

                ResultSetMetaData rsmd = rs.getMetaData();
                int numColumns = rsmd.getColumnCount();
                out.println("<div classname='par' style='display: flex;\n" +
                        "            justify-content: center; flex-direction: column\n" +
                        "            align-items: center;\n'>");
                for (int i = 3; i <= numColumns; i++) {
                    String option = rsmd.getColumnName(i);
                    out.println("<form id='form" + i + "' action='increaseVote' method='post'>" +
                            "<input type='text' name='title' value='"+ tableName +"' style='display:none'>" +
                            "<input type='text' name='opt_value' value='"+option+"' style='display: none;'>"+
                            "<div classname='child' style=' padding: 15px;\n" +
                            "            margin: 10px;\n" +
                            "            background-color: #c6e5d9; /* Soft light green */\n" +
                            "            color: #333; /* Darker text color */\n" +
                            "            border-radius: 5px; font-weight: 900; font-size: 50px\n" +
                            "            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);\n" +
                            "            cursor: pointer;\n" +
                            "            transition: background-color 0.3s ease;' " +
                            "onclick='castVote(\"" + i + "\")'>" + option + "</div></form>");
                }
                out.println("</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <script>
        function castVote(id) {
            alert("Vote cast for: " + id);
            document.getElementById("form" + id).submit();
        }
    </script>
</div>
</body>
</html>
