package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Usuario {
    private String usuario;
    private String senhausuario;
    private String cpfCliente;
    

    public boolean incluirUsuario() {
        // declarando comando de execucao do banco de dados
        String sql = "insert into usuario (usuario,senhausuario,cpfcliente) VALUES (?,?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.setString(2, this.senhausuario);
            stm.setString(3, this.cpfCliente);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarSenha() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE usuario ";
        sql += "set senhausuario    = ? ";
        sql += "where usuario =  ?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senhausuario);
            stm.setString(2, this.usuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirUsuario() {
        String sql = "DELETE FROM usuario ";
        sql += "WHERE usuario  =? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
   
    public Usuario consultarUsuario(String pUsuario) {
        this.usuario = pUsuario;
        String sql = "select usuario,senhausuario,cpfcliente,grupo ";
        sql += "from usuario";
        sql += "where usuario = ?";
        Connection con = Conexao.conectar();
        Usuario usuario = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.setString(2, this.cpfCliente);
            stm.setString(3, this.senhausuario);
            
            
            
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setCpfCliente(rs.getString("cpfcliente"));
                usuario.setSenhausuario(rs.getString("senhausuario"));
                
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return usuario;
    }
    //realiza pesquisa de todos os usuarios
    public List<Usuario> consultarGeral() {
        List<Usuario> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select usuario,cpfcliente ";
        sql += "from usuario";
       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setCpfCliente(rs.getString("cpfcliente"));
                lista.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
       //realiza consulta para validar usuario e senha pelo BD para iniciar uma sessao
       public static boolean podeLogar(String pUser, String pSenha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where usuario = ? and senhausuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            stm.setString(2, pSenha);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  
       
       //realiza consulta do cliente pelo nome do usuario
       public boolean userExiste(String pUser){
        Connection con = Conexao.conectar();
        String sql = "select tipousuario from cliente where usuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  

    @Override
    public String toString() {
        return "Usuario{" + "usuario=" + usuario + ", senhausuario=" + senhausuario + ", cpfCliente=" + cpfCliente +  '}';
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenhausuario() {
        return senhausuario;
    }

    public void setSenhausuario(String senhausuario) {
        this.senhausuario = senhausuario;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }


    
    
}
