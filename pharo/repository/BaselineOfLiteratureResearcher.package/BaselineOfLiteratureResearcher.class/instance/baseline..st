baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'XPath'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'NeoJSON'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'NeoCSV'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'OSProcess'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'Citezen'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'Roassal2'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'PharoUriScheme'
					with: [ spec
						versionString: '0.1.0-pre';
						repository: 'github://maenu/PharoUriScheme:master/pharo/repository' ];
				package: 'LiteratureResearcher-Actions';
				package: 'LiteratureResearcher-Announcements';
				package: 'LiteratureResearcher-ExternalTools';
				package: 'LiteratureResearcher-ExternalTools-Tests';
				package: 'LiteratureResearcher-Model';
				package: 'LiteratureResearcher-UI';
				group: 'default'
					with:
					#('XPath' 'NeoJSON' 'NeoCSV' 'OSProcess' 'Citezen' 'Roassal2' 'PharoUriScheme' 'LiteratureResearcher-Actions' 'LiteratureResearcher-Announcements' 'LiteratureResearcher-ExternalTools' 'LiteratureResearcher-ExternalTools-Tests' 'LiteratureResearcher-Model' 'LiteratureResearcher-UI');
				postLoadDoIt: #postLoadActions ]