example
example
	| repository pdfscrap cermine pdfOpen action article |
	'../test/Osma16a.pdf' asFileReference copyTo: '../test/tmp/Osma16a.pdf' asFileReference.
	repository := '../test/repository' asFileReference.
	pdfscrap := LiRePdfscrap subprocess: (LiReSubprocess command: '../pdfscrap.sh').
	cermine := LiReCermine subprocess: (LiReSubprocess command: '../cermine.sh').
	pdfOpen := LiRePdfOpen subprocess: (LiReSubprocess command: '../pdf-open.sh').
	action := self
		repository: repository
		pdfscrap: pdfscrap
		cermine: cermine
		pdfOpen: pdfOpen.
	article := LiReArticle
		graph: LiReGraph new
		bibtex: (LiReBibParser parse: (Character lf asString join: {'@inproceedings{GENERATED,' . '  pdf={../test/tmp/Osma16a.pdf}' . '}'})) entries first.
	action executeIn: article