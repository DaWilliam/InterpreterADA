with BlockPackage;
with StatementPackage;
with BooleanExpressionPackage;


package WhileStatementPackage is

   type WhileStatement is new StatementPackage.Statement with record
      expr : BooleanExpressionPackage.BooleanExpression;
      blk : BlockPackage.Block;
   end record;
   
   function init(exprIn : BooleanExpressionPackage.BooleanExpression; blkIn : BlockPackage.Block) return WhileStatement;
   
   overriding
   procedure execute(self : in out WhileStatement);


end WhileStatementPackage;
