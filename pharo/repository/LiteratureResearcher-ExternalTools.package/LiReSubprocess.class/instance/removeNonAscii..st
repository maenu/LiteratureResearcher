removing
removeNonAscii: aString
	self flag: 'TODO why does is break on non-ascii?'.
	^ String
		streamContents: [ :stream | 
			aString
				do: [ :char | 
					(char asciiValue <= 31 or: [ char asciiValue >= 127 ])
						ifFalse: [ stream nextPut: char ] ] ]