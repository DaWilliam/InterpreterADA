with BlockPackage;
with StatementPackage;
with BooleanExpressionPackage;

package RepeatStatement is

   type RepeatStatement is new StatementPackage.Statement with record
      blk : BlockPackage.Block;
      expr : BooleanExpressionPackage.BooleanExpression;
   end record;
   
   function init(blkIn : BlockPackage.Block; exprIn : BooleanExpressionPackage.BooleanExpression) return RepeatStatement;
   
   overriding
   procedure execute(self : in out RepeatStatement);

end RepeatStatement;
