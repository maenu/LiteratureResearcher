converting
sourceLink
	| sourceLink |
	self invalidateLink.
	sourceLink := link copy.
	sourceLink color: source asColor.
	^ sourceLink