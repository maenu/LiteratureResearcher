as yet unclassified
node: aNode edgeClass: aClass edgesSelector: aSymbol edgeDisplayBlock: aBlock edgeEndClassSelector: anotherSymbol edgeOtherEndClassSelector: yetAnotherSymbol createEdgeBlock: anotherBlock selectNodeBlock: yetAnotherBlock selectEdgeBlock: yetYetAnotherBlock
	^ self basicNew
		node: aNode;
		edgesSelector: aSymbol;
		edgeClass: aClass;
		edgeDisplayBlock: aBlock;
		edgeEndClassSelector: anotherSymbol;
		edgeOtherEndClassSelector: yetAnotherSymbol;
		createEdgeBlock: anotherBlock;
		selectNodeBlock: yetAnotherBlock;
		selectEdgeBlock: yetYetAnotherBlock;
		initialize;
		yourself