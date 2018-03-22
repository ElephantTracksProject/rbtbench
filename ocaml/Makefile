.PHONY: all clean

all:
	ocamlbuild -use-ocamlfind -pkg core -tag thread bench.native
	@cp _build/bench.native bench

clean:
	ocamlbuild -clean
	rm -f bench spacetime*
