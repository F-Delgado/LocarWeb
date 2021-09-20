<%@page import="metodopix.QRCode"%>
<%@page import="metodopix.CriarCobranca"%>
<%@page import="metodopix.Autenticar"%>
<%@page import="modelos.Carro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locadora Céu Azul</title>
    </head>
    <body>
        <%
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
        imageName=location.saveImage(image);
       
    	//System.out.println("image = "+image);
    	//imageName=location.saveImage(image); //salvando a imagem
    	//location.showImage(imageName); //exibindo a imagem
            
        %>
        
        <img src="<%=image%>"
        
        <hr />
    </body>
</html>
