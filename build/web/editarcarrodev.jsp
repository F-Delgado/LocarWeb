<%@page import="modelos.Carro"%>
<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <title>Locadora Céu Azul</title>
        <script src="scripts/jquery-3.6.0.min.js"></script>
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
                <h1>Editar Carro</h1>
                <hr />
                <%
                    String placacarro = request.getParameter("placa");
                    String id = request.getParameter("id");
                    Carro c = new Carro();
                    Locacao l = new Locacao();
                    if (placacarro != null) {
                        c = c.consultarCarro(placacarro);
                        if (id != null) {
                            l.consultarLocacaoID(Integer.parseInt(id));
                        }
                    }

                %>
                <form action="devolucaocarro.jsp" method="POST">

                    <label>Placa</label>
                    <input type="text" name="placa" 
                           readonly="true"
                           value="<%out.write(c.getPlaca());%>" />
                    <br />
                    <label>Marca</label>
                    <input type="text" name="marca" 
                           readonly="true"
                           value="<%out.write(c.getMarca());%>" />
                    <br />
                    <label>Modelo</label>
                    <input type="text" name="modelo" 
                           readonly="true"
                           value="<%out.write(c.getModelo());%>" />

                    <br />
                    <label>KM</label>
                    <input type="text" name="km" 
                           value="<%out.write("" + c.getKm());%>" />
                    <br />
                    <label>ID Locacao</label>
                    <input type="text" name="id" 
                           readonly="true"
                           value="<%out.write("" + l.getId());%>" />
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
    <script>
    </script> 
</html>
