with Ada.Text_IO; use Ada.Text_IO;
with Memory;

package body IdPackage is

   function init(chIn : in out Character) return Id is
      temp : Id;
   begin
      temp.ch := chIn;
      return temp;
   end;

   function getChar(self : Id) return Character is
   begin
      return self.ch;
   end;
   
   function evaluate(self : in out Id) return Integer is 
   begin
      return Memory.fetch(self.ch);
   end;
   
     
end IdPackage;
