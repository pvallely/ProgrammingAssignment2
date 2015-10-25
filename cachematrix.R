## This is Assigment 2 of the Coursera R Programming Modeule
##  Two functions are contained below
## Function one (makeCacheMatrix)  creates a special "matrix" object that can cache its inverse.
## Function Two (cacheSolve) computes the inverse of the special "matrix" returned by makeCacheMatrix (Function 1). 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

## This function creates a special Matrix of functions that
## Returns the matrix inverse from cache if it has been unchanged
## Stores the matrix inverse if it was not previously calculated.

makeCacheMatrix <- function(x = matrix()) {
    ## Set the stored inverse to be NULL
    ## Please note the small i in inv 
    inv <- NULL 
    
    ## Give the internal functions an "a" prefix so that we can clearly see the levels
    ## You could use the same names as R will understand that they are different
    ## However as the programs get more complex my ability to keep track is less
    ## than R's so lets seperate them.
    
    aset <- function(y) {
      x <<- y
      ## change the value of the Inverse when the matrix was changed.
      inv <<- NULL
    }
    
    ## function that returns the Matrix x stored in the main function.
    aget <- function() x ## Doesn't require any input.
    
    asetinverse <- function(solve) inv <<- solve
    
    agetinverse <- function() inv
    
    ## Store the external Functions
  
    list(set = aset, 
         get = aget,
         setinverse = asetinverse,
         getinverse = agetinverse)

}


## This function will check if we have already calculated the inverse and then 
## Either call the above function to retrive or calulate it then call the above function to store it



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  ## First grab the (potentially cached) Inverse from our special Matrix
  Inv <- x$getinverse()    
  if(!is.null(Inv)) {      ## has it previously been cached? i.e. not null
    message("getting cached data")
    ## return it and exit this function
    return(Inv)  
  }
  ## The use of the 'Return' in the above statement makes the rest an effective ELSE
  ## we now need to calculate the Inverse and store it
  ## make a copy of the values in the main vector here
  data <- x$get()     
  #calculate the Inverse, and stored it in our local object
  Inv <- solve(data, ...)  
  #using the setinverse function, store our value
  x$setinverse(Inv)   
  #return the inverse
  Inv     
  
  
}

## Example of their use taken from http://www.mathcentre.ac.uk/resources/uploaded/sigma-matrices7-2009-1.pdf
## so that I could check if it worked or not
##  x<-matrix(c(3,4,1,2),2,2)
## > x
## [,1] [,2]
## [1,]    3    1
## [2,]    4    2
## > test <- makeCacheMatrix(x)
## > cacheSolve(test)
## [,1] [,2]
## [1,]    1 -0.5
## [2,]   -2  1.5
## > cacheSolve(test)
## getting cached data
## [,1] [,2]
## [1,]    1 -0.5
## [2,]   -2  1.5
