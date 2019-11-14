
import java.util.*;
import syntaxtree.*;
import visitor.*;

public class P6 {
   public static void main(String [] args) {
      try {
         Node root = new MiniRAParser(System.in).Goal();
         GJDepthFirst1 O1 =new GJDepthFirst1();  
         root.accept(O1,null);

      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


