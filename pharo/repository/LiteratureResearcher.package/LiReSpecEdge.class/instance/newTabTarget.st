instance creation
newTabTarget
	^ self newTab
		model: entity target asWidget;
		icon: (Smalltalk ui icons iconNamed: #forward);
		label: 'Target';
		closeable: false;
		yourself