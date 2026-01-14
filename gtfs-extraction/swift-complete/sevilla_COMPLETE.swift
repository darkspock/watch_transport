// SEVILLA Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 5

// ====================================================================================
// C1: Lora del Rio                            -Lebrija
// ====================================================================================
let sevillaC1 = Line(
    id: "sevilla_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#78B4E1",
    stops: [
        Stop(id: "50600", name: "Lora Del Río", latitude: 37.6613212, longitude: -5.5295514, connectionLineIds: []),
        Stop(id: "50602", name: "Guadajoz", latitude: 37.5814594, longitude: -5.6699795, connectionLineIds: []),
        Stop(id: "50700", name: "Los Rosales", latitude: 37.5899718, longitude: -5.7261208, connectionLineIds: ["sevilla_c3"]),
        Stop(id: "50701", name: "Cantillana", latitude: 37.5749689, longitude: -5.8032073, connectionLineIds: ["sevilla_c3"]),
        Stop(id: "50702", name: "Brenes", latitude: 37.5463276, longitude: -5.8667821, connectionLineIds: ["sevilla_c3"]),
        Stop(id: "50704", name: "El Cáñamo", latitude: 37.4863952, longitude: -5.932975, connectionLineIds: ["sevilla_c3"]),
        Stop(id: "50703", name: "La Rinconada", latitude: 37.4800897, longitude: -5.940119, connectionLineIds: ["sevilla_c3"]),
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c2", "sevilla_c3", "sevilla_c4", "sevilla_c5"]),
        Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c4", "sevilla_c5"]),
        Stop(id: "51110", name: "Virgen Del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c4", "sevilla_c5"]),
        Stop(id: "51113", name: "Jardines De Hércules", latitude: 37.3328527, longitude: -5.964094, connectionLineIds: ["sevilla_c5"]),
        Stop(id: "51111", name: "Bellavista", latitude: 37.3215188, longitude: -5.9641924, connectionLineIds: ["sevilla_c5"]),
        Stop(id: "51103", name: "Dos Hermanas", latitude: 37.2872259, longitude: -5.9235322, connectionLineIds: ["sevilla_c5"]),
        Stop(id: "51112", name: "Cantaelgallo", latitude: 37.2782197, longitude: -5.9104397, connectionLineIds: []),
        Stop(id: "51200", name: "Utrera", latitude: 37.1848178, longitude: -5.7907537, connectionLineIds: []),
        Stop(id: "51202", name: "Las Cabezas De San Juan", latitude: 37.0194897, longitude: -5.94658, connectionLineIds: []),
        Stop(id: "51203", name: "Lebrija", latitude: 36.9116378, longitude: -6.0948487, connectionLineIds: [])
    ],
    city: "Sevilla"
)

// ====================================================================================
// C2: Santa Justa                             -Cartuja
// ====================================================================================
let sevillaC2 = Line(
    id: "sevilla_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#067B34",
    stops: [
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c3", "sevilla_c4", "sevilla_c5"]),
        Stop(id: "43000", name: "San Jerónimo", latitude: 37.433173, longitude: -5.98036, connectionLineIds: ["sevilla_c5"]),
        Stop(id: "51051", name: "Estadio Olímpico", latitude: 37.4174307, longitude: -6.007496, connectionLineIds: []),
        Stop(id: "51050", name: "Cartuja", latitude: 37.4074574, longitude: -6.0101856, connectionLineIds: [])
    ],
    city: "Sevilla"
)

// ====================================================================================
// C3: Santa Justa                             -Cazalla-Constantina
// ====================================================================================
let sevillaC3 = Line(
    id: "sevilla_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#E4242D",
    stops: [
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c4", "sevilla_c5"]),
        Stop(id: "50703", name: "La Rinconada", latitude: 37.4800897, longitude: -5.940119, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "50704", name: "El Cáñamo", latitude: 37.4863952, longitude: -5.932975, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "50702", name: "Brenes", latitude: 37.5463276, longitude: -5.8667821, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "50701", name: "Cantillana", latitude: 37.5749689, longitude: -5.8032073, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "50700", name: "Los Rosales", latitude: 37.5899718, longitude: -5.7261208, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "40122", name: "Tocina", latitude: 37.6093044, longitude: -5.7316939, connectionLineIds: []),
        Stop(id: "40121", name: "Alcolea Del Río", latitude: 37.6354557, longitude: -5.7308309, connectionLineIds: []),
        Stop(id: "40119", name: "Villanueva Del Río-Minas", latitude: 37.6617048, longitude: -5.7121543, connectionLineIds: []),
        Stop(id: "40115", name: "Pedroso", latitude: 37.8373919, longitude: -5.7624522, connectionLineIds: []),
        Stop(id: "40113", name: "Cazalla-Constantina", latitude: 37.9328637, longitude: -5.704433, connectionLineIds: [])
    ],
    city: "Sevilla"
)

// ====================================================================================
// C4: Santa Justa                             -Santa Justa
// ====================================================================================
let sevillaC4 = Line(
    id: "sevilla_c4",
    name: "C4",
    type: .cercanias,
    colorHex: "#8E2182",
    stops: [
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c3", "sevilla_c5"]),
        Stop(id: "51009", name: "Palacio De Congresos", latitude: 37.4036456, longitude: -5.9362636, connectionLineIds: []),
        Stop(id: "51010", name: "Padre Pío-Palmete", latitude: 37.370852, longitude: -5.9394111, connectionLineIds: []),
        Stop(id: "51110", name: "Virgen Del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c1", "sevilla_c5"]),
        Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c1", "sevilla_c5"]),
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c3", "sevilla_c5"])
    ],
    city: "Sevilla"
)

// ====================================================================================
// C5: Jardines de Hercules                    -Benacazon
// ====================================================================================
let sevillaC5 = Line(
    id: "sevilla_c5",
    name: "C5",
    type: .cercanias,
    colorHex: "#073588",
    stops: [
        Stop(id: "51103", name: "Dos Hermanas", latitude: 37.2872259, longitude: -5.9235322, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "51111", name: "Bellavista", latitude: 37.3215188, longitude: -5.9641924, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "51113", name: "Jardines De Hércules", latitude: 37.3328527, longitude: -5.964094, connectionLineIds: ["sevilla_c1"]),
        Stop(id: "51110", name: "Virgen Del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c1", "sevilla_c4"]),
        Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c1", "sevilla_c4"]),
        Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c3", "sevilla_c4"]),
        Stop(id: "43000", name: "San Jerónimo", latitude: 37.433173, longitude: -5.98036, connectionLineIds: ["sevilla_c2"]),
        Stop(id: "43002", name: "Camas", latitude: 37.4177385, longitude: -6.0408469, connectionLineIds: []),
        Stop(id: "43026", name: "Valencina-Santiponce", latitude: 37.4268127, longitude: -6.0566858, connectionLineIds: []),
        Stop(id: "43027", name: "Salteras", latitude: 37.4102348, longitude: -6.0992391, connectionLineIds: []),
        Stop(id: "43003", name: "Villanueva Del Ariscal Y Olivares", latitude: 37.4071375, longitude: -6.1481895, connectionLineIds: []),
        Stop(id: "43004", name: "Sanlúcar La Mayor", latitude: 37.3814397, longitude: -6.1939625, connectionLineIds: []),
        Stop(id: "43005", name: "Benacazón", latitude: 37.3568512, longitude: -6.2082011, connectionLineIds: [])
    ],
    city: "Sevilla"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 5
// C1: 17 stops
// C2: 4 stops
// C3: 11 stops
// C4: 6 stops
// C5: 13 stops
// Total stops: 51 (with duplicates across lines)
