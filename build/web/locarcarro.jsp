<%@page import="modelos.Carro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
    </head>
    <body>
        <%
                String idlocacao = request.getParameter("idlocacao");
                Locacao l = new Locacao();
                if (idlocacao != null) {
                    l.consultarLocacaoID(Integer.parseInt(idlocacao));
                    if(l.locarCarro()){
                    response.sendRedirect("consultalocacao.jsp?pmensagem=Carro locado com sucesso");
                    }
                } else {
                    response.sendRedirect("consultalocacao.jsp?pmensagem=Problemas locar carro");
                }
            
        %>
        <hr />
    </body>
</html>
