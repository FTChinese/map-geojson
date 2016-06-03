## Workflow
1. Fetch zip file containing shapefile;
```
wget --directory-prefix=.tmp --timestamping --input-file=natural_earth_urls.txt
```
2. Unzip it.
3. Find the file ending with .shp
4. Extract data from .shp with ogr2ogr

Generate China's border with Hongkong, Macao and Taiwan:
```
ogr2ogr -f GeoJSON -where "ADM0_A3 IN ('CHN','MAC','HKG','TWN')" .tmp/china_border.json .tmp/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp
```

Generate Hongkong, Macao and Taiwan:
```
ogr2ogr -f GeoJSON -where "ADM0_A3 IN ('MAC','HKG','TWN')" .tmp/hmt.json .tmp/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp
```

Generate China provinces with Hongkong, Macao and Taiwan:
```
ogr2ogr -f GeoJSON -where "adm0_a3 IN ('CHN','HKG','MAC','TWN')" .tmp/china_provinces.json .tmp/ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp
```

5. We should join administrations under Taiwan into a single path since Taiwan should be treated as a province. Its cities should not be exposed at this level. So do Hongkong.


6. Convert to topojson. Keep some attributes like `name_local`, `adm0_a3`.