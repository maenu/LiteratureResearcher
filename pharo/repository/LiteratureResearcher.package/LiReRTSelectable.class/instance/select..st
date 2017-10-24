actions
select: anElement
	| subscription |
	subscription := anElement view announcer
		when: TRMouseClick
		do: [ anElement view announcer removeSubscription: subscription.
			self unselectAllIn: anElement view ].
	self unselectAllIn: anElement view.
	anElement attributeAt: #selected put: true.
	anElement attributeAt: #originalColor ifAbsentPut: anElement trachelShape color.
	anElement trachelShape allColor: color