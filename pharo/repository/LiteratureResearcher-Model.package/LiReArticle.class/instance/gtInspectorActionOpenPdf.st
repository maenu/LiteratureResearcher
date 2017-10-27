as yet unclassified
gtInspectorActionOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :p | p selection: (self runThenDo: [ :r | r returnValue ] onErrorDo: [ :r | r ]) ];
		title: 'Evaluate and inspect return-value'