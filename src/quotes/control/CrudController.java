package quotes.control;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.SubjectTag;
import quotes.jpa.entities.User;
import quotes.jpa.entities.UserAuthorRating;
import quotes.jpa.entities.UserQuoteRating;

@Controller
public class CrudController {

	@PersistenceContext(unitName = "EMF")
	protected EntityManager em;

	@RequestMapping("submitQuote")
	public ModelAndView submitPage() {
		return new ModelAndView("submitQuote");
	}

	@RequestMapping(path = "/submitvalidation/author", produces = "application/json")
	@ResponseBody
	public List<Author> getAuthorMatches(String author) {
		String[] autharr = author.split(" ");
		List<Author> results = new ArrayList();
		if(author!="")
		for (String s : autharr) {
			s="%"+s.toUpperCase()+"%";
			//System.out.println(s);
			List<Author> tempresults = em
					.createQuery("select a from Author a where upper(a.firstName) like ?1 or upper(a.lastName) like ?1",
							Author.class)
					.setParameter(1, s).getResultList();
			//System.out.println(tempresults.size());
			for (Author a: tempresults){
				if (!results.contains(a))
					results.add(a);
			}
		}	
		return results;
	}
	
	@ResponseBody
	@RequestMapping(path="/submitvalidation/tag")
	public List<SubjectTag> getTagMatches(String tag){
		String s="%"+tag.toUpperCase()+"%";
		List<SubjectTag> results=em.createQuery("select t from SubjectTag t where upper(t.tagText) like ?1", SubjectTag.class).setParameter(1, s).getResultList();
		return results;
	}
	@ResponseBody
	@Transactional
	@RequestMapping(path="/updateUser/addInterest")
	public String addUserInterest(String tagID, HttpServletResponse response){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try{
			int tID=Integer.parseInt(tagID);
			SubjectTag tag = em.createQuery("select t from SubjectTag t where t.id=?1", SubjectTag.class).setParameter(1, tID).getResultList().get(0);
			user=em.find(User.class,user.getUsername());
			user.addUserInterest(tag);
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	@ResponseBody
	@Transactional
	@RequestMapping(path="/updateUser/addQuoteRating")
	public String addQuoteRating(String quoteID, String score, Principal principal){
		try{
		User user = em.find(User.class,  principal.getName());
		//Quotation quote = em.createQuery("select q from Quotation q where q.id=?1", Quotation.class).setParameter(1, Integer.parseInt(quoteID)).getResultList().get(0);
		UserQuoteRating uqr = new UserQuoteRating();
		//uqr.setQuotation(quote);
		//uqr.setUser(user);
		uqr.setRating(Integer.parseInt(score));
		uqr.setQuoteID(Integer.parseInt(quoteID));
		uqr.setUserName(user.getUsername());
		em.merge(uqr);
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	@ResponseBody
	@Transactional
	@RequestMapping(path="/updateUser/addAuthorRating")
	public String addAuthorRating(String authorID, String score, Principal principal){
		try{
			UserAuthorRating uar = new UserAuthorRating();
			uar.setAuthorID(Integer.parseInt(authorID));
			uar.setUserName(principal.getName());
			uar.setRating(Integer.parseInt(score));
			em.merge(uar);
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	
}
