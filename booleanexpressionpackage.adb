package body BooleanExpressionPackage is

    function init(op : RelationalOperator; expr1 : ArithmeticExpression.ArithmeticExpression;
                  expr2 : ArithmeticExpression.ArithmeticExpression) return BooleanExpression is
      temp : BooleanExpression;
   begin
      temp.op := op;
      temp.expr1 := expr1;
      temp.expr2 := expr2;
      
      return temp;
   end;
   
   function evaluate (self : in out BooleanExpression) return Boolean is
      result : Boolean := false;
   begin      
      if self.op = EQ_OP then
         result := self.expr1.evaluate = self.expr2.evaluate;
      elsif self.op = NE_OP then
         result := self.expr1.evaluate /= self.expr2.evaluate;
      elsif self.op = LT_OP then
         result := self.expr1.evaluate < self.expr2.evaluate;
      elsif self.op = LE_OP then
         result := self.expr1.evaluate <= self.expr2.evaluate;
      elsif self.op = GT_OP then
         result := self.expr1.evaluate > self.expr2.evaluate;
      elsif self.op = GE_OP then
         result := self.expr1.evaluate >= self.expr2.evaluate; 
      end if;
      
      return result;
   end;
   

end BooleanExpressionPackage;
