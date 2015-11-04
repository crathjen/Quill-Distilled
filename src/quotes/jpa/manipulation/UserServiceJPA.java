package quotes.jpa.manipulation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import quotes.jpa.entities.User;

public class UserServiceJPA implements UserService, UserDetailsService {
	

	@PersistenceContext(unitName="EMF")
	protected EntityManager em;

	@Override
	public User getUserByName(String username) {
		List<User> results =em.createQuery("select u from User u where u.username = ?1", User.class).setParameter(1, username).getResultList();
		if (results.isEmpty())
			return null;
		else
			return results.get(0);
	}

	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
			
		List<User> details = em.createQuery("select u from User u where u.username = ?1", User.class).setParameter(1, username).getResultList();
		if (details.size()>0 && details.get(0)!=null)
		return details.get(0);
	
		throw new UsernameNotFoundException("Sorry, that is not a valid username.");
	}
	
	
}
