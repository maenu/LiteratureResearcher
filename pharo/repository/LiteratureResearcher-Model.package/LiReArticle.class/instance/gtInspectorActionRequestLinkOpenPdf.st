as yet unclassified
gtInspectorActionRequestLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link & open PDF';
		position: 6;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | 
			announcer
				announce: (LiReRequestLinkPdf article: self);
				announce: (LiReRequestOpenPdf article: self) ]