package DAO;
import javax.persistence.TypedQuery;
import modelo.Franquiador;
/**
 *
 * @author paton
 */
public class FranquiadorDAO extends GenericDAO<Franquiador, Long> {
    public FranquiadorDAO() {
       super(Franquiador.class);
    }   
    public Franquiador realizarLogin(String cnpj, String senha){
        TypedQuery<Franquiador>query=em.createNamedQuery("Franquiador.realizarLogin", Franquiador.class);
        //seto os parâmetros
        query.setParameter("cnpj", cnpj);
        query.setParameter("senha", senha);
        Franquiador franquiador;
        try{
            franquiador = query.getSingleResult();
        }
        catch(Exception e){
            franquiador = null;
        
        }
         return franquiador;
    } 
}