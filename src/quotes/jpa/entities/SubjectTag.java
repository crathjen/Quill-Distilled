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

@Entity 
@Table(name="subject_tag")
public class SubjectTag {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="tag_text")
	private String tagText;
	
	@ManyToOne
	@JoinColumn(name="creating_user")
	private User creatingUser;
	
	@ManyToMany
	@JoinTable(name="User_interest", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns = @JoinColumn(name="reg_user"))
	private List<User> interestedUsers;
	
	@ManyToMany
	@JoinTable(name="Quote_Tag", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns=@JoinColumn(name="quote_id"))
	private List<Quotation> taggedQuotes;
	
	@ManyToMany
	@JoinTable(name="Author_Tag", joinColumns=@JoinColumn(name="tag_id"), inverseJoinColumns=@JoinColumn(name="author_id"))
	private List<Author> taggedAuthors;
	

}
