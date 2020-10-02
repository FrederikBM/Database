import de.bezier.data.sql.*;

SQLite db;

void setup()
{
  size( 100, 100 );

  db = new SQLite( this, "test.db" );  // open database file

  if (db.connect()){
    
    db.query( "SELECT * FROM Users");
    
    while (db.next()){
      
      String name =db.getString("Usernames");
      String pwd = db.getString("Passwords"); 

      println("Username: "+ name + "       " + "Password: " + pwd);
    }
  }
}
