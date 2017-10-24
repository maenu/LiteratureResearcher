example
example
	| target cermine graph article action |
	target := '../test/tmp/Osma16a.pdf' asFileReference.
	target ensureDelete.
	'../test/Osma16a.pdf' asFileReference copyTo: target.
	cermine := LiReCermine subprocess: (LiReSubprocess command: '../cermine.sh').
	action := self cermine: cermine.
	graph := LiReGraph new.
	article := LiReArticle graph: graph bibtex: (LiReBibParser parse: (Character lf asString join: {'@inproceedings{GENERATED,' . '  pdf={../test/tmp/Osma16a.pdf}' . '}'})) entries first metadata: nil.
	graph nodes add: article.
	action executeIn: article.
	^ graph