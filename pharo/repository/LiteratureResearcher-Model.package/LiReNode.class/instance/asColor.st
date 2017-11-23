converting
asColor
	^ (labels value ifEmpty: [ LiReLabel default ] ifNotEmpty: [ :c | c first ]) asColor