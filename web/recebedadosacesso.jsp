<%@page import="modelos.Acesso"%>
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
            String usuario = request.getParameter("usuario");
            String grupo = request.getParameter("grupo");
            String acessoCadastraUsuario = request.getParameter("acessoCadastraUsuario");
            String acessoConsultaUsuario = request.getParameter("acessoConsultaUsuario");
            String acessoEdicaoUsuario = request.getParameter("acessoEdicaoUsuario");
            String acessoCadastraCarro = request.getParameter("acessoCadastraCarro");
            String acessoConsultaCarro = request.getParameter("acessoConsultaCarro");
            String acessoEdicaoCarro = request.getParameter("acessoEdicaoCarro");
            String acessoCadastraCliente = request.getParameter("acessoCadastraCliente");
            String acessoConsultaCliente = request.getParameter("acessoConsultaCliente");
            String acessoEdicaoCliente = request.getParameter("acessoEdicaoCliente");
            String acessoCadastraLocacao = request.getParameter("acessoCadastraLocacao");
            String acessoConsultaLocacao = request.getParameter("acessoConsultaLocacao");
            //instancia o usuario
            Acesso acesso = new Acesso();
            acesso.setUsuario(usuario);
            acesso.setGrupo(grupo);
            if (acessoCadastraUsuario != null) {
            acesso.setAcessoCadastraUsuario(Boolean.parseBoolean(acessoConsultaUsuario));
            }
            if (acessoConsultaUsuario != null) {
            acesso.setAcessoConsultaUsuario(Boolean.parseBoolean(acessoConsultaUsuario));
            }
            if (acessoEdicaoUsuario != null) {
            acesso.setAcessoEdicaoUsuario(Boolean.parseBoolean(acessoEdicaoUsuario));
            }
            if (acessoCadastraCarro != null) {
            acesso.setAcessoCadastraCarro(Boolean.parseBoolean(acessoCadastraCarro));
            }
            if (acessoConsultaCarro != null) {
            acesso.setAcessoConsultaCarro(Boolean.parseBoolean(acessoConsultaCarro));
            }
            if (acessoEdicaoCarro != null) {
            acesso.setAcessoEdicaoCarro(Boolean.parseBoolean(acessoEdicaoCarro));
            }
            if (acessoCadastraCliente != null) {
            acesso.setAcessoCadastraCliente(Boolean.parseBoolean(acessoCadastraCliente));
            }
            if (acessoConsultaCliente != null) {
            acesso.setAcessoConsultaCliente(Boolean.parseBoolean(acessoConsultaCliente));
            }
            if (acessoEdicaoCliente != null) {
            acesso.setAcessoEdicaoCliente(Boolean.parseBoolean(acessoEdicaoCliente));
            }
            if (acessoCadastraLocacao != null) {
            acesso.setAcessoCadastraLocacao(Boolean.parseBoolean(acessoCadastraLocacao));
            }
            if (acessoConsultaLocacao != null) {
            acesso.setAcessoConsultaLocacao(Boolean.parseBoolean(acessoConsultaLocacao));
            }
            if (usuario != null) {
                acesso.alterarAcesso();
                response.sendRedirect("consultausuario.jsp?pmensagem=Permissoes alterado com sucesso");
            } else {
                response.sendRedirect("consultausuario.jsp?pmensagem=Problemas ao alterar permissoes");
            }
        %>        
        <hr />      
    </body>
</html>
