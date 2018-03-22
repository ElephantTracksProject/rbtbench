# The Red-Black Tree Memory Benchmark

The red-black tree memory benchmark is a very simple mini-benchmark for 
benchmarking memory in functional programming languages. It performs 
four simple tasks:

  * creates an Okasaki-style immutable red-black tree;
  * add one million positive integers (integers 1 to 1,000,000 by default) to the 
    red-black tree;
  * computes the height of the tree;
  * in-order traverses the tree and prints the resulting list.
  
Currently, the RBT benchmark has been implemented in Scala, Standard ML, OCaml and 
Haskell, benchmarking the JVM, MLton, OCaml and GHC runtime systems respectively. I 
think a Rust implementation

## Building
For Haskell, use `stack` or `cabal`. For other languages, simply type `make`. The build 
dependencies are:
  
  * `scalac` for Scala;
  * MLton for SML [the code compiles under SML/NJ, but the performance would not be competitive];
  * OCaml (from INRIA) and Core (from Jane Street), including `ocamlbuild`, for OCaml.

## License
All code is placed in the public domain.

## References

  * Chris Okasaki. 1999. Purely Functional Data Structures. Cambridge University Press, New York, NY, USA.
