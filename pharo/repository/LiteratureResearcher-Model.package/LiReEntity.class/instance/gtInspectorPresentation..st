as yet unclassified
gtInspectorPresentation: aComposite
	<gtInspectorPresentationOrder: 1>
	aComposite spec
		title: [ self label ];
		display: [ self asWidget
				buildWithSpec;
				yourself ]