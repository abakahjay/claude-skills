# Maps, location and place search without Google (free, no keys)

Templates: frontend `components/MapView.jsx`, `components/LocationPicker.jsx`, `components/PlacePreview.jsx`,
`lib/hooks.js` (`getBestPosition`); backend `controllers/cleanbridgeGeo.js`, `utils/ghanaPlaces.js`,
`scripts/buildGhanaPlaces.js`.

## Why not Google Maps
Google Maps Platform needs a Cloud billing account with a card even inside the free tier. You may not
enter payment details for the user. Offer it (they add the card; key restricted by HTTP referrer + daily
quota caps) - otherwise use this free stack. Note: the "my location" dot is only as good as the device
(browser geolocation is the same for Google) - Google's real advantage is POI search and detail.

## Map (Leaflet / react-leaflet)
- Tiles: OpenStreetMap (dark mode = CSS filter) + Esri World Imagery satellite toggle. Don't use CARTO
  (needs a key now).
- `ScrollGuard`: `scrollWheelZoom={false}`; Ctrl+wheel zooms, plain wheel shows a hint; on touch devices
  dragging is off until the map is tapped - otherwise the map hijacks page scrolling.
- Location picker (ride-hailing style): taps never move the pin. "Adjust pin" shows a fixed centre pin
  while the map moves; "Confirm this spot" reverse-geocodes the centre. Show an accuracy circle.
- `getBestPosition`: quick low-accuracy fix first, then `watchPosition` high accuracy, keep the best reading,
  stop at <= 25 m or ~10 s. Tell the user when accuracy is poor (> 60 m) and suggest Adjust pin + Satellite.

## Search (backend proxy /geo/search, rate limited)
- Photon (OSM, search-as-you-type) with Nominatim fallback, limited to the country bbox, cached 10 min.
- Merge a local POI index from **Overture Maps places** (free, CDLA/Apache/CC0, mostly Meta + Microsoft
  business listings - far better business coverage than OSM in many African countries):
  `buildGhanaPlaces.js` uses DuckDB (`@duckdb/node-api`; Python duckdb may lack wheels for new Pythons) to
  read only the country bbox from `s3://overturemaps-us-west-2/release/<release>/theme=places/type=place/*`
  (list releases at `https://overturemaps-us-west-2.s3.amazonaws.com/?list-type=2&prefix=release/&delimiter=/`),
  keeps confidence >= 0.4, writes a ~2 MB gzip committed with the backend. `ghanaPlaces.js` loads it into
  memory (~28k places, ~5 ms per search) - no database import needed in production.
- Ranking: word-prefix match on name/street/locality/category synonyms ("pharmacy", "church", "fuel"),
  bonus for name matches, strong pull for nearby places. Order: OSM results named exactly like the query
  (areas/roads, max 3) -> businesses whose name contains the query -> other OSM -> rest; dedupe same name
  within 150 m. With no user position, bias to the main city (else same-named villages win).
- Reverse geocode: prefer a named POI within ~40 m of the pin over the street name.

## Pictures of a place (/geo/photos)
- Satellite snapshot: Esri `World_Imagery/MapServer/export?bbox=...&bboxSR=4326&imageSR=3857&size=480,288&f=image`.
- Real photos: Wikimedia Commons `generator=geosearch` (namespace 6, radius 150 m) with `imageinfo`
  thumbs + author/licence. Many landmarks have photos; small shops usually don't.
- Always show credits: Esri/Maxar, Wikimedia Commons (author + licence), OpenStreetMap, Overture Maps.

## Adapting to another country
Change the bbox, country code filter, region code map, category synonyms, default bias city and hubs.
