accessing
default
	^ Default ifNil: [ self allInstances detect: [ :l | l name = 'default' ] ifNone: [ Default := self name: 'default' color: Color white ] ]