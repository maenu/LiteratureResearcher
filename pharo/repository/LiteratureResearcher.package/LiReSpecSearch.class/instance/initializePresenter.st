initialization
initializePresenter
	searchBar buttonSearch
		action: [ results
				items:
					((search value: searchBar text text)
						collect: [ :item | 
							| result |
							result := LiReSpecSearchResult result: item.
							result buttonCreate action: [ resultCreate value: item ].
							result ]) ].
	results displayBlock: [ :model | model buildWithSpec ]