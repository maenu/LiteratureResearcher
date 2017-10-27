as yet unclassified
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #pdf ];
		title: 'Open PDF';
		action: [ :p | announcer announce: (LiReRequestLinkPdf presentation: p article: self) ]