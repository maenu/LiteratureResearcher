converting
asColor
	^ (labels ifEmpty: [ LiReLabel default ] ifNotEmpty: [ :c | c first ]) asColor