converting
asSourceLink
	| sourceLink |
	self invalidateLink.
	sourceLink := self link copy.
	sourceLink color: self source asColor.
	^ sourceLink