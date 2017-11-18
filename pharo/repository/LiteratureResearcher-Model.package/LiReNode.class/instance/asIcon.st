converting
asIcon
	^ (labels ifEmpty: [ LiReLabel default ] ifNotEmpty: [ :c | c first ]) asIcon