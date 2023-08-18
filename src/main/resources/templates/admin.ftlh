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

        h4 {
            color: #555555;
            text-align: center;
        }

        hr {
            border: none;
            border-top: 1px solid #cccccc;
            margin: 20px auto;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333333;
        }

        td {
            background-color: #ffffff;
            color: #333333;
        }

        td a {
            color: #333333;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

        form {
            display: inline;
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

        h3 {
            text-align: center;
            color: #555555;
        }
    </style>
</head>
<body>
<h1>DORMITORY</h1>
<hr>
<h4>Admin panel</h4>
<table border="1">
    <tr>
        <th>Email</th>
        <th>Phone number</th>
        <th>Activity</th>
        <th>Ban</th>
        <th>Detail information</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Ban">
                </form>
            </th>
            <th><a href="/user/${user.id}">Detail information</a></th>
        </tr>
        <#else>
        <h3>No users</h3>
    </#list>
</table>
</body>
</html>