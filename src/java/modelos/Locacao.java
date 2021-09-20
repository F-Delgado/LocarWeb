package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import metodopix.Autenticar;
import metodopix.CriarCobranca;
import metodopix.QRCode;
import utils.Conexao;

public class Locacao {

    private int id;
    private Date datareserva;
    private Date datalocacao;
    private Date datadevolucao;
    private String placa;
    private String cpfCliente;
    private Cliente cliente;
    private Carro carro;
 

    @Override
    public String toString() {
        return "Locacao{" + "id=" + id + ", datareserva=" + datareserva + ", datalocacao=" + datalocacao + ", datadevolucao=" + datadevolucao + ", placa=" + placa + ", cpfCliente=" + cpfCliente + '}';
    }

    public boolean incluirLocacao() {
        String sql = "insert into locacao (datareserva,datalocacao, ";
        sql += " datadevolucao, placa,cpfcliente) ";
        sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate(1, this.datareserva);
            stm.setDate(2, this.datalocacao);
            stm.setDate(3, this.datadevolucao);
            stm.setString(4, this.placa);
            stm.setString(5, this.cpfCliente);
            stm.execute();

        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarLocacao() {
        Connection con = Conexao.conectar();
        String sql = "update locacao set ";
        sql += "cpfcliente    = ?, ";
        sql += "datalocacao   = ?, ";
        sql += "datareserva   = ?, ";
        sql += "datadevolucao = ?  ";
        sql += "where placa = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            stm.setDate(2, this.datalocacao);
            stm.setDate(3, this.datareserva);
            stm.setDate(4, this.datadevolucao);
            stm.setString(5, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    public List<Locacao> gerarPainel() {
        List<Locacao> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select placa, datareserva, datalocacao,";
        sql += "datadevolucao, cpfcliente ";
        sql += "from locacao ";
        sql += "order by cpfcliente";

        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Locacao loc = new Locacao();
                loc.setPlaca(rs.getString("placa"));
                loc.setDataReserva(rs.getDate("datareserva"));
                loc.setDatalocacao(rs.getDate("datalocacao"));
                loc.setDatadevolucao(rs.getDate("datadevolucao"));
                loc.setCpfCliente(rs.getString("cpfcliente"));
                lista.add(loc);
            }

        } catch (SQLException ex) {
        }
        return lista;
    }

    public List<Locacao> consultarLocacao(String pCpf) {
        this.cpfCliente = pCpf;
        List<Locacao> lista = new ArrayList<>();
        String sql = "select * from locacao where cpfcliente = ?";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Locacao loc = new Locacao();
                loc.setId(rs.getInt("id"));
                loc.setPlaca(rs.getString("placa"));
                loc.setDataReserva(rs.getDate("datareserva"));
                loc.setDatalocacao(rs.getDate("datalocacao"));
                loc.setDatadevolucao(rs.getDate("datadevolucao"));
                loc.setCpfCliente(rs.getString("cpfcliente"));
                lista.add(loc);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return null;
        }
        return lista;
    }
    
    public List<Locacao> consultarLocacaoID(int pId) {
        this.id = pId;
        List<Locacao> lista = new ArrayList<>();
        String sql = "select * from locacao where cpfcliente = ?";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Locacao loc = new Locacao();
                loc.setId(rs.getInt("id"));
                loc.setPlaca(rs.getString("placa"));
                loc.setDataReserva(rs.getDate("datareserva"));
                loc.setDatalocacao(rs.getDate("datalocacao"));
                loc.setDatadevolucao(rs.getDate("datadevolucao"));
                loc.setCpfCliente(rs.getString("cpfcliente"));
                lista.add(loc);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return null;
        }
        return lista;
    }
    
    public boolean locarCarro() {
        Connection con = Conexao.conectar();
        String  sql = "update locacao set ";
                sql += "datalocacao   = current_date ";
                sql += "where id = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    public boolean devolverCarro() {
        Connection con = Conexao.conectar();
        String sql = "update locacao set ";
        sql += "datadevolucao = current_date  ";
        sql += "where id = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    public static void gerarConta(){
        //AUTENTICA
    	Autenticar authProd = new Autenticar();
    	String access_token;
    	
    	//CRIA COBRANÇA
    	CriarCobranca cobranca = new CriarCobranca();
    	String resultCob="";
    	int idCob=0;
        
    	//CRIA QR CODE
    	QRCode location = new QRCode();   //QRCode é criado a partir de um location
    	String resultLoc;
    	String qrCode="";
    	String image="";
    	String imageName;
        
    	//----------------------------------------------------
    	//Autenticar
    	access_token = authProd.geraToken();
    	System.out.println("access_token = "+access_token);
    	
    	//----------------------------------------------------
    	//Criar uma cobrança autenticada
    	resultCob = cobranca.doCob(access_token);
    	idCob = cobranca.getIdCob(resultCob);
    	System.out.println("idCobranca = "+idCob);
    	
    	//----------------------------------------------------
    	//Emitir QRCode a partir de um location
    	resultLoc = location.genQrCode(idCob, access_token);
    	qrCode = location.getQrCode(resultLoc);
    	System.out.println("qrCode = "+qrCode);
    	
    	//----------------------------------------------------
    	//Salvar e exibir a imagem do QRCode
    	image = location.getImage(resultLoc);
    	System.out.println("image = "+image);
    	imageName=location.saveImage(image); //salvando a imagem
    	location.showImage(imageName); //exibindo a imagem
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public Date getDataReserva() {
        return datareserva;
    }

    public void setDataReserva(Date data) {
        this.datareserva = data;
    }

    public Date getDatalocacao() {
        return datalocacao;
    }

    public void setDatalocacao(Date datalocacao) {
        this.datalocacao = datalocacao;
    }

    public Date getDatadevolucao() {
        return datadevolucao;
    }

    public void setDatadevolucao(Date datadevolucao) {
        this.datadevolucao = datadevolucao;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }
}
