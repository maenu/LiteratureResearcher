accessing
subprocess: aSubprocess cookie: aFileReference userAgent: anotherString
	^ self new
		subprocess: aSubprocess;
		cookie: aFileReference;
		userAgent: anotherString;
		yourself