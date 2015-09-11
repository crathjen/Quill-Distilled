package quotes.jpa.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.QuoteSource;
import quotes.jpa.entities.SubjectTag;

public class SubjectTagDAO {
	
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	
	public SubjectTag tagExists(SubjectTag candidate) {
	TypedQuery<SubjectTag> q=em.createQuery("select s from SubjectTag s where s.tagText= ?1", SubjectTag.class);
	
	List<SubjectTag> matches=q.setParameter(1, candidate.getTagText()).getResultList();
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
