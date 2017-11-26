parsing
parseContentStringOrNil: aNode
	^ aNode first ifNotNil: [ :first | first strings first ]