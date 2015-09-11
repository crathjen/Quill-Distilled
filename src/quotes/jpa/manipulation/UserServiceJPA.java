package quotes.jpa.manipulation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import quotes.jpa.entities.User;

public class UserServiceJPA implements UserService {
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;

	@Override
	public User getUserByName(String username) {
		List<User> results =em.createQuery("select u from User u where u.userName = ?1", User.class).setParameter(1, username).getResultList();
		if (results.isEmpty())
			return null;
		else
			return results.get(0);
	}
	
	
}
