package quotes.jpa.manipulation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;

public class SearchServiceJPA implements SearchService {

	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public List<Quotation> findQuotesByAuthor(String authorLN) {
		System.out.println("in Method");
		List<Quotation> results = em.createQuery("select q from Quotation q where q.author.lastName = ?1", Quotation.class).setParameter(1,authorLN).getResultList();
		//System.out.println(results);
		return results;
	}

	public List<Quotation> findQuotesByAuthor(Author author) {
		// TODO Auto-generated method stub
		return null;
	}

	public Quotation getRandomQuote() {
		System.out.println("Getting Random ...");
		List<Integer> ids = (List<Integer>)em.createNativeQuery("select id from quotation").getResultList();
		int randIndex = (int)(ids.size()*Math.random());
		int randID = ids.get(randIndex);
		//return em.find(Quotation.class, randID);
		TypedQuery<Quotation> query = em.createQuery("select q from Quotation q where q.id = ?1", Quotation.class);
		//System.out.println("Got past createStatement");
		return query.setParameter(1, randID).getSingleResult();
		//WHY DOESN"T THE TYPED QUERY FUNCTION??????

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
