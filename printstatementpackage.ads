with StatementPackage;
with ArithmeticExpression;

package PrintStatementPackage is

   type PrintStatement is new  StatementPackage.Statement with
   record
         expr : ArithmeticExpression.ArithmeticExpression;
   end record;      
   
   overriding
   procedure execute (self : in out PrintStatement);
   
end PrintStatementPackage;
