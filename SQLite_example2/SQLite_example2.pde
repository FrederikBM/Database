//state 0: login skærm
//state 1: chat skærm
//vi bruger states til at registrere, hvorvidt brugeren er på login skærmen eller chat skærmen. hvis man er på login skærmen skal chat skærmens funktioner (eks. textwheee) ikke kaldes, og vice versa. når man indtaster et brugernavn og det tilpassende password rykker man fra state 0 til state 1; alt fra state 0 rydes og vi kommer ind på chat skærmen.
//
import de.bezier.data.sql.*;
import g4p_controls.*;

SQLite db;
GTextField txf;
GPassword pwd;
GTabManager tt;
GLabel lblTxf;
GLabel lblPwd;
Textwheee textwheee = new Textwheee();

void setup(){
  size(220, 300);
  background(200, 128, 200);

  db = new SQLite(this, "test.db");  // open database file

  if (db.connect()){
    
    db.query("SELECT * FROM Users");
    
    while (db.next()){
      
      String name =db.getString("Usernames");
      String pwd = db.getString("Passwords"); 

      println("Username: "+ name + "       " + "Password: " + pwd);
    }
  }
  G4P.setInputFont("Times New Roman", G4P.PLAIN, 14); // New for G4P V4.3
  
  txf = new GTextField(this, 10, 40, 200, 20);
  txf.tag = "txf1";
  txf.setPromptText("Text field 1");
   txf.setFocus(true);
  // Create the tab manager and add these controls to it
  tt = new GTabManager();
  tt.addControls(txf);
  
  lblTxf = new GLabel(this, 10, txf.getY()-20, 200, 18);
  lblTxf.setAlpha(190);
  lblTxf.setTextAlign(GAlign.LEFT, null);
  lblTxf.setOpaque(true);
  
  pwd = new GPassword(this, 10, 100, 200, 20);
  pwd.tag = "pwd1";  
  pwd.setMaxWordLength(23);
  
  lblPwd = new GLabel(this, 10, pwd.getY()-20, 200, 18);
  lblPwd.setAlpha(190);
  lblPwd.setTextAlign(GAlign.LEFT, null);
  lblPwd.setOpaque(true);
}

void draw(){
  
  // Draw tab order
}
void keyPressed(){
  textwheee.addText(key);
  println(textwheee.teksten);
}
