package Memory is

   mem : array (0..52) of Integer;
   
   procedure store(ch : Character; value : Integer);     
   function indexOf(ch : Character) return Integer;
   function fetch(ch : Character) return Integer;
     
end Memory;
