package metodopix;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;

import com.mifmif.common.regex.Generex;


public class CriarCobranca {
	
	public String doCob(String token) {
		String payload;
    	payload = "{\r\n"
    			+ "  \"calendario\": {\r\n"
    			+ "    \"expiracao\": 3600\r\n"
    			+ "  },\r\n"
    			+ "  \"devedor\": {\r\n"
    			+ "    \"cpf\": \"08403143966\",\r\n"
    			+ "    \"nome\": \"Jonathan Hanzen Flores\"\r\n"
    			+ "  },\r\n"
    			+ "  \"valor\": {\r\n"
    			+ "    \"original\": \"0.01\"\r\n"
    			+ "  },\r\n"
    			+ "  \"chave\": \"1fc62ee3-d502-4e43-9cef-1ba3eec8d9c9\",\r\n"
    			+ "  \"solicitacaoPagador\": \"Informe o número ou identificador do pedido.\"\r\n"
    			+ "}";
    	 
    	//cobrança
    	StringBuilder responseBuilder = new StringBuilder();
    	HttpsURLConnection conn = null;
    	
    	try {
    		System.setProperty("javax.net.ssl.keyStore", "producao-310677-infinity-entra2.p12"); 
	        
    		String txid;
    		Generex generex = new Generex("[a-zA-Z0-9]{26,35}");
    		txid = generex.random();
    		//URL DE HOMOLOGACAO
    		URL url = new URL ("https://api-pix.gerencianet.com.br/v2/cob/"+txid);             
	        conn = (HttpsURLConnection)url.openConnection();
	        conn.setDoOutput(true);
	        conn.setRequestMethod("PUT");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Authorization", "Bearer "+ token);

	        OutputStream os = conn.getOutputStream();
	        os.write(payload.getBytes());
	        os.flush();   

	        InputStreamReader reader = new InputStreamReader(conn.getInputStream());
	        BufferedReader br = new BufferedReader(reader);

	        String response;        
	        while ((response = br.readLine()) != null) {
	          responseBuilder.append(response);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return responseBuilder.toString();	
	}
	
	public int getIdCob(String cob) {
		int id = 0;
    	try {
    		JSONObject jsonObject = new JSONObject(cob);
			JSONObject loc = (JSONObject) jsonObject.get("loc");
			id = loc.getInt("id");
		} catch (Exception e) {
			System.out.println("Erro na obtenção do id da Cobrança");
			e.printStackTrace();
		}
		return id;
	}

}

