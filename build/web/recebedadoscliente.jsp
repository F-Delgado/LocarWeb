<%@page import="modelos.Cliente"%>
<%
    Cliente cli = new Cliente();
 
    cli.setCpf(request.getParameter("cpf"));
    cli.setNome(request.getParameter("nome"));
    cli.setEmail(request.getParameter("email"));
    cli.setNrCartao(Integer.parseInt(request.getParameter("cartao")));
    if (cli.incluirCliente()) {
            response.sendRedirect("cadastracliente.jsp?pmensagem=Cliente salvo com sucesso");
    } else {
            response.sendRedirect("cadastracliente.jsp?pmensagem=Problemas ao salvar cliente");
    }
    
%>