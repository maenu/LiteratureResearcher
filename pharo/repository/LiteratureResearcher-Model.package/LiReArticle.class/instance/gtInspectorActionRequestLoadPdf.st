inspector extensions
gtInspectorActionRequestLoadPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load PDF';
		position: 3;
		action: [ :p | self graph announcer announce: (LiReRequestPdfLoad article: self) ]