## Tools needed to install (if no installed)
```
brew install wget
brew install ogr2ogr
npm install -g topojson
```

## Extract Data
1. Fetch zip file containing shapefile;
```
source fetch.sh
```

2. Find the file ending with .shp

3. Extract data from .shp with ogr2ogr
We need to extract Hongkong and Taiwan from ne_10m_admin_0_countries.shp, and China Mainland and Macao from ne_10m_admin_1_states_provinces.shp, and then merge the two layers.

Extract Hongkong and Taiwan:
```
ogr2ogr -f GeoJSON -where "ADM0_A3 IN ('HKG','TWN')" .tmp/china_border.json .tmp/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp
```

Extract provinces of China Mainland and Macao:
```
ogr2ogr -f GeoJSON -where "adm0_a3 IN ('CHN','MAC')" .tmp/china_provinces.json .tmp/ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp
```

4. Use topojson to combine the two layers, simply the outline, and delete unnecessary json fileds. Keep some attributes like `name_local`, `adm0_a3`.