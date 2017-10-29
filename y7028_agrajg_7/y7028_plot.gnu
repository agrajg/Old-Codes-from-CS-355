set term postscript eps color enhanced 10 
set output "y7028_plot.eps" 
set title "Histogram"
set key top right
set xrange [0:50]
set yrange [0:*]
set style data histograms
set style fill solid 0.1
set style histogram cluster gap 2
set boxwidth 1
set style fill pattern 3
set ylabel "Distribution"
set xlabel "X"
set label "Mean" at 10,0.14
set multiplot
set size 0.5,0.5
set origin 0,0.5
plot './y7028_data.dat' using 2 t "Y", '' using 3 t "h1", '' using 4 t "h2", '' using 5 t "h3"
set nolabel


 

set title "Row Stacked Histogram"
set style histogram rowstacked
set size 0.5,0.5
set origin 0,0
set label "Mean" at 10,0.57
plot './y7028_data.dat' using 2 t "Y", '' using 3 t "h1", '' using 4 t "h2", '' using 5 t "h3"
set nolabel

 
set size 0.5,0.5
set origin 0.5,0.5
set title "Column Stacked Histogram"
set xrange [0:5]
set style histogram columnstacked
plot './y7028_data.dat' using 2 t "Y", '' using 3 t "h1"
set nomultiplot
