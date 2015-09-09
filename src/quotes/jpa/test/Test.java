package quotes.jpa.test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import quotes.jpa.entities.Quotation;
import quotes.jpa.entities.User;

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
//            Quotation q2 = new Quotation();
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