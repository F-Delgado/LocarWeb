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
                <h1>Cadastro de Tipo Pagamento</h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <form action="recebedadostipopagamento.jsp" method="POST">
                    <div>
                        <label>Cpf</label>
                        <input id="cpf" name="cpf" type="text" placeholder="Informe o CPF" /> <br/>
                        <label>Tipo Pagamento</label>
                        <input id="tipoPagto" type="text" name="tipoPagto" /> <br />

                        <input type="button" value="Salvar" onclick="enviarDados()" />
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

    var tipoPagto = document.getElementsByName("tipoPagto");
    if (tipoPagto[0].value === "") {
        tipoPagto[0].focus();
        alert("Informe o tipo de pagamento");
        exit();
    }
    document.forms[0].submit();
    }

        </script>    
    </body>
</html>