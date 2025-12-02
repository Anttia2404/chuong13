package murach.data;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import murach.business.User;

public class UserDB {
    
    public static void insert(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }
    
    public static void update(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }
    
    public static void delete(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(user));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }
    
    public static User selectUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            User user = em.find(User.class, email);
            return user;
        } finally {
            em.close();
        }
    }
    
    public static List<User> selectUsers() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        List<User> users;
        try {
            users = q.getResultList();
            if (users == null || users.isEmpty()) {
                users = null;
            }
        } finally {
            em.close();
        }
        return users;
    }
}
