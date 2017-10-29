%{
#include <unistd.h>
#include <string.h>
#include <stdio.h>
int file_num, file_num_max;
%}
%x S0 S2 S3 S1 S4 S5
any_tag              !doctype|a|abbr|acronym|address|applet|area|b|base|basefont|bdo|big|blockquote|body|br|button|caption|center|cite|code|col|colgroup|dd|del|dfn|dir|div|dl|dt|em|fieldset|font|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|hr|html|i|iframe|img|input|ins|isindex|kbd|label|legend|li|link|map|menu|meta|noframes|noscript|object|ol|optgroup|option|p|param|pre|q|s|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|ul|var

comment              <!--.*-->


%%
"<h1"[^>]*">"	printf("@@@@@@");
"</h1>"		printf("@@@@@@");

"<h2"[^>]*">"	printf("@@@@@");
"</h2>"		printf("@@@@@");

"<h3"[^>]*">"	printf("@@@@");
"</h3>"		printf("@@@@");

"<h4"[^>]*">"	printf("@@@");
"</h4>"		printf("@@@");

"<h5"[^>]*">"	printf("@@");
"</h5>"		printf("@@");

"<h6"[^>]*">"	printf("@");
"</h6>"		printf("@");


"<!--"	BEGIN (S0);
<S0>[^-->]	;
<S0>"-->"	BEGIN(INITIAL);

"<ol>"		BEGIN(S5); int con=1;
<S5>"<li>" 	printf("%d", con,". "); con++;
<S5>"</li>"	;
<S5>"</ol>"	BEGIN(INITIAL);

"</"{any_tag}  BEGIN(S2);
<S2>[^>]	;
<S2>">"		BEGIN(INITIAL);

"<"{any_tag}"/"  BEGIN(S3);
<S3>[^>]	;
<S3>">"		BEGIN(INITIAL);

"<"{any_tag}     BEGIN(S1);
<S1>[^>]         ;
<S1>">"          BEGIN (INITIAL);


"<ul>"		BEGIN(S4);
<S4>"<li>"	printf("*");
<S4>"</li>"	;
<S4>"</ul>"	BEGIN(INITIAL);
%%







main(int argc,char** argv)
{
	++argv,--argc;
	if(argc > 0)
  		yyin = fopen(argv[0],"r");
 	else
  		yyin = stdin;
 	while(yylex())
		;
 }
int yywrap() {
    return 1;
}
