<resource>
    <schema>uhecr</schema>
    <meta name="title">UHECR</meta>
    <meta name="creationDate">2015-08-12T01:02:03</meta>
    <meta name="description">
        An interactive catalog of Ultra High Energy Cosmic Rays
    </meta>
    <meta name="creation.name">UHECR alliance</meta>
    <meta name="subject">Catalogs</meta>
    <meta name="subject">Ultra High Energy</meta>
    <meta name="subject">Cosmic Rays</meta>
    <meta name="type">Catalog</meta>
    <meta name="coverage">
        <meta name="profile">AllSky ICRS</meta>
    </meta>
    <meta name="source">
        2015ApJ...804...15A
    </meta>

    <table id="main" onDisk="True" mixin="//scs#q3cindex"
        primary="id">

        <index columns="ra,dec"/>
        <index columns="observatory"/>

        <column name="id" type="integer"
            ucd="meta.id;meta.main"
            description="Table object id"/>
        
        <column name="observatory" type="text"
            ucd="instr.obsty"
            description="Observatory that observed the event"/>
        
        <column name="energy" type="real"
            unit="EeV" ucd="em.energy"
            description="Energy"/>
        
        <column name="elevation" type="double precision"
            unit="degree" ucd="pos.az.zd;meta.main"
            description="Elevation angle">
		<values nullLiteral="-999"/>
	</column>
        
        <column name="ra" type="double precision"
            unit="degree" ucd="pos.eq.ra;meta.main"
            description="Right Ascension"/>
        
        <column name="dec" type="double precision"
            unit="degree" ucd="pos.eq.dec;meta.main"
            description="Declination"/>
        
        <column name="lii" type="double precision"
            unit="degrees" ucd="pos.galactic.lon"
            description="Galactic longitude"/>
        
        <column name="bii" type="double precision"
            unit="degrees" ucd="pos.galactic.lat"
            description="Galactic latidude"/>
        
        <column name="epoch_mjd" type="real"
            unit="d" ucd="time.epoch"
            description="Epoch MJD">
		<values nullLiteral="0"/>
	</column>
        
        <column name="epoch_date" type="date"
            unit="y" ucd="time.epoch"
            description="Epoch year">
		<values nullLiteral="1900-01-01"/>
	</column>

    </table>

        <data id="import">
            <sources>data/data.csv</sources>
            <csvGrammar/>
            <make table="main">
                <rowmaker idmaps="*"/>
            </make>
        </data>

        <service id="cone" allowed="scs.xml,form,static">
            <meta name="shortName">uhecr cone</meta>
            <meta name="testQuery">
                <meta name="ra">5.4</meta>
                <meta name="dec">-5.6</meta>
                <meta name="sr">1</meta>
            </meta>

            <dbCore queriedTable="main">
                <FEED source="//scs#coreDescs"/>
                <condDesc>
			<inputKey original="observatory">
				<values fromdb="observatory from uhecr.main order by observatory"/>
			</inputKey>
		</condDesc>
                <condDesc buildFrom="energy"/>
                <condDesc buildFrom="elevation"/>
            </dbCore>

            <publish render="scs.xml" sets="ivo_managed"/>
            <publish render="form" sets="local"/>
            <outputTable verbLevel="20"/>
        </service>

</resource>

