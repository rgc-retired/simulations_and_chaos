# More Fractal Stuff

## Chaotic Maps

[List of many maps](https://en.wikipedia.org/wiki/List_of_chaotic_maps)

A few of these have code to create the maps but most are quite
cryptic (e.g. math oriented).  I pulled my mandelbrot benchmark
code from grumpy and copy/pasted in some code to create the
Lorenz butterfly.

There are a couple more in this list that might be interesting.

* Arnold's Cat Map (given x,y in unit square)

    x -> 2*x+y mod 1
    y -> x+y   mod 1

    This creates an invertible warping.  The initial demonstration
    involved a picture of a cat (hence the name) that gets scrambled
    and (eventually) unscrambled by repeatedly using the map.
    Apparently it can be shown that the image will be returned in
    a maximum of 3*N steps (where N is the size of the image).

* Baker's Map (given x,y in unit square)

    S(x,y) = (2*x,y/2)     for x<1/2
             (2-2*x,1-y/2) for x>1/2

    This is basically a stretch and fold operation like kneading
    dough (hence the name).

* Gauss Map (aka Gaussian map or Mouse map)

    Is similar to the logistic map and has a bifurcation diagram
    that sort of looks like a top view of a mouse.  The chaos
    regions look like eyes or ears.

    x[n+1] = exp(-a*x[n]^2)+b

    Where: a,b are fixed parameters

    Use a=4.9 and sweep b from -1 to +1 to see mouse in bifurcation.
    Fixed point should be x=0 with b=-1 and x=1 with b=+1.

    Use a=6.2 and sweep b from -1 to +1 to see mouse with larger
    chaotic regions.

* Henon Map

    Very simple chaotic system:

    x[n+1] = 1-a*x[n]^2+y[n]
    y[n+1] = b*x[n]

    a=1.4 and b=0.3 shows chaos

* Ikeda Map

    Complex map: z[n+1]=A+B*z[n]*exp(i*(abs(z[n])^2+C))

    Which can be transformed into real equations:

    x[n+1]=1+u*(x[n]*cos(t[n])-y[n]*sin(t[n]))
    y[n+1]=u*(x[n]*sin(t[n])+y[n]*cos(t[n]))
    t[n]=0.4 - 6/(1+x[n]^2+y[n]^2)

    For u>0.6 there is a chaotic strange attractor.  The picture
    on the web page uses u=0.918

    The Wikipedia page has Octave/Matlab code.

* Lorenz System

    System of differential equations that started a lot of this

    dx/dt = sigma*(y-x)
    dy/dt = x*(rho-z)-y
    dz/dt = x*y-beta*z

    sigma=10, beta=8/3, rho=28 was used by Lorenz and shows chaos.

    The Wikipedia page has code is many languages (Octave/Python).

* Lotka-Volterra equations (Predator-Prey)

    System of differential equations

    dx/dt = alpha*x - beta*x*y
    dy/dt = delta*x*y - gamma*y

    alpha=2/3, beta=4/3, delta=gamma=1 has limit cycles.
    x=y = 0.9 to 1.8 in steps of 0.1, Fixed point at (1,1/2)

* Rossler attractor

    System of differential equations

    dx/dt = -y-z
    dy/dt = x+a*y
    dz/dt = b+z*(x-c)

    a=0.1, b=0.1, c=14 commonly used
    a=0.2, b=0.2, c=5.7 was original set used by Rossler

* Thomas' cyclically symmetric attractor

    System of differential equations

    dx/dt = sin(y)-b*x
    dy/dt = sin(z)-b*y
    dz/dt = sin(x)-b*z

    As b is made smaller the system is less dissipative and more
    prone to chaos.

    b = 0.1998 shows multiple bifurcations - attractor in 3D.

* Tent map

    x[n+1] = u*x[n]     for x<1/2
             u*(1-x[n]) for x>1/2


    Nice bifurcation diagrams for u = 1 to 2.  The fixed point
    has x=0.5 when u=1.0.

* Tinkerbell map

    x[n+1]=x[n]^2-y[n]^2+a*x[n]+b*y[n]
    y[n+1]=2*x[n]*y[n]+c*x[n]+d*y[n]

    use: a=0.9, b=0.6013, c=2, d=0.5 with
    x0=-0.72 and y0=-0.64 and the 3D curve looks a bit like
    Tinkerbell's flight path over the castle on Disney movies.

    Another common set is a=0.3, b=0.6, c=2, d=0.27

* maybe one or two more

## Fractals

There is also a list of links to fractals at the end of the page.

The one for Julia sets has pseudo-code that could be used to make
some interesting plots.

There is lots of good things to explore here.

