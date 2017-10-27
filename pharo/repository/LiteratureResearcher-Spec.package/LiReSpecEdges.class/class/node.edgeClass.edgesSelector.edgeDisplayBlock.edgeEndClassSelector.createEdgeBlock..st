as yet unclassified
node: aNode edgeClass: aClass edgesSelector: aSymbol edgeDisplayBlock: aBlock edgeEndClassSelector: anotherSymbol createEdgeBlock: anotherBlock
	^ self basicNew
		node: aNode;
		edgesSelector: aSymbol;
		edgeClass: aClass;
		edgeDisplayBlock: aBlock;
		edgeEndClassSelector: anotherSymbol;
		createEdgeBlock: anotherBlock;
		initialize;
		yourself