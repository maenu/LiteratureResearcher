instance creation
controller: aController repository: aRelativePath cermine: aCermine
	^ (self controller: aController repository: aRelativePath)
		cermine: aCermine;
		yourself