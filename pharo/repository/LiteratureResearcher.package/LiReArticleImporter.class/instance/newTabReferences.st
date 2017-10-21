initialization
newTabReferences
	| model |
	model := DynamicComposableModel new.
	model
		instantiateModels: #(articleModel DynamicComposableModel generatedArticleModel DynamicComposableModel).
	model assign: article asDetailsWidget to: #articleModel.
	model assign: generatedArticle asDetailsWidget to: #generatedArticleModel.
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #articleModel;
						add: #generatedArticleModel ];
				yourself).
	^ self newTab
		model: model;
		label: 'References';
		closeable: false;
		yourself