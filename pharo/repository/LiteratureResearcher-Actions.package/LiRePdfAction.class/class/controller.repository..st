instance creation
controller: aController repository: aRelativePath
	^ (self controller: aController)
		repository: aRelativePath;
		yourself