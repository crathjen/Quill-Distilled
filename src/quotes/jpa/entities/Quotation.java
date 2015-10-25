package quotes.jpa.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Quotation {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="author_id")
	private Author author;
	
	@Column(name="quote_text")
	private String quoteText;
	
	@JsonIgnore
	@OneToMany(mappedBy="quotation")
	private List<UserQuoteRating> ratings;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="posting_user")
	private User postingUser;
	
	@ManyToMany(mappedBy="taggedQuotes", fetch=FetchType.EAGER)
	private List<SubjectTag> tags;
	
	@ManyToOne
	@JoinColumn(name="q_source")
	private QuoteSource quoteSource;
	

	public QuoteSource getQuoteSource() {
		return quoteSource;
	}

	public void setQuoteSource(QuoteSource quoteSource) {
		this.quoteSource = quoteSource;
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public String getQuoteText() {
		return quoteText;
	}

	public void setQuoteText(String quoteText) {
		this.quoteText = quoteText;
	}

	public User getPostingUser() {
		return postingUser;
	}

	public void setPostingUser(User postingUser) {
		this.postingUser = postingUser;
	}
	public List<SubjectTag> getTags() {
		return tags;
	}

	public void setTags(List<SubjectTag> tags) {
		this.tags = tags;
		if (tags!=null)
		for (SubjectTag t:tags){
			t.addTaggedQuote(this);
		}
	}
	public void removeTags(List<SubjectTag> tags){
		for(SubjectTag t:tags){
			if (this.tags.contains(t)){
				this.tags.remove(t);
				t.removeTaggedQuote(this);
			}
		}
	}
	
	
	
	
	
	
	

}
