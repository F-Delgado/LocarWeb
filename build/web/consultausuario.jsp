<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <header>
            <script src="scripts/cabecalho.js"></script> 
    </header>
    
    <body>
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Usuario</h1>
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>

        </label>
        <hr />
        <%
          Usuario us = new Usuario();
          List<Usuario> usuarios = us.consultarGeral();
        %>
        <table>
            <thead>
              <th> CPF</th>
              <th> Usuario</th>
              <th> Editar </th>
              <th> Acessos </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Usuario u : usuarios) { %>
                   <tr>
                        <td><% out.write(u.getCpfCliente());   %></td>
                        <td><% out.write(u.getUsuario());  %></td>
                        <td><%out.write("<a href=editarusuario.jsp?usuario="+u.getUsuario()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=acessousuario.jsp?usuario="+u.getUsuario()+">Permissões</a>");%></td> 
                        <td><%out.write("<a href=excluirusuario.jsp?usuario="+u.getUsuario()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
