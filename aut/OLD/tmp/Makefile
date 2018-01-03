
# .far to specjalny format do przechowywania spakowanych transduktorów

TaskX06/run: TaskX06/01neg.far

TaskX06/01neg.far: TaskX06/01neg.grm
	LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib/fst" thraxcompiler --input_grammar=$< --output_far=$@
