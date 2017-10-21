converting
asMetadataWidget
	<liReWidget: 2>
	| model |
	model := (GlamourPresentationModel new presentationClass: GTInspector startOn: metadata)
		title: 'Metadata';
		yourself.
	self
		whenPropertyChangedDo: [ model
				presentation: nil;
				presentationClass: GTInspector startOn: metadata;
				buildWithSpec ].
	^ model