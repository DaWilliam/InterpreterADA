package body RepeatStatement is

   function init(blkIn : BlockPackage.Block; exprIn : BooleanExpressionPackage.BooleanExpression) return RepeatStatement is
      temp : RepeatStatement;
   begin
      temp.blk := blkIn;
      temp.expr := exprIn;
      return temp;
   end;
   
   overriding
   procedure execute(self : in out RepeatStatement) is
   begin
      THE_LOOP:
      loop
         self.blk.execute;
         exit THE_LOOP when not BooleanExpressionPackage.evaluate(self.expr);
      end loop THE_LOOP;        
   end;
   
end RepeatStatement;
