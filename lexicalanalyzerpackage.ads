with TokenPackage;
with TokenTypePackage;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

package LexicalAnalyzerPackage is


   type TokenListType is array (Integer range 0 .. 1000) of TokenPackage.Token;
   tokenList : TokenListType;
   length : Integer := 0;
   startPoint : Integer := 0;
   
   type LexicalAnalyzer is record 
      --fileName : String(0..5);
      fileName : Unbounded_String;      
   end record;
   
   procedure init(fileNameIn : String);
   procedure add(tokenIn : TokenPackage.Token);
   function remove return TokenPackage.Token;
   function get return TokenPackage.Token;
   
   procedure processLine(line : Unbounded_String; lineNumber : Integer);
   function getTokenType(lexeme : Unbounded_String; rowNumber : Integer; columnNumber : Integer) return TokenTypePackage.TokenType;
   function allDigits(lexeme : Unbounded_String) return Boolean;
   function getLexeme(line : Unbounded_String; index : Integer) return Unbounded_String;
   function skipWhiteSpace(line : Unbounded_String; index : Integer) return Integer;
   function getLookaheadToken return TokenPackage.Token;
   function getNextToken return TokenPackage.Token;
   
   -- Taken from RosettaCode https://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Ada
   function isNumeric(Item : in Unbounded_String) return Boolean;
   
end LexicalAnalyzerPackage;
