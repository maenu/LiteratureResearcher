parsing
parseKeyCount: aString
	^ (aString asOrderedCollection reverse collectWithIndex: [ :c :i | (c asInteger - $a asInteger + 1) * (26 ** (i - 1)) ]) sum