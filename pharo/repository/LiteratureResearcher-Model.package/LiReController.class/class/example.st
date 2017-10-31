example
example
	| article graph controller server |
	graph := LiReGraph new.
	article := LiReArticle
		graph: graph
		bibtex:
			(LiReBibParser
				parse:
					'@inproceedings{osman2016tracking,
  title={Tracking null checks in open-source Java systems},
  author={Osman, Haidar and Leuenberger, Manuel and Lungu, Mircea and Nierstrasz, Oscar},
  booktitle={Software Analysis, Evolution, and Reengineering (SANER), 2016 IEEE 23rd International Conference on},
  volume={1},
  pages={304--313},
  year={2016},
  organization={IEEE}
}') entries first
		document: nil.
	controller := LiReController graph: graph.
	graph nodes add: article.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller