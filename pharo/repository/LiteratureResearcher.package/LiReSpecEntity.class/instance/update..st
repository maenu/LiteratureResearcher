private
update: anAspect
	super update: anAspect.
	self buildWithSpec.
	self title: entity label