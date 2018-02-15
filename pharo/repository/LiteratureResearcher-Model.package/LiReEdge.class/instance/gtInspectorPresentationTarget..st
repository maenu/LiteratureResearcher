inspector extensions
gtInspectorPresentationTarget: aComposite
	<gtInspectorPresentationOrder: 3>
	aComposite spec
		title: [ 'Target' ];
		display: [ self target asWidget
				buildWithSpec;
				yourself ]