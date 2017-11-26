inspector extensions
gtInspectorActionRemove
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Remove';
		position: 1;
		action: [ :p | graph edges remove: self ]