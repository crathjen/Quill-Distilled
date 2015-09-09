package quotes.jpa.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(UQRID.class)
@Table(name="user_quote_rating")
public class UserQuoteRating {
	
	@Id
	@Column(name="reg_user")
	private String userName;
	
	@Id
	@Column(name="quote_id")
	private int quoteID;
	
	
	
	@ManyToOne
	@JoinColumn(name="quote_id", insertable=false, updatable=false)
	private Quotation quotation;
	
	@ManyToOne
	@JoinColumn(name="reg_user", insertable=false, updatable=false)
	private User user;
	
	@Column
	private int rating;

}
