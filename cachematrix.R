## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The code almost parallel to function MakeVector()
# I find that given matrix a, function solve(a) return
# its inverse matrix. 
makeCacheMatrix <- function(x = matrix()) {
        im <- NULL
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setim <- function(solve) im <<- solve
        getim <- function() im
        list(set = set,
             get = get,
             setim = setim,
             getim = getim)
}

# Again, the code is almost identifical to cachemean()
# Use solve to replace original mean.
# Use setim and getim defined in makeCacheMatrix
# to replace setmean and getmean
cacheSolve <- function(x, ...) {
         
        im <- x$getim()
        if (!is.null(im)) {
                message("getting cached data")
                return(im)
        }
        m <- x$get()
        im <- solve(m, ...)
        x$setim(im)
        im
}
