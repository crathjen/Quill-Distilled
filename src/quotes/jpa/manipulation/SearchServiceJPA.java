package quotes.jpa.manipulation;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;

public class SearchServiceJPA implements SearchService {

	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public List<Quotation> findQuotesByAuthorLN(String authorLN) {
		System.out.println("in Method");
		List<Quotation> results = em.createQuery("select q from Quotation q where UPPER(q.author.lastName) = UPPER(?1)", Quotation.class).setParameter(1,authorLN).getResultList();
		//System.out.println(results);
		return results;
	}

	public List<Quotation> findQuotesByAuthor(Author author) {
		// TODO Auto-generated method stub
		return null;
	}

	public Quotation getRandomQuote() {
		//System.out.println("Getting Random ...");
		return (Quotation) em.createNativeQuery("select * from quotation q order by random() fetch first 1 rows only",Quotation.class).getSingleResult();
//		List<Integer> ids = (List<Integer>)em.createNativeQuery("select id from quotation").getResultList();
//		int randIndex = (int)(ids.size()*Math.random());
//		int randID = ids.get(randIndex);
//		//return em.find(Quotation.class, randID);
//		TypedQuery<Quotation> query = em.createQuery("select q from Quotation q where q.id = ?1", Quotation.class);
//		//System.out.println("Got past createStatement");
//		return query.setParameter(1, randID).getSingleResult();
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

	@Override
	public List<Quotation> findQuotesByTag(String searchExpression) {
		List<Quotation> results = em.createQuery("select q from Quotation q join q.tags t where UPPER(t.tagText) = UPPER(?1)", Quotation.class).setParameter(1, searchExpression).getResultList();
		return results;
	}

	@Override
	public List<Quotation> findQuotesBySourceTitle(String searchExpression) {
		List<Quotation> results= em.createQuery("select q from Quotation q where UPPER(q.quoteSource.sourceTitle)=UPPER(?1)", Quotation.class).setParameter(1, searchExpression).getResultList();
		return results;
	}

	@Override
	public List<Quotation> findQuotesByQuoteText(String searchExpression) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Quotation> findQuotesByAuthorFN(String searchExpression) {
		
		List<Quotation> results = em.createQuery("select q from Quotation q where UPPER(concat(concat(q.author.firstName,' '),q.author.lastName)) = UPPER(?1)", Quotation.class).setParameter(1,searchExpression).getResultList();
		//System.out.println(results);
		return results;
	}
	@Override
	public List<Quotation> findQuotesByAuthorString(String searchExpression){
		String[] autharr = searchExpression.split(" ");
		List<Quotation> results = new ArrayList();
		if(searchExpression!="")
		for (String s : autharr) {
			s="%"+s.toUpperCase()+"%";
			//System.out.println(s);
			List<Quotation> tempresults = em
					.createQuery("select q from Quotation q where upper(q.author.firstName) like ?1 or upper(q.author.lastName) like ?1",
							Quotation.class)
					.setParameter(1, s).setMaxResults(50).getResultList();
			//System.out.println(tempresults.size());
			for (Quotation q: tempresults){
				if (!results.contains(q))
					results.add(q);
			}
			
		}
		return results;
	}

	@Override
	public List<Quotation> findQuotesByAuthorID(String searchExpression) {
		List<Quotation> results=em.createQuery("select q from Quotation q where q.author.id=?1",Quotation.class).setParameter(1, Integer.parseInt(searchExpression)).getResultList();
		return results;
	}

	@Override
	public List<Quotation> findQuotesBySourceID(String searchExpression) {
		List<Quotation> results=em.createQuery("select q from Quotation q where q.quoteSource.id=?1",Quotation.class).setParameter(1, Integer.parseInt(searchExpression)).getResultList();
		return results;
	}

	@Override
	public List<Quotation> findQuotesByTagID(String searchExpression) {
		List<Quotation> results=em.createQuery("select q from Quotation q join q.tags t where t.id=?1",Quotation.class).setParameter(1, Integer.parseInt(searchExpression)).getResultList();
		return results;
	}

}
