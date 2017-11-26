converting
asTargetLink
	| targetLink |
	self invalidateLink.
	targetLink := link copy.
	targetLink color: target asColor.
	^ targetLink