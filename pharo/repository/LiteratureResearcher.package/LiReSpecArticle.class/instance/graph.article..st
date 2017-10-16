accessing
graph: aGraph article: anArticle
	graph := aGraph.
	article := anArticle.
	bibtex
		text:
			(LiReBibBibRenderer new
				render: article bibtex;
				contents).
	authors list items: (graph edges select: [ :edge | edge class = LiReHasWritten and: [ edge target = article ] ]).
	references list items: (graph edges select: [ :edge | edge class = LiReReferences and: [ edge source = article ] ])