as yet unclassified
gtInspectorActionRequestOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #pdf ];
		title: 'Open PDF';
		action: [ :p | announcer announce: (LiReRequestOpenPdf article: self) ]