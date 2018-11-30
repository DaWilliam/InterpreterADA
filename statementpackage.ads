with Ada.Text_IO; use Ada.Text_IO;

package StatementPackage is

   type Statement is tagged null record;
   
         
   procedure execute (self : in out Statement);
          
end StatementPackage;
