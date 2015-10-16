package quotes.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import quotes.jpa.entities.Quotation;
import quotes.jpa.manipulation.SearchService;

@RestController
public class ServiceController {

	@Autowired
	private SearchService ss;
	
	@RequestMapping(path = "/search", params="searchType=authorLN", produces = "application/json")
	public List<Quotation> authorSearchLN(String searchExpression){
		return ss.findQuotesByAuthorLN(searchExpression);
	}

	@RequestMapping(path="/search", params="searchType=tag", produces="application/json")
	public List<Quotation> tagSearch(String searchExpression){
		return ss.findQuotesByTag(searchExpression);
	}
	
	@RequestMapping(path="/random", produces="application/json")
	public List<Quotation> randomQuote(){
		ArrayList<Quotation> al = new ArrayList<Quotation>();
		al.add(ss.getRandomQuote());
		return al;
	}
	@RequestMapping(path="/search", params="searchType=authorFN", produces="application/json")
	public List<Quotation> authorSearchFN(String searchExpression){
		//System.out.println(searchExpression);
		return ss.findQuotesByAuthorFN(searchExpression);
	}
	@RequestMapping(path="/search", params="searchType=bookTitle", produces="application/json")
	public List<Quotation> sourceSearch(String searchExpression){
		//System.out.println(searchExpression);
		return ss.findQuotesBySourceTitle(searchExpression);
	}
	
	
}
