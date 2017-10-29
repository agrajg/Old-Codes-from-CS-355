#----------------------------------------------------------------------------------
# Simple Makefile  to create html2ascii program
# Assumes lexer is in "html_lex.l" and main program is in "driver.c"
#

# Set the commands and options
LEX=flex

html2ascii: lex.yy.o
	$(CC) -o $@  $(LDFLAGS) $^

driver.o: driver.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $^

lex.yy.o: lex.yy.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $^

lex.yy.c: final_assignment.ll
	$(LEX) $(LFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) *.o lex.yy.c
