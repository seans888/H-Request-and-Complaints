
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


class DatabaseConnection {
    
    Connection conn;    
    Statement state;
    ResultSet res;
    
    public DatabaseConnection()
    {
        
    }
    
    public Connection setConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ticketms", "root", "");
        }catch (Exception e){
            
        }
        return conn;
    }
    
    public ResultSet getResult(String sql, Connection conn){
     
        
        try{
          state = conn.createStatement();
          res = state.executeQuery(sql);
          
        }
        catch (Exception e) {
            
        }
        return res;
    }
    
    
    
}
