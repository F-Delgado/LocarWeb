package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Cliente {

    private String cpf;
    private String nome;
    private String email;
    private int nrcartao;
 

    @Override
    public String toString() {
        return cpf + " " + nome + " " + email + " " + nrcartao + " " + "\n";
    }

    public boolean incluirCliente() {
        // declarando comando de execucao do banco de dados
        String sql = "INSERT INTO cliente ";
        sql += "(cpf, nome, email, nrcartao) ";
        sql += "VALUES(?,?,?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.setString(2, this.nome);
            stm.setString(3, this.email);
            stm.setInt(4, this.nrcartao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarCliente() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE cliente ";
        sql += "set nome     = ?, ";
        sql += "    email    = ?, ";
        sql += "    nrcartao = ?,  ";
        sql += "where cpf = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.email);
            stm.setInt(3, this.nrcartao);
            stm.setString(6, this.cpf);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirCliente() {
        String sql = "DELETE FROM cliente ";
        sql += "WHERE cpf = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
   //realiza consulta do cliente pelo CPF
    public Cliente consultarCliente(String pCpf) {
        this.cpf = pCpf;
        String sql = "select cpf, nome,email,nrcartao ";
        sql += "from cliente ";
        sql += "where cpf = ?";
        Connection con = Conexao.conectar();
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setCpf(rs.getString("cpf"));
                cliente.setEmail(rs.getString("email"));
                cliente.setNome(rs.getString("nome"));
                cliente.setNrCartao(rs.getInt("nrcartao"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return cliente;
    }
    //realiza pesquisa de todos os clientes
    public List<Cliente> consultarGeral() {
        List<Cliente> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from cliente order by cpf";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setCpf(rs.getString("cpf"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setNrCartao(rs.getInt("nrcartao"));
                lista.add(cliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    

// secao de getters e setters
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNrCartao() {
        return nrcartao;
    }

    public void setNrCartao(int nrcartao) {
        this.nrcartao = nrcartao;
    }

}

  
