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

        img {
            display: block;
            margin: 0 auto;
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
    </style>
</head>
<body>
<h1>DORMITORY</h1>
<hr>
<h4>More info about request</h4>
<#list images as img>
    <img src="/images/${img.id?if_exists}" height="60px"/><br><br>
</#list>
    <b>Name of dormitory: </b>${info.nameDormitory}<br>
    <b>Number of room: </b>${info.room}<br>
    <b>Username: </b><a href="/user/${info.user.id}">${info.user.name}</a><br>
</body>
</html>