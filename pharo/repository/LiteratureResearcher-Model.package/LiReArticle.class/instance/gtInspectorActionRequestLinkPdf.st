as yet unclassified
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #pdf ];
		title: 'Open PDF';
		action: [ :p | announcer announce: (LiReRequestLinkPdf article: self) ]