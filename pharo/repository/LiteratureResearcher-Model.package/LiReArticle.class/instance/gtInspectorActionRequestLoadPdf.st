as yet unclassified
gtInspectorActionRequestLoadPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load PDF';
		position: 1;
		action: [ :p | announcer announce: (LiReRequestLoadPdf article: self) ]