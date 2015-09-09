package quotes.jpa.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(UARID.class)
@Table(name="user_author_rating")
public class UserAuthorRating {
	
	@Id
	@Column(name="reg_user")
	private String userName;
	
	@Id
	@Column(name="author_id")
	private int authorID;
	
	
	@ManyToOne
	@JoinColumn(name="reg_user", insertable=false, updatable=false)
	private User user;
	
	@ManyToOne
	@JoinColumn(name="author_id", insertable=false, updatable=false)
	private Author author;
	
	@Column
	private int rating;

}
