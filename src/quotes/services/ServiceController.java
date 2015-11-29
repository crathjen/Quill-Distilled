package quotes.services;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import quotes.control.CrudController;
import quotes.jpa.entities.Quotation;
import quotes.jpa.entities.SubjectTag;
import quotes.jpa.entities.User;
import quotes.jpa.manipulation.SearchService;
import wordplay.BruteForce;
import wordplay.Cipher;
import wordplay.Decipher;
import wordplay.PigLatin4;

@RestController
public class ServiceController {

	@Autowired
	private SearchService ss;
	
	@Autowired
	private CrudController cc;
	
	@PersistenceContext(unitName = "EMF")
	private EntityManager em;
	
	@RequestMapping(path = "/search", params="searchType=authorLN", produces = "application/json")
	public List<Quotation> authorSearchLN(String searchExpression){
		return ss.findQuotesByAuthorLN(searchExpression);
	}

	@RequestMapping(path="/search", params="searchType=tag", produces="application/json")
	public List<Quotation> tagSearch(String searchExpression){
		return ss.findQuotesByTag(searchExpression);
	}
	
	@RequestMapping(path="/random", produces="application/json")
	public List<Quotation> randomQuote(){
		ArrayList<Quotation> al = new ArrayList<Quotation>();
		al.add(ss.getRandomQuote());
		return al;
	}
	
	@RequestMapping(path="/search", params="searchType=author", produces="application/json")
	public List<Quotation> authorSearch(String searchExpression){
		return ss.findQuotesByAuthorString(searchExpression);
	}
	
	@RequestMapping(path="/search", params="searchType=authorFN", produces="application/json")
	public List<Quotation> authorSearchFN(String searchExpression){
		//System.out.println(searchExpression);
		return ss.findQuotesByAuthorFN(searchExpression);
	}
	
	@RequestMapping(path="/search", params="searchType=bookTitle", produces="application/json")
	public List<Quotation> sourceSearch(String searchExpression){
		//System.out.println(searchExpression);
		return ss.findQuotesBySourceTitle(searchExpression);
	}
	
	@RequestMapping(path="/search", params="searchType=authorID", produces="application/json")
	public List<Quotation> authorIDSearch(String searchExpression){
		return ss.findQuotesByAuthorID(searchExpression);
	}
	
	@RequestMapping(path="/search", params="searchType=bookTitleID", produces="application/json")
	public List<Quotation> sourceIDSearch(String searchExpression){
		return ss.findQuotesBySourceID(searchExpression);
	}
	
	@RequestMapping(path="/search", params="searchType=quoteText", produces="application/json")
	public List<Quotation> qTextSearch(String searchExpression){
		searchExpression="%"+searchExpression+"%";
		return em.createQuery("select q from Quotation q where q.quoteText like ?1", Quotation.class).setParameter(1, searchExpression).setMaxResults(40).getResultList();
	}
	
	@RequestMapping(path="/search", params="searchType=tagID", produces="application/json")
	public List<Quotation> tagIDSearch(String searchExpression){
		return ss.findQuotesByTagID(searchExpression);
	}
	
	@Transactional
	@RequestMapping(path="/user", produces="application/json")
	public User getUserInfo(Principal principal){
		User userResult = em.find(User.class, principal.getName());
		em.refresh(userResult);
		return userResult;
	}
	
	@RequestMapping(path="/searchAC", produces="application/json")
	public List getAutocompleteValues(String searchExpression, String searchType){
		if (searchType.equals("author")){
			return cc.getAuthorMatches(searchExpression);
					//em.createQuery("select a from Author a where upper(a.lastName) like ?1").setParameter(1, "%"+searchExpression+"%").getResultList();
		}else if (searchType.equals("tag")){
			return cc.getTagMatches(searchExpression);
		}else
		
		
		return null;
	}
	
	@RequestMapping(path="/piggify", produces="text/plain")
	public String piggify(String quoteText){
		System.out.println("in piggify:"+quoteText);
		PigLatin4 pigger = new PigLatin4();
		pigger.setMessage(quoteText);
		pigger.getWords();
		
		return pigger.compileTranslation();
	}
	
	@RequestMapping(path="/cipherEncrypt", produces="text/plain")
	public String cipherEncrypt(String quoteText, String key){
		System.out.println(quoteText);
		return new Cipher(Integer.parseInt(key)).cipherMessage(quoteText);
	}
	
	@RequestMapping(path="/cipherDecrypt", produces="text/plain")
	public String cipherDecrypt(String quoteText, String key){
		System.out.println(quoteText);
		return new Decipher(Integer.parseInt(key)).decipherMessage(quoteText);
	}
	
	@RequestMapping(path="/cipherHack", produces="text/plain")
	public String cipherHack(String quoteText){
		System.out.println(quoteText);
		try{
			return BruteForce.main(quoteText);
		}catch(Exception e){System.out.println(e);}
		return null;
	}
	@RequestMapping(path="/D3DataTagBubble", produces="application/json")
	public List getD3TagBubbleData(){
		class Bubble{
			public String name;
			public int value;
			Bubble(String s, int v){
				name=s;
				value=v;
			}
		}
		List<Object[]> tempresult = em.createQuery("select s.tagText, size(s.taggedQuotes) from SubjectTag s", Object[].class).getResultList();
				System.out.println(tempresult);
		List result = new ArrayList();
		for(Object[] a:tempresult){
			if (((int)a[1])>5)
			result.add(new Bubble((String)a[0], (int)a[1]));
		}
		System.out.println("returning" +result);
		return result;
	}
	
	@RequestMapping(path="/D3DataTagForce", produces="application/json")
	public Object[] getD3TagForceData(){
		
		List<SubjectTag> result = em.createQuery("Select s from SubjectTag s where size(s.taggedQuotes)>13 order by s.id", SubjectTag.class).getResultList();
		
		class Link{
			private int source;
			@Override
			public int hashCode() {
				final int prime = 31;
				int result = 1;
				result = prime * result + source;
				result = prime * result + target;
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
				Link other = (Link) obj;
				if (source != other.source)
					return false;
				if (target != other.target)
					return false;
				return true;
			}
			private int target;
			public int count = 1;
			Link(int s, int t){
				source=s;
				target=t;
			}
			public int getSource(){
				return source;
			}
			public int getTarget(){
				return target;
			}
			
		}
		ArrayList<Link> links = new ArrayList<Link>();
		for (int i=0;i<result.size();i++){
			System.out.println(result.get(i).getId());
			List<Integer> linkResult=em.createQuery("Select ss.id from SubjectTag s inner join s.taggedQuotes q inner join q.tags ss where s.id=?1 and not(ss.id=?1) and size(ss.taggedQuotes)>13 and ss.id>s.id").setParameter(1, result.get(i).getId()).getResultList();
			System.out.println(linkResult);
			
			for(Integer target: linkResult){
				int targetIndex =-1;
				for(int j=i;j<result.size();j++)
					if (result.get(j).getId()==target)
						targetIndex=j;
				System.out.println("Source: "+i+"\t Target: "+targetIndex);
				//Object[] rtrn = {i, targetIndex};
				Link candidate = new Link(i,targetIndex);
				if (!links.contains(candidate))
					links.add(new Link(i,targetIndex));
				else links.get(links.indexOf(candidate)).count++;
			}
		}
		for(int i=0;i<links.size();i++){
			if (links.get(i).count<2){
				links.remove(i);
				i--;
			}
		}
		Object[] tempobj = {result, links};
		return tempobj;
	}
	

	
}
