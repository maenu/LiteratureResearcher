inspector extensions
gtInspectorActionShowHide
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Show/Hide';
		position: 1;
		action: [ :p | self hidden: self hidden not ]