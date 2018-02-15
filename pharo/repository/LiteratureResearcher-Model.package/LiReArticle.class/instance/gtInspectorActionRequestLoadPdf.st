inspector extensions
gtInspectorActionRequestLoadPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load PDF';
		position: 1;
		action: [ :p | self graph announcer announce: (LiReRequestPdfLoad article: self) ]