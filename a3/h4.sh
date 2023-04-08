set terminal svg
set output "h4.svg"

binwidth = 4
Min = 0
Max = 96
n = 24
width = (Max-Min)/n
bin(x, width) = width*(floor((x-Min)/width)+0.5) + Min

set tics out nomirror
set style fill transparent solid 0.5 border lt -1
set xrange [0:100]
set xtics binwidth
set boxwidth binwidth
set yrange [0:*]

plot '~/cs131/a3/task2.txt' u (bin($1, binwidth)):(1.0) smooth freq with boxes notitle

