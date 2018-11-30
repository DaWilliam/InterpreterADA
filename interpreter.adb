with IdPackage;
with ArithmeticExpression; use ArithmeticExpression;
with Ada.Text_IO; use Ada.Text_IO;
with Memory;
with BinaryExpressionPackage;
wiht LexicalAnalyzerPackage;

procedure Interpreter is
   b : BinaryExpressionPackage.BinaryExpression;
   a1 : ArithmeticExpression.ArithmeticExpression;
   a2 : ArithmeticExpression.ArithmeticExpression;
begin
   b := BinaryExpressionPackage.init(BinaryExpressionPackage.ADD_OP, a1, a2);

end Interpreter;
