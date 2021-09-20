<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora de Veículos</title>
        <style>
            div{
                display: block;
                width: 300px;
                margin:auto;
                margin-top: 100px;
            }
            p{
                color: blue;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <div>
            <a href="index.html"> <img src="imagens/home.jpg" width="100px" height="100px"/> </a>
            <hr />
            <img src="imagens/informacao.png" width="100px" height="100px" /> 
           <p>
           <%
            out.write(request.getParameter("msg"));
           %>
        </p> 
        
        </div>  
        
    </body>
</html>
