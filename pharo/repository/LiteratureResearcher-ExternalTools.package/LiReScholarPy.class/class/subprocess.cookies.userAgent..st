accessing
subprocess: aSubprocess cookies: aFileReference userAgent: anotherString
	^ self new
		subprocess: aSubprocess;
		cookies: aFileReference;
		userAgent: anotherString;
		yourself