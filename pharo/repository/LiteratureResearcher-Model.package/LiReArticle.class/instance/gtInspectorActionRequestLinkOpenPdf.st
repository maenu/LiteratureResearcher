as yet unclassified
gtInspectorActionRequestLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link & open PDF';
		position: 6;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | 
			graph announcer
				announce:
					((LiReRequestLinkPdf article: self)
						then: [ graph announcer announce: (LiReRequestOpenPdf article: self) ];
						yourself) ]