example
example
	| repository graph article action |
	repository := '../test/repository' asFileReference.
	action := self repository: repository pdfscrap: nil scholarPy: nil.
	graph := LiReGraph new.
	article := LiReArticle
		graph: graph
		bibtex: (LiReBibParser parse: (Character lf asString join: {'@inproceedings{GENERATED,' . '  abstract={alsj dflasj flajsfdl}' . '}'})) entries first
		metadata: nil.
	graph nodes add: article.
	action executeIn: article.
	^ graph