// Madrid Cercanías C1 - FINAL & CORRECT
// Source: Wikipedia + GTFS 20260113_170011_RENFE_CERCA
// Date: 2026-01-14
// Color: #75B6E0 (Light Blue - Official Renfe)
// Route: Aeropuerto T4 ↔ Chamartín (ONLY 4 stations!)

let madridC1 = Line(
    id: "madrid_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#75B6E0",
    stops: [
        Stop(id: "98305", name: "Madrid-Aeropuerto T4", latitude: 40.4924023, longitude: -3.5932297, connectionLineIds: ["madrid_c10"]),
        Stop(id: "98304", name: "Valdebebas", latitude: 40.4821016, longitude: -3.6162874, connectionLineIds: []),
        Stop(id: "98003", name: "Fuente de la Mora", latitude: 40.4847200, longitude: -3.6630608, connectionLineIds: []),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10", "line1", "line10"])
    ],
    city: "Madrid"
)

// IMPORTANT NOTES:
// - C1 is a SHORT airport shuttle line (only 4 stops)
// - C1 is the ONLY line that does NOT pass through Atocha
// - The old western branch (Príncipe Pío → Majadahonda) was closed/moved to other lines
// - Main interchange: Chamartín (all Cercanías lines + Metro L1, L10)
// - Airport connection: T4 only (not T1-T2-T3)
