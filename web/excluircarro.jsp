<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
    </head>
    <body>
        <%
          String placacarro = request.getParameter("placa");
          Carro c = new Carro();
          if (placacarro != null){
              c = c.consultarCarro(placacarro);
              if(c.excluirCarro()){
              response.sendRedirect("consultacarro.jsp?pmensagem=Carro excluído com sucesso");
          }
          else
          {
              response.sendRedirect("consultacarro.jsp?pmensagem=Problemas ao excluir carro");
          }
          }          
        %>
        <hr />
       <a href="consultacarro.jsp">Consulta carros</a> 
              
    </body>
</html>
