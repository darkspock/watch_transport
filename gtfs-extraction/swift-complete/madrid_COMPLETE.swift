// MADRID Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 10

// ====================================================================================
// C1: Principe Pio                            -Aeropuerto-T4
// ====================================================================================
let madridC1 = Line(
    id: "madrid_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#75B6E0",
    stops: [
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "98003", name: "Fuente De La Mora", latitude: 40.48472, longitude: -3.6630608, connectionLineIds: []),
        Stop(id: "98304", name: "Valdebebas", latitude: 40.4821016, longitude: -3.6162874, connectionLineIds: []),
        Stop(id: "98305", name: "Madrid-Aeropuerto T4", latitude: 40.4924023, longitude: -3.5932297, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C10: Villalba                                -Aeropuerto-T4
// ====================================================================================
let madridC10 = Line(
    id: "madrid_c10",
    name: "C10",
    type: .cercanias,
    colorHex: "#BCCF00",
    stops: [
        Stop(id: "10200", name: "Villalba De Guadarrama", latitude: 40.6264893, longitude: -4.0080301, connectionLineIds: []),
        Stop(id: "10104", name: "Galapagar-La Navata", latitude: 40.6003138, longitude: -3.982259, connectionLineIds: []),
        Stop(id: "10103", name: "Torrelodones", latitude: 40.574554, longitude: -3.9566013, connectionLineIds: []),
        Stop(id: "10101", name: "Las Matas", latitude: 40.5523869, longitude: -3.8967664, connectionLineIds: []),
        Stop(id: "10100", name: "Pinar De Las Rozas", latitude: 40.5222672, longitude: -3.8822477, connectionLineIds: []),
        Stop(id: "10005", name: "Las Rozas", latitude: 40.4942887, longitude: -3.8681747, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10007", name: "Majadahonda", latitude: 40.4742885, longitude: -3.8462931, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10010", name: "El Barrial-Centro Comercial Pozuelo", latitude: 40.4653918, longitude: -3.8076854, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10002", name: "Pozuelo", latitude: 40.4474569, longitude: -3.8002779, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10001", name: "Aravaca", latitude: 40.4484551, longitude: -3.7855547, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c7"]),
        Stop(id: "18005", name: "Pirámides", latitude: 40.4025341, longitude: -3.7113623, connectionLineIds: ["madrid_c5"]),
        Stop(id: "35609", name: "Embajadores", latitude: 40.4046484, longitude: -3.702579, connectionLineIds: ["madrid_c3", "madrid_c4", "madrid_c5"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.690931, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C2: Guadalajara                             -Chamartín - Clara Campoamor
// ====================================================================================
let madridC2 = Line(
    id: "madrid_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#00943D",
    stops: [
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c10", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.690931, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "70002", name: "Asamblea De Madrid-Entrevías", latitude: 40.3818618, longitude: -3.6680454, connectionLineIds: ["madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "70003", name: "El Pozo", latitude: 40.3760377, longitude: -3.6561407, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70001", name: "Vallecas", latitude: 40.3819607, longitude: -3.6245835, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70109", name: "Santa Eugenia", latitude: 40.3869545, longitude: -3.6089855, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70100", name: "Vicálvaro", latitude: 40.4012524, longitude: -3.595897, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70108", name: "Coslada", latitude: 40.423237, longitude: -3.5611109, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70101", name: "San Fernando De Henares", latitude: 40.4427805, longitude: -3.5339866, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70112", name: "Soto Del Henares", latitude: 40.463964, longitude: -3.4414076, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70111", name: "La Garena", latitude: 40.4805448, longitude: -3.3930055, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70103", name: "Alcalá De Henares", latitude: 40.4890814, longitude: -3.3662457, connectionLineIds: ["madrid_c7"]),
        Stop(id: "70107", name: "Alcalá De Henares-Universidad", latitude: 40.5054303, longitude: -3.3353258, connectionLineIds: []),
        Stop(id: "70104", name: "Meco", latitude: 40.5346731, longitude: -3.2986806, connectionLineIds: []),
        Stop(id: "70105", name: "Azuqueca", latitude: 40.561077, longitude: -3.265397, connectionLineIds: []),
        Stop(id: "70200", name: "Guadalajara", latitude: 40.6441928, longitude: -3.1822602, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C3: Chamartín - Clara Campoamor             -Aranjuez
// ====================================================================================
let madridC3 = Line(
    id: "madrid_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#952585",
    stops: [
        Stop(id: "60200", name: "Aranjuez", latitude: 40.0350257, longitude: -3.6182534, connectionLineIds: []),
        Stop(id: "60105", name: "Ciempozuelos", latitude: 40.1592011, longitude: -3.6101851, connectionLineIds: []),
        Stop(id: "60104", name: "Valdemoro", latitude: 40.1960779, longitude: -3.6649372, connectionLineIds: []),
        Stop(id: "60103", name: "Pinto", latitude: 40.2428555, longitude: -3.7035303, connectionLineIds: []),
        Stop(id: "60102", name: "Getafe-Industrial", latitude: 40.3057176, longitude: -3.7078359, connectionLineIds: []),
        Stop(id: "60109", name: "El Casar", latitude: 40.3185223, longitude: -3.7098062, connectionLineIds: []),
        Stop(id: "60101", name: "San Cristóbal Industrial", latitude: 40.3318587, longitude: -3.69896, connectionLineIds: []),
        Stop(id: "60107", name: "San Cristóbal De Los ángeles", latitude: 40.3424144, longitude: -3.6839795, connectionLineIds: ["madrid_c4"]),
        Stop(id: "60100", name: "Madrid-Villaverde Bajo", latitude: 40.3526762, longitude: -3.6838977, connectionLineIds: ["madrid_c4"]),
        Stop(id: "70002", name: "Asamblea De Madrid-Entrevías", latitude: 40.3818618, longitude: -3.6680454, connectionLineIds: ["madrid_c2", "madrid_c4", "madrid_c7"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c5", "madrid_c7"]),
        Stop(id: "35609", name: "Embajadores", latitude: 40.4046484, longitude: -3.702579, connectionLineIds: ["madrid_c10", "madrid_c4", "madrid_c5"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c7"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.690931, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c7"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c4", "madrid_c7"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c10", "madrid_c2", "madrid_c4", "madrid_c7"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4: Chamartín - Clara Campoamor             -Parla
// ====================================================================================
let madridC4 = Line(
    id: "madrid_c4",
    name: "C4",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "37012", name: "Parla", latitude: 40.2410986, longitude: -3.7692699, connectionLineIds: []),
        Stop(id: "37011", name: "Getafe-Sector 3", latitude: 40.2883893, longitude: -3.7374991, connectionLineIds: []),
        Stop(id: "37002", name: "Getafe-Centro", latitude: 40.3100045, longitude: -3.7339878, connectionLineIds: []),
        Stop(id: "37010", name: "Las Margaritas", latitude: 40.3230989, longitude: -3.7272863, connectionLineIds: []),
        Stop(id: "37001", name: "Madrid-Villaverde Alto", latitude: 40.3415895, longitude: -3.7123508, connectionLineIds: ["madrid_c5"]),
        Stop(id: "35704", name: "Puente Alcocer", latitude: 40.3504482, longitude: -3.7051154, connectionLineIds: ["madrid_c5"]),
        Stop(id: "60107", name: "San Cristóbal De Los ángeles", latitude: 40.3424144, longitude: -3.6839795, connectionLineIds: ["madrid_c3"]),
        Stop(id: "60100", name: "Madrid-Villaverde Bajo", latitude: 40.3526762, longitude: -3.6838977, connectionLineIds: ["madrid_c3"]),
        Stop(id: "70002", name: "Asamblea De Madrid-Entrevías", latitude: 40.3818618, longitude: -3.6680454, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c7"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c5", "madrid_c7"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c5", "madrid_c7"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c5", "madrid_c7"]),
        Stop(id: "35609", name: "Embajadores", latitude: 40.4046484, longitude: -3.702579, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c5"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c7"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.690931, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c7"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c7"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c10", "madrid_c2", "madrid_c3", "madrid_c7"]),
        Stop(id: "17001", name: "Fuencarral", latitude: 40.5015603, longitude: -3.6825042, connectionLineIds: []),
        Stop(id: "17009", name: "Universidad-Cantoblanco", latitude: 40.5438416, longitude: -3.7001551, connectionLineIds: ["madrid_c4a", "madrid_c4b"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4a: Alcobendas-S.Sebast. de los Reyes       -Parla
// ====================================================================================
let madridC4a = Line(
    id: "madrid_c4a",
    name: "C4a",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "17009", name: "Universidad-Cantoblanco", latitude: 40.5438416, longitude: -3.7001551, connectionLineIds: ["madrid_c4", "madrid_c4b"]),
        Stop(id: "19001", name: "Universidad Pontificia De Comillas", latitude: 40.5539697, longitude: -3.6836997, connectionLineIds: []),
        Stop(id: "19002", name: "Valdelasfuentes", latitude: 40.5474339, longitude: -3.6543237, connectionLineIds: []),
        Stop(id: "19003", name: "Alcobendas-San Sebastián De Los Reyes", latitude: 40.5465765, longitude: -3.6351731, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C4b: Colmenar Viejo                          -Parla
// ====================================================================================
let madridC4b = Line(
    id: "madrid_c4b",
    name: "C4b",
    type: .cercanias,
    colorHex: "#2C2A86",
    stops: [
        Stop(id: "17005", name: "Colmenar Viejo", latitude: 40.6452094, longitude: -3.7766142, connectionLineIds: []),
        Stop(id: "17004", name: "Tres Cantos", latitude: 40.5987417, longitude: -3.7155585, connectionLineIds: []),
        Stop(id: "17003", name: "El Goloso", latitude: 40.5588966, longitude: -3.7139714, connectionLineIds: []),
        Stop(id: "17009", name: "Universidad-Cantoblanco", latitude: 40.5438416, longitude: -3.7001551, connectionLineIds: ["madrid_c4", "madrid_c4a"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C5: Mostoles el Soto                        -Humanes
// ====================================================================================
let madridC5 = Line(
    id: "madrid_c5",
    name: "C5",
    type: .cercanias,
    colorHex: "#FECB00",
    stops: [
        Stop(id: "35607", name: "Móstoles-El Soto", latitude: 40.331064, longitude: -3.882456, connectionLineIds: []),
        Stop(id: "35606", name: "Móstoles", latitude: 40.3286626, longitude: -3.8636221, connectionLineIds: []),
        Stop(id: "35610", name: "Las Retamas", latitude: 40.3421153, longitude: -3.8424636, connectionLineIds: []),
        Stop(id: "35605", name: "Alcorcón", latitude: 40.3502269, longitude: -3.8317018, connectionLineIds: []),
        Stop(id: "35604", name: "San José De Valderas", latitude: 40.356613, longitude: -3.815573, connectionLineIds: []),
        Stop(id: "35603", name: "Cuatro Vientos", latitude: 40.3777651, longitude: -3.79151, connectionLineIds: []),
        Stop(id: "35602", name: "Las águilas", latitude: 40.381022, longitude: -3.7801636, connectionLineIds: []),
        Stop(id: "35601", name: "Maestra Justa Freire-Polidep. Aluche", latitude: 40.3836379, longitude: -3.7686869, connectionLineIds: []),
        Stop(id: "35600", name: "Aluche", latitude: 40.3856677, longitude: -3.7607343, connectionLineIds: []),
        Stop(id: "35608", name: "Laguna", latitude: 40.3990603, longitude: -3.7442305, connectionLineIds: []),
        Stop(id: "18005", name: "Pirámides", latitude: 40.4025341, longitude: -3.7113623, connectionLineIds: ["madrid_c10"]),
        Stop(id: "35609", name: "Embajadores", latitude: 40.4046484, longitude: -3.702579, connectionLineIds: ["madrid_c10", "madrid_c3", "madrid_c4"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7"]),
        Stop(id: "35702", name: "Doce De Octubre", latitude: 40.378921, longitude: -3.6986988, connectionLineIds: []),
        Stop(id: "35703", name: "Orcasitas", latitude: 40.3671021, longitude: -3.7042307, connectionLineIds: []),
        Stop(id: "35704", name: "Puente Alcocer", latitude: 40.3504482, longitude: -3.7051154, connectionLineIds: ["madrid_c4"]),
        Stop(id: "37001", name: "Madrid-Villaverde Alto", latitude: 40.3415895, longitude: -3.7123508, connectionLineIds: ["madrid_c4"]),
        Stop(id: "35009", name: "Zarzaquemada", latitude: 40.3408526, longitude: -3.7482632, connectionLineIds: []),
        Stop(id: "35001", name: "Leganés", latitude: 40.328643, longitude: -3.7713161, connectionLineIds: []),
        Stop(id: "35011", name: "Parque Polvoranca", latitude: 40.3125738, longitude: -3.7834937, connectionLineIds: []),
        Stop(id: "35010", name: "La Serna-Fuenlabrada", latitude: 40.2968173, longitude: -3.7926235, connectionLineIds: []),
        Stop(id: "35002", name: "Fuenlabrada", latitude: 40.2833784, longitude: -3.7994429, connectionLineIds: []),
        Stop(id: "35012", name: "Humanes", latitude: 40.2558101, longitude: -3.8287055, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// C7: Principe Pio                            -Chamartín - Clara Campoamor
// ====================================================================================
let madridC7 = Line(
    id: "madrid_c7",
    name: "C7",
    type: .cercanias,
    colorHex: "#E5202A",
    stops: [
        Stop(id: "70103", name: "Alcalá De Henares", latitude: 40.4890814, longitude: -3.3662457, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70111", name: "La Garena", latitude: 40.4805448, longitude: -3.3930055, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70112", name: "Soto Del Henares", latitude: 40.463964, longitude: -3.4414076, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70101", name: "San Fernando De Henares", latitude: 40.4427805, longitude: -3.5339866, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70108", name: "Coslada", latitude: 40.423237, longitude: -3.5611109, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70100", name: "Vicálvaro", latitude: 40.4012524, longitude: -3.595897, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70109", name: "Santa Eugenia", latitude: 40.3869545, longitude: -3.6089855, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70001", name: "Vallecas", latitude: 40.3819607, longitude: -3.6245835, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70003", name: "El Pozo", latitude: 40.3760377, longitude: -3.6561407, connectionLineIds: ["madrid_c2"]),
        Stop(id: "70002", name: "Asamblea De Madrid-Entrevías", latitude: 40.3818618, longitude: -3.6680454, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4"]),
        Stop(id: "18003", name: "Méndez álvaro P.v.", latitude: 40.3957768, longitude: -3.677844, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5"]),
        Stop(id: "18004", name: "Delicias", latitude: 40.4004375, longitude: -3.6927766, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5"]),
        Stop(id: "18101", name: "Sol", latitude: 40.4168665, longitude: -3.7028765, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.690931, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c1", "madrid_c10", "madrid_c2", "madrid_c3", "madrid_c4"]),
        Stop(id: "97201", name: "Madrid-Ramón Y Cajal", latitude: 40.4881473, longitude: -3.6948037, connectionLineIds: []),
        Stop(id: "97200", name: "Mirasierra-Paco De Lucía", latitude: 40.499759, longitude: -3.7092505, connectionLineIds: []),
        Stop(id: "97100", name: "Pitis", latitude: 40.4954173, longitude: -3.7261603, connectionLineIds: []),
        Stop(id: "10005", name: "Las Rozas", latitude: 40.4942887, longitude: -3.8681747, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10007", name: "Majadahonda", latitude: 40.4742885, longitude: -3.8462931, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10010", name: "El Barrial-Centro Comercial Pozuelo", latitude: 40.4653918, longitude: -3.8076854, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10002", name: "Pozuelo", latitude: 40.4474569, longitude: -3.8002779, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10001", name: "Aravaca", latitude: 40.4484551, longitude: -3.7855547, connectionLineIds: ["madrid_c10"]),
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c10"])
    ],
    city: "Madrid"
)

// ====================================================================================
// C9: Cercedilla                              -Cotos
// ====================================================================================
let madridC9 = Line(
    id: "madrid_c9",
    name: "C9",
    type: .cercanias,
    colorHex: "#F3972A",
    stops: [
        Stop(id: "12006", name: "Cercedilla", latitude: 40.7376129, longitude: -4.0662985, connectionLineIds: []),
        Stop(id: "12020", name: "Puerto De Navacerrada", latitude: 40.7844678, longitude: -4.0047744, connectionLineIds: []),
        Stop(id: "12023", name: "Los Cotos", latitude: 40.8223419, longitude: -3.9644961, connectionLineIds: [])
    ],
    city: "Madrid"
)

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 10
// C1: 4 stops
// C10: 20 stops
// C2: 21 stops
// C3: 18 stops
// C4: 19 stops
// C4a: 4 stops
// C4b: 4 stops
// C5: 25 stops
// C7: 26 stops
// C9: 3 stops
// Total stops: 144 (with duplicates across lines)
