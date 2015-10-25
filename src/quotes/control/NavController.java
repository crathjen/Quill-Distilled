package quotes.control;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.entities.User;
import quotes.jpa.test.DBLoader;

@Controller
@RequestMapping("/navigate")
public class NavController {
	
	@Autowired
	DBLoader dl;
	
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	@RequestMapping("/submitQuote")
	public String getSubmitPage(){
		return "submitQuote";
	}
	
	
	@RequestMapping("/userHome")
	public ModelAndView getUserHome(){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//user = em.createQuery("Select u from User u where u.username=?1", User.class).setParameter(1, user.getUsername()).getSingleResult();
		//System.out.println(user.getPassword());
		//System.out.println(user.getUserInterests().size());
		return new ModelAndView("userHome","user",user);
	}
	
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
