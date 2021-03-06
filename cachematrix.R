source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
makeCacheMatrix <- function(x = matrix())
{
  s <- NULL
  set <- function(y)
  {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}



cacheSolve <- function(x, ...)
{
  s <- x$getsolve()
  if(!is.null(s))
  {
    message("getting cached inverse matrix")
    return(s)
  }
  s <- solve(x$get())
  x$setsolve(s)
  return(s)
}