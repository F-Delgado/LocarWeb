<%@page import="modelos.Locacao"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <body>
        <script src="scripts/menu.js"></script>  
        <h1>Consulta carro</h1>
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>

        </label>
        <hr />
        <%
          Carro car = new Carro();
          List<Carro> carros = car.consultarTodosCarros();
        %>
        <table>
            <thead>
              <th>Placa</th>
              <th>Marca</th>
              <th>Modelo</th>
              <th>Km</th>
              <th>Tem Ar condicionado?</th>
              <th>Tem direção hidráulica</th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Carro c : carros) {%>
                   <tr>
                        <td><% out.write(c.getPlaca()); %></td>
                        <td><% out.write(c.getMarca()); %></td>
                        <td><% out.write(c.getModelo()); %></td>
                        <td><% out.write(""+c.getKm()); %></td>
                        
                        <!-- Valida direção arcondicionado-->
                        <% if(c.isArcondicionado()){
                            out.write("<td>Sim</td>");
                        }
                        else{       
                             out.write("<td>Não</td>"); 
                             }
                             %>  
                        <!-- Valida direção hidraulica-->
                         <%
                           if(c.isDirecaohidraulica()){
                              out.write("<td>Sim</td>");
                           }
                           else{
                             out.write("<td>Não</td>");  
                           }                       
                         %>  
                         <td><%out.write("<a href=editarcarro.jsp?placa="+c.getPlaca()+">Editar</a>");%></td> 
                         <td><%out.write("<a href=excluircarro.jsp?placa="+c.getPlaca()+">Excluir</a>");%></td>                         
                   </tr> 
                   
                <%}%>
            </tbody>
        </table>
    </body>
</html>
