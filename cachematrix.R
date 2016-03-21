## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix is a function that returns a list of functions
## Its puspose is to store a martix and a cached value of the inverse of the 
## matrix. Contains the following functions:
## * setMatrix         set the value of a matrix
## * getMatrix         get the value of a matrix
## * setcacheInverse   set the value of the inverse matrix
## * getcacheInverse   get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
## store a Matrix  
        setMatrix <- function(y) {
                x <<- y
                i <<- NULL
        }
## Return the stored Matrix
        getMatrix <- function() x
## Cache the given argument
        setcacheInverse <- function(inv) i <<- inv
## get the cached value
        getcacheInverse <- function() i
        list(
                setMatrix = setMatrix,
                getMatrix =getMatrix,
                setcacheInverse = setcacheInverse,
                getcacheInverse = getcacheInverse
        )

}


## Write a short comment describing this function
# The following function calculates the inverse of a "special" matrix created with makeCacheMatrix


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getcacheInverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        m <- x$getMatrix()
        i <- solve(m, ...)
        x$setCacheInverse(i)
        i
}
