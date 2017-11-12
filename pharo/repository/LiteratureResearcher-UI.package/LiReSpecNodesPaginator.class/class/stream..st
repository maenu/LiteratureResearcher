accessing
stream: aStream
	^ (super stream: aStream)
		menuModelBlock: [ nil ];
		yourself