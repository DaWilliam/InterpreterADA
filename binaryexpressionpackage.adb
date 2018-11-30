with Ada.Text_IO; use Ada.Text_IO;

package body BinaryExpressionPackage is

   function init(opIn : ArithmeticOperator; expr1In : ArithmeticExpression.ArithmeticExpression; 
                  expr2In : ArithmeticExpression.ArithmeticExpression) return BinaryExpression is
      temp : BinaryExpression;
   begin
      temp.op := opIn;
      temp.expr1 := expr1In;
      temp.expr2 := expr2In;
      return temp;
   end;   
   
   overriding
   function evaluate(self : in out BinaryExpression) return Integer is
      value : Integer := 0;
   begin
      if self.op = ADD_OP then
         value := self.expr1.evaluate + self.expr2.evaluate;
      elsif self.op = SUB_OP then
         value := self.expr1.evaluate - self.expr2.evaluate;
      elsif self.op = MUL_OP then
         value := self.expr1.evaluate * self.expr2.evaluate;
      elsif self.op = DIV_OP then
         value := self.expr1.evaluate / self.expr2.evaluate;
      end if; 
      
      return value;
   end;

end BinaryExpressionPackage;
