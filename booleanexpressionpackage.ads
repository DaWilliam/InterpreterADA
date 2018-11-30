with ArithmeticExpression;
with StatementPackage;

package BooleanExpressionPackage is

   type RelationalOperator is (GE_OP, GT_OP, LE_OP, LT_OP, EQ_OP, NE_OP);
   
   for RelationalOperator use (
                               GE_OP => 11,
                               GT_OP => 12,
                               LE_OP => 15,   
                               LT_OP => 16,
                               EQ_OP => 17,
                               NE_OP => 18
                              );
   
   type BooleanExpression is record
      op : RelationalOperator;
      expr1 : ArithmeticExpression.ArithmeticExpression;
      expr2 : ArithmeticExpression.ArithmeticExpression;
   end record;
   
   function init(op : RelationalOperator; expr1 : ArithmeticExpression.ArithmeticExpression;
                 expr2 : ArithmeticExpression.ArithmeticExpression) return BooleanExpression;

   function evaluate (self : in out BooleanExpression) return Boolean;
   
end BooleanExpressionPackage;
