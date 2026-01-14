// Málaga Cercanías - ALL LINES (Basic extraction)
// Source: GTFS
// Date: 2026-01-14
// Note: Smallest Cercanías network - only 2 lines!

// ====================================================================================
// C1: Málaga-Centro Alameda ↔ Fuengirola (Coastal line)
// ====================================================================================
let malagaC1 = Line(
    id: "malaga_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#4A8CCC",
    stops: [
        Stop(id: "54517", name: "Málaga-Centro Alameda", latitude: 36.7159539, longitude: -4.4265335, connectionLineIds: ["malaga_c2"]),
        Stop(id: "54505", name: "Málaga-Aeropuerto", latitude: 36.6777169, longitude: -4.4901607, connectionLineIds: []),
        Stop(id: "54516", name: "Fuengirola", latitude: 36.5418947, longitude: -4.6238580, connectionLineIds: [])
    ],
    city: "Málaga"
)

// ====================================================================================
// C2: Málaga-Centro Alameda ↔ Álora (Interior line)
// ====================================================================================
let malagaC2 = Line(
    id: "malaga_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#0FCF34",
    stops: [
        Stop(id: "54517", name: "Málaga-Centro Alameda", latitude: 36.7159539, longitude: -4.4265335, connectionLineIds: ["malaga_c1"]),
        Stop(id: "54405", name: "Álora", latitude: 36.8198747, longitude: -4.6996105, connectionLineIds: [])
    ],
    city: "Málaga"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 2 (C1, C2)
// Main hub: Málaga-Centro Alameda (both lines)
// Note: C1 includes Málaga Airport
// Note: This is the SMALLEST Cercanías network in Spain
// Note: Only 14 stations total in the network
// Note: Málaga also has Metro (separate system)
