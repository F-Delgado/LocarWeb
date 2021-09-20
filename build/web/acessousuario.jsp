<%@page import="modelos.Acesso"%>
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
                <h1>Lista de Permissões</h1>
                <hr />
                <%
                    String usuario = request.getParameter("usuario");
                    Acesso a = new Acesso();
                    if (usuario != null) {
                        a = a.consultarPermissoes(usuario);
                    }
                %>
                <form action="recebedadosacesso.jsp" method="POST">
                    <label>Usuario</label>
                    <input type="text" name="usuario" id="usuario"
                           readonly="true" 
                           value="<%out.write(a.getUsuario());%>" />
                    <br />
                    <label>Grupo</label>
                    <input type="text" name="consultaGrupo" id="consultaGrupo"
                           readonly="true" 
                           value="<%out.write(a.getGrupo());%>" />
                    <br /><br />
                    <input type="radio" name="grupo" id="grupo" value="u"><br />
                    <label for="grupo">Usuario</label><br />
                    <input type="radio" name="grupo" id="grupo" value="f"><br />
                    <label for="grupo">Funcionario</label><br />
                    <input type="radio" name="grupo" id="grupo" value="a"><br />
                    <label for="grupo">Administrador</label><br /><br />
                    <label for="acessoCadastraUsuario">Acesso ao Cadastro Usuario:</label><br    />
                    <input type="text" name="ConsultaParametroAcessoCadastraUsuario" id="ConsultaParametroAcessoCadastraUsuario"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoCadastraUsuario());%>" /><br    />
                    <select name="acessoCadastraUsuario" id="acessoCadastraUsuario">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoConsultaUsuario">Acesso ao Consulta Usuario</label><br    />
                    <input type="text" name="ConsultaParametroAcessoConsultaUsuario" id="ConsultaParametroAcessoConsultaUsuario"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoConsultaUsuario());%>" /><br    />
                    <select name="acessoConsultaUsuario" id="acessoConsultaUsuario">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoEdicaoUsuario">Acesso a Ediçãoo Usuario</label><br    />
                    <input type="text" name="ConsultaParametroAcessoEdicaoUsuario" id="ConsultaParametroAcessoEdicaoUsuario"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoEdicaoUsuario());%>" /><br    />
                    <select name="acessoEdicaoUsuario" id="acessoEdicaoUsuario">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoCadastraCarro">Acesso ao Cadastra Carro</label><br    />
                    <input type="text" name="ConsultaParametroAcessoCadastraCarro" id="ConsultaParametroAcessoCadastraCarro"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoCadastraCarro());%>" /><br    />
                    <select name="acessoCadastraCarro" id="acessoCadastraCarro">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoConsultaCarro">Acesso ao Consulta Carro</label><br    />
                    <input type="text" name="ConsultaParametroAcessoConsultaCarro" id="ConsultaParametroAcessoConsultaCarro"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoConsultaCarro());%>" /><br    />
                    <select name="acessoConsultaCarro" id="acessoConsultaCarro">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoEdicaoCarro">Acesso a Edição Carro</label><br    />
                    <input type="text" name="ConsultaParametroAcessoEdicaoCarro" id="ConsultaParametroAcessoEdicaoCarro"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoEdicaoCarro());%>" /><br    />
                    <select name="acessoEdicaoCarro" id="acessoEdicaoCarro">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoCadastraCliente">Acesso ao Cadastra Cliente</label><br    />
                    <input type="text" name="ConsultaParametroAcessoCadastraCliente" id="ConsultaParametroAcessoCadastraCliente"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoCadastraCliente());%>" /><br    />
                    <select name="acessoCadastraCliente" id="acessoCadastraCliente">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoConsultaCliente">Acesso Consulta Cliente</label><br    />
                    <input type="text" name="ConsultaParametroAcessoConsultaCliente" id="ConsultaParametroAcessoConsultaCliente"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoConsultaCliente());%>" /><br    />
                    <select name="acessoConsultaCliente" id="acessoConsultaCliente">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoEdicaoCliente">Acesso a Edição Cliente</label><br    />
                    <input type="text" name="ConsultaParametroAcessoEdicaoCliente" id="ConsultaParametroAcessoEdicaoCliente"
                           readonly="true" 
                           value="<%out.write(" " + a.isAcessoEdicaoCliente());%>" /><br    />
                    <select name="acessoEdicaoCliente" id="acessoEdicaoCliente">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoCadastraLocacao">Acesso Cadastra Locacao</label><br   />
                    <input type="text" name="ConsultaParametroAcessoCadastraLocacao" id="ConsultaParametroAcessoCadastraLocacao"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoCadastraLocacao());%>" /><br    />
                    <select name="acessoCadastraLocacao" id="acessoCadastraLocacao">
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                    <br />
                    <label for="acessoConsultaLocacao">Acesso Consulta Locacao</label><br    />
                    <input type="text" name="ConsultaParametroAcessoConsultaLocacao" id="ConsultaParametroAcessoConsultaLocacao"
                           readonly="true" 
                           value="<%out.write("" + a.isAcessoConsultaLocacao());%>" /><br    />
                    <select name="acessoConsultaLocacao" id="acessoConsultaLocacao">
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
