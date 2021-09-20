package metodopix;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.Base64;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;

import org.json.JSONObject;

public class Autenticar {
	private final String client_id = "Client_Id_1d33fa1adea2a8834b354e61a2d2f4b2fd0940e6";
	private final String client_secret = "Client_Secret_b2aa019c40f8a6d11060b628133f629c63c7a0c1";
	private final String basicAuth = Base64.getEncoder().encodeToString(((client_id+':'+client_secret).getBytes()));
	

	public String geraToken() {
		String tokenAcesso="";
		try {
			//Diretório em que seu certificado em formato .p12 deve ser inserido
	        System.setProperty("javax.net.ssl.keyStore", "C:\\Teste\\producao-310677-infinity-entra2.p12"); 
	        SSLSocketFactory sslsocketfactory = (SSLSocketFactory) SSLSocketFactory.getDefault();
	       
	        //URL DA API PARA HOMOLOGACAO
	        URL url = new URL ("https://api-pix.gerencianet.com.br/oauth/token");             
	        HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
	        conn.setDoOutput(true);
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Authorization", "Basic "+ basicAuth);
	        conn.setSSLSocketFactory(sslsocketfactory);
	        String input = "{\"grant_type\": \"client_credentials\"}";
	       
	        OutputStream os = conn.getOutputStream();
	        os.write(input.getBytes());
	        os.flush();   

	        InputStreamReader reader = new InputStreamReader(conn.getInputStream());
	        BufferedReader br = new BufferedReader(reader);

	        String response;
	        StringBuilder responseBuilder = new StringBuilder();
	        while ((response = br.readLine()) != null) {
	          //System.out.println(response);
	          responseBuilder.append(response);
	        }
	        try {
				JSONObject jsonObject = new JSONObject(responseBuilder.toString());
				tokenAcesso = jsonObject.getString("access_token");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Erro na conversão de "+responseBuilder);
				e.printStackTrace();
			}
	        conn.disconnect();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Erro na autenticação de ");
			e.printStackTrace();
		}
        
		return tokenAcesso;
	}

}
