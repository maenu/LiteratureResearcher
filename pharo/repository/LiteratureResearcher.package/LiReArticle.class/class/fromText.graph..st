instance creation
fromText: aString graph: aGraph
	^ (super fromText: aString graph: aGraph) bibtex: (CZBibParser parse: '@inproceedings{GENERATED,title={' , aString , '}') entries first