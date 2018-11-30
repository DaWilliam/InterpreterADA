

package body ArithmeticExpression is
      
   function evaluate(self : in out ArithmeticExpression) return Integer is 
   begin      
      Put("ArithmeticExpression Interface Called. Somethin Ain't being overridden.");
      return -1;
   end;         

end ArithmeticExpression;
