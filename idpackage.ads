with ArithmeticExpression;
with Ada.Characters.Conversions;

package IdPackage is
   
   type Id is new ArithmeticExpression.ArithmeticExpression with record
      ch : Character;
   end record;   
   
   function init(chIn : in out Character) return Id;
   function getChar(self : Id) return Character;
       
   overriding
   function evaluate(self : in out Id) return Integer;
   
end IdPackage;
