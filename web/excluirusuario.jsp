<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
    </head>
    <body>
        
        <h1>Excluir Usuario</h1>
        <%
          String usuario = request.getParameter("usuario");
          Usuario u = new Usuario();
          if (usuario != null){
              u = u.consultarUsuario(usuario);
              if(u.excluirUsuario()){
                response.sendRedirect("consultausuario.jsp?pmensagem=Usuario excluido com sucesso");
                } else {
                    response.sendRedirect("consultausuario.jsp?pmensagem=Problemas ao excluir usuario");
                }
          }          
        %>
        <hr />
    </body>
</html>
