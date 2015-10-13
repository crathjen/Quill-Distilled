package quotes.jpa.manipulation;

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
		response.getWriter().print(ow.writeValueAsString(authentication));
		response.setStatus(response.SC_ACCEPTED);
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
