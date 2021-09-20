<%@page import="modelos.Cliente"%>
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
            String cpf    = request.getParameter("cpf");
            String nome   = request.getParameter("nome");
            String email  = request.getParameter("email");
            int    cartao = Integer.parseInt(request.getParameter("cartao"));
          
            //instancia o Cliente
            Cliente cliente = new Cliente();
            cliente.setCpf(cpf);
            cliente.setNome(nome);
            cliente.setEmail(email);
            cliente.setNrCartao(cartao);
          
            if(cliente.alterarCliente()){
                response.sendRedirect("consultacliente.jsp?pmensagem=Cliente editado com sucesso");
            } else {
                response.sendRedirect("consultacliente.jsp?pmensagem=Problemas ao editar cliente");
            }          
        %>        
       <hr />
    </body>
</html>
