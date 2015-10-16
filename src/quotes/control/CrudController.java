package quotes.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CrudController {
	@RequestMapping("submitQuote")
	public ModelAndView submitPage(){
		return new ModelAndView("submitQuote");
	}

}
