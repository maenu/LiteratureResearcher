actions
select: anElement
	| view subscription |
	view := anElement view.
	subscription := view announcer
		when: TRMouseClick
		do: [ view announcer removeSubscription: subscription.
			self unselectAllIn: view ].
	self unselectAllIn: anElement view.
	anElement attributeAt: #selected put: true.
	anElement attributeAt: #originalColor ifAbsentPut: anElement trachelShape color.
	anElement trachelShape allColor: color