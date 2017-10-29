as yet unclassified
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link PDF';
		position: 3;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | announcer announce: (LiReRequestLinkPdf article: self) ]