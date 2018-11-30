package body IfStatementPackage is

   function init(exprIn : BooleanExpressionPackage.BooleanExpression; blk1In : BlockPackage.Block;
                 blk2In : BlockPackage.Block) return IfStatement is
   temp : IfStatement;
   begin
      temp.expr := exprIn;
      temp.blk1 := blk1In;
      temp.blk2 := blk2In;  
      
      return temp;
   end;
   
   
   overriding
   procedure execute (self : in out IfStatement) is
   begin
      
      if BooleanExpressionPackage.evaluate(self.expr) then
         self.blk1.execute;
      else
         self.blk2.execute;
      end if;
      
   end;
   

end IfStatementPackage;
