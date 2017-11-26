inspector extensions
gtInspectorPresentationTarget: aComposite
	<gtInspectorPresentationOrder: 3>
	aComposite spec
		title: [ 'Target' ];
		display: [ target asWidget
				buildWithSpec;
				yourself ]