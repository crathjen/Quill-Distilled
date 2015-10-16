package quotes.jpa.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import quotes.jpa.entities.Author;

public class AuthorDAO {

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

}
