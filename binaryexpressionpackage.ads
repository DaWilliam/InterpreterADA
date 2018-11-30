with ArithmeticExpression;
with StatementPackage;

package BinaryExpressionPackage is

   type ArithmeticOperator is (ADD_OP, SUB_OP, MUL_OP, DIV_OP);
   
      for ArithmeticOperator use (
                               ADD_OP => 19,
                               SUB_OP => 20,
                               MUL_OP => 21,
                               DIV_OP => 22
                                 );
   
   type BinaryExpression is new ArithmeticExpression.ArithmeticExpression with record      
         op : ArithmeticOperator;
         expr1 : ArithmeticExpression.ArithmeticExpression;
         expr2 : ArithmeticExpression.ArithmeticExpression;
      end record;

   function init(opIn : ArithmeticOperator; expr1In : ArithmeticExpression.ArithmeticExpression; 
                  expr2In : ArithmeticExpression.ArithmeticExpression) return BinaryExpression;
   
   overriding
   function evaluate(self : in out BinaryExpression) return Integer;
     
end BinaryExpressionPackage;
