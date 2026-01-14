// Madrid Cercanías - ALL LINES (Basic extraction)
// Source: GTFS + Wikipedia
// Date: 2026-01-14
// Note: Includes MAIN stations only - intermediate stops to be added later

// ====================================================================================
// C1: Aeropuerto T4 ↔ Chamartín (SHORT AIRPORT SHUTTLE)
// ====================================================================================
let madridC1 = Line(
    id: "madrid_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#75B6E0",
    stops: [
        Stop(id: "98305", name: "Madrid-Aeropuerto T4", latitude: 40.4924023, longitude: -3.5932297, connectionLineIds: ["madrid_c10"]),
        Stop(id: "98304", name: "Valdebebas", latitude: 40.4821016, longitude: -3.6162874, connectionLineIds: []),
        Stop(id: "98003", name: "Fuente de la Mora", latitude: 40.4847200, longitude: -3.6630608, connectionLineIds: []),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C2: Guadalajara / Alcalá de Henares ↔ Chamartín / Príncipe Pío
// ====================================================================================
let madridC2 = Line(
    id: "madrid_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#00943D",
    stops: [
        Stop(id: "70200", name: "Guadalajara", latitude: 40.6441928, longitude: -3.1822602, connectionLineIds: []),
        Stop(id: "70103", name: "Alcalá de Henares", latitude: 40.4890814, longitude: -3.3662457, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70107", name: "Alcalá de Henares-Universidad", latitude: 40.5054303, longitude: -3.3353258, connectionLineIds: []),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.6909310, connectionLineIds: ["madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: []),
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c7", "madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C3: Aranjuez ↔ Chamartín (via Sol)
// ====================================================================================
let madridC3 = Line(
    id: "madrid_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#952585",
    stops: [
        Stop(id: "60200", name: "Aranjuez", latitude: 40.0350257, longitude: -3.6182534, connectionLineIds: []),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: []),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4: Parla ↔ Chamartín (main line)
// ====================================================================================
let madridC4 = Line(
    id: "madrid_c4",
    name: "C4",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "37012", name: "Parla", latitude: 40.2410986, longitude: -3.7692699, connectionLineIds: []),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.6909310, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c7", "madrid_c8", "madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4a: Parla ↔ Alcobendas-San Sebastián de los Reyes
// ====================================================================================
let madridC4a = Line(
    id: "madrid_c4a",
    name: "C4a",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "37012", name: "Parla", latitude: 40.2410986, longitude: -3.7692699, connectionLineIds: ["madrid_c4", "madrid_c4b"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.6909310, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17009", name: "Universidad-Cantoblanco", latitude: 40.5438416, longitude: -3.7001551, connectionLineIds: []),
        Stop(id: "19003", name: "Alcobendas-San Sebastián de los Reyes", latitude: 40.5465765, longitude: -3.6351731, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4b: Parla ↔ Colmenar Viejo
// ====================================================================================
let madridC4b = Line(
    id: "madrid_c4b",
    name: "C4b",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "37012", name: "Parla", latitude: 40.2410986, longitude: -3.7692699, connectionLineIds: ["madrid_c4", "madrid_c4a"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.6909310, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "17009", name: "Universidad-Cantoblanco", latitude: 40.5438416, longitude: -3.7001551, connectionLineIds: []),
        Stop(id: "17005", name: "Colmenar Viejo", latitude: 40.6452094, longitude: -3.7766142, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C5: Móstoles-El Soto ↔ Humanes / Fuenlabrada
// ====================================================================================
let madridC5 = Line(
    id: "madrid_c5",
    name: "C5",
    type: .cercanias,
    colorHex: "#FECB00",
    stops: [
        Stop(id: "35607", name: "Móstoles-El Soto", latitude: 40.3310640, longitude: -3.8824560, connectionLineIds: []),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18003", name: "Méndez Álvaro", latitude: 40.3957768, longitude: -3.6778440, connectionLineIds: []),
        Stop(id: "35002", name: "Fuenlabrada", latitude: 40.2833784, longitude: -3.7994429, connectionLineIds: []),
        Stop(id: "35012", name: "Humanes", latitude: 40.2558101, longitude: -3.8287055, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C7: Príncipe Pío ↔ Alcalá de Henares (complex with multiple branches)
// ====================================================================================
let madridC7 = Line(
    id: "madrid_c7",
    name: "C7",
    type: .cercanias,
    colorHex: "#DA3239",
    stops: [
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c2", "madrid_c10"]),
        Stop(id: "10001", name: "Aravaca", latitude: 40.4484551, longitude: -3.7855547, connectionLineIds: ["madrid_c10"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c8", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c8", "madrid_c10"]),
        Stop(id: "70103", name: "Alcalá de Henares", latitude: 40.4890814, longitude: -3.3662457, connectionLineIds: ["madrid_c2"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C8a: Atocha/Chamartín ↔ El Escorial
// ====================================================================================
let madridC8a = Line(
    id: "madrid_c8a",
    name: "C8a",
    type: .cercanias,
    colorHex: "#868584",
    stops: [
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c10"]),
        Stop(id: "10200", name: "Villalba de Guadarrama", latitude: 40.6264893, longitude: -4.0080301, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10203", name: "El Escorial", latitude: 40.5853675, longitude: -4.1324053, connectionLineIds: ["madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C8b: Atocha/Chamartín ↔ Cercedilla
// ====================================================================================
let madridC8b = Line(
    id: "madrid_c8b",
    name: "C8b",
    type: .cercanias,
    colorHex: "#868584",
    stops: [
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c10"]),
        Stop(id: "10200", name: "Villalba de Guadarrama", latitude: 40.6264893, longitude: -4.0080301, connectionLineIds: ["madrid_c10"]),
        Stop(id: "12006", name: "Cercedilla", latitude: 40.7376129, longitude: -4.0662985, connectionLineIds: ["madrid_c9"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C9: Cercedilla ↔ Cotos (Mountain line - narrow gauge)
// ====================================================================================
let madridC9 = Line(
    id: "madrid_c9",
    name: "C9",
    type: .cercanias,
    colorHex: "#F3972A",
    stops: [
        Stop(id: "12006", name: "Cercedilla", latitude: 40.7376129, longitude: -4.0662985, connectionLineIds: ["madrid_c8b"]),
        Stop(id: "12023", name: "Los Cotos", latitude: 40.8223419, longitude: -3.9644961, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C10: Villalba ↔ Chamartín / Aeropuerto T4 (complex network)
// ====================================================================================
let madridC10 = Line(
    id: "madrid_c10",
    name: "C10",
    type: .cercanias,
    colorHex: "#BCCF00",
    stops: [
        Stop(id: "10200", name: "Villalba de Guadarrama", latitude: 40.6264893, longitude: -4.0080301, connectionLineIds: ["madrid_c8a", "madrid_c8b"]),
        Stop(id: "10103", name: "Torrelodones", latitude: 40.5745540, longitude: -3.9566013, connectionLineIds: []),
        Stop(id: "10100", name: "Pinar de las Rozas", latitude: 40.5222672, longitude: -3.8822477, connectionLineIds: []),
        Stop(id: "10002", name: "Pozuelo", latitude: 40.4474569, longitude: -3.8002779, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10001", name: "Aravaca", latitude: 40.4484551, longitude: -3.7855547, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c2", "madrid_c7"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8"]),
        Stop(id: "98305", name: "Madrid-Aeropuerto T4", latitude: 40.4924023, longitude: -3.5932297, connectionLineIds: ["madrid_c1"])
    ],
    city: "Madrid"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 11 (C1, C2, C3, C4, C4a, C4b, C5, C7, C8a, C8b, C9, C10)
// Note: C8 has variants C8a and C8b
// Note: C4 has variants C4a and C4b
// Note: This is BASIC extraction with MAIN stations only
// Note: Intermediate stops need to be added from detailed GTFS analysis
// Note: CIVIS service runs on some lines but uses same line numbers
