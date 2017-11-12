```
> source("cachematrix.r")
> matrix(1:9, nrow=3, ncol=3) ## a test
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
> new_matrix <- makeCacheMatrix(matrix(1:9, nrow=3, ncol=3))
> new_matrix$get()
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
> new_matrix$getInverse()
NULL
> cacheSolve(new_matrix)
 Show Traceback

 Rerun with Debug
 Error in solve.default(data, ...) :
  Lapack routine dgesv: system is exactly singular: U[3,3] = 0
```

This is because my chosen matrix is not invertible.
Some reading about invertible matrices:
- http://www.sosmath.com/matrix/matinv/matinv.html
- http://www.sosmath.com/matrix/coding/coding.html
- https://stackoverflow.com/questions/10826816/fast-method-to-check-if-a-matrix-is-singular-non-invertible-det-0

```
> matrix(1:4, nrow=2, ncol=2)
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> new_matrix <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2))
> my_matrix$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> new_matrix$getInverse()
NULL
> cacheSolve(new_matrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(new_matrix)
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> new_matrix$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> new_matrix$getInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> new_matrix$set(matrix(c(1, 1, 1, 2), nrow=2, ncol=2)) ## set different matrix
> new_matrix$get()
     [,1] [,2]
[1,]    1    1
[2,]    1    2
> new_matrix$getInverse()
NULL
> cacheSolve(new_matrix)
     [,1] [,2]
[1,]    2   -1
[2,]   -1    1
> new_matrix$getInverse()
     [,1] [,2]
[1,]    2   -1
[2,]   -1    1
> cacheSolve(new_matrix)
getting cached data
     [,1] [,2]
[1,]    2   -1
[2,]   -1    1
```
