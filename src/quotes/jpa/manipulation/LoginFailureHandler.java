package quotes.jpa.manipulation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception){
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		try{
		response.getWriter().print(ow.writeValueAsString(exception));
		response.setStatus(response.SC_NOT_ACCEPTABLE);
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
