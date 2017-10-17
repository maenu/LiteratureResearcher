instance creation
newTabDetails
	^ self newTab
		model: entity asDetailsWidget;
		label: 'Details';
		closeable: false;
		yourself