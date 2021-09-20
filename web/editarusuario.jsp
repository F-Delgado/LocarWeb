<%@page import="modelos.Usuario"%>
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
                <h1>Editar Usuario</h1>
                <label>
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>

                </label>
                <hr />
                <%
                    String usuario = request.getParameter("usuario");
                    Usuario u = new Usuario();
                    if (usuario != null) {
                        u = u.consultarUsuario(usuario);
                    }
                %>
                <form action="recebeeditacliente.jsp" method="POST">               
                    <label>Usuario</label>
                    <input type="text" name="nome" 
                           readonly="true" 
                           value="<%out.write(u.getUsuario());%>" />
                    <br />
                    <label>CPF</label>
                    <input type="text" name="cpfcliente" 
                           readonly="true"  
                           value="<%out.write(u.getCpfCliente());%>" />

                    <br />
                    <label>Senha</label>
                    <input type="password" name="senhausuario" 
                           value="<%out.write(u.getSenhausuario());%>" />

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
