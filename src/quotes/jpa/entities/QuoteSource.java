package quotes.jpa.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="quote_source")
public class QuoteSource {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="Author_ID")
	private Author author;
	
	@Column(name="source_title")
	private String sourceTitle;
	
	@Column
	private String isbn;
	
	@Column(name="Publication_year")
	short publicationYear;
	
	@Column
	String publisher;
	
	@Column
	String language;
	
	@ManyToOne
	@JoinColumn(name="creating_user")
	User creatingUser;
	
	
}
