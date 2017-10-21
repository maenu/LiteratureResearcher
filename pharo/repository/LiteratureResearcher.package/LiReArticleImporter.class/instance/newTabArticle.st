initialization
newTabArticle
	| model |
	model := DynamicComposableModel new.
	model
		instantiateModels:
			#(articleLabel LabelModel articleModel DynamicComposableModel copyButton ButtonModel generatedArticleLabel LabelModel generatedArticleModel DynamicComposableModel);
		assign: article asDetailsWidget to: #articleModel;
		assign: generatedArticle asDetailsWidget to: #generatedArticleModel;
		layout:
			(SpecLayout composed
				newRow: [ :r | 
					r
						newColumn: [ :c | 
							c
								add: #articleLabel height: self class toolbarHeight;
								add: #articleModel ];
						newColumn: [ :c | c add: #copyButton ];
						newColumn: [ :c | 
							c
								add: #generatedArticleLabel height: self class toolbarHeight;
								add: #generatedArticleModel ] ];
				yourself).
	model articleLabel label: 'Article to save'.
	model generatedArticleLabel label: 'Generated article'.
	model copyButton
		label: 'Copy fields';
		icon: (Smalltalk ui icons iconNamed: #back);
		action: [ generatedArticle bibtex
				do: [ :f | 
					article bibtex at: f key put: f rawValue.
					article propertyChanged: #bibtex ] ].
	^ self newTab
		model: model;
		label: 'Article';
		closeable: false;
		yourself