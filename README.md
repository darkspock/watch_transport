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

✅ **Data Coverage**
- Sevilla: 6 lines, 32 stations (100% complete)
- Madrid: In progress (11 lines planned)
- Barcelona, Valencia, Bilbao, Málaga: Planned

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
WatchTransApp/
├── WatchTrans.xcodeproj
└── WatchTrans Watch App/
    ├── WatchTransApp.swift          # App entry + SwiftData
    ├── ContentView.swift             # Home screen
    ├── Models/
    │   ├── TransportType.swift
    │   ├── Line.swift
    │   ├── Stop.swift
    │   ├── Arrival.swift
    │   └── Favorite.swift
    ├── Views/
    │   ├── ArrivalCard.swift
    │   ├── LinesView.swift           # Line browser
    │   └── LineDetailView.swift      # Termometro
    └── Services/
        ├── LocationService.swift
        ├── DataService.swift
        └── FavoritesManager.swift
```

---

## 🎯 Development Roadmap

### Phase 1: Extract ALL Cercanías Lines ⏳ (Current)
- [x] Sevilla (100% complete)
- [ ] Madrid (in progress)
- [ ] Barcelona
- [ ] Valencia
- [ ] Bilbao
- [ ] Málaga

### Phase 2: Update DataService (After Phase 1)
- [ ] Add all 6 networks to DataService
- [ ] Implement city detection for all networks
- [ ] Test with complete static data

### Phase 3: Real-Time Integration (After Phase 2)
- [ ] GTFS-Realtime trip updates
- [ ] Vehicle positions
- [ ] Delay and cancellation alerts
- [ ] Live arrival times

---

## 🚦 Current Status

**Last Updated:** January 14, 2026
**Current Phase:** Phase 1 - Data Extraction
**Next Task:** Extract Madrid C1 line

See [PROJECT_STATUS.md](./PROJECT_STATUS.md) for detailed status.

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
