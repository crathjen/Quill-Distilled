package quotes.jpa.test;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import quotes.jpa.daos.AuthorDAO;
import quotes.jpa.daos.QuotationDAO;
import quotes.jpa.daos.QuoteSourceDAO;
import quotes.jpa.daos.SubjectTagDAO;
import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;
import quotes.jpa.entities.QuoteSource;
import quotes.jpa.entities.SubjectTag;

public class DBLoader {
	
	@Autowired
	@PersistenceContext(unitName="EMF")
	protected EntityManager em;
	@Autowired
	protected AuthorDAO aDAO;
	@Autowired	
	protected QuotationDAO qDAO;
	@Autowired
	protected SubjectTagDAO stDAO;
	@Autowired
	protected QuoteSourceDAO qsDAO;
	

	@Transactional
	public void load(String url) throws IOException {
	url = "https://www.goodreads.com/author/quotes/"+url;
	//Document doc = Jsoup.connect("https://www.goodreads.com/author/quotes/" +url).get();
	Document doc = Jsoup.parse(new URL(url).openStream(),"UTF-8", url);
	Elements quoteds = doc.select(".quoteDetails");
	System.out.println(quoteds.size());
	String quoteText=null;
	String aLastName=null;
	String aFirstName=null;
	String workTitle=null;
	ArrayList<String> alTags=new ArrayList<>();
	
	for(Element qt : quoteds){
		quoteText=null;
		aLastName=null;
		aFirstName=null;
		workTitle=null;
		alTags=new ArrayList<>();
		Element e = qt.select(".quoteText").first();
		//e.children().remove();
		quoteText= e.text().substring(1,e.text().lastIndexOf(8221));
		System.out.println(quoteText);
		
		Elements links= e.select("a");
		for(Element l: links){

			if(l.attr("href").contains("author")){
				aLastName=l.text().substring(l.text().lastIndexOf(" ")+1);
				if(l.text().lastIndexOf(" ")>0)
				aFirstName=l.text().substring(0, l.text().lastIndexOf(" "));
				System.out.println("AUTHOR: "+aFirstName+aLastName);
			}
			else if (l.attr("href").contains("work")){
				workTitle=l.text();
				System.out.println("WORK: "+workTitle);
			}}
		Element footer = qt.select(".quoteFooter").first();	
		Elements tags= footer.select("a").select(":not(.smallText)");
		for (Element tag: tags){
			alTags.add(tag.text());
			System.out.println("TAG: "+tag.text());
		}
		//EntityTransaction t = em.getTransaction();
		//t.begin();
		Quotation q = new Quotation();
		Author a= new Author();
		QuoteSource s=new QuoteSource();
		List<SubjectTag> ls = new ArrayList<>();
		
		a.setFirstName(aFirstName);
		a.setLastName(aLastName);
		a=aDAO.authorExists(a);
//		t.begin();
		a=em.merge(a);
//		t.commit();
		
		s.setAuthor(a);
		s.setSourceTitle(workTitle);
		s=qsDAO.sourceExists(s);
//		t.begin();
		//if(s!=null&&s.getSourceTitle()!=null)
		if(s!=null&&s.getSourceTitle()!=null){
			s=em.merge(s);
			q.setQuoteSource(s);
		}
		
//		t.commit();
		
		for(String stringTag: alTags){
			SubjectTag workingTag = new SubjectTag();
			workingTag.setTagText(stringTag);
			workingTag=stDAO.tagExists(workingTag);
			//t.begin();
			workingTag=em.merge(workingTag);
			//t.commit();
			ls.add(workingTag);
		}
		//q=em.merge(q);
		q.setAuthor(a);
		q.setQuoteText(quoteText);
		q=qDAO.quotationExists(q);
		q=em.merge(q);
		//System.out.println("terminator");
		//if (q.getTags()==null)
			q.setTags(ls);
		//System.out.println("the final commit");
		q=em.merge(q);
		//t.commit();

	}
	}

}
