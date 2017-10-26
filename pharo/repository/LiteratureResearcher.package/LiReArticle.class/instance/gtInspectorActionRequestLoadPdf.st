as yet unclassified
gtInspectorActionRequestLoadPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load PDF';
		action: [ :p | announcer announce: (LiReRequestLoadPdf presentation: p article: self) ]