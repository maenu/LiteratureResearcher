as yet unclassified
gtInspectorActionRequestLoadImportLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load, import, link & open PDF';
		position: 5;
		action: [ :p | announcer announce: (LiReRequestLoadImportLinkOpenPdf article: self) ]