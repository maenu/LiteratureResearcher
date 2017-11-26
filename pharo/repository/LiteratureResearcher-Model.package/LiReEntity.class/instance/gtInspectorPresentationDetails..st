inspector extensions
gtInspectorPresentationDetails: aComposite
	<gtInspectorPresentationOrder: 1>
	aComposite spec
		title: [ 'Details' ];
		display: [ self asWidget
				buildWithSpec;
				yourself ]