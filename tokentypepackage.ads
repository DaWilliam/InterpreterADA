package TokenTypePackage is
   
    type TokenType is (FUNCTION_TOK, LEFT_PAREN_TOK, RIGHT_PAREN_TOK, IF_TOK, THEN_TOK, END_TOK, 
	ELSE_TOK, WHILE_TOK, DO_TOK, ID_TOK, PRINT_TOK, GE_TOK, GT_TOK, REPEAT_TOK,
	UNTIL_TOK,LE_TOK, LT_TOK, EQ_TOK, NE_TOK, ADD_TOK, SUB_TOK, MUL_TOK, 
                           DIV_TOK, ASSIGN_TOK, EOS_TOK, LITERAL_INTEGER_TOK, FOR_TOK, BETWEEN_TOK);
   
   for TokenType use (
    FUNCTION_TOK => 0,
    LEFT_PAREN_TOK => 1,
    RIGHT_PAREN_TOK => 2,
    IF_TOK => 3,
    THEN_TOK => 4,
    END_TOK => 5,
    ELSE_TOK => 6,
    WHILE_TOK => 7,
    DO_TOK => 8,
    ID_TOK => 9,
    PRINT_TOK => 10,
    GE_TOK => 11,
    GT_TOK => 12,
    REPEAT_TOK => 13,
    UNTIL_TOK => 14,
    LE_TOK => 15,
    LT_TOK => 16,
    EQ_TOK => 17,
    NE_TOK => 18,
    ADD_TOK => 19,
    SUB_TOK => 20,
    MUL_TOK => 21,
    DIV_TOK => 22,
    ASSIGN_TOK => 23,
    EOS_TOK => 24,
    LITERAL_INTEGER_TOK => 25,
    FOR_TOK => 26,
    BETWEEN_TOK => 27
   );
     
   function equals (left : TokenType; right : TokenType) return Boolean;
   

end TokenTypePackage;
