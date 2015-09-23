package quotes.control;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.test.DBLoader;

@Controller
@RequestMapping("/navigate")
public class NavController {
	
	@Autowired
	DBLoader dl;
	
	@RequestMapping("/search")
	public ModelAndView searchPage(){
		return new ModelAndView("search");
	}
	@RequestMapping("/login")
	public String loginPage(){
		return "login";
	}
	@RequestMapping("/dbloader")
	public String loaderPage(){
		return "loader";
	}
	@RequestMapping("/scrape")
	public ModelAndView load(String url) throws IOException{

		dl.load(url);
		return new ModelAndView("loader","url",url);
	}
}
