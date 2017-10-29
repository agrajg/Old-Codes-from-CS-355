resume.pdf: resume.ps direct_resume.pdf
	ps2pdf resume.ps resume.pdf
	echo ".ps updated"
resume.ps: resume.dvi
	dvips -o resume.ps resume.dvi
	echo ".dvi updated"
resume.dvi: pc.jpg y7028_plot.eps resume.tex resume.bib
	convert pc.jpg pc.eps
	latex resume.tex
	bibtex resume.aux
	latex resume.tex
	latex resume.tex
	echo ".tex updated or plot.pdf changed"
direct_resume.pdf: resume.tex
	pstopdf pc.eps
	pstopdf y7028_plot.eps
	pdflatex resume.tex 
	mv resume.pdf direct_resume.pdf
y7028_plot.eps: y7028_data.dat y7028_plot.gnu
	gnuplot y7028_plot.gnu
	echo ".gnu or .dat changed"
clean:
	-rm -f *.log *.aux *.dvi *.bbl *.blg *.ps  *~