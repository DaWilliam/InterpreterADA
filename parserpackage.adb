
package body ParserPackage is

   procedure init (fileName : String) is
   begin
      LexicalAnalyzerPackage.init(fileName);
   end;         
   
   function parse return ProgramPackage.Program is
      tok : TokenPackage.Token;
      functionName : IdPackage.Id;    
      blk : BlockPackage.Block;
   begin
      tok := getNextToken;
      match(tok, TokenTypePackage.FUNCTION_TOK);
      functionName := getId;
      tok := getNextToken;
      match(tok, TokenTypePackage.LEFT_PAREN_TOK);
      tok := getNextToken;
      match(tok, TokenTypePackage.RIGHT_PAREN_TOK);
      blk := getBlock;
      tok := getNextToken;
      match(tok, TokenTypePackage.END_TOK);
      tok := getNextToken;
      return ProgramPackage.init(blk);
   end;
   
   function getBlock return BlockPackage.Block is
      blk : BlockPackage.Block;
      tok : TokenPackage.Token;
      stmt : StatementPackage.Statement;
   begin
      tok := getLookaheadToken;
      while isValidStartOfStatement(tok) loop
         stmt := getStatement;
         blk.add(stmt);
         tok := getLookaheadToken;
      end loop;
      return blk;
   end;
   
   function getStatement return StatementPackage.Statement is
      stmt : StatementPackage.Statement;
      tok : TokenPackage.Token;
      tokIf : TokenTypePackage.TokenType := TokenTypePackage.IF_TOK;
   begin
      tok := getLookaheadToken;
      
      if TokenTypePackage.equals(tok.tokType, TokenTypePackage.IF_TOK) then
         stmt := getIfStatement;
      elsif TokenTypePackage.equals(tok.tokType, TokenTypePackage.WHILE_TOK) then
         stmt := getWhileStatement;
      elsif TokenTypePackage.equals(tok.tokType, TokenTypePackage.PRINT_TOK) then
         stmt := getPrintStatement;
      elsif TokenTypePackage.equals(tok.tokType, TokenTypePackage.REPEAT_TOK) then
         stmt := getRepeatStatement;
      elsif TokenTypePackage.equals(tok.tokType, TokenTypePackage.ID_TOK) then
         stmt := getAssignmentStatement;
      elsif TokenTypePackage.equals(tok.tokType, TokenTypePackage.FOR_TOK) then
         stmt := getForStatement;
      end if;
      
      return stmt;      
   end;
   
   function getAssignmentStatement return StatementPackage.Statement is
      var : IdPackage.Id;
      tok : TokenPackage.Token;
      expr : ArithmeticExpression.ArithmeticExpression;
      tempAssign : AssignmentStatementPackage.AssignmentStatement;
      tempState : StatementPackage.Statement;
   begin
      var := getId;
      tok := getNextToken;
      match(tok, TokenTypePackage.ASSIGN_TOK);
      expr := getArithmeticExpression;
      tempAssign := AssignmentStatementPackage.init(var, expr);      
      tempState := StatementPackage.Statement(tempAssign);      
      return tempState;      
   end;
   
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
