// Barcelona Rodalies - ALL LINES (Basic extraction)
// Source: GTFS + Routes data
// Date: 2026-01-14
// Note: Includes MAIN stations only - intermediate stops to be added later

// ====================================================================================
// R1: Molins de Rei ↔ L'Hospitalet ↔ Maçanet-Massanes
// ====================================================================================
let barcelonaR1 = Line(
    id: "barcelona_r1",
    name: "R1",
    type: .cercanias,
    colorHex: "#7DBCEC",
    stops: [
        Stop(id: "72300", name: "Molins de Rei", latitude: 41.4098958, longitude: 2.02077275, connectionLineIds: ["barcelona_r4", "barcelona_r8"]),
        Stop(id: "72305", name: "L'Hospitalet de Llobregat", latitude: 41.3642038, longitude: 2.10091749, connectionLineIds: ["barcelona_r2"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8", "barcelona_r11", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "78805", name: "Barcelona-Plaça de Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r2", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r2", "barcelona_r2n"])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R2: Sant Vicenç de Calders ↔ Barcelona-Sants ↔ Maçanet-Massanes
// ====================================================================================
let barcelonaR2 = Line(
    id: "barcelona_r2",
    name: "R2",
    type: .cercanias,
    colorHex: "#26A741",
    stops: [
        Stop(id: "71600", name: "Sant Vicenç de Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r2s", "barcelona_r4", "barcelona_r17"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: []),
        Stop(id: "71709", name: "Viladecans", latitude: 41.3095086, longitude: 2.02741857, connectionLineIds: []),
        Stop(id: "72305", name: "L'Hospitalet de Llobregat", latitude: 41.3642038, longitude: 2.10091749, connectionLineIds: ["barcelona_r1"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2n", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2n", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "78805", name: "Barcelona-Plaça de Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r1", "barcelona_r2n"])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R2N: Aeroport ↔ Barcelona-Sants ↔ Maçanet-Massanes (Airport extension)
// ====================================================================================
let barcelonaR2N = Line(
    id: "barcelona_r2n",
    name: "R2N",
    type: .cercanias,
    colorHex: "#D0DF00",
    stops: [
        Stop(id: "72400", name: "El Prat Aeroport", latitude: 41.3041813, longitude: 2.07340133, connectionLineIds: []),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r1", "barcelona_r2"])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R2S: Sant Vicenç de Calders ↔ Barcelona-Estació de França (Southern variant)
// ====================================================================================
let barcelonaR2S = Line(
    id: "barcelona_r2s",
    name: "R2S",
    type: .cercanias,
    colorHex: "#146520",
    stops: [
        Stop(id: "71600", name: "Sant Vicenç de Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r2", "barcelona_r4", "barcelona_r17"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r4"]),
        Stop(id: "79400", name: "Barcelona-Estació de França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r14", "barcelona_r15"])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R3: L'Hospitalet ↔ Barcelona-Sants ↔ Vic ↔ Puigcerdà (Mountain line)
// ====================================================================================
let barcelonaR3 = Line(
    id: "barcelona_r3",
    name: "R3",
    type: .cercanias,
    colorHex: "#E54A3C",
    stops: [
        Stop(id: "72305", name: "L'Hospitalet de Llobregat", latitude: 41.3642038, longitude: 2.10091749, connectionLineIds: ["barcelona_r1", "barcelona_r2"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r4", "barcelona_r7", "barcelona_r8"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r4"]),
        Stop(id: "78805", name: "Barcelona-Plaça de Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r4"]),
        Stop(id: "77109", name: "Vic", latitude: 41.9310958, longitude: 2.24885665, connectionLineIds: []),
        Stop(id: "77309", name: "Puigcerdà", latitude: 42.4296256, longitude: 1.92458355, connectionLineIds: [])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R4: Sant Vicenç de Calders ↔ Barcelona-Sants ↔ Manresa
// ====================================================================================
let barcelonaR4 = Line(
    id: "barcelona_r4",
    name: "R4",
    type: .cercanias,
    colorHex: "#F7A30D",
    stops: [
        Stop(id: "71600", name: "Sant Vicenç de Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r2", "barcelona_r2s", "barcelona_r17"]),
        Stop(id: "72300", name: "Molins de Rei", latitude: 41.4098958, longitude: 2.02077275, connectionLineIds: ["barcelona_r1", "barcelona_r8"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r7", "barcelona_r8"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça de Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "78600", name: "Manresa", latitude: 41.7203921, longitude: 1.82648564, connectionLineIds: [])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R7: Barcelona-Fabra i Puig ↔ Martorell ↔ Cerdanyola-Universitat
// ====================================================================================
let barcelonaR7 = Line(
    id: "barcelona_r7",
    name: "R7",
    type: .cercanias,
    colorHex: "#B57CBB",
    stops: [
        Stop(id: "72209", name: "Martorell-Central", latitude: 41.4792866, longitude: 1.92533467, connectionLineIds: ["barcelona_r8"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r4", "barcelona_r8"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r4"])
    ],
    city: "Barcelona"
)

// ====================================================================================
// R8: Martorell ↔ Barcelona-Sants ↔ Granollers Centre
// ====================================================================================
let barcelonaR8 = Line(
    id: "barcelona_r8",
    name: "R8",
    type: .cercanias,
    colorHex: "#88016A",
    stops: [
        Stop(id: "72209", name: "Martorell-Central", latitude: 41.4792866, longitude: 1.92533467, connectionLineIds: ["barcelona_r7"]),
        Stop(id: "72300", name: "Molins de Rei", latitude: 41.4098958, longitude: 2.02077275, connectionLineIds: ["barcelona_r1", "barcelona_r4"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r4", "barcelona_r7"]),
        Stop(id: "71802", name: "Barcelona-Passeig de Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r4", "barcelona_r7"]),
        Stop(id: "79100", name: "Granollers-Centre", latitude: 41.5997447, longitude: 2.29126962, connectionLineIds: [])
    ],
    city: "Barcelona"
)

// ====================================================================================
// REGIONAL LINES (Long distance - basics only)
// ====================================================================================

// R11: Barcelona-Sants → Portbou (French border)
let barcelonaR11 = Line(
    id: "barcelona_r11",
    name: "R11",
    type: .cercanias,
    colorHex: "#0069AA",
    stops: [
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8"])
        // More stops TBD - long distance line
    ],
    city: "Barcelona"
)

// R14: Barcelona-França → Lleida
let barcelonaR14 = Line(
    id: "barcelona_r14",
    name: "R14",
    type: .cercanias,
    colorHex: "#6C60A8",
    stops: [
        Stop(id: "79400", name: "Barcelona-Estació de França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r2s", "barcelona_r15"])
        // More stops TBD - regional line
    ],
    city: "Barcelona"
)

// R15: Barcelona-França → Riba-roja d'Ebre
let barcelonaR15 = Line(
    id: "barcelona_r15",
    name: "R15",
    type: .cercanias,
    colorHex: "#978571",
    stops: [
        Stop(id: "79400", name: "Barcelona-Estació de França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r2s", "barcelona_r14"])
        // More stops TBD - regional line
    ],
    city: "Barcelona"
)

// R16: Barcelona-Sants → Tortosa
let barcelonaR16 = Line(
    id: "barcelona_r16",
    name: "R16",
    type: .cercanias,
    colorHex: "#B52B46",
    stops: [
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8", "barcelona_r11", "barcelona_r17"])
        // More stops TBD - regional line
    ],
    city: "Barcelona"
)

// R17: Barcelona-Sants → Tarragona
let barcelonaR17 = Line(
    id: "barcelona_r17",
    name: "R17",
    type: .cercanias,
    colorHex: "#F3B12E",
    stops: [
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3", "barcelona_r4", "barcelona_r7", "barcelona_r8", "barcelona_r11", "barcelona_r16"]),
        Stop(id: "71600", name: "Sant Vicenç de Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r2", "barcelona_r2s", "barcelona_r4"]),
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: [])
    ],
    city: "Barcelona"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 13 (R1-R8 core + R11, R14-R17 regional)
// Note: R2N is airport extension of R2
// Note: R2S is southern coastal variant of R2
// Note: R3 goes to Pyrenees (Puigcerdà)
// Note: Regional lines (R11, R14-R17) serve long-distance routes
// Note: This is BASIC extraction with MAIN stations only
// Note: Barcelona has 212 total stations in GTFS
