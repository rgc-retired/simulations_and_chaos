#!/usr/bin/tclsh

# Optimized Version by Samuel Zafrany

# Ported from C by Anders Bergh <anders1@gmail.com>
package require Tcl 8.4

set BAILOUT 16
set MAX_ITERATIONS 1000

proc mandelbrot {x y} {
       global BAILOUT
       global MAX_ITERATIONS

       set cr [expr {$y - 0.5}]
       set ci $x
       set zi 0.0
       set zr 0.0
       set i 0

       while {1} {
               incr i
               set temp [expr {$zr * $zi}]
               set zr2 [expr {$zr * $zr}]
               set zi2 [expr {$zi * $zi}]
               set zr [expr {$zr2 - $zi2 + $cr}]
               set zi [expr {$temp + $temp + $ci}]

               if {$zi2 + $zr2 > $BAILOUT} {
                       return $i
               }

               if {$i > $MAX_ITERATIONS} {
                       return 0
               }
       }
}

proc main { } {
    set begin [clock clicks -milliseconds]

    for {set y -39} {$y < 39} {incr y} {
           puts ""
           for {set x -39} {$x < 39} {incr x} {
                   set i [mandelbrot [expr {$x / 40.0}] [expr {$y / 40.0}]]

                   if {$i == 0} {
                           puts -nonewline "*"
                   } else {
                           puts -nonewline " "
                   }
                   flush stdout
           }
    }
    puts ""

    set diff [expr [clock clicks -milliseconds] - $begin]
    #puts "Tcl Elapsed [expr int($diff / 1000)] seconds ($diff ms)"
    puts "Tcl Elapsed [expr ($diff / 1000.)]"
}

main
