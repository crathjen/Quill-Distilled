package quotes.jpa.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.Quotation;

public class QuotationDAO {

	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public Quotation quotationExists(Quotation candidate) {
		TypedQuery<Quotation> q=em.createQuery("select q from Quotation q where q.quoteText = ?1", Quotation.class);

		List<Quotation> matches=q.setParameter(1, candidate.getQuoteText()).getResultList();
		//List<Author> matches = em.createQuery("select a from Author a where a.lastName = '"+candidate.getLastName() +"' and a.firstName = '"+candidate.getFirstName()+"'",Author.class).getResultList();
		if (matches !=null &&matches.size()==1)
			{
			return matches.get(0);
			}
		if (matches == null||matches.isEmpty()){
			return candidate;}
		throw new RuntimeException();
	}

}
