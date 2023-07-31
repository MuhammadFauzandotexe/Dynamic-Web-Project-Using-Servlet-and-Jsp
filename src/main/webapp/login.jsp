<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="./css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<h2>Login</h2>
<form action="LoginService" method="post">
    Enter UserId : <input type="text" name="userid" id="username"><br>
    <br>
    Enter Password : <input type="password" name="password" id="password">
    <input type="submit" value="Login">
</form>
<div id="successMessage" style="color: green;"></div>
<script>
    $(document).ready(function() {
        $("form").submit(function(e) {
            $.ajax({
                type: "POST",
                url: "LoginService",
                data: $("form").serialize(),
                success: function(data) {
                    if (data === "success") {
                        $("#successMessage").text("Login berhasil!");
                        setTimeout(function() {
                            window.location.href = "http://localhost:8085/tomcatconfig/welcome.jsp";
                        }, 100);
                    } else {

                        $("#errorMessage").text("Wrong Password");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    $("#errorMessage").text("Error: " + textStatus + " - " + errorThrown);
                }
            });
            e.preventDefault();
        });
    });
</script>
</body>
</html>
