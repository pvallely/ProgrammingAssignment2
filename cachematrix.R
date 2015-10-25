## This is Assigment 2 of the Coursera R Programming Modeule
##  Two functions are contained below
## Function one (makeCacheMatrix)  creates a special "matrix" object that can cache its inverse.
## Function Two (cacheSolve) computes the inverse of the special "matrix" returned by makeCacheMatrix (Function 1). 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function
## This function creates a special Matrix that can get the matrix from Cache if it exists
## Set the matix to Cache if it does not exist
## Returns the matrix inverse from cache if it has been unchanged
## Stores the matrix inverse if it was not previously calculated.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## step one check if the calculation has been done already to save processing power
        ## step two return the previous calcualtion OR Calculate it
        ## step three is a new calculation Store it for future use.
}
