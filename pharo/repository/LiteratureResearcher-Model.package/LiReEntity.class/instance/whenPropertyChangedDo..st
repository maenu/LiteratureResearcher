announcements
whenPropertyChangedDo: aBlock
	^ announcer when: LiRePropertyChanged do: [ :a | aBlock cull: a ]