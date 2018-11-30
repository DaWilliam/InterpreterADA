package body BlockPackage is

   procedure add (self : in out Block; stmt : in out StatementPackage.Statement) is
   begin
      self.stmts(self.length) := stmt;
      self.length := self.length + 1;
   end;
   
   overriding
   procedure execute (self : in out Block) is
   begin
      for I in Integer range 0 .. self.length loop
         self.stmts(I).execute;
      end loop;
   end;
      

end BlockPackage;
