package quotes.jpa.entities;

import java.io.Serializable;
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
public class SubjectTag implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2727635378797813542L;

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
	public void addInterestedUser(User candidate){
		if (!interestedUsers.contains(candidate)){
			interestedUsers.add(candidate);
		}
	}
	public void removeInterestedUser(User candidate){
		if (interestedUsers.contains(candidate)){
			interestedUsers.remove(candidate);
		}
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		SubjectTag other = (SubjectTag) obj;
		if (id != other.id)
			return false;
		return true;
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
