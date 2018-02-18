inspector extensions
gtInspectorActionRequestLoadImportLinkOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Load, import, link & open PDF';
		position: 8;
		action: [ :p | 
			self graph announcer
				announce:
					((LiReRequestPdfLoad article: self)
						then: [ self graph announcer
								announce:
									((LiReRequestPdfImport article: self)
										then: [ self graph announcer
												announce:
													((LiReRequestPdfLink article: self)
														then: [ self graph announcer announce: (LiReRequestPdfOpen article: self) ];
														yourself) ];
										yourself) ];
						yourself) ]