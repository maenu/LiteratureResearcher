inspector extensions
gtInspectorPresentationSource: aComposite
	<gtInspectorPresentationOrder: 2>
	aComposite spec
		title: [ 'Source' ];
		display: [ self source asWidget
				buildWithSpec;
				yourself ]