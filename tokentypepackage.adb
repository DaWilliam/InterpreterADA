package body tokentypepackage is

   function equals (left : TokenType; right : TokenType) return Boolean is
   begin
      if left = right then
         return true;
      else
         return false;
      end if;
   end;
   

end tokentypepackage;
