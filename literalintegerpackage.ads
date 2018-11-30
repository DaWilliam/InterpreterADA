with ArithmeticExpression;

package LiteralIntegerPackage is

   type LiteralInteger is new ArithmeticExpression.ArithmeticExpression with record
      value : Integer;
   end record;
   
   function init(valueIn : Integer) return LiteralInteger;
   
   overriding
   function evaluate(self : in out LiteralInteger) return Integer;

end LiteralIntegerPackage;
