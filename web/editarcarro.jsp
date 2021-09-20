<%@page import="modelos.Acesso"%>
<%@page import="modelos.Carro"%>
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
                    Carro c = new Carro();
                    if (placacarro != null) {
                        c = c.consultarCarro(placacarro);
                    }
                %>
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <%
                     //verifica sessão
                                String usuario = (String) session.getAttribute("usuario");
                                //verifica sessão 
                                /*Acesso ac = new Acesso();
                                ac = ac.consultarPermissoes(usuario);
                                if (usuario == null) {
                                    response.sendRedirect("login.jsp?pmensagem=PorFavorRealizarLogin");
                                } else if (ac.isAcessoEdicaoCarro()== true) {
                                   
                                } else {
                                    response.sendRedirect("login.jsp?pmensagem=UsuarioSemAcessoEntrarContatoComAdministrador");
                                }*/
                %>
                <form action="recebeeditacarro.jsp" method="POST">
                    <label>Placa</label>
                    <input type="text" name="placa"
                           readonly="true" 
                           value="<%out.write(c.getPlaca());%>" />
                    <br />
                    <label>Marca</label>
                    <input type="text" name="marca" 
                           value="<%out.write(c.getMarca());%>" />
                    <br />
                    <label>Modelo</label>
                    <input type="text" name="modelo" 
                           value="<%out.write(c.getModelo());%>" />

                    <br />
                    <label>KM</label>
                    <input type="text" name="km" 
                           value="<%out.write("" + c.getKm());%>" />
                    <br />
                    <label for="arcondicionado">ArCondicionado</label>
                    <select name="arcondicionado" id="arcondicionado">
                        <option value=" "> </option>
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="direcaohidraulica">Direção Hidraulica</label>
                    <select name="direcaohidraulica" id="direcaohidraulica">
                            <option value="" > </option>
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>

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
