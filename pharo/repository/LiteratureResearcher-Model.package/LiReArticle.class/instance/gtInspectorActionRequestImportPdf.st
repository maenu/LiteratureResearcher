as yet unclassified
gtInspectorActionRequestImportPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		enabledCondition: [ bibtex hasField: #pdf ];
		title: 'Import PDF';
		action: [ :p | announcer announce: (LiReRequestImportPdf article: self) ]