# Madrid Cercanías C1 - Manual Extraction

**Source:** GTFS data + Manual research
**Date:** 2026-01-14
**Color:** #75B6E0 (Light Blue)
**Route:** Príncipe Pío ↔ Aeropuerto T4

## Confirmed Stops from GTFS (stop_id prefix 10xxx):

1. **10000** - Madrid-Príncipe Pío (40.4214895, -3.7189689)
2. **10001** - Aravaca (40.4484551, -3.7855547)
3. **10002** - Pozuelo (40.4474569, -3.8002779)
4. **10010** - El Barrial-Centro Comercial Pozuelo (40.4653918, -3.8076854)
5. **10005** - Las Rozas (40.4942887, -3.8681747)
6. **10007** - Majadahonda (40.4742885, -3.8462931)

## Known Missing Stations (Need to find in GTFS):
- Nuevos Ministerios
- Chamartín - Clara Campoamor
- Recoletos
- Madrid-Atocha Cercanías
- Méndez Álvaro
- Aeropuerto T4

## Search Strategy:
1. Look for stops with "Madrid", "Chamart", "Aeropuerto", "Atocha" in names
2. Check coordinate ranges for central Madrid (40.4-40.5 lat, -3.7 to -3.6 lon)
3. Cross-reference with route descriptions

## Next Steps:
- Search GTFS stops.txt for Madrid central stations
- Find the complete station sequence
- Verify coordinates match Madrid area
- Add connection information
