instance creation
graph: aGraph string: aString
	^ (self graph: aGraph bibtex: (LiReBibParser parse: '@inproceedings{GENERATED,title={' , aString , '}}') entries first) yourself