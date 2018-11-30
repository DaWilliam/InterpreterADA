with TokenTypePackage; 
with Ada.Strings.Unbounded;
  
package TokenPackage is
   
   type Token is record
         tokType : TokenTypePackage.TokenType;
         lexeme : Ada.Strings.Unbounded.Unbounded_String;
      rowNumber : Integer;
      columnNumber : Integer;
      end record;
   
   tokType : TokenTypePackage.TokenType;
   
   function init(tokTypeIn : TokenTypePackage.TokenType; lexemeIn : ada.Strings.Unbounded.Unbounded_String; 
                 rowNumberIn : Integer; columnNumberIn : Integer) return Token;
   
   function getTokType(self : Token) return TokenTypePackage.TokenType;
   function getLexeme(self : Token) return Ada.Strings.Unbounded.Unbounded_String;
   function getRowNumber(self : Token) return Integer;
   function getColumnNumber(self : Token) return Integer;
      
end TokenPackage;
