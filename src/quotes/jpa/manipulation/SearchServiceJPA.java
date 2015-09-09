package quotes.jpa.manipulation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;

public class SearchServiceJPA implements SearchService {

	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public List<Quotation> findQuotesByAuthor(String authorLN) {
		System.out.println("in Method");
		return 	em.createQuery("select q from Quotation q where q.author.lastName = '"+authorLN+"'", Quotation.class).getResultList();
	}

	public List<Quotation> findQuotesByAuthor(Author author) {
		// TODO Auto-generated method stub
		return null;
	}

	public Quotation getRandomQuote() {
		// TODO Auto-generated method stub
		return null;
	}

	public Quotation getRandomQuoteByAuthor(String author) {
		// TODO Auto-generated method stub
		return null;
	}

	public Quotation getRandomQuoteByAuthor(Author author) {
		// TODO Auto-generated method stub
		return null;
	}

}
