import java.util.HashMap;
import java.util.Vector;
import java.util.*;
import syntaxtree.*;
import visitor.*;

public class P3 {
   public static void main(String [] args) {
      try {
         Node root = new MiniJavaParser(System.in).Goal();
             
         GJDepthFirst1 O1= new GJDepthFirst1();
         GJDepthFirst2 O2= new GJDepthFirst2();
         GJDepthFirst3 O3= new GJDepthFirst3();        
//         System.out.println("Program parsed successfully");

         root.accept(O1,null);
         root.accept(O2,null);
//         
         O3.Indexfun=O2.Indexfun;
         O3.Indexvar=O2.Indexvar;
         O3.parent=O2.parent;
         O3.table1=O1.table1;
         O3.table2=O1.table2;
         O3.IndF=O2.Indf;
         O3.IndV=O2.Indv;
         
         root.accept(O3,null);
         
      }
      catch (Exception e) {
//         System.out.println(e.toString());
      }
   }
} 


