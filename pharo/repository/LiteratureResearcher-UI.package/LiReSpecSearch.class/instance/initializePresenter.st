initialization
initializePresenter
	searchButtonModel
		disable;
		action: [ searchButtonModel
				label: 'Searching...';
				disable.
			[ [ paginatorModel stream: (searchBlock cull: searchTextModel text asString) ]
				ensure: [ searchButtonModel
						label: 'Search';
						enable ] ] fork ].
	createButtonModel
		disable;
		action: [ createBlock cull: searchTextModel text asString ].
	searchTextModel
		whenTextChanged: [ :t | 
			| enabled |
			enabled := t asString trimmed isEmpty not.
			searchButtonModel enabled: enabled.
			createButtonModel enabled: enabled ]