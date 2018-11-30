with Ada.Text_IO; use Ada.Text_IO;

package ArithmeticExpression is

   type ArithmeticExpression is tagged record      
         dummy : Integer;
      end record;
      
   function evaluate(self : in out ArithmeticExpression) return Integer;
   
end ArithmeticExpression;
