package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Carro {

    private String placa;
    private String marca;
    private String modelo;
    private int km;
    private boolean arcondicionado;
    private boolean direcaohidraulica;
    private boolean situacao;
    
    
    @Override
    public String toString() {
        return "Carro{" + ", placa=" + placa + ", marca=" + marca + ", modelo=" + modelo + ", km=" + km + ", arcondicionado=" + arcondicionado + ", direcaohidraulica=" + direcaohidraulica + ", situacao=" + situacao + '}';
    }
 
    public boolean incluirCarro() {
        // declarando comando de execucao do banco de dados
        String sql = "INSERT INTO carro ";
        sql += "(placa, marca, modelo, km, arcondicionado, direcaohidraulica,situacao) ";
        sql += " VALUES(?,?,?,?,?,?,?) ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.setString(2, this.marca);
            stm.setString(3, this.modelo);
            stm.setInt(4, this.km);
            stm.setBoolean(5, this.arcondicionado);
            stm.setBoolean(6, this.direcaohidraulica);
            stm.setBoolean(7, this.situacao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarCarro() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE carro ";
        sql += "SET marca  = ?, ";
        sql += "    modelo = ?, ";
        sql += "    km     = ?, ";
        sql += "    arcondicionado    = ?, ";
        sql += "    direcaohidraulica = ? ";
        sql += "where placa = ?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.marca);
            stm.setString(2, this.modelo);
            stm.setInt(3, this.km);
            stm.setBoolean(4, this.arcondicionado);
            stm.setBoolean(5, this.direcaohidraulica);
            stm.setString(6, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarSituacaoCarroFalse() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE carro set situacao=false where placa=?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return true;
    }

    public boolean alterarSituacaoCarroTrue() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE carro set situacao=true where placa=?";
        
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return true;
    }

    public boolean excluirCarro() {
        String sql = "DELETE FROM carro ";
        sql += "WHERE placa = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Carro consultarCarro(String pPlaca) {
        this.placa = pPlaca;
        String sql = "select * from carro where placa =?";
        Connection con = Conexao.conectar();
        Carro car = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                car = new Carro();
                car.setPlaca(rs.getString("placa"));
                car.setMarca(rs.getString("marca"));
                car.setModelo(rs.getString("modelo"));
                car.setKm(rs.getInt("km"));
                car.setDirecaohidraulica(rs.getBoolean("direcaohidraulica"));
                car.setArcondicionado(rs.getBoolean("arcondicionado"));
                car.setSituacao(rs.getBoolean("situacao"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return car;
    }

    public List<Carro> consultarTodosCarros() {
        List<Carro> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from carro";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Carro car = new Carro();
                car.setPlaca(rs.getString("placa"));
                car.setMarca(rs.getString("marca"));
                car.setModelo(rs.getString("modelo"));
                car.setKm(rs.getInt("km"));
                car.setArcondicionado(rs.getBoolean("arcondicionado"));
                car.setDirecaohidraulica(rs.getBoolean("direcaohidraulica"));
                car.setSituacao(rs.getBoolean("situacao"));
                lista.add(car);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    public List<Carro> consultarTodosCarrosDisponiveis() {
        List<Carro> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from carro where situacao=true";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Carro car = new Carro();
                car.setPlaca(rs.getString("placa"));
                car.setMarca(rs.getString("marca"));
                car.setModelo(rs.getString("modelo"));
                car.setKm(rs.getInt("km"));
                car.setArcondicionado(rs.getBoolean("arcondicionado"));
                car.setDirecaohidraulica(rs.getBoolean("direcaohidraulica"));
                car.setSituacao(rs.getBoolean("situacao"));
                lista.add(car);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    // area de getters e setters
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getKm() {
        return km;
    }

    public void setKm(int km) {
        this.km = km;
    }

    public boolean isArcondicionado() {
        return arcondicionado;
    }

    public void setArcondicionado(boolean arcondicionado) {
        this.arcondicionado = arcondicionado;
    }

    public boolean isDirecaohidraulica() {
        return direcaohidraulica;
    }

    public void setDirecaohidraulica(boolean direcaohidraulica) {
        this.direcaohidraulica = direcaohidraulica;
    }

    public boolean isSituacao() {
        return situacao;
    }

    public void setSituacao(boolean situacao) {
        this.situacao = situacao;
    }
}
