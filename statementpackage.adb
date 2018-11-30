

package body StatementPackage is         
   
   procedure execute (self : in out Statement) is
   begin
      Put("Parent execute method is not being overridden");
   end;          

end StatementPackage;
