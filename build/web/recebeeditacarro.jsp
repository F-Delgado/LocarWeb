<%@page import="modelos.Carro"%>
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
          String placa = request.getParameter("placa");
          String marca = request.getParameter("marca");
          String modelo = request.getParameter("modelo");
          String km = request.getParameter("km");
          String arcondicionado = request.getParameter("arcondicionado");
          String direcaohidraulica = request.getParameter("direcaohidraulica");
          
          //instancia o carro
          Carro carro = new Carro();
          carro.setPlaca(placa);
          carro.setMarca(marca);
          carro.setModelo(modelo);
          if(!km.equals(""))
             carro.setKm(Integer.parseInt(km));                   
          if (arcondicionado != null)
             carro.setArcondicionado(Boolean.parseBoolean(arcondicionado));
          if(direcaohidraulica != null)
            carro.setDirecaohidraulica(Boolean.parseBoolean(direcaohidraulica));
          if(carro.alterarCarro()){
              response.sendRedirect("consultacarro.jsp?pmensagem=Carro alterado com sucesso");
          }
          else
          {
              response.sendRedirect("consultacarro.jsp?pmensagem=Problemas ao salvar carro");
          }         
        %>        
       <hr />      
    </body>
</html>
