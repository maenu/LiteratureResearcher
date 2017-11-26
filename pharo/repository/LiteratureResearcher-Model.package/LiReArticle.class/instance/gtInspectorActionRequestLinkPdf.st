inspector extensions
gtInspectorActionRequestLinkPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Link PDF';
		position: 3;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | graph announcer announce: (LiReRequestLinkPdf article: self) ]