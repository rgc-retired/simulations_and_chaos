# Make a dendrite
rw = function(a,x,y) {
  N=nrow(a)
  while(TRUE) {
    # If point is next to existing point - stop here
    if ( (x>1) && (a[x-1,y] != 0) ) { return(c(x,y)) }
    if ( (x<N) && (a[x+1,y] != 0) ) { return(c(x,y)) }
    if ( (y>1) && (a[x,y-1] != 0) ) { return(c(x,y)) }
    if ( (y<N) && (a[x,y+1] != 0) ) { return(c(x,y)) }
    # Take a random step
    d=sample(4,1)
    if (d==1) { x = x-1 }
    if (d==2) { x = x+1 }
    if (d==3) { y = y-1 }
    if (d==4) { y = y+1 }
    # Clip it to the range of the matrix
    if (x<1) {x = 1}
    if (x>N) {x = N}
    if (y<1) {y = 1}
    if (y>N) {y = N}
    ### print(c(x,y))
  }
}


# Create a "stalk" to attract particles
N=200
a=matrix(rep(0,N*N),nrow=N)
a[(N/2):N,(N/2)]=1

t1=Sys.time()
# Generate a bunch of random points
# Note that this is extremely slow.
# With 10K points in a matrix of 400x400 the computations take ~50 minutes.
# The result, however, is a pretty convincing dendrite!
#
# The 400x400 grid with 200 frames (one every 100 points) takes about an hour
#
# A coarser grid of 200x200 with 6K points runs in 4.1 minutes.
#

for (frame in 1:100) {
  for (i in 1:100) {
    # Release a particle from a random location along a border and allow it to
    # make a random walk until it runs into some existing structure.  At that
    # point add it to the dendrite.
    a[1,]=0
    a[N,]=0
    a[,1]=0
    a[,N]=0
    first_pass=TRUE
    while( first_pass || a[row,column] != 0) {
      d=sample(4,1)
      if (d==1) {row=1; column=sample(N,1) }
      if (d==2) {row=N; column=sample(N,1) }
      if (d==3) {column=1; row=sample(N,1) }
      if (d==4) {column=N; row=sample(N,1) }
      first_pass=FALSE
    }
    s=rw(a,row,column)
    a[s[1],s[2]]=2
  }
  fname=sprintf("dendrite_frame_%03d.png",frame)
  png(fname)
  image(t(a[rev(1:nrow(a)),]),col=c('green','red','blue'),axes=FALSE)
  print(sprintf("Done with frame %d",frame))
  dev.off()
}
t2=Sys.time()
print(t2-t1)

image(t(a[rev(1:nrow(a)),]),col=c('green','red','blue'),axes=FALSE)
