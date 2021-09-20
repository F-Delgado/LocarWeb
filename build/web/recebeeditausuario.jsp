<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
        //recebe os valores da tela HTML  
            String usuario   = request.getParameter("usuario");
            String senhausuario   = request.getParameter("senhausuario");
            String cpfcliente     = request.getParameter("cpfcliente");
          
            //instancia o Cliente
            Usuario us = new Usuario();
            us.setUsuario(usuario);
            us.setSenhausuario(senhausuario);
            us.setCpfCliente(cpfcliente);
            if(us.alterarSenha()){
                response.sendRedirect("consultausuario.jsp?pmensagem=Usuario editado com sucesso");
            } else {
                response.sendRedirect("consultausuario.jsp?pmensagem=Problemas ao editar usuario");
            }          
        %>        
       <hr />
    </body>
</html>
