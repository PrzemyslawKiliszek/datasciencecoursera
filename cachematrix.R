	## The functions below cache the inverse if a matrix. It is assumed that the matrix supplied is always invertible.


	## The makeCacheMatrix function will be used to create a "matrix" object to cache the inverse.

makeCacheMatrix <- function(x = matrix()) {

# setting the value of the matrix
		a<- NULL
		set.matrix<- function(y) {
			x<<- y
			a<<- NULL
		}
# getting the value of the matrix
		get.matrix<-function() x

# setting and getting the inverse of the matrix
		set.inverse.matrix<- function(inverse)	a<<-inverse 
		get.inverse.matrix<- function() a
		list(set.matrix=set.matrix, get.matrix=get.matrix,
			set.inverse.matrix=set.inverse.matrix,
			get.inverse.matrix=get.inverse.matrix)

}


	##The cacheSolve function will compute the inverse of the "matrix" created by makeCacheMatrix function. If the inverse has already been calculated, then the cacheSolve function should load cached data.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# loading the inverse of the matrix
		a<-x$get.inverse.matrix()

#checking if there is already the inverse of the matrix; if yes, gives cached data
 		if(!is.null(a)){
			message("getting cached data")
			return(a)
		}

# if not, getting and setting the inverse of the matrix
		data<- x$get.matrix()
		a<- solve(data, ...)
		x$set.inverse.matrix(a)
		return(a)

}
