package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;
import modelo.Franquiador;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-01T09:37:38")
@StaticMetamodel(Franquia.class)
public class Franquia_ { 

    public static volatile SingularAttribute<Franquia, Double> valorinicial;
    public static volatile SingularAttribute<Franquia, Integer> idfranquia;
    public static volatile SingularAttribute<Franquia, Integer> capital;
    public static volatile SingularAttribute<Franquia, String> foto;
    public static volatile SingularAttribute<Franquia, String> nome;
    public static volatile SingularAttribute<Franquia, Double> valortotal;
    public static volatile SingularAttribute<Franquia, Franquiador> franquiador;
    public static volatile ListAttribute<Franquia, Categoria> categoriaList;
    public static volatile SingularAttribute<Franquia, Integer> tempolucro;
    public static volatile SingularAttribute<Franquia, String> descricao;

}