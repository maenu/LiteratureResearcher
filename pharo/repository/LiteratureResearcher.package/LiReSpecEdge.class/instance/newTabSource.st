instance creation
newTabSource
	^ self newTab
		model: entity source asWidget;
		icon: (Smalltalk ui icons iconNamed: #back);
		label: 'Source';
		closeable: false;
		yourself