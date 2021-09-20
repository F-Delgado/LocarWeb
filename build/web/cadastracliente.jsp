<%@page import="modelos.Acesso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    <body>
        <header>
            <script src="scripts/cabecalho.js"></script> 
        </header>
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <h1>Cadastro de Clientes</h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <%
                    //verifica sessão
                    String usuario = (String) session.getAttribute("usuario");
                    /*
                    Acesso ac = new Acesso();
                    ac = ac.consultarPermissoes(usuario);
                    if (usuario == null) {
                        response.sendRedirect("login.jsp?pmensagem=PorFavorRealizarLogin");
                    } else if (ac.isAcessoCadastraCliente() != false) {
                        response.sendRedirect("cadastracliente.jsp");
                    } else {
                        response.sendRedirect("login.jsp?pmensagem=UsuarioSemAcessoEntrarContatoComAdministrador");
                    } */


                %>
                <form action="recebedadoscliente.jsp" method="POST">
                    <div>
                        <label>Cpf</label>
                        <input id="cpf" name="cpf" type="text" required="required" 
                               pattern="[0-9]*" title="Digite apenas números" placeholder="Informe o CPF" /> <br/>

                        <label>Nome</label>
                        <input type="text" name="nome" /> <br />

                        <label>eMail</label>
                        <input type="text" name="email" /> <br />

                        <label>Cartão</label>
                        <input type="text" name="cartao" /> <br />
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <a href="cadastrausuario.jsp"><input type="button" value="Criar Usuario" /></a>
                    </div>   
                </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                       
        <script>
                                    function enviarDados() {
                                        var cpf = document.getElementsByName("cpf");
                                        if (cpf[0].value === "") {
                                            cpf[0].focus();
                                            alert("Informe o cpf");
                                            exit();
                                        }

                                        var nome = document.getElementsByName("nome");
                                        if (nome[0].value === "") {
                                            nome[0].focus();
                                            alert("Informe o nome");
                                            exit();
                                        }

                                        var email = document.getElementsByName("email");
                                        if (email[0].value === "") {
                                            email[0].focus();
                                            alert("Informe o email");
                                            exit();
                                        }

                                        var cartao = document.getElementsByName("cartao");
                                        if (cartao[0].value === "") {
                                            cartao[0].focus();
                                            alert("Informe o Cartão");
                                            exit();
                                        }
                                        document.forms[0].submit();
                                    }
                                    function enviaForm() {
                                        document.forms[0].submit();
                                        response.sendRedirect("nulo.html");
                                    }
        </script>    
    </body>
</html>