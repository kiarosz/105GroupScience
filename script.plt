#script para plotar a solução com as três componentes
#ecgabrick@gmail.com
reset 
set terminal postscript eps size 8,5 enhanced color font 'Times, 42'
set output "fig9.eps"
set key center right
set key sample 1
set xlabel 't' font 'Times, 52'
set ylabel ''
set xrange [0:3]
set yrange [0:10]
set xtics 1
plot 'equacao20.dat' using 1:2 with lines lt rgb 'red' lw 5 title "a(t)", 'hubble.dat' with lines title 'H(t)' lt rgb 'blue' lw 5, 'densidade.dat' u 1:2 with lines title '{/Symbol r}(t)' lt rgb 'green' lw 5
set output
