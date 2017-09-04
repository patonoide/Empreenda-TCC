package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Franquia;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-03T23:57:15")
@StaticMetamodel(Franquiador.class)
public class Franquiador_ { 

    public static volatile SingularAttribute<Franquiador, String> senha;
    public static volatile ListAttribute<Franquiador, Franquia> franquiaList;
    public static volatile SingularAttribute<Franquiador, String> nome;
    public static volatile SingularAttribute<Franquiador, String> cnpj;
    public static volatile SingularAttribute<Franquiador, String> contato;

}