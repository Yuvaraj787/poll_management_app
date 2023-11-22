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
            String email = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("email")) {
                        email = cookie.getValue();
                        break;
                    }
                }
            }

            // Fetch description and options from the specified table
            String query = "SELECT title FROM poll_entry where email = '" + email + "';";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            out.println("<p style='font-size: 30px; color: black; margin-left:20px; font-weight: 900;'>Your Polls</p>");
            out.println("<div classname='par' style='display: flex; flex-direction: column;'>");
            while (rs.next()) {
                String title = rs.getString("title");
                out.println("<form action='checkResult.jsp' onclick='this.submit()'>" +
                        "<input tye='text' style='display: none;' name='title' value='"+ title + "' >"+
                        "<div classname='title' style='font-size: 23px;\n" +
                        "        background-color: #F1EAFF;\n" +
                        "        color: #363062;\n" +
                        "        border: 1px solid grey;\n" +
                        "        width: 50%;\n" +
                        "        font-weight: 900;\n" +
                        "        border-radius: 12px;\n" +
                        "        margin: 20px;\n" +
                        "        padding: 12px 6px;\n" +
                        "        margin-top: 30px;\n" +
                        "        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1)'><p style='margin-left: 12px'>" + title + "</p></div></form>");
            }
            out.println("</div>");
        } catch (Exception e) {
            out.println("<h1>Error : " + e.getMessage() + " </h1>");
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


</div>
</body>
</html>
