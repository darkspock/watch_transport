# WatchTrans Project - Current Status & Plan

**Date:** January 14, 2026
**Session:** Implementing Spanish Cercanías Networks

---

## 📋 PROJECT PLAN

### Phase 1: Extract ALL Cercanías Lines (CURRENT PHASE)
Extract complete line data (routes + stations) for the 6 major Cercanías networks in Spain:

1. ✅ **Sevilla** - COMPLETE (100%)
   - 6 lines: C1, C2, C3, C4, C5, Metro L1
   - 32 stations with official GTFS data
   - All connections mapped
   - Colors: Official Renfe colors

2. ⏳ **Madrid** - IN PROGRESS
   - 11 lines: C1, C2, C3, C4a, C4b, C5, C7, C8a, C8b, C9, C10
   - 78 stations identified from Renfe CSV
   - GTFS route prefix: 10T
   - Need to extract complete stop sequences

3. ⏳ **Barcelona** - PENDING
   - Lines: R1, R2, R3, R4, R7, R8, R11, R12, R13, R14, R15, R16, R17
   - GTFS route prefix: 51T
   - 105 stations (Rodalies network)

4. ⏳ **Valencia** - PENDING
   - Lines: C1, C2, C3, C4, C5, C6
   - GTFS route prefix: 40T
   - 47 stations + Castellón (21) = 68 total

5. ⏳ **Bilbao** - PENDING
   - Lines: C1, C2, C3
   - GTFS route prefixes: 60T, 61T
   - 56 stations (Bizkaia + Gipuzkoa + Araba)

6. ⏳ **Málaga** - PENDING
   - Lines: C1, C2
   - GTFS route prefix: 32T
   - 14 stations

### Phase 2: Update DataService (AFTER Phase 1)
Once ALL lines from ALL 6 networks are extracted:
- Update DataService.swift with complete data
- Add all lines with official colors, stops, and connections
- Implement city detection for all networks
- Test the app with static/mock data

### Phase 3: Real-Time Integration (AFTER Phase 2)
Only implement real-time features AFTER all lines are in place:
- Integrate GTFS-Realtime API: `https://gtfsrt.renfe.com/trip_updates.json`
- Integrate vehicle positions: `https://gtfsrt.renfe.com/vehicle_positions.json`
- Both update every 30 seconds
- Show delays, cancellations, live arrivals

---

## ✅ COMPLETED WORK

### Sevilla Cercanías - 100% Complete
**Data Source:** Official GTFS from `/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/`

#### Line C1 (Color: #78B4E1 - Light Blue)
**Route:** Lora del Río → Lebrija (17 stops)
- Lora del Río → Guadajoz → Los Rosales → Cantillana → Brenes → El Cáñamo → La Rinconada
- Sevilla-Santa Justa → San Bernardo → Virgen del Rocío
- Jardines de Hércules → Bellavista → Dos Hermanas → Cantaelgallo → Utrera → Las Cabezas de San Juan → Lebrija
- **Connections:** C3 (northern corridor), C5 (southern corridor)

#### Line C2 (Color: #067B34 - Green)
**Route:** Santa Justa → Cartuja (3 stops)
- Sevilla-Santa Justa → Estadio Olímpico → Cartuja
- Short line to Cartuja complex

#### Line C3 (Color: #E4242D - Red)
**Route:** Santa Justa → Cazalla-Constantina (11 stops)
- Sevilla-Santa Justa → La Rinconada → El Cáñamo → Brenes → Cantillana → Los Rosales
- Tocina → **Alcolea del Río** → Villanueva del Río-Minas → Pedroso → Cazalla-Constantina
- **Connections:** C1 (shared northern corridor)

#### Line C4 (Color: #8E2182 - Purple)
**Route:** Circular line (5 stops)
- Sevilla-Santa Justa → Palacio de Congresos → Padre Pío-Palmete → Virgen del Rocío → San Bernardo
- Returns to Santa Justa

#### Line C5 (Color: #073588 - Dark Blue)
**Route:** Two branches (13 stops)
- **Eastern branch:** Dos Hermanas → Bellavista → Jardines de Hércules
- **Central corridor:** Virgen del Rocío → San Bernardo → Sevilla-Santa Justa
- **Western branch:** San Jerónimo → Camas → Valencina-Santiponce → Salteras → Villanueva del Ariscal y Olivares → Sanlúcar la Mayor → Benacazón

#### Metro L1 (Color: #0d6928 - Green)
**Route:** Ciudad Expo → San Juan Alto → Olivar de Quintos (3 stops)

**Key Interchanges:**
- Santa Justa: C1, C2, C3, C4, C5
- San Bernardo: C1, C4, C5, Metro L1
- Virgen del Rocío: C1, C4, C5
- Other connections documented in code

---

## 🔄 CURRENT WORK IN PROGRESS

### Madrid Cercanías Extraction
**Status:** Extracting line by line

**Available Data Sources:**
1. ✅ Renfe stations CSV: 78 stations identified
   - URL: `https://ssl.renfe.com/ftransit/Fichero_estaciones/estaciones.csv`

2. ✅ Madrid-specific CSV:
   - URL: `https://data.renfe.com/dataset/.../listado-estaciones-cercanias-madrid.csv`
   - Last updated: March 2, 2021

3. ✅ GTFS routes file: Route definitions available
   - Prefix: 10T
   - Routes defined but stop_times incomplete in general GTFS

4. ⚠️ Wikipedia: Blocked with 403 errors

**Extraction Method:**
- Using CSV station data + GTFS route colors
- Organizing stations by line based on route descriptions
- Will document principal stations per line
- Complete sequences to be validated

**Lines to Extract:**
- C1: Príncipe Pío → Aeropuerto T4 (Color: #75B6E0)
- C2: Multiple routes (Color: #00943D)
- C3: Chamartín → Aranjuez (Color: #952585)
- C4a/C4b: Chamartín → Parla (Color: #2C2A86)
- C5: Móstoles → Humanes (Color: #FECB00)
- C7: (Color: #DA3239)
- C8a/C8b: El Escorial/Cercedilla (Color: #868584)
- C9: Cercedilla → Cotos (Color: #F3972A)
- C10: Multiple routes (Color: #BCCF00)

---

## 📚 DATA SOURCES

### Official Renfe Open Data Portal
- Main portal: `https://data.renfe.com/dataset`
- All networks tagged "cercanías"

### Real-Time Data (For Phase 3)
- **Trip Updates:** `https://gtfsrt.renfe.com/trip_updates.json` (30s refresh)
- **Vehicle Positions:** `https://gtfsrt.renfe.com/vehicle_positions.json` (30s refresh)
- **Format:** GTFS-Realtime (JSON)
- **License:** Creative Commons Attribution 4.0

### GTFS Static Data
- Complete Spain GTFS: `/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/`
- Individual network CSVs available on Renfe portal

### Network Identification (GTFS Prefixes)
- 10T = Madrid
- 30T = Sevilla ✅
- 32T = Málaga
- 40T = Valencia
- 51T = Barcelona (Rodalies)
- 60T, 61T = Bilbao

---

## 🎯 NEXT STEPS (When you return)

1. **Continue Madrid extraction** line by line:
   - C1 first (Príncipe Pío → Aeropuerto T4)
   - Extract principal stations from CSV
   - Map connections between lines
   - Document in same format as Sevilla

2. **After Madrid is complete** → Move to Barcelona
   - Same process: CSV + GTFS data
   - Line by line extraction

3. **Continue until ALL 6 networks complete**
   - Madrid → Barcelona → Valencia → Bilbao → Málaga

4. **Then update DataService.swift** with ALL networks

5. **Finally implement real-time** (Phase 3)

---

## 📝 IMPORTANT NOTES

- **Schedules/timetables DON'T matter now** - only line routes and stations
- **Real-time implementation is LAST** - after all static data is in place
- **Focus on completeness** - extract ALL lines for each network before moving to next
- All station IDs match official Renfe codes (validated for Sevilla)
- Colors are official Renfe brand colors from GTFS

---

## 🗂️ FILES MODIFIED

### Completed
- `DataService.swift` - Sevilla lines complete (lines 451-574)
- `ContentView.swift` - City filtering implemented
- `LinesView.swift` - Multi-city support with filtering

### To Update (Phase 2)
- `DataService.swift` - Add Madrid, Barcelona, Valencia, Bilbao, Málaga
- City detection logic - Expand coordinate ranges for all cities

### To Create (Phase 3)
- `RealTimeService.swift` - GTFS-RT integration
- API models for trip updates and vehicle positions
- Live arrival display components

---

**Last Updated:** 2026-01-14 07:48 CET
**Session End Reason:** User going to sleep
**Next Session:** Continue Madrid C1 extraction line by line
