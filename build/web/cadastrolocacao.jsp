<%@page import="modelos.Acesso"%>
<%@page import="modelos.Locacao"%>
<%@page import="modelos.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css"> 
        <style>
            input[type=date], select{
                margin-left: 20px;  
            }
        </style>
    </head>
    <body>
        <script src="scripts/menu.js"></script>  
        <h1>Cadastro Locação</h1>
        <hr />
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>
        </label>
        <%
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            Acesso ac = new Acesso();
            ac = ac.consultarPermissoes(usuario);
                if (usuario == null) {
                     response.sendRedirect("login.jsp?pmensagem=PorFavorRealizarLogin");
                } else if (ac.isAcessoCadastraLocacao() == true){
                    
                 } else {
                   response.sendRedirect("login.jsp?pmensagem=UsuarioSemAcessoEntrarContatoComAdministrador");
                  } 
                
               
            

        %>
        <%  Carro carro = new Carro();
            List<Carro> carros = carro.consultarTodosCarrosDisponiveis();

            Cliente cliente = new Cliente();
            List<Cliente> clientes = cliente.consultarGeral();
        %>  
        <form action="recebedadoslocacao.jsp" method="POST">
            <div style="height: 180px">  
                <label>Selecione o carro para locação </label> <br/>
                <select name="placa">
                    <% for (Carro car
                                : carros) { %>
                    <option value="<%out.write(car.getPlaca());%>">
                        <% out.write(car.getPlaca() + " - " + car.getModelo()); %> 
                        <%}%>
                </select> 
                <br />
                <label>Selecione o cliente para locação </label> <br/>
                <select name="cpfcliente">
                    <%for (Cliente c
                                : clientes) {%>
                    <option value="<%out.write(c.getCpf());%>">
                        <% out.write(c.getNome() + "-" + c.getCpf()); %>
                    </option>
                    <%}%>
                </select>
                <br />
                <label>Informe a data </label> <br/>
                <input type="date" name="datareserva" />
                <hr />
                <input type="submit" value="Salvar" />  
            </div>     
        </form>        
    </body>
</html>
