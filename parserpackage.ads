with StatementPackage;
with BlockPackage;
with ProgramPackage;
with ArithmeticExpression;
with BinaryExpressionPackage;
with LiteralIntegerPackage;
with IdPackage;
with BooleanExpressionPackage;
with TokenPackage;
with TokenTypePackage;
with LexicalAnalyzerPackage;
with AssignmentStatementPackage;

package ParserPackage is

   procedure init (fileName : String);
   
   function parse return ProgramPackage.Program;
   function getBlock return BlockPackage.Block;
   function getStatement return StatementPackage.Statement;
   function getAssignmentStatement return AssignmentStatementPackage.AssignmentStatement;
   function getRepeatStatement return StatementPackage.Statement;
   function getPrintStatement return StatementPackage.Statement;
   function getWhileStatement return StatementPackage.Statement;
   function getIfStatement return StatementPackage.Statement;
   function isValidStartOfStatement(tok : TokenPackage.Token) return Boolean;
   function getArithmeticExpression return ArithmeticExpression.ArithmeticExpression;
   function getBinaryExpression return BinaryExpressionPackage.BinaryExpression;
   function getArithmeticOperator return BinaryExpressionPackage.ArithmeticOperator;
   function getLiteralInteger return LiteralIntegerPackage.LiteralInteger;
   function getId return IdPackage.Id;
   function getBooleanExpression return BooleanExpressionPackage.BooleanExpression;
   function getRelationalOperator return BooleanExpressionPackage.RelationalOperator;
   
   procedure match(tok : TokenPackage.Token; tokType : TokenTypePackage.TokenType);
   function getLookaheadToken return TokenPackage.Token;
   function getNextToken return TokenPackage.Token;
   
   function getForStatement return StatementPackage.Statement;
   
end ParserPackage;
