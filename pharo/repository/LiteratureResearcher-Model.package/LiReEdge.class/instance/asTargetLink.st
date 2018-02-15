converting
asTargetLink
	| targetLink |
	self invalidateLink.
	targetLink := self link copy.
	targetLink color: self target asColor.
	^ targetLink