package quotes.jpa.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Author {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column
	private String descriptor;
	
	@OneToMany(mappedBy="author")
	private List<Quotation> authorQuotes;
	
	@ManyToMany(mappedBy="taggedAuthors")
	private List<SubjectTag> tags;
	
	@OneToMany(mappedBy="author")
	private List<UserAuthorRating> ratings;
	
	@OneToMany(mappedBy="author")
	private List<QuoteSource> bodyOfWork;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDescriptor() {
		return descriptor;
	}

	public void setDescriptor(String descriptor) {
		this.descriptor = descriptor;
	}

	public List<Quotation> getAuthorQuotes() {
		return authorQuotes;
	}

	public void setAuthorQuotes(List<Quotation> authorQuotes) {
		this.authorQuotes = authorQuotes;
	}

}
