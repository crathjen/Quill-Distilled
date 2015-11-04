package quotes.jpa.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@IdClass(UQRID.class)
@Table(name="user_quote_rating")
public class UserQuoteRating implements Serializable{
	
	@Id
	@Column(name="reg_user")
	private String userName;
	
	@Id
	@Column(name="quote_id")
	private int quoteID;
	
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="quote_id", insertable=false, updatable=false)
	private Quotation quotation;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getQuoteID() {
		return quoteID;
	}

	public void setQuoteID(int quoteID) {
		this.quoteID = quoteID;
	}

	public Quotation getQuotation() {
		return quotation;
	}

	public void setQuotation(Quotation quotation) {
		this.quotation = quotation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="reg_user", insertable=false, updatable=false)
	private User user;
	
	@Column
	private int rating;

}
