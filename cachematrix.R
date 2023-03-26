## Pair of fucntions that cache the inverse of matrix
## Usage: Pass the result of a makeCacheMatrix call too cacheSolve

#' Util function that set the matrix and the inverse in an environment
#' @param x an invertible matrix
#' examples
#' c = makeCacheMatrix(matric(rnorm(9), 3, 3))
#' x$set(matrix(rnorm(16), 4, 4)) 
makeCacheMatrix <- function(x = matrix()) {
  #todo error if x is not a matrix
  inv <- NULL
  set <- function(y) {
    x <<-y
    inv <<- NULL
    }
  get <- function() x
  setinvrse <- function(inverse) inv <<-inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  }


#' Compute and cahe the inverse of a matrix
#' @param x the result of a previous makeCacheMatrix call
#' @param ... additional arguments to pass to solve function
#' examples
#' x = makeCacheMatrix(matrix(rnorm(9), 3, 3))
#' cachSolve(x)
cacheSolve <- function(x, ...) {
  ##Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached matrix inverse")
    return(inv)
    }
  data <= x$get()
  inv - solve(data, ...)
  x$setinverse(inv)
  inv
  }
