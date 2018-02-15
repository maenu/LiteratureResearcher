instance creation
newArticleWith: aMetadata
	^ LiReArticle
		graph: nil
		bibtex:
			((CZEntry type: CZEntry article)
				key: #GENERATED;
				at: #title put: aMetadata title;
				at: #author put: (',' join: (aMetadata authors collect: [ :a | a at: #stringName ]));
				at: #keywords put: (',' join: aMetadata keywords);
				at: #abstract put: aMetadata abstract;
				yourself)