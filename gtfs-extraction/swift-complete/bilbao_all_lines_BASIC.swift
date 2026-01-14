// Bilbao/Basque Country Cercanías - ALL LINES (Basic extraction)
// Source: GTFS
// Date: 2026-01-14
// Note: TWO separate networks - Bizkaia (60T) and Gipuzkoa (61T)

// ==================================================================================
// BIZKAIA NETWORK (Bilbao area - 60T prefix)
// ==================================================================================

// C1: Bilbao-Abando ↔ Santurtzi (Left bank / Margen Izquierda)
let bilbaoC1 = Line(
    id: "bilbao_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#D7001E",
    stops: [
        Stop(id: "TBD", name: "Bilbao-Abando", latitude: 0, longitude: 0, connectionLineIds: ["bilbao_c2", "bilbao_c3"]),
        Stop(id: "TBD", name: "Santurtzi", latitude: 0, longitude: 0, connectionLineIds: [])
    ],
    city: "Bilbao"
)

// C2: Bilbao-Abando ↔ Muskiz (West coast)
let bilbaoC2 = Line(
    id: "bilbao_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#0F8C2D",
    stops: [
        Stop(id: "TBD", name: "Bilbao-Abando", latitude: 0, longitude: 0, connectionLineIds: ["bilbao_c1", "bilbao_c3"]),
        Stop(id: "TBD", name: "Muskiz", latitude: 0, longitude: 0, connectionLineIds: [])
    ],
    city: "Bilbao"
)

// C3: Bilbao-Abando ↔ Orduña (Southern line)
let bilbaoC3 = Line(
    id: "bilbao_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#78B4E1",
    stops: [
        Stop(id: "TBD", name: "Bilbao-Abando", latitude: 0, longitude: 0, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "TBD", name: "Orduña", latitude: 0, longitude: 0, connectionLineIds: [])
    ],
    city: "Bilbao"
)

// ====================================================================================
// GIPUZKOA NETWORK (San Sebastián area - 61T prefix)
// ====================================================================================

// C1: Donostia-San Sebastián ↔ Irun / Beasain / Brincola (Multiple branches)
let gipuzkoaC1 = Line(
    id: "gipuzkoa_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#DA001C",
    stops: [
        Stop(id: "11511", name: "San Sebastián-Donostia", latitude: 43.3176961, longitude: -1.9767172, connectionLineIds: []),
        Stop(id: "11600", name: "Irun", latitude: 43.3395365, longitude: -1.8012519, connectionLineIds: []),
        Stop(id: "11404", name: "Beasain", latitude: 43.0462687, longitude: -2.2022994, connectionLineIds: []),
        Stop(id: "11305", name: "Brincola", latitude: 43.0189865, longitude: -2.3346811, connectionLineIds: [])
    ],
    city: "San Sebastián"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total networks: 2 (Bizkaia + Gipuzkoa)
// Total lines: 4 (Bilbao C1-C3 + Gipuzkoa C1)
// Note: BOTH networks use "C1" line name (different systems!)
// Note: 60T prefix = Bizkaia/Bilbao
// Note: 61T prefix = Gipuzkoa/San Sebastián
// Note: These are SEPARATE non-connected networks
// Note: Bilbao station coordinates TBD (need to find in GTFS)
// Note: San Sebastián coordinates from GTFS found
