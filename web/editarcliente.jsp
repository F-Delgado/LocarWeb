<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <title>Locadora Céu Azul</title>
    </head>
    <header>
        <script src="scripts/cabecalho.js"></script> 
    </header>
    <section>
        <nav>
            <script src="scripts/menu.js"></script> 
        </nav>
        <article>
            <body>
                <h1>Editar Cliente</h1>
                <hr />
                <%
                    String idcpf = request.getParameter("cpf");
                    Cliente c = new Cliente();
                    if (idcpf != null) {
                        c = c.consultarCliente(idcpf);
                    }
                %>
                <form action="recebeeditacliente.jsp" method="POST">
                    <label>CPF</label>
                    <input type="text" name="cpf" 
                           readonly="true"  
                           value="<%out.write(c.getCpf());%>" />

                    <br />
                    <label>Nome</label>
                    <input type="text" name="nome" 
                           value="<%out.write(c.getNome());%>" />
                    <br />
                    <label>Email</label>
                    <input type="text" name="email" 
                           value="<%out.write(c.getEmail());%>" />

                    <br />
                    <label>Cartão</label>
                    <input type="text" name="cartao" 
                           value="<%out.write("" + c.getNrCartao());%>" 
                           maxlength="8"/>
                    <br />
                    <hr />
                    <input type="submit" value="Alterar" />
                </form>
            </body>
        </article>
    </section>
    <footer>
        <script src="scripts/rodape.js"></script>
    </footer>                    
</html>
