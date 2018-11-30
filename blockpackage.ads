with StatementPackage;

package BlockPackage is

   type statementArray is array (Integer range 0 .. 1000) of StatementPackage.Statement;
   
   type Block is tagged record
      stmts : statementArray;
      length : Integer := 0;
   end record;
   
   procedure add (self : in out Block; stmt : in out StatementPackage.Statement);
   
   procedure execute (self : in out Block);

end BlockPackage;
