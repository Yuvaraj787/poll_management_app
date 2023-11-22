<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; /* Light gray background */
        }

        .homepage {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .section {
            margin: 10px;
        }

        .box {
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            width: 300px;
            height: 200px;
            background-color: #c6e5d9; /* Soft light green */
            color: #333; /* Darker text color */
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .box:hover {
            background-color: #a0d6bf; /* Darker green on hover */
        }

        h2 {
            margin-bottom: 10px;
            font-size: 24px; /* Increased font size */
        }

        p {
            font-size: 16px; /* Increased font size */
        }

    </style>
</head>
<body>
<div class="homepage">
    <div class="section">
        <a href="createPoll.jsp" class="box create-poll">
            <h2>Create New Poll</h2>
            <p>Create a new poll to gather opinions</p>
        </a>
    </div>
    <div class="section">
        <a href="voteChoose.jsp" class="box vote-poll">
            <h2>Vote the Existing Poll</h2>
            <p>Participate and cast your vote</p>
        </a>
    </div>
    <div class="section">
        <a href="votercheck.jsp" class="box view-results">
            <h2>View Results of My Poll</h2>
            <p>Check the results of your created polls</p>
        </a>
    </div>
</div>
</body>
</html>
