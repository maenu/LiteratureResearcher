inspector extensions
gtInspectorActionRequestLoadImportLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load, import, link & open PDF';
		position: 5;
		action: [ :p | 
			graph announcer
				announce:
					((LiReRequestLoadPdf article: self)
						then: [ graph announcer
								announce:
									((LiReRequestImportPdf article: self)
										then: [ graph announcer
												announce:
													((LiReRequestLinkPdf article: self)
														then: [ graph announcer announce: (LiReRequestOpenPdf article: self) ];
														yourself) ];
										yourself) ];
						yourself) ]