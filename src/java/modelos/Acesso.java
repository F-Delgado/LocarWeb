package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Conexao;

public class Acesso {

    private String idUsuario;
    private String usuario;
    private boolean acessoCadastraUsuario;
    private boolean acessoConsultaUsuario;
    private boolean acessoEdicaoUsuario;
    private boolean acessoCadastraCarro;
    private boolean acessoConsultaCarro;
    private boolean acessoEdicaoCarro;
    private boolean acessoCadastraCliente;
    private boolean acessoConsultaCliente;
    private boolean acessoEdicaoCliente;
    private boolean acessoCadastraLocacao;
    private boolean acessoConsultaLocacao;
    private String grupo;

    public boolean incluirAcesso() {
        // declarando comando de execucao do banco de dados
        String sql = "INSERT INTO acesso ";
        sql += "(usuario,"
                + "acessoCadastraUsuario ,"
                + "acessoConsultaUsuario,"
                + "acessoEdicaoUsuario,"
                + "acessoCadastraCarro, "
                + "acessoConsultaCarro,"
                + " acessoEdicaoCarro,"
                + "acessoCadastraCliente,"
                + "acessoConsultaCliente,"
                + "acessoEdicaoCliente,"
                + "acessoCadastraLocacao,"
                + "acessoConsultaLocacao,"
                + "grupo)";
        sql += "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.setBoolean(2, this.acessoCadastraUsuario);
            stm.setBoolean(3, this.acessoConsultaUsuario);
            stm.setBoolean(4, this.acessoEdicaoUsuario);
            stm.setBoolean(5, this.acessoCadastraCarro);
            stm.setBoolean(6, this.acessoConsultaCarro);
            stm.setBoolean(7, this.acessoEdicaoCarro);
            stm.setBoolean(8, this.acessoCadastraCliente);
            stm.setBoolean(9, this.acessoConsultaCliente);
            stm.setBoolean(10, this.acessoEdicaoCliente);
            stm.setBoolean(11, this.acessoCadastraLocacao);
            stm.setBoolean(12, this.acessoConsultaLocacao);
            stm.setString(13, this.grupo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Acesso consultarPermissoes(String pUsuario) {
        this.usuario = pUsuario;
        String sql = "select * from acesso where usuario = ?";
        Connection con = Conexao.conectar();
        Acesso ac = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ac = new Acesso();
                ac.setUsuario(rs.getString("usuario"));
                ac.setGrupo(rs.getString("grupo"));
                ac.setAcessoCadastraUsuario(rs.getBoolean("acessoCadastraUsuario"));
                ac.setAcessoConsultaUsuario(rs.getBoolean("acessoConsultaUsuario"));
                ac.setAcessoEdicaoUsuario(rs.getBoolean("acessoEdicaoUsuario"));
                ac.setAcessoCadastraCarro(rs.getBoolean("acessoCadastraCarro"));
                ac.setAcessoConsultaCarro(rs.getBoolean("acessoConsultaCarro"));
                ac.setAcessoEdicaoCarro(rs.getBoolean("acessoEdicaoCarro"));
                ac.setAcessoCadastraCliente(rs.getBoolean("acessoCadastraCliente"));
                ac.setAcessoConsultaCliente(rs.getBoolean("acessoConsultaCliente"));
                ac.setAcessoEdicaoCliente(rs.getBoolean("acessoEdicaoCliente"));
                ac.setAcessoCadastraLocacao(rs.getBoolean("acessoCadastraLocacao"));
                ac.setAcessoConsultaLocacao(rs.getBoolean("acessoConsultaLocacao"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: no comando sql" + ex.getMessage());
        }
        return ac;
    }

    public boolean alterarAcesso() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE acesso "
                + "SET grupo=?,"
                + "acessoCadastraUsuario=?,"
                + "acessoConsultaUsuario=?,"
                + "acessoEdicaoUsuario=?,"
                + "acessoCadastraCarro=?,"
                + "acessoConsultaCarro=?,"
                + "acessoEdicaoCarro=?,"
                + "acessoCadastraCliente=?,"
                + "acessoConsultaCliente=?,"
                + "acessoEdicaoCliente=?,"
                + "acessoCadastraLocacao=?,"
                + "acessoConsultaLocacao =?"
                + "where usuario=?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.grupo);
            stm.setBoolean(2, this.acessoCadastraUsuario);
            stm.setBoolean(3, this.acessoConsultaUsuario);
            stm.setBoolean(4, this.acessoEdicaoUsuario);
            stm.setBoolean(5, this.acessoCadastraCarro);
            stm.setBoolean(6, this.acessoConsultaCarro);
            stm.setBoolean(7, this.acessoEdicaoCarro);
            stm.setBoolean(8, this.acessoCadastraCliente);
            stm.setBoolean(9, this.acessoConsultaCliente);
            stm.setBoolean(10, this.acessoEdicaoCliente);
            stm.setBoolean(11, this.acessoCadastraLocacao);
            stm.setBoolean(12, this.acessoConsultaLocacao);
            stm.setString(13, this.usuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Acesso{" + "idUsuario=" + idUsuario + ", usuario=" + usuario + ", acessoCadastraUsuario=" + acessoCadastraUsuario + ", acessoConsultaUsuario=" + acessoConsultaUsuario + ", acessoEdicaoUsuario=" + acessoEdicaoUsuario + ", acessoCadastraCarro=" + acessoCadastraCarro + ", acessoConsultaCarro=" + acessoConsultaCarro + ", acessoEdicaoCarro=" + acessoEdicaoCarro + ", acessoCadastraCliente=" + acessoCadastraCliente + ", acessoConsultaCliente=" + acessoConsultaCliente + ", acessoEdicaoCliente=" + acessoEdicaoCliente + ", acessoCadastraLocacao=" + acessoCadastraLocacao + ", acessoConsultaLocacao=" + acessoConsultaLocacao + ", grupo=" + grupo + '}';
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public boolean isAcessoCadastraCarro() {
        return acessoCadastraCarro;
    }

    public void setAcessoCadastraCarro(boolean acessoCadastraCarro) {
        this.acessoCadastraCarro = acessoCadastraCarro;
    }

    public boolean isAcessoConsultaCarro() {
        return acessoConsultaCarro;
    }

    public void setAcessoConsultaCarro(boolean acessoConsultaCarro) {
        this.acessoConsultaCarro = acessoConsultaCarro;
    }

    public boolean isAcessoEdicaoCarro() {
        return acessoEdicaoCarro;
    }

    public void setAcessoEdicaoCarro(boolean acessoEdicaoCarro) {
        this.acessoEdicaoCarro = acessoEdicaoCarro;
    }

    public boolean isAcessoCadastraCliente() {
        return acessoCadastraCliente;
    }

    public void setAcessoCadastraCliente(boolean acessoCadastraCliente) {
        this.acessoCadastraCliente = acessoCadastraCliente;
    }

    public boolean isAcessoConsultaCliente() {
        return acessoConsultaCliente;
    }

    public void setAcessoConsultaCliente(boolean acessoConsultaCliente) {
        this.acessoConsultaCliente = acessoConsultaCliente;
    }

    public boolean isAcessoEdicaoCliente() {
        return acessoEdicaoCliente;
    }

    public void setAcessoEdicaoCliente(boolean acessoEdicaoCliente) {
        this.acessoEdicaoCliente = acessoEdicaoCliente;
    }

    public boolean isAcessoCadastraLocacao() {
        return acessoCadastraLocacao;
    }

    public void setAcessoCadastraLocacao(boolean acessoCadastraLocacao) {
        this.acessoCadastraLocacao = acessoCadastraLocacao;
    }

    public boolean isAcessoConsultaLocacao() {
        return acessoConsultaLocacao;
    }

    public void setAcessoConsultaLocacao(boolean acessoConsultaLocacao) {
        this.acessoConsultaLocacao = acessoConsultaLocacao;
    }

    public boolean isAcessoCadastraUsuario() {
        return acessoCadastraUsuario;
    }

    public void setAcessoCadastraUsuario(boolean acessoCadastraUsuario) {
        this.acessoCadastraUsuario = acessoCadastraUsuario;
    }

    public boolean isAcessoConsultaUsuario() {
        return acessoConsultaUsuario;
    }

    public void setAcessoConsultaUsuario(boolean acessoConsultaUsuario) {
        this.acessoConsultaUsuario = acessoConsultaUsuario;
    }

    public boolean isAcessoEdicaoUsuario() {
        return acessoEdicaoUsuario;
    }

    public void setAcessoEdicaoUsuario(boolean acessoEdicaoUsuario) {
        this.acessoEdicaoUsuario = acessoEdicaoUsuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
        public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
}
