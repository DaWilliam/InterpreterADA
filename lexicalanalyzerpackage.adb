

package body LexicalAnalyzerPackage is

     -- Taken from RosettaCode https://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Ada
   function isNumeric(Item : in Unbounded_String) return Boolean is
       Dummy : Float;
   begin
      Dummy := Float'Value (To_String(Item));
      return True;
   exception
      when others =>
         return False;
   end;
   
   procedure add(tokenIn : TokenPackage.Token) is
   begin
      tokenList(length) := tokenIn;
      length := length + 1;
   end;
   
   function remove return TokenPackage.Token is
   begin
      --tokenList(0)
      startPoint := startPoint + 1;
      return tokenList(startPoint - 1);      
   end;   
   
   function get return TokenPackage.Token is
   begin
      return tokenList(startPoint);
   end;
      
   procedure init(fileNameIn : String) is
      File : File_Type;
      lineNumber : Integer := 0;
      line : Unbounded_String;
   begin      
      Open (File => File, Mode => In_File, Name => fileNameIn);
   While not  End_Of_File (File) Loop
         --Put_Line (Get_Line (File));
         line := To_Unbounded_String(Get_Line(File));
         lineNumber := lineNumber + 1;
         processLine(line, lineNumber);
   end loop;
      Close (File);
      add(TokenPackage.init(TokenTypePackage.EOS_TOK, "EOS", lineNumber, 1));
   end;
        
   procedure processLine(line : Unbounded_String; lineNumber : Integer) is
      lineLength : Integer := Ada.Strings.Unbounded.Length(line);
      index : Integer;
      lexeme : Unbounded_String;
      tokType : TokenTypePackage.TokenType;
   begin
      index := skipWhiteSpace(line, 0);
      while index < Ada.Strings.Unbounded.Length(line) loop
         lexeme := getLexeme(line, index);
         tokType := getTokenType(lexeme, lineNumber, index + 1);
         LexicalAnalyzerPackage.add(TokenPackage.init(tokType, lexeme, lineNumber, index + 1));
         index := index + Ada.Strings.Unbounded.Length(lexeme);
         index := skipWhiteSpace(line, index);   
      end loop;      
   end;
   
   function getTokenType(lexeme : Unbounded_String; rowNumber : Integer; columnNumber : Integer) return TokenTypePackage.TokenType is
      tokType : TokenTypePackage.TokenType := TokenTypePackage.EOS_TOK;
   begin
      if isNumeric(lexeme) then
         tokType := TokenTypePackage.LITERAL_INTEGER_TOK;
         --if (allDigits(lexeme)) then            
         --end if;
         --elsif not isNumeric(lexeme(0)) then
      elsif Ada.Strings.Unbounded.Length(lexeme) = 1 then
         tokType := TokenTypePackage.ID_TOK;
      elsif lexeme = "if" then
         tokType := TokenTypePackage.IF_TOK;  
      elsif lexeme = "function" then
         tokType := TokenTypePackage.FUNCTION_TOK; 
      elsif lexeme = "then" then
         tokType := TokenTypePackage.THEN_TOK;
      elsif lexeme = "end" then
         tokType := TokenTypePackage.END_TOK;  
      elsif lexeme = "else" then
         tokType := TokenTypePackage.ELSE_TOK; 
      elsif lexeme = "while" then
         tokType := TokenTypePackage.WHILE_TOK; 
      elsif lexeme = "do" then
         tokType := TokenTypePackage.DO_TOK;  
      elsif lexeme = "print" then
         tokType := TokenTypePackage.PRINT_TOK; 
      elsif lexeme = "repeat" then
         tokType := TokenTypePackage.REPEAT_TOK; 
      elsif lexeme = "until" then
         tokType := TokenTypePackage.UNTIL_TOK;  
      elsif lexeme = "for" then
         tokType := TokenTypePackage.FOR_TOK; 
      elsif lexeme = "(" then
         tokType := TokenTypePackage.LEFT_PAREN_TOK;
      elsif lexeme = ")" then
         tokType := TokenTypePackage.RIGHT_PAREN_TOK;  
      elsif lexeme = ">=" then
         tokType := TokenTypePackage.GE_TOK; 
      elsif lexeme = ">" then
         tokType := TokenTypePackage.GT_TOK; 
      elsif lexeme = "<=" then
         tokType := TokenTypePackage.LE_TOK;  
      elsif lexeme = "<" then
         tokType := TokenTypePackage.LT_TOK; 
      elsif lexeme = "==" then
         tokType := TokenTypePackage.EQ_TOK; 
      elsif lexeme = "!=" then
         tokType := TokenTypePackage.NE_TOK;  
      elsif lexeme = "+" then
         tokType := TokenTypePackage.ADD_TOK; 
      elsif lexeme = "-" then
         tokType := TokenTypePackage.SUB_TOK;
      elsif lexeme = "*" then
         tokType := TokenTypePackage.MUL_TOK;  
      elsif lexeme = "/" then
         tokType := TokenTypePackage.DIV_TOK; 
      elsif lexeme = ":" then
         tokType := TokenTypePackage.BETWEEN_TOK; 
      end if;
      
      return tokType;
   end;
   
   function allDigits(lexeme : Unbounded_String) return Boolean is
   begin
      Put("All Digit Called. But Not Needed?");
      return true;
   end;
   
   function getLexeme(line : Unbounded_String; index : Integer) return Unbounded_String is
      i : Integer := index;
      lineString : String := To_String(line);
   begin
      while i < lineString'Length and lineString(i) /= ' ' loop
         i := i + 1;
      end loop;
      return To_Unbounded_String(lineString(index .. i));
   end;
   
   function skipWhiteSpace(line : Unbounded_String; index : Integer) return Integer is
      lineString : String := To_String(line);
      newIndex : Integer := index;
   begin
      while index < lineString'Length and lineString(newIndex) = ' ' loop
         newIndex := newIndex + 1;
      end loop;
      return newIndex;
   end;
   
   function getLookaheadToken return TokenPackage.Token is
   begin
      if tokenList'Length = 0 then
         Put("getLookaheadToken ERROR: Token List is 0");
      end if;
      
      return get;
   end;
   
   function getNextToken return TokenPackage.Token is
   begin
      if tokenList'Length = 0 then
         Put("getLookaheadToken ERROR: Token List is 0");
      end if;
      
      return remove;
   end;
          
end LexicalAnalyzerPackage;
