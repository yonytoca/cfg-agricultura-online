package org.cfg.uapa.java.agricultura.servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author ecabrerar
 */
public class Coneccion {

    private static final Coneccion INSTANCIA = new Coneccion();

    private Coneccion() {  } 
    
    
    public static Coneccion getInstancia() {

        return INSTANCIA;
    }

    public Connection getConeccion() {
        
        //Establish connection to MySQL database
       
        Connection con = null;

        try {
           
             Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/Agricultura");
            
            con = ds.getConnection();
            Logger.getLogger(getClass().getName()).info(String.format("Connection established !!!"));
        
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(Coneccion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return con;
    }

}
