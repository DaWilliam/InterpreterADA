with StatementPackage;
with BooleanExpressionPackage;
with BlockPackage;

package IfStatementPackage is

   type IfStatement is new StatementPackage.Statement with record
      expr : BooleanExpressionPackage.BooleanExpression;
      blk1 : BlockPackage.Block;
      blk2 : BlockPackage.Block;
   end record;
   
   function init(exprIn : BooleanExpressionPackage.BooleanExpression; blk1In : BlockPackage.Block;
                 blk2In : BlockPackage.Block) return IfStatement;
   
   overriding
   procedure execute (self : in out IfStatement);
   
end IfStatementPackage;
