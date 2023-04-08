set terminal svg
set output "h1.svg"

binwidth = 1
bin(x, width) = width*floor(x/width)

set tics out nomirror
set style fill transparent solid 0.5 border lt -1
set xrange [0:100]
set xtics binwidth
set boxwidth binwidth
set yrange [0:120]

plot '~/cs131/a3/task2.txt' u (bin($1, binwidth)):(1.0) smooth freq with boxes notitle
