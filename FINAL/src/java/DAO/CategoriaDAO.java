package DAO;
import javax.persistence.TypedQuery;
import modelo.Categoria;
/**
 *
 * @author paton
 */
public class CategoriaDAO extends GenericDAO <Categoria , Integer > {
    public CategoriaDAO() {
       super(Categoria.class);
    }   
    public String filtroCategoria(String idcategoria){
        TypedQuery<Categoria> query = em.createNamedQuery("Categoria.filtroCategoria", Categoria.class);
        query.setParameter("idcategoria", idcategoria);
        return query.toString();
    }
}