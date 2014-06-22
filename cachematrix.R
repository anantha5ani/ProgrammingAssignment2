
## Matrix inverse computations are very costly, hence it is cached
## This can be done in two steps
## 1. Function to make the matrix or which inverse is to be computed
## 2. Create a function to solve for inverse either from cache or 
## fresh computation

## This is a function to make the matrix to find its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatx <- function(matx) m <<- matx
        getmatx <- function() m
        list(set = set, get = get,
             setmatx = setmatx,
             getmatx = getmatx)

}


## This is a function to find the inverse from cache or calculation 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatx()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- matx(data, ...)
        x$setmatx(m)
        m
}
