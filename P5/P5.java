
import java.util.*;
import syntaxtree.*;
import visitor.*;

public class P5 {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
         
         GJDepthFirst1 O1 = new GJDepthFirst1();
         GJDepthFirst2 O2 = new GJDepthFirst2();
         
         root.accept(O1,null);
         
        O2.table1=O1.table1;
     	O2.table2=O1.table2;
     	O2.table3=O1.table3;
     	O2.table4=O1.table4;
     	O2.max_args=O1.max_args;
     	
     	root.accept(O2,null);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


