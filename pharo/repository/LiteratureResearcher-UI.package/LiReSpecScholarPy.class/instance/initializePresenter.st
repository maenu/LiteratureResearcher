initialization
initializePresenter
	buttonModel
		disable;
		action: [ buttonModel
				label: 'Searching...';
				disable.
			[ [ paginatorModel stream: (searchBlock cull: textModel pendingText) ]
				ensure: [ buttonModel
						label: 'Search';
						enable ] ] fork ].
	textModel whenTextChanged: [ :t | buttonModel enabled: t asString trimmed isEmpty not ]