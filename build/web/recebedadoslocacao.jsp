<%@page import="modelos.Carro"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body
        <%

            String datareserva = request.getParameter("datareserva");
            String placa = request.getParameter("placa");
            String cpfcliente = request.getParameter("cpfcliente");

            Locacao locacao = new Locacao();
            Carro car = new Carro();

            locacao.setDataReserva(Date.valueOf(datareserva));
            locacao.setPlaca(placa);
            locacao.setCpfCliente(cpfcliente);
            car = car.consultarCarro(placa);
            if (locacao.incluirLocacao()) {
                if (car.alterarSituacaoCarroFalse()) {
                    out.print("Locação registrada com sucesso");
                    response.sendRedirect("index.html");
                }

            } else {
                out.print("Problemas ao registrar locação");
                response.sendRedirect("cadastrolocacao.jsp");
            }

        %>
        </body>
</html>
