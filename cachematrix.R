## makeCacheMatrix: This function creates a special "matrix" object that can cache
## its inverse.

makeCacheMatrix <- function(x = matrix()) {
        matrix_value <- NULL
        set <- function(y) {
              x <<- y
              matrix_value <<- NULL
        }
        get <- function() x
        set_inverse <- function(solve) matrix_value <<- solve
        get_inverse <- function() matrix_value
        list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}

## cacheSolve: This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cacheSolve should retrieve the inverse from
## the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        matrix_value <- x$get_inverse()
        if(!is.null(matrix_value)) {
                message("getting cached data")
                return(matrix_value)
        }
        data <- x$get()
        matrix_value <- solve(data, ...)
        x$set_inverse(matrix_value)
        matrix_value
}
