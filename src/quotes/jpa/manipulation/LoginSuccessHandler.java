package quotes.jpa.manipulation;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication){
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		try{
		PrintWriter pw = response.getWriter();
		//pw.println(ow.writeValueAsString(authentication));
		response.setStatus(response.SC_ACCEPTED);
		pw.print("{\"name\" : \""+authentication.getName()+"\", ");
		pw.print("\"authorities\" : "+ow.writeValueAsString(authentication.getAuthorities())+"}");
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
