<%@page import="modelos.Usuario"%>
<%@page import="modelos.Acesso"%>
<%
    String usuario      = request.getParameter("usuario");
    String senhausuario = request.getParameter("senhausuario");
    String cpfcliente   = request.getParameter("cpfcliente");
    String grupo = "u";
    Usuario us = new Usuario();
    Acesso ac = new Acesso();
    
    us.setUsuario(usuario);
    us.setSenhausuario(senhausuario);
    us.setCpfCliente(cpfcliente);
    ac.setUsuario(usuario);
    ac.setGrupo(grupo);
    if (us.incluirUsuario()) {
            if (ac.incluirAcesso()){
                   response.sendRedirect("cadastrausuario.jsp?pmensagem=Usuario salvo com sucesso");
            } else {
                  response.sendRedirect("cadastracliente.jsp?pmensagem=Problemas ao salvar usuario!Você deve cadastrar-se primeiro como cliente!");
           }
    }
    
%>
