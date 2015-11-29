package quotes.jpa.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;
import quotes.jpa.entities.QuoteSource;
import quotes.jpa.entities.SubjectTag;

public class CompositeDAO {
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public Author authorExists(Author candidate) {
		if(candidate.getFirstName()!=null&&candidate.getLastName()!=null){
		TypedQuery<Author> q=em.createQuery("select a from Author a where a.lastName = ?1 and a.firstName = ?2", Author.class);
		List<Author> matches=q.setParameter(1, candidate.getLastName()).setParameter(2, candidate.getFirstName()).getResultList();
		//List<Author> matches = em.createQuery("select a from Author a where a.lastName = '"+candidate.getLastName() +"' and a.firstName = '"+candidate.getFirstName()+"'",Author.class).getResultList();
		if (matches !=null &&matches.size()==1)
			{
			return matches.get(0);
			}
		if (matches == null||matches.isEmpty()){
			return candidate;}
		}else if (candidate.getFirstName()==null&&candidate.getLastName()!=null){
			TypedQuery<Author> q=em.createQuery("select a from Author a where a.lastName=?1 and a.firstName is null", Author.class);
			List<Author> matches=q.setParameter(1, candidate.getLastName()).getResultList();
			if (matches !=null &&matches.size()==1)
			{
			return matches.get(0);
			}
		if (matches == null||matches.isEmpty()){
			return candidate;}
		}
		throw new RuntimeException();
	}
	
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
	
	public SubjectTag tagExists(SubjectTag candidate) {
		TypedQuery<SubjectTag> q = em.createQuery("select s from SubjectTag s where s.tagText= ?1", SubjectTag.class);

		List<SubjectTag> matches = q.setParameter(1, candidate.getTagText()).getResultList();
		// List<Author> matches = em.createQuery("select a from Author a where
		// a.lastName = '"+candidate.getLastName() +"' and a.firstName =
		// '"+candidate.getFirstName()+"'",Author.class).getResultList();
		if (matches != null && matches.size() == 1) {
			return matches.get(0);
		}
		if (matches == null || matches.isEmpty()) {
			return candidate;
		}
		throw new RuntimeException();
	}


}
