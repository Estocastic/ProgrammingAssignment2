## Las primera función crea el objeto de interés (matriz en este caso) con capacidad de guardar la matriz original y la inversa de la misma,
## luego - en la otra función - se comprueba si a la matriz se le ha calculado la inversa y de ser así la imprime, de lo contrario, la calcula y la guarda 
# en la primera función.

## Esta función crea un objeto (matriz) que tiene la capacidad de
## guardar la matriz dada y también su inversa

makeCacheMatrix <- function(x = matrix()) {
 
  inversa <- NULL
  set <- function(y) {
    x <<- y
    inversa <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inversa <<- inverse
  getInverse <- function() inversa
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## La siguiente función recibe la matriz de interés, revisando si ya está guardada la inversa en la anterior función para devolverla,
## de lo contrario, la calcula y la imprime.

cacheSolve <- function(x, ...) {

        inversa <- x$getInverse()
        if (!is.null(inversa)) {
                message("Obtener datos en cache")
                return(inv)
        }
        mat <- x$get()
        inversa <- solve(mat, ...)
        x$setInverse(inversa)
        inversa
        
}
#Ejemplo

m <- matrix(c(1,2,3,4), nrow=2)  # Matriz de interés
mym <- makeCacheMatrix(m) # G
mym$get()
mym$getInverse() # Aún no ha sido calculada

cacheSolve(mym) # La calcula y la muestra

mym$getInverse() # queda guardada en cache.
