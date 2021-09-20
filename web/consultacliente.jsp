<%@page import="java.util.List"%>
<%@page import="modelos.Cliente"%>
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
        <h1>Consulta Clientes</h1>
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>

        </label>
        <hr />
        <%
          Cliente cli = new Cliente();
          List<Cliente> clientes = cli.consultarGeral();
        %>
        <table>
            <thead>
              <th>CPF</th>
              <th>Nome</th>
              <th>eMail</th>
              <th>Cartão</th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Cliente c : clientes) { %>
                   <tr>
                        <td><% out.write(c.getCpf());   %></td>
                        <td><% out.write(c.getNome());  %></td>
                        <td><% out.write(c.getEmail()); %></td>
                        <td><% out.write(""+c.getNrCartao()); %></td>
                        <td><%out.write("<a href=editarcliente.jsp?cpf="+c.getCpf()+">Editar</a>");%></td> 
                    <td><%out.write("<a href=excluircliente.jsp?cpf="+c.getCpf()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
