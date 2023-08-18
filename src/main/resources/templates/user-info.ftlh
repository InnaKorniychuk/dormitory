<!DOCTYPE html>
<html lang="en">
<head>
    <title>DORMITORY</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333333;
            text-align: center;
            margin-top: 50px;
        }

        h3 {
            color: #555555;
            text-align: center;
        }

        b {
            color: #333333;
        }

        a {
            color: #333333;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .request {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .no-requests {
            text-align: center;
            color: #555555;
        }
    </style>
</head>
<body>
<h1>DORMITORY</h1>
<h3>Details about user ${user.name}</h3>
<b>Phone number: </b> ${user.phoneNumber}<br>
<b>Email: </b> ${user.email}<br>
<h4>User's requests ${user.name}</h4>
<#list information as info>
    <div>
        <p><b></b>${info.nameDormitory}</b> ${info.room} room | <a href="/info/${info.id}"> More </a> </p>
    </div>
    <#else>
    <h3>No requests</h3>
</#list>
</body>
</html>