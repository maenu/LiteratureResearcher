key generation
renderKeyCount: anInteger
	| remainder characters |
	remainder := anInteger.
	characters := OrderedCollection new.
	[ characters add: (remainder % 26 + $a asInteger - 1) asCharacter.
	remainder := (remainder / 26) asInteger ] doWhileTrue: [ remainder >= 1 ].
	^ '' join: characters reverse