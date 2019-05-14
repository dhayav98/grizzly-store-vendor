<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Grizzly Store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles/main.css">
    <link rel="stylesheet" href="styles/bootstrap.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="scripts/main.js"></script>
    <script src="scripts/bootstrap.js"></script>
</head>

<body>
    <div class="container-fluid m">
        <div class="row">
                <div class="col offset-md-2 h3">
                    Welcome to
                </div>
            </div>
        <div class="row align-items-center">
            <div class="row">
                
            <div class="col-7 text-center mx-auto">
                
                    <div class="col-12">
                        <div class="row align-items-center mx-auto col">
                        <span id="grizzly">GRIZZLY</span>
                        <img src="images/logo.png" width="25%"/>
                        <span id="grizzly">STORE</span>
                        </div>
                    </div>
                    <br>
                    <hr style="height:2px;border:none;background-color:lightgray;" class="col-6"><br>
                    <form action="loginAction.jsp" class="form-group" method="post">
                    <div class="lead col-4 mx-auto">
                        <input type="text" placeholder="&nbsp;&nbsp;Username" class="form-control form-rounded" name="username"/>
                    </div>
                    <div class="lead col-4 mx-auto">
                        <input type="password" placeholder="&nbsp;&nbsp;Password" class="form-control form-rounded" name="password"/>
                    </div><br>
                    <div class="lead col-6 mx-auto">
                        <button type="submit" class="btn btn-secondary rounded-circle"><span style="color:black">Login</span></button>
                    </div>
                    </form>
                
            </div>
            </div>
        </div>
    </div>
</body>
</html>