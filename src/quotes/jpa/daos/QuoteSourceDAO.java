package quotes.jpa.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.QuoteSource;

public class QuoteSourceDAO {
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public QuoteSource sourceExists(QuoteSource candidate) {
		TypedQuery<QuoteSource> q=em.createQuery("select s from QuoteSource s where s.author.lastName = ?1 and s.author.firstName = ?2 and s.sourceTitle = ?3", QuoteSource.class);
		
		List<QuoteSource> matches=q.setParameter(1, candidate.getAuthor().getLastName()).setParameter(2, candidate.getAuthor().getFirstName()).setParameter(3, candidate.getSourceTitle()).getResultList();
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
