as yet unclassified
gtInspectorActionRemove
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Remove';
		position: 1;
		action: [ :p | 
			graph edges removeAll: self incomingEdges , self outgoingEdges.
			graph nodes remove: self ]