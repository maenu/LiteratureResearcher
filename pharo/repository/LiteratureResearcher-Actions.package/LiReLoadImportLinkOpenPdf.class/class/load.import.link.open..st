as yet unclassified
load: aLoadPdfAction import: aImportPdfAction link: aLinkPdfAction open: aOpenPdfAction
	^ self new
		load: aLoadPdfAction;
		import: aImportPdfAction;
		link: aLinkPdfAction;
		open: aOpenPdfAction;
		yourself