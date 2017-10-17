initialization
initializePresenter
	searchBar buttonSearch
		action: [ results
				items:
					((search value: searchBar text text)
						collect: [ :n | 
							| result |
							result := LiReSpecSearchResult result: n asCompactWidget.
							result buttonCreate action: [ resultCreate value: n ].
							result ]) ].
	results displayBlock: [ :model | model buildWithSpec ]