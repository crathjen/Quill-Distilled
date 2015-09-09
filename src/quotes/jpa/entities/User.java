package quotes.jpa.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="registered_user")
public class User {
	
	@Id
	@Column(name="user_name")
	private String userName;
	
	@Column
	private String password;
	
	@Column
	private String email;
	
	@Column(name="trust_factor")
	private int trustFactor;
	
	@OneToMany(mappedBy="postingUser")
	private List<Quotation> userQuotationSubmissions;
	
	@OneToMany(mappedBy="creatingUser")
	private List<SubjectTag> userCreatedTags;
	
	@ManyToMany(mappedBy="interestedUsers")
	private List<SubjectTag> userInterests;

	@OneToMany(mappedBy="user")
	private List<UserAuthorRating> ratedAuthors;
	
	@OneToMany(mappedBy="user")
	private List<UserQuoteRating> ratedQuotes;
	
	@OneToMany(mappedBy="creatingUser")
	private List<QuoteSource> userCreatedSources;
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTrustFactor() {
		return trustFactor;
	}

	public void setTrustFactor(int trustFactor) {
		this.trustFactor = trustFactor;
	}

	public List<Quotation> getUserQuotationSubmissions() {
		return userQuotationSubmissions;
	}

	public void setUserQuotationSubmissions(List<Quotation> userQuotationSubmissions) {
		this.userQuotationSubmissions = userQuotationSubmissions;
	}
	
	

}
