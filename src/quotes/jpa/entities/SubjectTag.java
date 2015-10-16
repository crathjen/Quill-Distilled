package quotes.jpa.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity 
@Table(name="subject_tag")
public class SubjectTag {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTagText() {
		return tagText;
	}

	public void setTagText(String tagText) {
		this.tagText = tagText;
	}

	public User getCreatingUser() {
		return creatingUser;
	}

	public void setCreatingUser(User creatingUser) {
		this.creatingUser = creatingUser;
	}

	public List<User> getInterestedUsers() {
		return interestedUsers;
	}

	public void setInterestedUsers(List<User> interestedUsers) {
		this.interestedUsers = interestedUsers;
	}

	public List<Quotation> getTaggedQuotes() {
		return taggedQuotes;
	}

	public void setTaggedQuotes(List<Quotation> taggedQuotes) {
		this.taggedQuotes = taggedQuotes;
	}
	
	public void addTaggedQuote(Quotation candidate){
		if (!taggedQuotes.contains(candidate))
			taggedQuotes.add(candidate);
	}
	public void removeTaggedQuote(Quotation quotation) {
		if (taggedQuotes.contains(quotation)){
			taggedQuotes.remove(quotation);
		}
		
	}
	

	public List<Author> getTaggedAuthors() {
		return taggedAuthors;
	}

	public void setTaggedAuthors(List<Author> taggedAuthors) {
		this.taggedAuthors = taggedAuthors;
	}

	@Column(name="tag_text")
	private String tagText;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="creating_user")
	private User creatingUser;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="User_interest", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns = @JoinColumn(name="reg_user"))
	private List<User> interestedUsers;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="Quote_Tag", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns=@JoinColumn(name="quote_id"))
	private List<Quotation> taggedQuotes;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="Author_Tag", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns=@JoinColumn(name="author_id"))
	private List<Author> taggedAuthors;



}
