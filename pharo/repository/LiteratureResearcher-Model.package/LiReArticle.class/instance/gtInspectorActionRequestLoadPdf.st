as yet unclassified
gtInspectorActionRequestLoadPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #url ];
		title: 'Load PDF';
		action: [ :p | announcer announce: (LiReRequestLoadPdf presentation: p article: self) ]