package body WhileStatementPackage is

   function init(exprIn : BooleanExpressionPackage.BooleanExpression; blkIn : BlockPackage.Block) return WhileStatement is
      temp : WhileStatement;
   begin
      temp.expr := exprIn;
      temp.blk := blkIn;
      return temp;
   end;
   
   
   overriding
   procedure execute(self : in out WhileStatement) is
   begin
      while BooleanExpressionPackage.evaluate(self.expr) loop
         self.blk.execute;
      end loop;             
   end;
   

end WhileStatementPackage;
