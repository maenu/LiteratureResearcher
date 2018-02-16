*LiteratureResearcher-Model
announce: anAnnouncement wait: aDuration
	| lock result timeout |
	self flag: 'TODO should not override then and finally'.
	lock := Semaphore new.
	result := {}.
	timeout := [ aDuration asDelay wait.
	lock isSignaled
		ifFalse: [ lock signal ] ] fork.
	[ self
		announce:
			(anAnnouncement
				then: [ :e | result := e ];
				finally: [ lock signal ];
				yourself) ]
		ifCurtailed: [ lock isSignaled
				ifFalse: [ lock signal ] ].
	lock wait.
	timeout terminate.
	^ result