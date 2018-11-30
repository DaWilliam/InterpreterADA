package body PrintStatementPackage is

   procedure execute (self : in out PrintStatement) is
      blank : BinaryExpressionPackage.BinaryExpression;
   begin
      self.expr.evaluate(blank);
   end;
   

end PrintStatementPackage;
