## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  solved <- NULL
  set <- function(y) {
    x <<- y
    solved <<- NULL
  }
  get <- function() x
  setsolved <- function(solve) solved <<- solve
  getsolved <- function() solved
  list(set = set, get = get,
       setsolved = setsolved,
       getsolved = getsolved)
} ###creates an inversible matrix based on an original matrix 


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  solved <- x$getsolved()
  if(!is.null(solved)) {
    message("getting inverse matrix")
    return(solved)
  }
  data <- x$get()
  solved <- solve(data, ...)
  x$setsolved(solved)
  solved ## Return a matrix that is the inverse of 'x'- the inversible matrix
}


###testing 
matriz<- matrix(rnorm(4),2,2)
matrizInv <- makeCacheMatrix(matriz)
cacheSolve(matrizInv)
