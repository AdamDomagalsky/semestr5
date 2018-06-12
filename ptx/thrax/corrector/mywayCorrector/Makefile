build: corrector.far test

corrector.far: corrector.grm ./vocab1.txt ./vocab2.txt ./vocab3.txt
	thraxcompiler --input_grammar=$< --output_far=$@

test: 
	thraxrewrite-tester --far=corrector.far --rules=spelling
