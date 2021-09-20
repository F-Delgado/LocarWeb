package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class MetodosPagto {

    private String cpfCliente;
    private String Pagto;

    public boolean incluirMetodosPagto() {
        // declarando comando de execucao do banco de dados
        String sql = "insert into pagamento (cpfcliente,pagto) VALUES(?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            stm.setString(2, this.Pagto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public List<MetodosPagto> consultarGeral() {
        List<MetodosPagto> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from pagamento order by cpfcliente";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MetodosPagto mpg = new MetodosPagto();
                mpg.setCpfCliente(rs.getString("cpfCliente"));
                mpg.setPagto(rs.getString("Pagto"));
                lista.add(mpg);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public String getPagto() {
        return Pagto;
    }

    public void setPagto(String Pagto) {
        this.Pagto = Pagto;
    }

}
