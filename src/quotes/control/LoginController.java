package quotes.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.entities.User;
import quotes.jpa.manipulation.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService us;
	
	@RequestMapping("/validateLogin")
	public ModelAndView validateLogin(String userName, String password, HttpSession session){
		User requester = us.getUserByName(userName);
		if (requester.getPassword().equals(password))
		{
			session.setAttribute("verifiedUser", requester);
			return new ModelAndView("loginsuccess");
		}
		else 
			return new ModelAndView("loginfailure");
		
	}
	

}
