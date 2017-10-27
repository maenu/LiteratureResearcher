as yet unclassified
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #pdf ];
		title: 'Link PDF';
		action: [ :p | announcer announce: (LiReRequestLinkPdf article: self) ]