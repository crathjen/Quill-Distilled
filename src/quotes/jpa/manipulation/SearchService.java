package quotes.jpa.manipulation;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;

public interface SearchService {
	@Transactional
	public List<Quotation> findQuotesByAuthorLN(String author);
	
	@Transactional
	public List<Quotation> findQuotesByAuthor(Author author);
	
	@Transactional
	public Quotation getRandomQuote();
	
	@Transactional
	public Quotation getRandomQuoteByAuthor(String author);
	
	@Transactional
	public Quotation getRandomQuoteByAuthor(Author author);

	@Transactional
	public List<Quotation> findQuotesByTag(String searchExpression);

	@Transactional
	public List<Quotation> findQuotesBySourceTitle(String searchExpression);

	public List<Quotation> findQuotesByQuoteText(String searchExpression);

	public List<Quotation> findQuotesByAuthorFN(String searchExpression);
	
	
	
	

}
