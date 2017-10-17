accessing
node: aNode
	super node: aNode.
	tabNode bibtex
		text:
			(LiReBibBibRenderer new
				render: node bibtex;
				contents)