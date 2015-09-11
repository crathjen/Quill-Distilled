package quotes.jpa.manipulation;

import org.springframework.transaction.annotation.Transactional;

import quotes.jpa.entities.User;

public interface UserService {
@Transactional
public User getUserByName(String s);
}
