inspector extensions
gtInspectorActionRequestLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link & open PDF';
		position: 6;
		enabledCondition: [ self bibtex hasField: #pdf ];
		action: [ :p | 
			self graph announcer
				announce:
					((LiReRequestPdfLink article: self)
						then: [ self graph announcer announce: (LiReRequestPdfOpen article: self) ];
						yourself) ]