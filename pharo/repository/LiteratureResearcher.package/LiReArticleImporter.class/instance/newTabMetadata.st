initialization
newTabMetadata
	^ self newTab
		model: (GlamourPresentationModel new presentationClass: GTInspector startOn: metadata document);
		label: 'Metadata';
		closeable: false;
		yourself