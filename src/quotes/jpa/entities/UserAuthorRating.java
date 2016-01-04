package quotes.jpa.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@IdClass(UARID.class)
@Table(name="user_author_rating")
public class UserAuthorRating implements Serializable{
	
	@Id
	@Column(name="reg_user")
	private String userName;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="reg_user", insertable=false, updatable=false)
	private User user;
	
	@Id
	@Column(name="author_id")
	private int authorID;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="author_id", insertable=false, updatable=false)
	private Author author;
	
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}
	@Column
	private int rating;

}
