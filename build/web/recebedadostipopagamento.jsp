<%@page import="modelos.MetodosPagto"%>
<%
    MetodosPagto mpg = new MetodosPagto();
 
    mpg.setCpfCliente(request.getParameter("cpf"));
    mpg.setPagto(request.getParameter("tipoPagto"));
    if (mpg.incluirMetodosPagto()) {
            response.sendRedirect("cadastratipopagamento.jsp?pmensagem=Tipo de pagamento salvo com sucesso");
    } else {
            response.sendRedirect("cadastratipopagamento.jsp?pmensagem=Problemas ao salvar este tipo de´pagamento");
    }
    
%>
