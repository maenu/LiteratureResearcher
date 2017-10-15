baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'XPath'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XPath/main' ];
				configuration: 'NeoJson'
					with: [ spec
						versionString: #stable;
						repository: 'http://mc.stfx.eu/Neo' ];
				configuration: 'OSProcess'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				configuration: 'Citezen'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ].
			spec group: 'default' with: #('XPath' 'NeoJson' 'OSProcess' 'Citezen') ]