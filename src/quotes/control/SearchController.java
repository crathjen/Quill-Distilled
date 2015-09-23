package quotes.control;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import quotes.jpa.entities.Quotation;
import quotes.jpa.manipulation.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private SearchService ss;

	
	@RequestMapping("/random")
	public ModelAndView getRandom(){
		//SearchService ss = context.getBean(SearchService.class);
		ArrayList<Quotation> results= new ArrayList<>();
		results.add(ss.getRandomQuote());
	return new ModelAndView("DisplayQuotes","results",results);	
	}
	
	@RequestMapping(params = "searchType=authorLN")
	public ModelAndView getQuoteByAuthorLN(String searchExpression){
		return new ModelAndView("DisplayQuotes","results", ss.findQuotesByAuthor(searchExpression));
	}
	
	@RequestMapping(params = "searchType=tag")
	public ModelAndView getQuoteByTag(String searchExpression){
		return new ModelAndView("DisplayQuotes","results", ss.findQuotesByTag(searchExpression));
	}
	

}

