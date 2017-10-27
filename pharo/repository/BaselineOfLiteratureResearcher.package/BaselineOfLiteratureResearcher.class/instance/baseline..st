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
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ].
			spec group: 'default' with: #('XPath' 'NeoJSON' 'NeoCSV' 'OSProcess' 'Citezen' 'Roassal2') ]