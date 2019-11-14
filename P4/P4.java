
import java.util.HashMap;

import java.util.Vector;
import java.util.*;
import syntaxtree.*;
import visitor.*;

public class P4 {
   public static void main(String [] args) {
      try {
         Node root = new MiniIRParser(System.in).Goal();
//            System.out.println("hello");
          GJDepthFirst1 O1= new GJDepthFirst1();
          root.accept(O1,null);

      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


