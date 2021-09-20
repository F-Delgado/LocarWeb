<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Locacao"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
        <style>
            button{
                background-color: green;                
            }
        </style>
    </head>
    <body>
        <%
            List<Locacao> locacoes = new ArrayList();
            
            String cpfcliente = request.getParameter("cpfcliente");
            Locacao locacao = new Locacao();
            if (cpfcliente != null) {
                locacoes = locacao.consultarLocacao(cpfcliente);
            } 
        %>

        <script src="scripts/menu.js"></script>  

        <h1>Consulta Locação</h1>
        <label>
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>

        </label>
        <hr />
        <form action="consultalocacao.jsp" method="POST">
            <label>Buscar pelo CPF</label>
            <input type="text" name="cpfcliente" placeholder="Informe o CPF que deseja procurar" />

            <input type="submit" value="Consultar" />
            <hr />
            <table>
                <thead>
                <th>ID</th>
                <th>Carro</th>
                <th>Cliente</th>
                <th>Data Reserva</th>
                <th>Data Retirada</th>
                <th>Data Devolução</th>
                <th>Locar </th>
                <th>Devolver </th>
                <th>Gerar Conta </th>
                </thead>
                <tbody>
                    <%for (Locacao loc : locacoes) {%>
                    <tr>
                        <td><%out.write("" + loc.getId());%></td>
                        <td><%out.write("" + loc.getPlaca());%></td>
                        <td><%out.write("" + loc.getCpfCliente());%></td>
                        <td><%out.write(String.valueOf(loc.getDataReserva()));%></td>
                        <td><%out.write(String.valueOf(loc.getDatalocacao()));%></td>
                        <td><%out.write(String.valueOf(loc.getDatadevolucao()));%></td>
                        <td><%out.write("<a href=locarcarro.jsp?idlocacao=" + loc.getId() + ">Locar</a>");%></td>
                        <td><%out.write("<a href=editarcarrodev.jsp?placa=" + loc.getPlaca()+ "&id=" + loc.getId() + ">Devolver</a>");%></td>
                        <td><%out.write("<a href=gerarconta.jsp?cpfcliente=" + loc.getCpfCliente()+ ">Gerar Conta</a>");%></td>
                    </tr>
                    <%}%>
                </tbody>    
            </table>

        </form>

    </body>
</html>
