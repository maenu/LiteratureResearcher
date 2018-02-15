inspector extensions
gtInspectorActionRequestOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Open PDF';
		position: 4;
		enabledCondition: [ self bibtex hasField: #pdf ];
		action: [ :p | self graph announcer announce: (LiReRequestPdfOpen article: self) ]