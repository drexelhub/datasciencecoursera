## The below functions will create and cache an inverse of a matrix or retrieve the cached version of an
## inverse matrix if it is already cached


## The makeCacheMatrix function will create an object to cache a matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## the cacheSolve will retrieve a cached version of an inverse matrix or create and cache the inverse of a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- scope(data, ...)
  x$setinv(m)
  inv
}
