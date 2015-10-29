package quotes.jpa.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name="registered_user")
public class User implements UserDetails, Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1890106497421652139L;

	@Id
	@Column(name="user_name")
	private String username;
	
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
	
	@ManyToMany(mappedBy="interestedUsers", fetch=FetchType.EAGER)
	private List<SubjectTag> userInterests;

	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<UserAuthorRating> ratedAuthors;
	
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	private List<UserQuoteRating> ratedQuotes;
	
	@OneToMany(mappedBy="creatingUser")
	private List<QuoteSource> userCreatedSources;
	
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		this.username = userName;
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


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
		switch (trustFactor) {
		case 1:
			authorities.add(new SimpleGrantedAuthority("base_user"));
			return authorities;
		case 2:
			authorities.add(new SimpleGrantedAuthority("reporting_user"));
			return authorities;
		case 3:
			authorities.add(new SimpleGrantedAuthority("super_user"));
			return authorities;
		case 4:
			authorities.add(new SimpleGrantedAuthority("admin"));
			System.out.println("admin");
			return authorities;
		case 5:
			authorities.add(new SimpleGrantedAuthority("locked"));
			return authorities;
		default:
			return null;
		}
	}



	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public List<SubjectTag> getUserInterests() {
		return userInterests;
	}

	public void setUserInterests(List<SubjectTag> userInterests) {
		this.userInterests = userInterests;
	}
	public void addUserInterest(SubjectTag candidate){
		if (!userInterests.contains(candidate)){
			userInterests.add(candidate);
			candidate.addInterestedUser(this);
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	public List<UserAuthorRating> getRatedAuthors() {
		return ratedAuthors;
	}

	public void setRatedAuthors(List<UserAuthorRating> ratedAuthors) {
		this.ratedAuthors = ratedAuthors;
	}

	public List<UserQuoteRating> getRatedQuotes() {
		return ratedQuotes;
	}

	public void setRatedQuotes(List<UserQuoteRating> ratedQuotes) {
		this.ratedQuotes = ratedQuotes;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	

}
