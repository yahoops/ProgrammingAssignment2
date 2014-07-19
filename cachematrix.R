## this is a with cache matrix & inverse matrix strucutre


## from a matrix, create a list with: setters & getters on the matrix & inversematrix
## the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
  
}


## for a matrix on a list structure (see previous method)
## compute the inverse matrix
## if the comutations has already been made, do not redo the computations but give the previous computed result
## demo code smaple may be :
## mi<-matrix(c(4,3,3,2),ncol=2,nrow=2)
## mk<-makeCacheMatrix(mi)
##z<-cacheSolve(mk)
##z<-cacheSolve(mk)
##z<-cacheSolve(mk)
##message compare show a first evaluation and then returning data from cache




cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  message("computing uncached data")
  m <- solve(x$get())
  x$setinverse(m)
  m
}