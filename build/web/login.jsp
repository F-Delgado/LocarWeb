<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utils.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            div{
                display: block;
                width: 300px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        <header>
            <script src="scripts/cabecalho.js"></script>  
        </header>

        <h1>Tela de Login</h1>
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>

        </label>
        <form action="login.jsp" method="POST">
            <label>Usuário</label><br/>
            <input type="text" required="required" name="usuario" /> <br/>
            <label>Senha</label><br/>
            <input type="password" required="required" name="senhausuario" /> <hr/>
            <input type="hidden" required="required" name="tipousuario" /> <hr/>
            <input type="submit" value="Logar"/>                 
            <a href="cadastracliente.jsp"><input type="button" value="Cadastrar" /></a>
        </form>   
      




        <%
            String usuario = request.getParameter("usuario");
            String senhausuario = request.getParameter("senhausuario");
            Usuario u = new Usuario();
            if ((usuario != null) && (senhausuario != null) && !(usuario.isEmpty())
                    && !(senhausuario.isEmpty())) {
                // verifica se usuário existe 
                if (u.podeLogar(usuario, senhausuario)) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("index.html");
                    
                } else {
                    response.sendRedirect("cadastracliente.jsp?pmensagem=RealizarCadastro");
                }
            }

        %>
    </body>
</html>
