<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Poll</title>
<%--    <link rel="stylesheet" href="styles.css">--%>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; /* Light gray background */
        }

        .create-poll-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #c6e5d9; /* Soft light green */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #007bff; /* Blue header */
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea,
        input[type="number"] {
            width: calc(100% - 12px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .options-fields input[type="text"] {
            margin-bottom: 10px;
        }

        button {
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="create-poll-container">
    <h2>Create Poll</h2>
    <form action="addPoll" method="post">
        <div class="input-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="input-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>
        </div>
        <div class="input-group">
            <label for="numOptions">Number of Options:</label>
            <input type="number" id="numOptions" name="numOptions" min="2" required oninput="createOptionsFields(this.value)">
        </div>
        <div id="optionsFields">
        </div>
        <button type="submit">Create Poll</button>
    </form>
</div>

<script>
    function createOptionsFields(num) {
        const optionsFields = document.getElementById('optionsFields');
        optionsFields.innerHTML = '';

        for (let i = 1; i <= num; i++) {
            const inputField = document.createElement('input');
            inputField.type = 'text';
            inputField.name = 'option' + i;
            inputField.placeholder = 'Option ' + i + ' value';
            inputField.className = "input-group";
            optionsFields.appendChild(inputField);
        }
    }
</script>
</body>
</html>
