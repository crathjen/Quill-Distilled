package quotes.control;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.entities.Author;

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
}
