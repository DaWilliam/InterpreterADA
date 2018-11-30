with Memory;

package body ForStatementPackage is

   function init (varIn : IdPackage.Id; blkIn : BlockPackage.Block;
                  endingIn : ArithmeticExpression.ArithmeticExpression) return ForStatement is
   temp : ForStatement;
   begin
      temp.var := varIn;
      temp.blk := blkIn;
      temp.ending := endingIn;
      return temp;
   end;
         
   
   overriding
   procedure execute (self : in out ForStatement) is
   begin
      for I in Integer range self.var.evaluate .. self.ending.evaluate loop
         Memory.store(self.var.getChar, I);
         self.blk.execute;
      end loop;
   end;
   

end ForStatementPackage;
