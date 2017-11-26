inspector extensions
gtInspectorPresentationLabels: aComposite
	<gtInspectorPresentationOrder: 2>
	aComposite spec
		title: [ 'Labels' ];
		display: [ LiReSpecLabels new
				labels: labels;
				buildWithSpec;
				yourself ]