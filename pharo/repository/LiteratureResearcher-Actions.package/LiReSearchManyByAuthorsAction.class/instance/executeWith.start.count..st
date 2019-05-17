execution
executeWith: aCollection start: anInteger count: anotherInteger
	^ scholarPy findByAuthors: (aCollection collect: #name) start: anInteger count: anotherInteger