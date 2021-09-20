<%@page import="modelos.Locacao"%>
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
            String id = request.getParameter("id");

            //instancia o carro
           
            Locacao loc = new Locacao();
            Carro carro = new Carro();
            carro = carro.consultarCarro(placa);
            boolean ar = carro.isArcondicionado();
            boolean dir = carro.isDirecaohidraulica();
            carro.setPlaca(placa);
            carro.setMarca(marca);
            carro.setModelo(modelo);
            
            
            if (!km.equals("")) {
                carro.setKm(Integer.parseInt(km));
            }
            carro.setArcondicionado(ar);
            carro.setDirecaohidraulica(dir);
            
            if (carro.alterarCarro()) {
                if (id != null) {
                    loc.consultarLocacaoID(Integer.parseInt(id));
                    if (loc.devolverCarro()) {
                        carro = carro.consultarCarro(placa);
                        if (carro.alterarSituacaoCarroTrue()) {
                            response.sendRedirect("consultalocacao.jsp?pmensagem=Carro devolvido com sucesso");
                        }
                    } else {
                        response.sendRedirect("consultalocacao.jsp?pmensagem=Problemas devolver carro");
                    }
                }
            }

        %>        
        <hr />      
    </body>
</html>
