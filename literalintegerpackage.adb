package body LiteralIntegerPackage is

   function init(valueIn : Integer) return LiteralInteger is
      temp : LiteralInteger;
   begin
         temp.value := valueIn;
         return temp;
   end;
      
   overriding
      function evaluate(self : in out LiteralInteger) return Integer is
      begin
         return self.value;
      end;
      

end LiteralIntegerPackage;
