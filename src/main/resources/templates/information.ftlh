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

        hr {
            border: none;
            border-top: 1px solid #cccccc;
            margin: 20px auto;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"] {
            padding: 6px 12px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 6px 12px;
            background-color: #333333;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555555;
        }

        p {
            margin: 0;
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

        h3.no-requests,
        h3.no-users {
            text-align: center;
            color: #555555;
        }

        i {
            font-style: italic;
        }
    </style>
</head>
<body>
<h1>DORMITORY</h1>
<hr>
<#if user.email??>
    <h3>User name: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Log out">
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Admin panel</a>
    </#if>
<#else>
    <a href="/login">Log in</a>
</#if>
<h4>All requests</h4>
<form action="/" method="get">
    Find by dormitory name: <input type="text" name="nameDormitory"><br>
    <input type="submit" value="Find">
</form>
<#list information as info>
    <div>
        <p><b></b>${info.nameDormitory}</b> ${info.room} room | <a href="/info/${info.id}"> More </a> </p>
    </div>
    <#else>
    <h3>No requests</h3>
</#list>
<#if user.email??>
    <hr>
    <hr3>Add new request</hr3>
    <form action="/info/create" method="post" enctype="multipart/form-data">
        Name of dormitory: <input type="text" name="nameDormitory"/><br><br>
        Number of room: <input type="number" name="room"/><br><br>
        First photo: <input type="file" name="file1"/><br><br>
        Second photo: <input type="file" name="file2"/><br><br>
        Third photo: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Add a request"/>
    </form>
</#if>
</body>
</html>