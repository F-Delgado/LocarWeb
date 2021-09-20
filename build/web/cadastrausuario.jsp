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
                <h1>Cadastro de Usuario</h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <form action="recebedadosusuario.jsp" method="POST">
                    <div>
                        <label>Usuario</label>
                        <input type="text" name="usuario" /> <br />

                        <label>Senha</label>
                        <input type="password" name="senhausuario" /> <br />

                        <label>CPF</label>
                        <input type="text" name="cpfcliente" placeholder="Informe o seu CPF" /> <br />

                        <input type="button" value="Criar" onclick="enviarDados()" />
                    </div>   
                </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                       
        <script>
                            function enviarDados() {

                                var usuario = document.getElementsByName("usuario");
                                if (usuario[0].value === "") {
                                    usuario[0].focus();
                                    alert("Informe o usuario");
                                    exit();
                                }

                                var senhausuario = document.getElementsByName("senhausuario");
                                if (senhausuario[0].value === "") {
                                    senhausuario[0].focus();
                                    alert("Informe a senha");
                                    exit();
                                }

                                var cpf = document.getElementsByName("cpfcliente");
                                if (cpf[0].value === "") {
                                    cpf[0].focus();
                                    alert("Informe o CPF");
                                    exit();
                                }

                                document.forms[0].submit();
                            }
        </script>    
    </body>
</html>