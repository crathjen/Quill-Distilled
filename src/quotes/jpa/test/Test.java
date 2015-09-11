package quotes.jpa.test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.support.FileSystemXmlApplicationContext;

import quotes.jpa.daos.AuthorDAO;
import quotes.jpa.entities.Author;
import quotes.jpa.entities.Quotation;
import quotes.jpa.entities.User;
import quotes.jpa.manipulation.SearchService;

public class Test
{
    private static EntityManagerFactory emf = null;
    private static EntityManager em = null;

    /**
     * Test code for entities.
     * 
     * @param args
     *            Not used.
     */

    public static void main(String[] args)
    {
        System.out.println("Test Entities");

        try
        {
            emf = Persistence.createEntityManagerFactory("QuotesPU");
            em = emf.createEntityManager();
            Quotation q=em.find(Quotation.class, new Integer(3));
            System.out.println(q.getQuoteText());
            User u=em.find(User.class, "admin");
            List<Quotation> l=u.getUserQuotationSubmissions();
            for (Quotation qq:l){
            	System.out.println(qq.getQuoteText());
            }
            FileSystemXmlApplicationContext context=new FileSystemXmlApplicationContext("WebContent/WEB-INF/JPA.xml");
            SearchService ss = context.getBean(SearchService.class);
         
            List<Quotation> l2= ss.findQuotesByAuthor("Kierkegaard");
            
            List<Quotation> l3= ss.findQuotesByAuthor("Atwood");
            if (l2!=null)
            for(Quotation qt:l2){
            	System.out.println(qt.getQuoteText());
            }
            if (l3!=null)
            for(Quotation qt:l3){
            	System.out.println(qt.getQuoteText());
            }
               
            
            Quotation q2 = new Quotation();
            Author a = new Author();
            a.setFirstName("Chimamanda Ngozi");
            a.setLastName("Adichi");
            a=context.getBean(AuthorDAO.class).authorExists(a);
            System.out.println(a.getId());
            
            
            
//            q2.setQuoteText("We spend too much time teaching girls to worry about what boys think of them. But the reverse is not the case. We don’t teach boys to care about being likable. We spend too much time telling girls that they cannot be angry or aggressive or tough, which is bad enough, but then we turn around and either praise or excuse men for the same reasons. All over the world, there are so many magazine articles and books telling women what to do, how to be and not to be, in order to attract or please men. There are far fewer guides for men about pleasing women.");
//            //System.out.println(q2.getAuthor().getId());
//            try {
//            	em.getTransaction().begin();
//            	a=context.getBean(AuthorDAO.class).authorExists(a);
//                q2.setAuthor(a);
//            	em.merge(q2.getAuthor());
//            	em.persist(q2);
//            	em.getTransaction().commit();
//				System.out.println("Successfully added quote");
//			} catch (Exception e) {
//				em.getTransaction().rollback();
//				System.out.println("Rolled Back");
//			}
//           
//            q2.authorID=1;
//            q2.quoteText="The truth is a trap: you can not get it without it getting you; you cannot get the truth by capturing it, only by its capturing you.";
//            em.getTransaction().begin();
//            em.persist(q2);
//            em.getTransaction().commit();
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        finally
        {
            if (em != null && em.isOpen())
                em.close();
            try { emf.close(); } catch (Exception ex) {}
        }
    }
}