initialization
initializePresenter
	authors search search: [ :text | graph nodes select: [ :node | node class = LiReAuthor and: [ node name asLowercase includesSubstring: text asLowercase ] ] ].
	references search search: [ :text | graph nodes select: [ :node | node class = LiReArticle and: [ (node bibtex at: #title) value asLowercase includesSubstring: text asLowercase ] ] ]