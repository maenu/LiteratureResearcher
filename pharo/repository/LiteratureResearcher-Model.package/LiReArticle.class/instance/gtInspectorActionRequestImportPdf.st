inspector extensions
gtInspectorActionRequestImportPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Import PDF';
		position: 4;
		enabledCondition: [ self bibtex hasField: #pdf ];
		action: [ :p | self graph announcer announce: (LiReRequestPdfImport article: self) ]