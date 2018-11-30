package body StringModifier is

   function ChangeStringLength(newLength : Integer; copiedString : String) return String is
      s : String(0..newLength);
   begin
      s := "Hi";
      For_Loop : 
      for i in Integer range 0..newLength loop
         s(i) := copiedString(i);
         end loop For_Loop;
      return s;
      end;
      

end StringModifier;
