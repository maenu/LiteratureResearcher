instance creation
graph: aGraph string: aString
	^ (super graph: aGraph string: aString)
		bibtex:
			(LiReBibParser
				parse: '@inproceedings{GENERATED,title={' , aString , '}}')
				entries first;
		yourself