MLTON = mlton

.PHONY: all alloc time clean

all:
	$(MLTON) -codegen native -output bench bench.mlb

profalloc:
	$(MLTON) -codegen native -profile alloc -output bench bench.mlb

proftime:
	$(MLTON) -codegen native -profile time -output bench bench.mlb

clean:
	rm -f bench *out
