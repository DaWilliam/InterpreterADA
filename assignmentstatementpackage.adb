with Memory;

package body AssignmentStatementPackage is

   function init(varIn : IdPackage.Id; exprIn : ArithmeticExpression.ArithmeticExpression) return AssignmentStatement is
      temp : AssignmentStatement;
   begin
      temp.var := varIn;
      temp.expr := exprIn;
      return temp;
   end;
   
   
   function getId (self : AssignmentStatement) return IdPackage.Id is
   begin
      return self.var;
   end;
   
   
   overriding
   procedure execute (self : in out AssignmentStatement) is
   begin
      Memory.store(self.var.getChar, self.expr.evaluate);
   end;
   

end AssignmentStatementPackage;
