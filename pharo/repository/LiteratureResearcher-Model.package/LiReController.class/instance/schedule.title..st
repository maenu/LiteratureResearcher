scheduling
schedule: aBlock title: aString
	[ [ :j | 
	j title: aString.
	aBlock value ] asJob run ] fork