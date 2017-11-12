accessing
invalidate
	| number page |
	Halt now.
	number := (start / size) asInteger.
	stream position: start.
	page := OrderedCollection new.
	[ stream atEnd not and: [ stream position < (start + size) ] ] whileTrue: [ page add: stream next ].
	listModel items: page.
	backModel enabled: start > 0.
	numberModel label: (start + 1) asString , ' to ' , (start + page size) asString.
	forwardModel enabled: stream atEnd not