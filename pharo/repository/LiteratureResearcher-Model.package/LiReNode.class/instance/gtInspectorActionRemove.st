inspector extensions
gtInspectorActionRemove
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Remove';
		position: 2;
		action: [ :p | 
			self graph edges removeAll: self incomingEdges , self outgoingEdges.
			self graph nodes remove: self ]