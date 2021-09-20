<%@page import="java.util.List"%>
<%@page import="modelos.MetodosPagto"%>
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
        <h1>Consulta Tipo Pagamento</h1>
        <hr />
        <%
          MetodosPagto mpg = new MetodosPagto();
          List<MetodosPagto> pagamentos = mpg.consultarGeral();
        %>
        <table>
            <thead>
              <th>CPF</th>
              <th>Tipo Pagamento</th>
            </thead>
            <tbody>
                <% for(MetodosPagto p : pagamentos) { %>
                   <tr>
                        <td><% out.write(p.getCpfCliente());   %></td>
                        <td><% out.write(p.getPagto());  %></td>                                           
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
