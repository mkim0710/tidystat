# function.tensor_product.dev.r

# https://www.r-bloggers.com/tensor-algebra-efficient-operations-on-multidimensional-arrays-with-r/ ====  
# https://cran.r-project.org/web/packages/tensorA/tensorA.pdf =====  

set.seed(42)
A <- matrix(rnorm(4), 2, 2)
B <- matrix(rnorm(4), 2, 2)
C <- matrix(0, 2, 2)
A
B
C
# > A <- matrix(rnorm(4), 2, 2)
# > B <- matrix(rnorm(4), 2, 2)
# > C <- matrix(0, 2, 2)
# > A
#            [,1]     [,2]
# [1,]  2.0184237 1.304870
# [2,] -0.0627141 2.286645
# > B
#            [,1]       [,2]
# [1,] -1.3888607 -0.1333213
# [2,] -0.2787888  0.6359504
# > C
#      [,1] [,2]
# [1,]    0    0
# [2,]    0    0

for(i in 1:2) {
    for(j in 1:2) {
        for(k in 1:2) {
            C[i,j] = C[i,j] + A[i, k] * B[k,j]
        }
    }
}
C
# > C
#            [,1]      [,2]
# [1,] -3.1670924 0.5607334
# [2,] -0.5503899 1.4625542


A %*% B
# > A %*% B
#            [,1]      [,2]
# [1,] -3.1670924 0.5607334
# [2,] -0.5503899 1.4625542


library("tensorA")
set.seed(42)
At <- to.tensor(rnorm(4), c(i=2, k=2))
Bt <- to.tensor(rnorm(4), c(k=2, j=2))
At %e% Bt
# > At %e% Bt
#       j
# i            [,1]       [,2]
#   [1,]  0.5156982  2.0378605
#   [2,] -0.2954518 -0.9134599
# attr(,"class")
# [1] "tensor" "matrix"





# https://cran.r-project.org/web/packages/tensor/tensor.pdf =====  

"tensor" <- function(A, B, alongA = integer(0), alongB = integer(0))
    {
        A <- as.array(A)
        dimA <- dim(A)
        dnA <- dimnames(A)
        if (nnA <- is.null(dnA))
            dnA <- rep(list(NULL), length(dimA))
        
        B <- as.array(B)
        dimB <- dim(B)
        dnB <- dimnames(B)
        if (nnB <- is.null(dnB))
            dnB <- rep(list(NULL), length(dimB))
        
        if (length(alongA) != length(alongB))
            stop("\"along\" vectors must be same length")
        
        # special case of both length zero
        
        if (length(alongA) == 0) {
            R <- as.vector(A) %*% t(as.vector(B))
            dim(R) <- c(dimA, dimB)
            if (!(nnA && nnB))
                dimnames(R) <- c(dnA, dnB)
            return(R)
        }
        
        mtch <- dimA[alongA] == dimB[alongB]
        if (any(is.na(mtch)) || !all(mtch))
            stop("Mismatch in \"along\" dimensions")
        
        seqA <- seq(along=dimA)
        allA <- length(seqA) == length(alongA)
        permA <- c(seqA[-alongA], alongA)
        if (!all(seqA == permA))
            A <- aperm(A, permA)
        dim(A) <- c(
            if (allA) 1 else prod(dimA[-alongA]),
            prod(dimA[alongA])
        )
        
        seqB <- seq(along=dimB)
        allB <- length(seqB) == length(alongB)
        permB <- c(alongB, seqB[-alongB])
        if (!all(seqB == permB))
            B <- aperm(B, permB)
        dim(B) <- c(
            prod(dimB[alongB]),
            if (allB) 1 else prod(dimB[-alongB])
        )
        
        R <- A %*% B
        
        if (allA && allB)
            R <- drop(R)
        else {
            dim(R) <- c(
                if (allA) integer(0) else dimA[-alongA],
                if (allB) integer(0) else dimB[-alongB]
            )
            if (!(nnA && nnB))
                dimnames(R) <- c(dnA[-alongA], dnB[-alongB])
        }
        R
    }

"%*t%" <- function(x, y) tensor(x, y, 2, 2)

"%t*%" <- function(x, y) tensor(x, y, 1, 1)

"%t*t%" <- function(x, y) tensor(x, y, 1, 2)



# Usage
# tensor(A, B, alongA = integer(0), alongB = integer(0))
# 
# Arguments
# A, B	
# Numerical vectors, matrices or arrays
# alongA	
# Extents in A to be collapsed
# alongB	
# Extents in B to be collapsed


# Shortcuts
# 
# Some special cases of tensor may be independently useful, and these have got shortcuts as follows.
# 
# %*t%	 Matrix product A %*% t(B)
# %t*%	 Matrix product t(A) %*% B
# %t*t%	 Matrix product t(A) %*% t(B)

A <- matrix(1:6, 2, 3)
dimnames(A) <- list(happy = LETTERS[1:2], sad = NULL)
B <- matrix(1:12, 4, 3)
A
B
# > A
#      sad
# happy [,1] [,2] [,3]
#     A    1    3    5
#     B    2    4    6
# > B
#      [,1] [,2] [,3]
# [1,]    1    5    9
# [2,]    2    6   10
# [3,]    3    7   11
# [4,]    4    8   12

A %*% t(B)
# > A %*% t(B)
#      
# happy [,1] [,2] [,3] [,4]
#     A   61   70   79   88
#     B   76   88  100  112
tensor(A, B, 2, 2)
# > tensor(A, B, 2, 2)
#      
# happy [,1] [,2] [,3] [,4]
#     A   61   70   79   88
#     B   76   88  100  112
tensor(A, B)
# > tensor(A, B)
# , , 1, 1
# 
#      sad
# happy [,1] [,2] [,3]
#     A    1    3    5
#     B    2    4    6
# 
# , , 2, 1
# 
#      sad
# happy [,1] [,2] [,3]
#     A    2    6   10
#     B    4    8   12
# 
# , , 3, 1
# 
#      sad
# happy [,1] [,2] [,3]
#     A    3    9   15
#     B    6   12   18
# 
# , , 4, 1
# 
#      sad
# happy [,1] [,2] [,3]
#     A    4   12   20
#     B    8   16   24
# 
# , , 1, 2
# 
#      sad
# happy [,1] [,2] [,3]
#     A    5   15   25
#     B   10   20   30
# 
# , , 2, 2
# 
#      sad
# happy [,1] [,2] [,3]
#     A    6   18   30
#     B   12   24   36
# 
# , , 3, 2
# 
#      sad
# happy [,1] [,2] [,3]
#     A    7   21   35
#     B   14   28   42
# 
# , , 4, 2
# 
#      sad
# happy [,1] [,2] [,3]
#     A    8   24   40
#     B   16   32   48
# 
# , , 1, 3
# 
#      sad
# happy [,1] [,2] [,3]
#     A    9   27   45
#     B   18   36   54
# 
# , , 2, 3
# 
#      sad
# happy [,1] [,2] [,3]
#     A   10   30   50
#     B   20   40   60
# 
# , , 3, 3
# 
#      sad
# happy [,1] [,2] [,3]
#     A   11   33   55
#     B   22   44   66
# 
# , , 4, 3
# 
#      sad
# happy [,1] [,2] [,3]
#     A   12   36   60
#     B   24   48   72
stopifnot(A %*% t(B) == tensor(A, B, 2, 2))




A <- A %o% A
C <- tensor(A, B, 2, 2)
A
C
dim(C)
# > dim(C)
# [1] 2 2 3 4

stopifnot(all(dim(C) == c(2, 2, 3, 4)))

D <- tensor(C, B, c(4, 3), c(1, 2))
D
dim(D)
# > D
#      happy
# happy     A     B
#     A 22606 28552
#     B 28552 36064
# > dim(D)
# [1] 2 2
stopifnot(all(dim(D) == c(2, 2)))


E <- matrix(9:12, 2, 2)
s <- tensor(D, E, 1:2, 1:2)
E
s
sum(D * E)
# > E
#      [,1] [,2]
# [1,]    9   11
# [2,]   10   12
# > s
# [1] 1235814
# > sum(D * E)
# [1] 1235814
dim(s)
# > dim(s)
# NULL


  
  
# __________|------  
# ⸿ END-----  
