## In this assignment we have to solve the inverse of a matrix by caching the 
## result within a lexical scope of a function:  "makeCacheMatrix" and 
## "cacheSolve".
## These functions allow us to avoid excess computation by using
## memory.


## "makeCacheMatrix" creates a new environment.
## The inverse matrix is cached inside the object mat, 
## The output of the function is a list with 4 named elements, which are 
## the four functions defined: set, get, setinverse, 
## getinverse.

makeCacheMatrix <- function(x = matrix()) {
        mat <- NULL
        set <- function(y){
                x <<- y
                mat <<- NULL 
        }
        get <- function() x
        setinverse <- function(inverse) mat <- inverse
        getinverse <- function() mat
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The function "cacheSolve" returns the inverse of the matrix that is 
## returned by "makeCacheMatrix" function

cacheSolve <- function(x, ...) {
        mat <- x$getinverse()
        if(!is.null(mat)){
                message("getting cached data")
                return(met)
        }
        data <- x$get()
        mat <- solve(data, ...)
        x$setinverse(mat)
        mat
}

