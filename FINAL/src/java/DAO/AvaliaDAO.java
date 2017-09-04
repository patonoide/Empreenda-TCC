package DAO;
import javax.persistence.TypedQuery;
import modelo.Avalia;
/**
 *
 * @author paton
 */
public class AvaliaDAO extends GenericDAO <Avalia , Integer > {
    public AvaliaDAO() {
       super(Avalia.class);
    }   
    
}