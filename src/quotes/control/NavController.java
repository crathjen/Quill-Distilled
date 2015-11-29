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

import quotes.jpa.daos.DBLoader;
import quotes.jpa.entities.User;

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
	
	@RequestMapping("/signUp")
	public String getSignupPage(){
		return "signup";
	}
	
	@Transactional
	@RequestMapping("/userHome")
	public ModelAndView getUserHome(){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user=em.find(User.class, user.getUsername());
		em.refresh(user);
		//user = em.createQuery("Select u from User u where u.username=?1", User.class).setParameter(1, user.getUsername()).getSingleResult();
		//System.out.println(user.getPassword());
		//System.out.println(user.getUserInterests().size());
		return new ModelAndView("userHome","user",user);
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
