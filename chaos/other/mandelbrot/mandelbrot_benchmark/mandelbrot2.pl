#!/usr/bin/perl
# Ported from C to Perl by Anders Bergh <anders1@gmail.com>
#

$BAILOUT=16;
$MAX_ITERATIONS=1000;

$begin = time();

sub mandelbrot {
       local $x = $_[0];
       local $y = $_[1];

       local $cr = $y - 0.5;
       local $ci = $x;
       local $zi = 0.0;
       local $zr = 0.0;
       local $i = 0;

       while (1)
       {
               $i = $i + 1;
               local $temp = $zr * $zi;
               local $zr2 = $zr * $zr;
               local $zi2 = $zi * $zi;
               $zr = $zr2 - $zi2 + $cr;
               $zi = $temp + $temp + $ci;
               if ($zi2 + $zr2 > $BAILOUT)
               {
                       return $i;
               }
               if ($i > $MAX_ITERATIONS)
               {
                       return 0;
               }
       }
}

for ($y = -39; $y < 39; $y++)
{
       print("\n");
       for ($x = -39; $x < 39; $x++)
       {
               $i = mandelbrot($x/40.0, $y/40.0);
               if ($i == 0)
               {
                       print("*");
               }
               else
               {
                       print(" ");
               }
       }
}
print("\n");

$end = time() - $begin;

print "Perl2 Elapsed $end\n";
