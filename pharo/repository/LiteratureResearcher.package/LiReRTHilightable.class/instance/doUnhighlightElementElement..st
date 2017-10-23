actions
doUnhighlightElementElement: anElement
	self doUnhighlightElementNonRecursive: anElement.
	anElement connectedEdges
		do: [ :e | 
			self doUnhighlightElementNonRecursive: e.
			e from == anElement
				ifTrue: [ self doUnhighlightElementNonRecursive: e to ]
				ifFalse: [ self doUnhighlightElementNonRecursive: e from ] ]