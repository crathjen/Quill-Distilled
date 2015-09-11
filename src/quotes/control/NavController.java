package quotes.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/navigate")
public class NavController {
	@RequestMapping("/search")
	public ModelAndView searchPage(){
		return new ModelAndView("search");
	}
	@RequestMapping("/login")
	public String loginPage(){
		return "login";
	}

}
