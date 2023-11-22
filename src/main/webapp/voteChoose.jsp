<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vote the Existing Poll</title>
<%--    <link rel="stylesheet" href="styles.css">--%>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; /* Light gray background */
        }

        .vote-poll-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #c6e5d9; /* Soft light green */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #007bff; /* Blue header */
        }

        .input-group {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: calc(100% - 12px);
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button.submit-button {
            padding: 15px 30px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button.submit-button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="vote-poll-container">
    <h2>Vote the Existing Poll</h2>
    <form action="choosePoll" method="post">
        <div class="input-group">
            <label for="voteTitle">Enter Vote Title:</label>
            <input type="text" id="voteTitle" name="voteTitle" required>
        </div>
        <button type="submit" class="submit-button">Submit</button>
    </form>
</div>
</body>
</html>
