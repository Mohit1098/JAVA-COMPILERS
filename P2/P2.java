import java.util.*;



import syntaxtree.*;
import visitor.*;

public class P2 {
	
	
	
   public static void main(String [] args) {
	   
	   HashMap<String,HashMap<String,String>> Symboltable1;
	   HashMap<String,HashMap<String,String>> Parent;
	   HashMap<String,HashMap<String, Pair<Pair<String,Vector<String>>,HashMap<String,String>>>> Symboltable2 ;
	   
      try {
         Node root = new MiniJavaParser(System.in).Goal();
         
         GJDepthFirst2 O1=new GJDepthFirst2();
         root.accept(O1,null); // Your assignment part is invoked here.
         Symboltable1 = O1.Symboltable1;
         Symboltable2 = O1.Symboltable2;
         Parent=O1.Parent;
         
         Pair<HashMap<String,HashMap<String,String>>,Pair<HashMap<String,HashMap<String, Pair<Pair<String,Vector<String>>,HashMap<String,String>>>>,HashMap<String,HashMap<String,String>>>> temp
         = new Pair<HashMap<String,HashMap<String,String>>,Pair<HashMap<String,HashMap<String, Pair<Pair<String,Vector<String>>,HashMap<String,String>>>>,HashMap<String,HashMap<String,String>>>>
         	(Symboltable1,new Pair<HashMap<String,HashMap<String, Pair<Pair<String,Vector<String>>,HashMap<String,String>>>>,HashMap<String,HashMap<String,String>>>(Symboltable2,Parent));
//         System.out.println(Symboltable2.get("Tree").get("Compare").f.s);
         root.accept(new GJDepthFirst3(temp),null);
         
         System.out.println("Program type checked successfully");
         
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 

