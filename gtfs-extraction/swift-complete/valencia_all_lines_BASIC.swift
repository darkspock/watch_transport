// Valencia Cercanías - ALL LINES (Basic extraction)
// Source: GTFS
// Date: 2026-01-14
// Note: Includes MAIN stations only - intermediate stops to be added later

// ====================================================================================
// C1: València-Estació Del Nord ↔ Platja i Grau de Gandia (Coastal line)
// ====================================================================================
let valenciaC1 = Line(
    id: "valencia_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#7AB3DE",
    stops: [
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c2", "valencia_c3", "valencia_c5", "valencia_c6"]),
        Stop(id: "69110", name: "Gandia", latitude: 38.9705140, longitude: -0.1797829, connectionLineIds: []),
        Stop(id: "69111", name: "Platja i Grau de Gandia", latitude: 38.9902436, longitude: -0.1624339, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// C2: València-Estació Del Nord ↔ Xàtiva ↔ Moixent (Interior line)
// ====================================================================================
let valenciaC2 = Line(
    id: "valencia_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#F79529",
    stops: [
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c3", "valencia_c5", "valencia_c6"]),
        Stop(id: "64100", name: "Xàtiva", latitude: 38.9921480, longitude: -0.5245402, connectionLineIds: []),
        Stop(id: "64003", name: "Moixent", latitude: 38.8777975, longitude: -0.7536507, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// C3: València-Estació Del Nord ↔ Buñol ↔ Utiel (Mountain line)
// ====================================================================================
let valenciaC3 = Line(
    id: "valencia_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#7A2780",
    stops: [
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c5", "valencia_c6"]),
        Stop(id: "66212", name: "València-Sant Isidre", latitude: 39.4502194, longitude: -0.4039788, connectionLineIds: ["valencia_c4"]),
        Stop(id: "66211", name: "Aldaia", latitude: 39.4611179, longitude: -0.4632476, connectionLineIds: []),
        Stop(id: "66206", name: "Buñol", latitude: 39.4271390, longitude: -0.7873638, connectionLineIds: []),
        Stop(id: "66200", name: "Utiel", latitude: 39.5707742, longitude: -1.2024215, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// C4: València-Sant Isidre ↔ Xirivella-L'Alter (Short suburban line)
// ====================================================================================
let valenciaC4 = Line(
    id: "valencia_c4",
    name: "C4",
    type: .cercanias,
    colorHex: "#D4021D",
    stops: [
        Stop(id: "66212", name: "València-Sant Isidre", latitude: 39.4502194, longitude: -0.4039788, connectionLineIds: ["valencia_c3"]),
        Stop(id: "66214", name: "Xirivella-Alqueries", latitude: 39.4626294, longitude: -0.4322160, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// C5: València-Estació Del Nord ↔ Sagunt ↔ Caudiel (Northern line)
// ====================================================================================
let valenciaC5 = Line(
    id: "valencia_c5",
    name: "C5",
    type: .cercanias,
    colorHex: "#018A27",
    stops: [
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c3", "valencia_c6"]),
        Stop(id: "65200", name: "Sagunt", latitude: 39.6758025, longitude: -0.2715420, connectionLineIds: ["valencia_c6"]),
        Stop(id: "67211", name: "Caudiel", latitude: 39.9473696, longitude: -0.5720537, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// C6: València-Estació Del Nord ↔ Castelló de la Plana (Coastal north)
// ====================================================================================
let valenciaC6 = Line(
    id: "valencia_c6",
    name: "C6",
    type: .cercanias,
    colorHex: "#0D3386",
    stops: [
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c3", "valencia_c5"]),
        Stop(id: "65200", name: "Sagunt", latitude: 39.6758025, longitude: -0.2715420, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65300", name: "Castelló de la Plana", latitude: 39.9884736, longitude: -0.0523456, connectionLineIds: [])
    ],
    city: "Valencia"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 6 (C1-C6)
// Main hub: València-Estació Del Nord (C1, C2, C3, C5, C6)
// Secondary hub: València-Sant Isidre (C3, C4)
// Note: This is BASIC extraction with MAIN stations only
// Note: Valencia has 134 total stations in GTFS
// Note: C4 is the shortest line (only 2 stops - suburban shuttle)
