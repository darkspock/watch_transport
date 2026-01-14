# WatchTrans - Spanish Transport Watch App

**Official Repository:** [github.com/xoaninc/App-watch](https://github.com/xoaninc/App-watch)

---

## 🚀 Project Overview

WatchTrans is an Apple Watch (watchOS 11+) application for Spanish public transport. It provides real-time arrival information for metro, trains (Cercanías), and trams using official data from Spain's National Access Point (NAP).

### Core Features

✅ **Home Screen**
- Auto-detects nearest stop on launch
- Shows next 2 arrivals per stop
- Favorites section (max 5 stops)
- Recommended section (nearest + 2 others)
- Pull-to-refresh with haptic feedback

✅ **Watch Face Complication**
- 4 complication types: Rectangular, Circular, Corner, Inline
- Shows line, destination, and time
- Progress bar visualization
- Delay indicators
- Updates every 5 minutes

✅ **Line Browser**
- Browse all Metro and Cercanías lines
- Grouped by transport type
- City filtering (Madrid/Sevilla)
- Visual termometro with connections

✅ **Data Coverage** (COMPLETE)
- **Madrid:** 10 Cercanías lines, 144 stops ✅
- **Sevilla:** 5 Cercanías lines, 51 stops ✅
- **Barcelona:** 12 Rodalies lines, 320 stops ✅
- **Valencia:** 5 Cercanías lines, 72 stops ✅
- **Málaga:** 2 Cercanías lines, 28 stops ✅
- **Bilbao:** 4 Cercanías lines, 96 stops ✅
- **San Sebastián:** 1 Cercanías line, 30 stops ✅
- **TOTAL:** 39 lines, 741 stops across 6 networks

---

## 📱 Screenshots

*Coming soon*

---

## 🛠️ Tech Stack

- **Platform:** watchOS 11+
- **Language:** Swift
- **UI:** SwiftUI
- **Persistence:** SwiftData
- **Location:** CoreLocation
- **Complications:** WidgetKit
- **Data Source:** GTFS + GTFS-Realtime from Renfe

---

## 📂 Project Structure

```
watch_transport-main/
├── WatchTransApp/                    # Main Xcode project
│   ├── WatchTrans.xcodeproj
│   └── WatchTrans Watch App/
│       ├── WatchTransApp.swift      # App entry + SwiftData
│       ├── ContentView.swift         # Home screen
│       ├── Models/
│       │   ├── TransportType.swift
│       │   ├── Line.swift
│       │   ├── Stop.swift
│       │   ├── Arrival.swift
│       │   └── Favorite.swift
│       ├── Views/
│       │   ├── ArrivalCard.swift
│       │   ├── LinesView.swift      # Line browser
│       │   └── LineDetailView.swift # Termometro
│       └── Services/
│           ├── LocationService.swift
│           ├── DataService.swift    # ✅ UPDATED with all 39 lines
│           └── FavoritesManager.swift
├── gtfs-extraction/                  # GTFS extraction work
│   ├── scripts/                     # Python extraction scripts
│   ├── swift-complete/              # Complete Swift line definitions
│   ├── data/                        # JSON extraction results
│   └── README.md
├── docs/                             # Documentation
│   ├── INTEGRATION_COMPLETE.md      # Integration summary
│   ├── COMPLETE_EXTRACTION_SUMMARY.md
│   └── [other documentation files]
├── README.md                         # This file
└── PROJECT_STATUS.md
```

---

## 🎯 Development Roadmap

### Phase 1: Extract ALL Cercanías Lines ✅ COMPLETE
- [x] Sevilla (5 lines, 51 stops)
- [x] Madrid (10 lines, 144 stops)
- [x] Barcelona (12 lines, 320 stops)
- [x] Valencia (5 lines, 72 stops)
- [x] Málaga (2 lines, 28 stops)
- [x] Bilbao (4 lines, 96 stops)
- [x] San Sebastián (1 line, 30 stops)

### Phase 2: Update DataService ✅ COMPLETE
- [x] Add all 6 networks to DataService
- [x] Set connection IDs for all interchanges
- [x] Complete stop sequences for all lines
- [x] City identification for all stops

### Phase 3: Testing & Validation ⏳ NEXT
- [ ] Build and test in Xcode
- [ ] Verify line browser shows all 39 lines
- [ ] Test favorites across networks
- [ ] Test GPS-based city detection
- [ ] Verify connection IDs work

### Phase 4: Real-Time Integration (After Testing)
- [ ] GTFS-Realtime trip updates
- [ ] Vehicle positions
- [ ] Delay and cancellation alerts
- [ ] Live arrival times

### Phase 5: Madrid Metro & Polish
- [ ] Replace Madrid Metro mock data
- [ ] Add complete Metro Ligero data
- [ ] Verify missing lines (Barcelona R4, R7, etc.)
- [ ] App Store preparation

---

## 🚦 Current Status

**Last Updated:** January 14, 2026
**Current Phase:** Phase 3 - Testing & Validation
**Completed:** All 39 Cercanías lines integrated into DataService.swift
**Next Task:** Build and test in Xcode

### Recent Achievements ✅
- ✅ Complete GTFS extraction for all 6 Spanish Cercanías networks
- ✅ 741 stops with GPS coordinates and connection IDs
- ✅ DataService.swift updated from 642 to 1,304 lines
- ✅ All project files organized in proper structure

See [docs/INTEGRATION_COMPLETE.md](./docs/INTEGRATION_COMPLETE.md) for detailed integration documentation.

---

## 🔧 Setup Instructions

### Prerequisites
- macOS 14+
- Xcode 16+
- Apple Watch (physical device or simulator)

### Build Steps

1. Clone the repository:
```bash
git clone https://github.com/xoaninc/App-watch.git
cd App-watch
```

2. Open the Xcode project:
```bash
cd WatchTransApp/WatchTrans
open WatchTrans.xcodeproj
```

3. Select your target Apple Watch device/simulator

4. Build and run (⌘ + R)

### Location Permissions

The app requires location access. Add to `Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>WatchTrans needs your location to find nearby stops</string>
```

---

## 📊 Data Sources

### Official Renfe Open Data
- **Portal:** https://data.renfe.com/dataset
- **GTFS Static:** Complete Spain network data
- **GTFS-Realtime:**
  - Trip Updates: https://gtfsrt.renfe.com/trip_updates.json
  - Vehicle Positions: https://gtfsrt.renfe.com/vehicle_positions.json
- **Update Frequency:** 30 seconds
- **License:** Creative Commons Attribution 4.0

---

## 👥 Team

- **Juan Macias Gomez** - Project Owner
- **Claude Sonnet 4.5** - AI Development Assistant

### Fictional Team Members (from design docs)
- Ana Torres - Product Owner
- Carlos Mendez - iOS/watchOS Developer
- Miguel Ruiz - UX/UI Designer
- Lucia Fernandez - Backend Developer
- Elena Garcia - QA Engineer

---

## 📄 License

*To be determined*

---

## 🙏 Acknowledgments

- Spanish Ministry of Transport (MITMA) for NAP data
- Renfe for open GTFS data
- Apple for watchOS and WidgetKit

---

## 📞 Contact

- **GitHub:** [@xoaninc](https://github.com/xoaninc)
- **Repository:** [App-watch](https://github.com/xoaninc/App-watch)

---

**⚠️ IMPORTANT: This is your main working directory**

If you see a folder named `watch_transport-MILESTONE_HomeScreen_Complete` in Downloads, that's an OLD backup from before the complication was added. Always work in `watch_transport-main`.
