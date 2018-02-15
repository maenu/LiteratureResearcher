inspector extensions
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link PDF';
		position: 3;
		enabledCondition: [ self bibtex hasField: #pdf ];
		action: [ :p | self graph announcer announce: (LiReRequestPdfLink article: self) ]