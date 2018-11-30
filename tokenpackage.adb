package body TokenPackage is

   function init(tokTypeIn : TokenTypePackage.TokenType; lexemeIn : ada.Strings.Unbounded.Unbounded_String; 
                 rowNumberIn : Integer; columnNumberIn : Integer) return Token is
      temp : Token;
   begin
      temp.tokType := tokTypeIn;
      temp.lexeme := lexemeIn;
      temp.rowNumber := rowNumberIn;
      temp.columnNumber := columnNumberIn;
      return temp;
   end;
   
   
   function getTokType(self : Token) return TokenTypePackage.TokenType is
   begin
      return self.tokType;
   end;
   
   function getLexeme(self : Token) return Ada.Strings.Unbounded.Unbounded_String is
   begin
      return self.lexeme;
   end;
   
   function getRowNumber(self : Token) return Integer is 
   begin
      return self.rowNumber;
   end;
   
   function getColumnNumber(self : Token) return Integer is
   begin
      return self.columnNumber;
   end;   

end TokenPackage;
