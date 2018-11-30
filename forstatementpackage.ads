with StatementPackage;
with ArithmeticExpression;
with BlockPackage;
with IdPackage;

package ForStatementPackage is

   type ForStatement is new StatementPackage.Statement with record
      var : IdPackage.Id;
      blk : BlockPackage.Block;
      ending : ArithmeticExpression.ArithmeticExpression;
   end record;
   
   function init (varIn : IdPackage.Id; blkIn : BlockPackage.Block;
                   endingIn : ArithmeticExpression.ArithmeticExpression) return ForStatement;
   
   overriding
   procedure execute (self : in out ForStatement);
   
end ForStatementPackage;
