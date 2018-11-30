with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Memory is

   procedure store(ch : Character; value : Integer) is           
   begin
      mem(indexOf(ch)) := value;
   end;
   
   function indexOf(ch : Character) return Integer is 
   index : Integer;
   begin
      if Ada.Characters.Handling.Is_Letter(ch) then
         Put("Exception");
      else 
         if Ada.Characters.Handling.Is_Lower(ch) then
            index := Character'Pos(ch) - Character'Pos('a');
         else
            index := 26 + Character'Pos(ch) - Character'Pos('A');
         end if;           
      end if;
      return index;
   end;
   
   
   function fetch(ch : Character) return Integer is
   begin
      return mem(indexOf(ch));
   end;
   

end Memory;
