as yet unclassified
gtInspectorActionRequestImportPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Import PDF';
		position: 2;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | graph announcer announce: (LiReRequestImportPdf article: self) ]