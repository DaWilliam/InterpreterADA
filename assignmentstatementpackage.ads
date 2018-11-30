with StatementPackage;
with ArithmeticExpression;
with IdPackage;

package AssignmentStatementPackage is

   type AssignmentStatement is new StatementPackage.Statement with record
      var : IdPackage.Id;
      expr : ArithmeticExpression.ArithmeticExpression;
   end record;
   
   function init(varIn : IdPackage.Id; exprIn : ArithmeticExpression.ArithmeticExpression) return AssignmentStatement;
   function getId(self : AssignmentStatement) return IdPackage.Id;
   
   overriding
   procedure execute (self : in out AssignmentStatement);
                            
end AssignmentStatementPackage;
