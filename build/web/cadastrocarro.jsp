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
                <h1>Cadastro carro</h1>
                <label>
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>

                </label>
                <hr />        
                <form action="recebeDadosCarro.jsp" method="POST">
                    <div>
                        <label>Informe a placa</label>
                        <input id="placa" type="text" name="placa" style="width: 50px"/> 

                        <br />
                        <label>Informe a marca</label>
                        <input id="marca" type="text" name="marca" />

                        <br />
                        <label>Informe modelo</label>
                        <input id="modelo" type="text" name="modelo" />

                        <br />
                        <label>Informe km</label>
                        <input id="km" type="text" name="km" />

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
                            <option value=" "> </option>
                            <option value="true">Sim</option>
                            <option value="false">Não</option>
                        </select>
                        <br> 
                        <hr />
                        <input type="button" value="Salvar" onclick="enviaForm()"/>
                        <input type="reset" value="Cancelar" />
                    </div>
                </form>         
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>             

        <script>
                             function enviaForm() {
                                 var placa = document.getElementsByName("placa");
                                 if (placa[0].value === "") {
                                     placa[0].focus();
                                     alert("Informe a placa");
                                     exit();
                                 }

                                 var marca = document.getElementsByName("marca");
                                 if (marca[0].value === "") {
                                     marca[0].focus();
                                     alert("Informe a marca");
                                     exit();
                                 }

                                 var modelo = document.getElementsByName("modelo");
                                 if (modelo[0].value === "") {
                                     modelo[0].focus();
                                     alert("Informe a modelo");
                                     exit();
                                 }
                                 var km = document.getElementsByName("km");
                                 if (km[0].value === "") {
                                     km[0].focus();
                                     alert("Informe a km");
                                     exit();
                                 }
                                 var arcondicionado = document.getElementsByName("arcondicionado");
                                 if (arcondicionado[0].value === " ") {
                                     arcondicionado[0].focus();
                                     exit();
                                 }
                                 var direcaohidraulica = document.getElementsByName("direcaohidraulica");
                                 if (direcaohidraulica[0].value === " ") {
                                     direcaohidraulica[0].focus();
                                     exit();
                                 }
                                 document.forms[0].submit();
                             }
        </script>    
    </body>   
</html>
