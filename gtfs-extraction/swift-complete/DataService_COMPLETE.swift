//
//  DataService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//
//  UPDATED: 2026-01-14 with COMPLETE GTFS extraction for all Spanish Cercanías networks
//  Total: 39 Cercanías lines with 741 stops across 6 networks
//  Data source: GTFS (Hybrid: stop_times.txt + shapes.txt)
//

import Foundation

@Observable
class DataService {
    var lines: [Line] = []
    var stops: [Stop] = []
    var isLoading = false
    var error: Error?

    // MARK: - Public Methods

    // Fetch all lines and stops (placeholder for NAP API integration)
    func fetchTransportData() async {
        isLoading = true
        defer { isLoading = false }

        // TODO: Replace with actual NAP API call
        // For now, load mock data
        await loadMockData()
    }

    // Fetch arrivals for a specific stop (placeholder for NAP API integration)
    func fetchArrivals(for stopId: String) async -> [Arrival] {
        // TODO: Replace with actual GTFS-RT API call
        // For now, return mock arrivals
        return generateMockArrivals(for: stopId)
    }

    // Get stop by ID
    func getStop(by id: String) -> Stop? {
        return stops.first { $0.id == id }
    }

    // Get line by ID
    func getLine(by id: String) -> Line? {
        return lines.first { $0.id == id }
    }

    // MARK: - Data Loading

    private func loadMockData() async {

        // ========================================
        // MADRID METRO (Mock data - to be replaced)
        // ========================================

        // Madrid Metro Line 1
        let line1Stops = [
            Stop(id: "stop_pinar", name: "Pinar de Chamartín", latitude: 40.4595, longitude: -3.6802, connectionLineIds: ["line4"]),
            Stop(id: "stop_bambú", name: "Bambú", latitude: 40.4553, longitude: -3.6802, connectionLineIds: []),
            Stop(id: "stop_chamartin", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line10"]),
            Stop(id: "stop_sol", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line2", "line3"]),
        ]

        let line1 = Line(
            id: "line1",
            name: "L1",
            type: .metro,
            colorHex: "#2ca5dd",
            stops: line1Stops,
            city: "Madrid"
        )

        let line2 = Line(
            id: "line2",
            name: "L2",
            type: .metro,
            colorHex: "#e0292f",
            stops: [
                Stop(id: "stop_cuatro_caminos", name: "Cuatro Caminos", latitude: 40.4456, longitude: -3.7098, connectionLineIds: ["line1", "line6"]),
                Stop(id: "stop_goya", name: "Goya", latitude: 40.4265, longitude: -3.6768, connectionLineIds: []),
                Stop(id: "stop_retiro", name: "Retiro", latitude: 40.4120, longitude: -3.6830, connectionLineIds: []),
            ],
            city: "Madrid"
        )

        // ========================================
        // COMPLETE SPANISH CERCANÍAS NETWORKS
        // Source: GTFS extraction 2026-01-14
        // ========================================


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

let barcelonaR1 = Line(
    id: "barcelona_r1",
    name: "R1",
    type: .cercanias,
    colorHex: "#7DBCEC",
    stops: [
        Stop(id: "72300", name: "Molins De Rei", latitude: 41.4098958, longitude: 2.02077275, connectionLineIds: []),
        Stop(id: "72301", name: "Sant Feliu De Llobregat", latitude: 41.3830018, longitude: 2.0479197, connectionLineIds: []),
        Stop(id: "72302", name: "Sant Joan Despí", latitude: 41.3685805, longitude: 2.06020835, connectionLineIds: []),
        Stop(id: "72303", name: "Cornellà", latitude: 41.3575214, longitude: 2.07054907, connectionLineIds: []),
        Stop(id: "72305", name: "L'hospitalet De Llobregat", latitude: 41.3642038, longitude: 2.10091749, connectionLineIds: ["barcelona_r3"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78806", name: "Barcelona-La Sagrera-Meridiana", latitude: 41.421848, longitude: 2.18711031, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79004", name: "Barcelona-Sant Andreu", latitude: 41.4361251, longitude: 2.19319866, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79403", name: "Sant Adrià De Besòs", latitude: 41.4244316, longitude: 2.23048178, connectionLineIds: []),
        Stop(id: "79404", name: "Badalona", latitude: 41.4458838, longitude: 2.24892096, connectionLineIds: []),
        Stop(id: "79405", name: "Montgat", latitude: 41.4630211, longitude: 2.2721551, connectionLineIds: []),
        Stop(id: "79406", name: "Montgat-Nord", latitude: 41.468786, longitude: 2.28669661, connectionLineIds: []),
        Stop(id: "79407", name: "El Masnou", latitude: 41.4770363, longitude: 2.3103772, connectionLineIds: []),
        Stop(id: "79408", name: "Ocata", latitude: 41.4790211, longitude: 2.31953267, connectionLineIds: []),
        Stop(id: "79409", name: "Premià De Mar", latitude: 41.4877522, longitude: 2.35485608, connectionLineIds: []),
        Stop(id: "79410", name: "Vilassar De Mar", latitude: 41.5006285, longitude: 2.38986104, connectionLineIds: []),
        Stop(id: "79412", name: "Cabrera De Mar-Vilassar De Mar", latitude: 41.5067718, longitude: 2.40162431, connectionLineIds: []),
        Stop(id: "79500", name: "Mataró", latitude: 41.5333852, longitude: 2.44553025, connectionLineIds: []),
        Stop(id: "79501", name: "Sant Andreu De Llavaneres", latitude: 41.5555467, longitude: 2.49826463, connectionLineIds: []),
        Stop(id: "79502", name: "Caldes D'estrac", latitude: 41.5686082, longitude: 2.52598143, connectionLineIds: []),
        Stop(id: "79600", name: "Arenys De Mar", latitude: 41.577699, longitude: 2.54933744, connectionLineIds: []),
        Stop(id: "79601", name: "Canet De Mar", latitude: 41.5866691, longitude: 2.58128887, connectionLineIds: []),
        Stop(id: "79602", name: "Sant Pol De Mar", latitude: 41.6017549, longitude: 2.62459756, connectionLineIds: []),
        Stop(id: "79603", name: "Calella", latitude: 41.6146911, longitude: 2.66599517, connectionLineIds: []),
        Stop(id: "79604", name: "Pineda De Mar", latitude: 41.6224449, longitude: 2.69355042, connectionLineIds: []),
        Stop(id: "79608", name: "Santa Susana", latitude: 41.6300971, longitude: 2.7159698, connectionLineIds: []),
        Stop(id: "79605", name: "Malgrat De Mar", latitude: 41.641602, longitude: 2.74127903, connectionLineIds: []),
        Stop(id: "79606", name: "Blanes", latitude: 41.6736157, longitude: 2.7692697, connectionLineIds: []),
        Stop(id: "79607", name: "Tordera", latitude: 41.7071687, longitude: 2.71957063, connectionLineIds: []),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r11", "barcelona_r2n"])
    ],
    city: "Barcelona"
)

let barcelonaR11 = Line(
    id: "barcelona_r11",
    name: "R11",
    type: .cercanias,
    colorHex: "#0069AA",
    stops: [
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78806", name: "Barcelona-La Sagrera-Meridiana", latitude: 41.421848, longitude: 2.18711031, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79004", name: "Barcelona-Sant Andreu", latitude: 41.4361251, longitude: 2.19319866, connectionLineIds: ["barcelona_r1", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78801", name: "Torre Del Baró-Vallbona", latitude: 41.4609684, longitude: 2.18102036, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78800", name: "Montcada-Bifurcació", latitude: 41.4698402, longitude: 2.18001578, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78708", name: "Montcada I Reixac-Manresa", latitude: 41.4839402, longitude: 2.1854042, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79005", name: "Montcada I Reixac", latitude: 41.4842254, longitude: 2.1880892, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "77002", name: "Montcada-Ripollet", latitude: 41.4968022, longitude: 2.18192841, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79011", name: "La Llagosta", latitude: 41.5104566, longitude: 2.19973279, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79006", name: "Mollet-Sant Fost", latitude: 41.5335634, longitude: 2.21766516, connectionLineIds: ["barcelona_r2", "barcelona_r2n", "barcelona_r3", "barcelona_r8"]),
        Stop(id: "79100", name: "Granollers-Centre", latitude: 41.5997447, longitude: 2.29126962, connectionLineIds: ["barcelona_r2"]),
        Stop(id: "79109", name: "Les Franqueses-Granollers Nord", latitude: 41.6172549, longitude: 2.2944318, connectionLineIds: ["barcelona_r2n", "barcelona_r3"]),
        Stop(id: "77100", name: "Les Franqueses Del Vallès", latitude: 41.6297885, longitude: 2.29516461, connectionLineIds: ["barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79101", name: "Cardedeu", latitude: 41.6367012, longitude: 2.35626265, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79102", name: "Llinars Del Vallès", latitude: 41.6380367, longitude: 2.40445769, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79103", name: "Palautordera", latitude: 41.6719522, longitude: 2.45421488, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79105", name: "Gualba", latitude: 41.7181901, longitude: 2.53878373, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79107", name: "Hostalric", latitude: 41.747788, longitude: 2.63165011, connectionLineIds: ["barcelona_r2n"]),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r1", "barcelona_r2n"]),
        Stop(id: "79203", name: "Caldes De Malavella", latitude: 41.84111, longitude: 2.80076692, connectionLineIds: []),
        Stop(id: "79204", name: "Riudellots", latitude: 41.896297, longitude: 2.81157037, connectionLineIds: []),
        Stop(id: "79205", name: "Fornells De La Selva", latitude: 41.935043, longitude: 2.80978324, connectionLineIds: []),
        Stop(id: "79300", name: "Girona", latitude: 41.9793629, longitude: 2.81693689, connectionLineIds: []),
        Stop(id: "79301", name: "Celrà", latitude: 42.0271984, longitude: 2.87490587, connectionLineIds: []),
        Stop(id: "79302", name: "Bordils-Juià", latitude: 42.0370568, longitude: 2.91529561, connectionLineIds: []),
        Stop(id: "79303", name: "Flaçà", latitude: 42.047477, longitude: 2.95740315, connectionLineIds: []),
        Stop(id: "79304", name: "Sant Jordi Desvalls", latitude: 42.0683023, longitude: 2.96447664, connectionLineIds: []),
        Stop(id: "79305", name: "Camallera", latitude: 42.1223297, longitude: 2.96536522, connectionLineIds: []),
        Stop(id: "79306", name: "Sant Miquel De Fluvià", latitude: 42.1721019, longitude: 2.98959828, connectionLineIds: []),
        Stop(id: "79309", name: "Figueres", latitude: 42.2651134, longitude: 2.96880074, connectionLineIds: []),
        Stop(id: "79311", name: "Vilajuïga", latitude: 42.3256691, longitude: 3.08754626, connectionLineIds: []),
        Stop(id: "79312", name: "Llançà", latitude: 42.3666194, longitude: 3.1489746, connectionLineIds: []),
        Stop(id: "79314", name: "Colera", latitude: 42.4068837, longitude: 3.15434316, connectionLineIds: []),
        Stop(id: "79315", name: "Portbou", latitude: 42.4245908, longitude: 3.15801841, connectionLineIds: []),
        Stop(id: "79316", name: "Cerbère", latitude: 42.441664, longitude: 3.16314935, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR14 = Line(
    id: "barcelona_r14",
    name: "R14",
    type: .cercanias,
    colorHex: "#6C60A8",
    stops: [
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71704", name: "Platja De Castelldefels", latitude: 41.2669823, longitude: 1.95713579, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71703", name: "Garraf", latitude: 41.2545875, longitude: 1.90250383, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71701", name: "Sitges", latitude: 41.2391315, longitude: 1.80969184, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71700", name: "Vilanova I La Geltrú", latitude: 41.2203207, longitude: 1.73077249, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71604", name: "Cubelles", latitude: 41.2043246, longitude: 1.6759772, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71603", name: "Cunit", latitude: 41.1950415, longitude: 1.63194242, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71602", name: "Segur De Calafell", latitude: 41.1925787, longitude: 1.60643599, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71601", name: "Calafell", latitude: 41.1896703, longitude: 1.57500937, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71600", name: "Sant Vicenç De Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71503", name: "Torredembarra", latitude: 41.1427923, longitude: 1.40578377, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71502", name: "Altafulla-Tamarit", latitude: 41.1366479, longitude: 1.37341488, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_rt1"]),
        Stop(id: "71401", name: "Vila-Seca", latitude: 41.1128193, longitude: 1.15037877, connectionLineIds: ["barcelona_r15", "barcelona_r16", "barcelona_rt1"]),
        Stop(id: "71400", name: "Reus", latitude: 41.1605229, longitude: 1.10008978, connectionLineIds: ["barcelona_r15", "barcelona_rt1"]),
        Stop(id: "73102", name: "La Selva Del Camp", latitude: 41.2111544, longitude: 1.14396003, connectionLineIds: []),
        Stop(id: "73101", name: "Alcover", latitude: 41.2616066, longitude: 1.17416002, connectionLineIds: []),
        Stop(id: "73100", name: "La Plana-Picamoixons", latitude: 41.3061987, longitude: 1.19488293, connectionLineIds: []),
        Stop(id: "73010", name: "La Riba", latitude: 41.3184926, longitude: 1.1813126, connectionLineIds: []),
        Stop(id: "73009", name: "Vilaverd", latitude: 41.3376633, longitude: 1.17653235, connectionLineIds: []),
        Stop(id: "73008", name: "Montblanc", latitude: 41.3766254, longitude: 1.16554869, connectionLineIds: []),
        Stop(id: "73007", name: "L'espluga De Francolí", latitude: 41.4006616, longitude: 1.10336094, connectionLineIds: []),
        Stop(id: "73006", name: "Vimbodí I Poblet", latitude: 41.4027277, longitude: 1.04603327, connectionLineIds: []),
        Stop(id: "73005", name: "Vinaixa", latitude: 41.425141, longitude: 0.9703737, connectionLineIds: []),
        Stop(id: "73004", name: "La Floresta", latitude: 41.5048872, longitude: 0.9217547, connectionLineIds: []),
        Stop(id: "73002", name: "Juneda", latitude: 41.5439328, longitude: 0.82554185, connectionLineIds: []),
        Stop(id: "73001", name: "Puigverd De Lleida-Artesa", latitude: 41.5537015, longitude: 0.73342706, connectionLineIds: []),
        Stop(id: "78400", name: "Lleida-Pirineus", latitude: 41.62013, longitude: 0.63365328, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR15 = Line(
    id: "barcelona_r15",
    name: "R15",
    type: .cercanias,
    colorHex: "#978571",
    stops: [
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71704", name: "Platja De Castelldefels", latitude: 41.2669823, longitude: 1.95713579, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71703", name: "Garraf", latitude: 41.2545875, longitude: 1.90250383, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71701", name: "Sitges", latitude: 41.2391315, longitude: 1.80969184, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71700", name: "Vilanova I La Geltrú", latitude: 41.2203207, longitude: 1.73077249, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71604", name: "Cubelles", latitude: 41.2043246, longitude: 1.6759772, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71603", name: "Cunit", latitude: 41.1950415, longitude: 1.63194242, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71602", name: "Segur De Calafell", latitude: 41.1925787, longitude: 1.60643599, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71601", name: "Calafell", latitude: 41.1896703, longitude: 1.57500937, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71600", name: "Sant Vicenç De Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71503", name: "Torredembarra", latitude: 41.1427923, longitude: 1.40578377, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71502", name: "Altafulla-Tamarit", latitude: 41.1366479, longitude: 1.37341488, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_r17", "barcelona_rt1"]),
        Stop(id: "71401", name: "Vila-Seca", latitude: 41.1128193, longitude: 1.15037877, connectionLineIds: ["barcelona_r14", "barcelona_r16", "barcelona_rt1"]),
        Stop(id: "71400", name: "Reus", latitude: 41.1605229, longitude: 1.10008978, connectionLineIds: ["barcelona_r14", "barcelona_rt1"]),
        Stop(id: "71307", name: "Les Borges Del Camp", latitude: 41.1665064, longitude: 1.0221323, connectionLineIds: []),
        Stop(id: "71306", name: "Riudecanyes-Botarell", latitude: 41.1400577, longitude: 0.97574775, connectionLineIds: []),
        Stop(id: "71305", name: "Duesaigües-L'argentera", latitude: 41.1436928, longitude: 0.92087096, connectionLineIds: []),
        Stop(id: "71304", name: "Pradell", latitude: 41.1333595, longitude: 0.85865032, connectionLineIds: []),
        Stop(id: "71303", name: "Marçà-Falset", latitude: 41.1309421, longitude: 0.81041774, connectionLineIds: []),
        Stop(id: "71302", name: "Capçanes", latitude: 41.1020902, longitude: 0.78036099, connectionLineIds: []),
        Stop(id: "71300", name: "Móra La Nova", latitude: 41.1065823, longitude: 0.65321819, connectionLineIds: []),
        Stop(id: "71211", name: "Ascó", latitude: 41.1823727, longitude: 0.56902524, connectionLineIds: []),
        Stop(id: "71210", name: "Flix", latitude: 41.2293651, longitude: 0.54010012, connectionLineIds: []),
        Stop(id: "71209", name: "Riba-Roja D'ebre", latitude: 41.2485594, longitude: 0.48103178, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR16 = Line(
    id: "barcelona_r16",
    name: "R16",
    type: .cercanias,
    colorHex: "#B52B46",
    stops: [
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71704", name: "Platja De Castelldefels", latitude: 41.2669823, longitude: 1.95713579, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71703", name: "Garraf", latitude: 41.2545875, longitude: 1.90250383, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71701", name: "Sitges", latitude: 41.2391315, longitude: 1.80969184, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71700", name: "Vilanova I La Geltrú", latitude: 41.2203207, longitude: 1.73077249, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71604", name: "Cubelles", latitude: 41.2043246, longitude: 1.6759772, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71603", name: "Cunit", latitude: 41.1950415, longitude: 1.63194242, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71602", name: "Segur De Calafell", latitude: 41.1925787, longitude: 1.60643599, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71601", name: "Calafell", latitude: 41.1896703, longitude: 1.57500937, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71600", name: "Sant Vicenç De Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71503", name: "Torredembarra", latitude: 41.1427923, longitude: 1.40578377, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17"]),
        Stop(id: "71502", name: "Altafulla-Tamarit", latitude: 41.1366479, longitude: 1.37341488, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17"]),
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r17", "barcelona_rt1"]),
        Stop(id: "71401", name: "Vila-Seca", latitude: 41.1128193, longitude: 1.15037877, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_rt1"]),
        Stop(id: "65422", name: "Cambrils", latitude: 41.0815642, longitude: 1.04603752, connectionLineIds: []),
        Stop(id: "65420", name: "L'hospitalet De L'infant", latitude: 40.99939, longitude: 0.91253887, connectionLineIds: []),
        Stop(id: "65405", name: "L'ametlla De Mar", latitude: 40.8862, longitude: 0.80045321, connectionLineIds: []),
        Stop(id: "65404", name: "L'ampolla-El Perelló-Deltebre", latitude: 40.8119898, longitude: 0.70826336, connectionLineIds: []),
        Stop(id: "65403", name: "Camarles-Deltebre", latitude: 40.7747633, longitude: 0.67176095, connectionLineIds: []),
        Stop(id: "65400", name: "Tortosa", latitude: 40.807333, longitude: 0.5230136, connectionLineIds: []),
        Stop(id: "65401", name: "Camp-Redó", latitude: 40.7591556, longitude: 0.55584433, connectionLineIds: []),
        Stop(id: "65402", name: "L'aldea-Amposta-Tortosa", latitude: 40.753564, longitude: 0.61430923, connectionLineIds: []),
        Stop(id: "65314", name: "Ulldecona-Alcanar-La Sénia", latitude: 40.5959267, longitude: 0.44927448, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR17 = Line(
    id: "barcelona_r17",
    name: "R17",
    type: .cercanias,
    colorHex: "#F3B12E",
    stops: [
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71704", name: "Platja De Castelldefels", latitude: 41.2669823, longitude: 1.95713579, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71703", name: "Garraf", latitude: 41.2545875, longitude: 1.90250383, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71701", name: "Sitges", latitude: 41.2391315, longitude: 1.80969184, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71700", name: "Vilanova I La Geltrú", latitude: 41.2203207, longitude: 1.73077249, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71604", name: "Cubelles", latitude: 41.2043246, longitude: 1.6759772, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71603", name: "Cunit", latitude: 41.1950415, longitude: 1.63194242, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71602", name: "Segur De Calafell", latitude: 41.1925787, longitude: 1.60643599, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71601", name: "Calafell", latitude: 41.1896703, longitude: 1.57500937, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71600", name: "Sant Vicenç De Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r2s"]),
        Stop(id: "71503", name: "Torredembarra", latitude: 41.1427923, longitude: 1.40578377, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16"]),
        Stop(id: "71502", name: "Altafulla-Tamarit", latitude: 41.1366479, longitude: 1.37341488, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16"]),
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_rt1"]),
        Stop(id: "65411", name: "Salou-Port Aventura", latitude: 41.0884798, longitude: 1.14605195, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR2 = Line(
    id: "barcelona_r2",
    name: "R2",
    type: .cercanias,
    colorHex: "#26A741",
    stops: [
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78806", name: "Barcelona-La Sagrera-Meridiana", latitude: 41.421848, longitude: 2.18711031, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78802", name: "Fabra I Puig", latitude: 41.4303481, longitude: 2.18332907, connectionLineIds: ["barcelona_r3"]),
        Stop(id: "79004", name: "Barcelona-Sant Andreu", latitude: 41.4361251, longitude: 2.19319866, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78801", name: "Torre Del Baró-Vallbona", latitude: 41.4609684, longitude: 2.18102036, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78800", name: "Montcada-Bifurcació", latitude: 41.4698402, longitude: 2.18001578, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78708", name: "Montcada I Reixac-Manresa", latitude: 41.4839402, longitude: 2.1854042, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79005", name: "Montcada I Reixac", latitude: 41.4842254, longitude: 2.1880892, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "77002", name: "Montcada-Ripollet", latitude: 41.4968022, longitude: 2.18192841, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79006", name: "Mollet-Sant Fost", latitude: 41.5335634, longitude: 2.21766516, connectionLineIds: ["barcelona_r11", "barcelona_r2n", "barcelona_r3", "barcelona_r8"]),
        Stop(id: "79100", name: "Granollers-Centre", latitude: 41.5997447, longitude: 2.29126962, connectionLineIds: ["barcelona_r11"])
    ],
    city: "Barcelona"
)

let barcelonaR2N = Line(
    id: "barcelona_r2n",
    name: "R2N",
    type: .cercanias,
    colorHex: "#D0DF00",
    stops: [
        Stop(id: "72400", name: "El Prat Aeroport", latitude: 41.3041813, longitude: 2.07340133, connectionLineIds: []),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2s", "barcelona_r3"]),
        Stop(id: "78806", name: "Barcelona-La Sagrera-Meridiana", latitude: 41.421848, longitude: 2.18711031, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "79004", name: "Barcelona-Sant Andreu", latitude: 41.4361251, longitude: 2.19319866, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "78801", name: "Torre Del Baró-Vallbona", latitude: 41.4609684, longitude: 2.18102036, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "78800", name: "Montcada-Bifurcació", latitude: 41.4698402, longitude: 2.18001578, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "78708", name: "Montcada I Reixac-Manresa", latitude: 41.4839402, longitude: 2.1854042, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "79005", name: "Montcada I Reixac", latitude: 41.4842254, longitude: 2.1880892, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "77002", name: "Montcada-Ripollet", latitude: 41.4968022, longitude: 2.18192841, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3"]),
        Stop(id: "79011", name: "La Llagosta", latitude: 41.5104566, longitude: 2.19973279, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79006", name: "Mollet-Sant Fost", latitude: 41.5335634, longitude: 2.21766516, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r3", "barcelona_r8"]),
        Stop(id: "79109", name: "Les Franqueses-Granollers Nord", latitude: 41.6172549, longitude: 2.2944318, connectionLineIds: ["barcelona_r11", "barcelona_r3"]),
        Stop(id: "77100", name: "Les Franqueses Del Vallès", latitude: 41.6297885, longitude: 2.29516461, connectionLineIds: ["barcelona_r11", "barcelona_r3"]),
        Stop(id: "79101", name: "Cardedeu", latitude: 41.6367012, longitude: 2.35626265, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79102", name: "Llinars Del Vallès", latitude: 41.6380367, longitude: 2.40445769, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79103", name: "Palautordera", latitude: 41.6719522, longitude: 2.45421488, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79105", name: "Gualba", latitude: 41.7181901, longitude: 2.53878373, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79106", name: "Riells I Viabrea-Breda", latitude: 41.7263582, longitude: 2.56889584, connectionLineIds: []),
        Stop(id: "79107", name: "Hostalric", latitude: 41.747788, longitude: 2.63165011, connectionLineIds: ["barcelona_r11"]),
        Stop(id: "79200", name: "Maçanet-Massanes", latitude: 41.7724212, longitude: 2.67385865, connectionLineIds: ["barcelona_r1", "barcelona_r11"])
    ],
    city: "Barcelona"
)

let barcelonaR2S = Line(
    id: "barcelona_r2s",
    name: "R2S",
    type: .cercanias,
    colorHex: "#146520",
    stops: [
        Stop(id: "71600", name: "Sant Vicenç De Calders", latitude: 41.1862102, longitude: 1.52480358, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71601", name: "Calafell", latitude: 41.1896703, longitude: 1.57500937, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71602", name: "Segur De Calafell", latitude: 41.1925787, longitude: 1.60643599, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71603", name: "Cunit", latitude: 41.1950415, longitude: 1.63194242, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71604", name: "Cubelles", latitude: 41.2043246, longitude: 1.6759772, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71700", name: "Vilanova I La Geltrú", latitude: 41.2203207, longitude: 1.73077249, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71701", name: "Sitges", latitude: 41.2391315, longitude: 1.80969184, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71703", name: "Garraf", latitude: 41.2545875, longitude: 1.90250383, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71704", name: "Platja De Castelldefels", latitude: 41.2669823, longitude: 1.95713579, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71705", name: "Castelldefels", latitude: 41.2790474, longitude: 1.97915126, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2"]),
        Stop(id: "71706", name: "Gavà", latitude: 41.3034722, longitude: 2.01053111, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2"]),
        Stop(id: "71709", name: "Viladecans", latitude: 41.3095086, longitude: 2.02741857, connectionLineIds: []),
        Stop(id: "71707", name: "El Prat De Llobregat", latitude: 41.3309401, longitude: 2.08934473, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "71708", name: "Bellvitge-Gornal", latitude: 41.3549216, longitude: 2.1152733, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r3"])
    ],
    city: "Barcelona"
)

let barcelonaR3 = Line(
    id: "barcelona_r3",
    name: "R3",
    type: .cercanias,
    colorHex: "#E54A3C",
    stops: [
        Stop(id: "72305", name: "L'hospitalet De Llobregat", latitude: 41.3642038, longitude: 2.10091749, connectionLineIds: ["barcelona_r1"]),
        Stop(id: "71801", name: "Barcelona-Sants", latitude: 41.3798632, longitude: 2.14101688, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "71802", name: "Barcelona-Passeig De Gràcia", latitude: 41.3920862, longitude: 2.16533862, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "78805", name: "Barcelona-Plaça De Catalunya", latitude: 41.3879231, longitude: 2.16970383, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "79400", name: "Barcelona Estació De França", latitude: 41.3844866, longitude: 2.18534785, connectionLineIds: ["barcelona_r1", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2s"]),
        Stop(id: "78804", name: "Barcelona-Arc De Triomf", latitude: 41.3919048, longitude: 2.18063916, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "79009", name: "Barcelona-El Clot", latitude: 41.4092979, longitude: 2.18719759, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17", "barcelona_r2", "barcelona_r2n", "barcelona_r2s"]),
        Stop(id: "78806", name: "Barcelona-La Sagrera-Meridiana", latitude: 41.421848, longitude: 2.18711031, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "78802", name: "Fabra I Puig", latitude: 41.4303481, longitude: 2.18332907, connectionLineIds: ["barcelona_r2"]),
        Stop(id: "79004", name: "Barcelona-Sant Andreu", latitude: 41.4361251, longitude: 2.19319866, connectionLineIds: ["barcelona_r1", "barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "78801", name: "Torre Del Baró-Vallbona", latitude: 41.4609684, longitude: 2.18102036, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "78800", name: "Montcada-Bifurcació", latitude: 41.4698402, longitude: 2.18001578, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "78708", name: "Montcada I Reixac-Manresa", latitude: 41.4839402, longitude: 2.1854042, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "79005", name: "Montcada I Reixac", latitude: 41.4842254, longitude: 2.1880892, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "77002", name: "Montcada-Ripollet", latitude: 41.4968022, longitude: 2.18192841, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n"]),
        Stop(id: "72508", name: "Santa Perpètua De Mogoda-Riera De Caldes", latitude: 41.5262297, longitude: 2.18633867, connectionLineIds: ["barcelona_r8"]),
        Stop(id: "77003", name: "Santa Perpètua De Mogoda La Florida", latitude: 41.5262041, longitude: 2.18623384, connectionLineIds: ["barcelona_r8"]),
        Stop(id: "79006", name: "Mollet-Sant Fost", latitude: 41.5335634, longitude: 2.21766516, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n", "barcelona_r8"]),
        Stop(id: "77004", name: "Mollet-Santa Rosa", latitude: 41.5366617, longitude: 2.20616865, connectionLineIds: []),
        Stop(id: "77005", name: "Parets Del Vallès", latitude: 41.556269, longitude: 2.22600409, connectionLineIds: []),
        Stop(id: "77006", name: "Granollers-Canovelles", latitude: 41.6114637, longitude: 2.27686073, connectionLineIds: []),
        Stop(id: "79109", name: "Les Franqueses-Granollers Nord", latitude: 41.6172549, longitude: 2.2944318, connectionLineIds: ["barcelona_r11", "barcelona_r2n"]),
        Stop(id: "77100", name: "Les Franqueses Del Vallès", latitude: 41.6297885, longitude: 2.29516461, connectionLineIds: ["barcelona_r11", "barcelona_r2n"]),
        Stop(id: "77102", name: "La Garriga", latitude: 41.6846272, longitude: 2.28879559, connectionLineIds: []),
        Stop(id: "77103", name: "Figaró", latitude: 41.7213454, longitude: 2.27160129, connectionLineIds: []),
        Stop(id: "77104", name: "Sant Martí De Centelles", latitude: 41.7605736, longitude: 2.24890462, connectionLineIds: []),
        Stop(id: "77105", name: "Centelles", latitude: 41.7993947, longitude: 2.22263552, connectionLineIds: []),
        Stop(id: "77106", name: "Balenyà-Els Hostalets", latitude: 41.8149511, longitude: 2.23331523, connectionLineIds: []),
        Stop(id: "77107", name: "Balenyà-Tona-Seva", latitude: 41.8419076, longitude: 2.2474424, connectionLineIds: []),
        Stop(id: "77109", name: "Vic", latitude: 41.9310958, longitude: 2.24885665, connectionLineIds: []),
        Stop(id: "77110", name: "Manlleu", latitude: 41.9998601, longitude: 2.26929589, connectionLineIds: []),
        Stop(id: "77111", name: "Torelló", latitude: 42.0520113, longitude: 2.25997226, connectionLineIds: []),
        Stop(id: "77112", name: "Borgonyà", latitude: 42.0646586, longitude: 2.24200567, connectionLineIds: []),
        Stop(id: "77113", name: "Sant Quirze De Besora-Montesquiu", latitude: 42.1048488, longitude: 2.21773349, connectionLineIds: []),
        Stop(id: "77114", name: "La Farga De Bebié", latitude: 42.1300729, longitude: 2.20393566, connectionLineIds: []),
        Stop(id: "77200", name: "Ripoll", latitude: 42.1961284, longitude: 2.19584128, connectionLineIds: []),
        Stop(id: "77301", name: "Campdevànol", latitude: 42.2217131, longitude: 2.16575839, connectionLineIds: []),
        Stop(id: "77303", name: "Ribes De Freser", latitude: 42.3002126, longitude: 2.16619947, connectionLineIds: []),
        Stop(id: "77304", name: "Planoles", latitude: 42.3144689, longitude: 2.09973152, connectionLineIds: []),
        Stop(id: "77305", name: "Toses", latitude: 42.3209639, longitude: 2.01525836, connectionLineIds: []),
        Stop(id: "77306", name: "La Molina", latitude: 42.3446518, longitude: 1.95595081, connectionLineIds: []),
        Stop(id: "77307", name: "Urtx-Alp", latitude: 42.3768624, longitude: 1.89685307, connectionLineIds: []),
        Stop(id: "77309", name: "Puigcerdà", latitude: 42.4296256, longitude: 1.92458355, connectionLineIds: []),
        Stop(id: "77310", name: "La Tour De Carol", latitude: 42.4590288, longitude: 1.90438312, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaR8 = Line(
    id: "barcelona_r8",
    name: "R8",
    type: .cercanias,
    colorHex: "#88016A",
    stops: [
        Stop(id: "72209", name: "Martorell-Central", latitude: 41.4792866, longitude: 1.92533467, connectionLineIds: []),
        Stop(id: "72210", name: "Castellbisbal", latitude: 41.4734152, longitude: 1.96756971, connectionLineIds: []),
        Stop(id: "72501", name: "Rubí Can Vallhonrat", latitude: 41.4751763, longitude: 2.03707926, connectionLineIds: []),
        Stop(id: "72502", name: "Sant Cugat Coll Favà", latitude: 41.4810907, longitude: 2.07967922, connectionLineIds: []),
        Stop(id: "72503", name: "Cerdanyola Universitat", latitude: 41.4969904, longitude: 2.1153777, connectionLineIds: []),
        Stop(id: "72508", name: "Santa Perpètua De Mogoda-Riera De Caldes", latitude: 41.5262297, longitude: 2.18633867, connectionLineIds: ["barcelona_r3"]),
        Stop(id: "77003", name: "Santa Perpètua De Mogoda La Florida", latitude: 41.5262041, longitude: 2.18623384, connectionLineIds: ["barcelona_r3"]),
        Stop(id: "79006", name: "Mollet-Sant Fost", latitude: 41.5335634, longitude: 2.21766516, connectionLineIds: ["barcelona_r11", "barcelona_r2", "barcelona_r2n", "barcelona_r3"]),
        Stop(id: "79007", name: "Montmeló", latitude: 41.5496523, longitude: 2.24544407, connectionLineIds: [])
    ],
    city: "Barcelona"
)

let barcelonaRT1 = Line(
    id: "barcelona_rt1",
    name: "RT1",
    type: .cercanias,
    colorHex: "#39D4CC",
    stops: [
        Stop(id: "71500", name: "Tarragona", latitude: 41.1115636, longitude: 1.25322776, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16", "barcelona_r17"]),
        Stop(id: "71401", name: "Vila-Seca", latitude: 41.1128193, longitude: 1.15037877, connectionLineIds: ["barcelona_r14", "barcelona_r15", "barcelona_r16"]),
        Stop(id: "71400", name: "Reus", latitude: 41.1605229, longitude: 1.10008978, connectionLineIds: ["barcelona_r14", "barcelona_r15"])
    ],
    city: "Barcelona"
)

let valenciaC1 = Line(
    id: "valencia_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#7AB3DE",
    stops: [
        Stop(id: "69110", name: "Gandia", latitude: 38.970514, longitude: -0.1797829, connectionLineIds: []),
        Stop(id: "69107", name: "Xeraco", latitude: 39.0261489, longitude: -0.2150346, connectionLineIds: []),
        Stop(id: "69105", name: "Tavernes De La Valldigna", latitude: 39.0790438, longitude: -0.2262966, connectionLineIds: []),
        Stop(id: "69104", name: "Cullera", latitude: 39.1778885, longitude: -0.2632437, connectionLineIds: []),
        Stop(id: "69103", name: "Sueca", latitude: 39.2058471, longitude: -0.3082388, connectionLineIds: []),
        Stop(id: "69102", name: "Sollana", latitude: 39.2793471, longitude: -0.3793139, connectionLineIds: []),
        Stop(id: "69101", name: "El Romaní", latitude: 39.3029789, longitude: -0.3942354, connectionLineIds: []),
        Stop(id: "64200", name: "Silla", latitude: 39.3619548, longitude: -0.4149813, connectionLineIds: ["valencia_c2"]),
        Stop(id: "64202", name: "Massanassa", latitude: 39.4091934, longitude: -0.3953073, connectionLineIds: ["valencia_c2"]),
        Stop(id: "64203", name: "Alfafar-Benetússer", latitude: 39.4224232, longitude: -0.392605, connectionLineIds: ["valencia_c2"]),
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c2", "valencia_c3", "valencia_c5", "valencia_c6"])
    ],
    city: "Valencia"
)

let valenciaC2 = Line(
    id: "valencia_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#F79529",
    stops: [
        Stop(id: "64003", name: "Moixent", latitude: 38.8777975, longitude: -0.7536507, connectionLineIds: []),
        Stop(id: "64004", name: "Vallada", latitude: 38.9089907, longitude: -0.6902385, connectionLineIds: []),
        Stop(id: "64005", name: "Montesa", latitude: 38.9429388, longitude: -0.6410905, connectionLineIds: []),
        Stop(id: "64006", name: "L'alcúdia De Crespins", latitude: 38.9690579, longitude: -0.5866758, connectionLineIds: []),
        Stop(id: "64100", name: "Xàtiva", latitude: 38.992148, longitude: -0.5245402, connectionLineIds: []),
        Stop(id: "64007", name: "Lenova-Manuel", latitude: 39.0500727, longitude: -0.4776036, connectionLineIds: []),
        Stop(id: "64102", name: "La Pobla Llarga", latitude: 39.0833385, longitude: -0.4696592, connectionLineIds: []),
        Stop(id: "64103", name: "Carcaixent", latitude: 39.1205251, longitude: -0.4544102, connectionLineIds: []),
        Stop(id: "64104", name: "Alzira", latitude: 39.1531495, longitude: -0.4506011, connectionLineIds: []),
        Stop(id: "64105", name: "Algemesí", latitude: 39.1931484, longitude: -0.4409196, connectionLineIds: []),
        Stop(id: "64107", name: "Benifaió", latitude: 39.2843027, longitude: -0.4299537, connectionLineIds: []),
        Stop(id: "64200", name: "Silla", latitude: 39.3619548, longitude: -0.4149813, connectionLineIds: ["valencia_c1"]),
        Stop(id: "64210", name: "Albal", latitude: 39.3918429, longitude: -0.4026343, connectionLineIds: []),
        Stop(id: "64202", name: "Massanassa", latitude: 39.4091934, longitude: -0.3953073, connectionLineIds: ["valencia_c1"]),
        Stop(id: "64203", name: "Alfafar-Benetússer", latitude: 39.4224232, longitude: -0.392605, connectionLineIds: ["valencia_c1"]),
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c3", "valencia_c5", "valencia_c6"])
    ],
    city: "Valencia"
)

let valenciaC3 = Line(
    id: "valencia_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#7A2780",
    stops: [
        Stop(id: "66200", name: "Utiel", latitude: 39.5707742, longitude: -1.2024215, connectionLineIds: []),
        Stop(id: "66201", name: "San Antonio De Requena", latitude: 39.5222997, longitude: -1.150367, connectionLineIds: []),
        Stop(id: "66202", name: "Requena", latitude: 39.4912708, longitude: -1.1046578, connectionLineIds: []),
        Stop(id: "66203", name: "El Rebollar", latitude: 39.4773604, longitude: -1.0116025, connectionLineIds: []),
        Stop(id: "66204", name: "Siete Aguas", latitude: 39.4572264, longitude: -0.9025067, connectionLineIds: []),
        Stop(id: "66206", name: "Buñol", latitude: 39.427139, longitude: -0.7873638, connectionLineIds: []),
        Stop(id: "66207", name: "Chiva", latitude: 39.4711268, longitude: -0.7229414, connectionLineIds: []),
        Stop(id: "66208", name: "Cheste", latitude: 39.490903, longitude: -0.6862639, connectionLineIds: []),
        Stop(id: "66210", name: "Circuit Ricardo Tormo", latitude: 39.4954379, longitude: -0.6247545, connectionLineIds: []),
        Stop(id: "66209", name: "Loriguilla-Reva", latitude: 39.4857771, longitude: -0.5673983, connectionLineIds: []),
        Stop(id: "66211", name: "Aldaia", latitude: 39.4611179, longitude: -0.4632476, connectionLineIds: []),
        Stop(id: "66214", name: "Xirivella-Alqueries", latitude: 39.4626294, longitude: -0.432216, connectionLineIds: []),
        Stop(id: "66212", name: "València-Sant Isidre", latitude: 39.4502194, longitude: -0.4039788, connectionLineIds: []),
        Stop(id: "65002", name: "València-La Font De Sant Lluís", latitude: 39.4416052, longitude: -0.371422, connectionLineIds: ["valencia_c5", "valencia_c6"]),
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c5", "valencia_c6"])
    ],
    city: "Valencia"
)

let valenciaC5 = Line(
    id: "valencia_c5",
    name: "C5",
    type: .cercanias,
    colorHex: "#018A27",
    stops: [
        Stop(id: "67211", name: "Caudiel", latitude: 39.9473696, longitude: -0.5720537, connectionLineIds: []),
        Stop(id: "67212", name: "Jérica-Viver", latitude: 39.9149777, longitude: -0.5693896, connectionLineIds: []),
        Stop(id: "67213", name: "Navajas", latitude: 39.8744166, longitude: -0.5059546, connectionLineIds: []),
        Stop(id: "67214", name: "Segorbe-Arrabal", latitude: 39.854557, longitude: -0.493863, connectionLineIds: []),
        Stop(id: "67215", name: "Segorbe-Ciudad", latitude: 39.8471755, longitude: -0.4823544, connectionLineIds: []),
        Stop(id: "67217", name: "Soneja", latitude: 39.8126015, longitude: -0.4318206, connectionLineIds: []),
        Stop(id: "67216", name: "Algimia-Ciudad", latitude: 39.7529934, longitude: -0.3657542, connectionLineIds: []),
        Stop(id: "67221", name: "Estivella-Albalat Dels Tarongers", latitude: 39.706408, longitude: -0.348324, connectionLineIds: []),
        Stop(id: "67223", name: "Gilet", latitude: 39.6793985, longitude: -0.3206548, connectionLineIds: []),
        Stop(id: "65200", name: "Sagunt", latitude: 39.6758025, longitude: -0.271542, connectionLineIds: ["valencia_c6"]),
        Stop(id: "65008", name: "Puçol", latitude: 39.6205367, longitude: -0.3031085, connectionLineIds: ["valencia_c6"]),
        Stop(id: "65007", name: "El Puig", latitude: 39.588302, longitude: -0.3116645, connectionLineIds: ["valencia_c6"]),
        Stop(id: "65001", name: "Roca-Cúper", latitude: 39.5262094, longitude: -0.3238405, connectionLineIds: ["valencia_c6"]),
        Stop(id: "65003", name: "València-Cabanyal", latitude: 39.4702456, longitude: -0.3346772, connectionLineIds: ["valencia_c6"]),
        Stop(id: "65002", name: "València-La Font De Sant Lluís", latitude: 39.4416052, longitude: -0.371422, connectionLineIds: ["valencia_c3", "valencia_c6"]),
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c3", "valencia_c6"])
    ],
    city: "Valencia"
)

let valenciaC6 = Line(
    id: "valencia_c6",
    name: "C6",
    type: .cercanias,
    colorHex: "#0D3386",
    stops: [
        Stop(id: "65300", name: "Castelló De La Plana", latitude: 39.9884736, longitude: -0.0523456, connectionLineIds: []),
        Stop(id: "65208", name: "Vila-Real", latitude: 39.9330935, longitude: -0.0967681, connectionLineIds: []),
        Stop(id: "65207", name: "Burriana-Alquerías Niño Perdido", latitude: 39.8965088, longitude: -0.1038601, connectionLineIds: []),
        Stop(id: "65206", name: "Nules La Villavella", latitude: 39.8532354, longitude: -0.1527317, connectionLineIds: []),
        Stop(id: "65205", name: "Moncofa", latitude: 39.8208891, longitude: -0.1626965, connectionLineIds: []),
        Stop(id: "65203", name: "La Llosa", latitude: 39.7678109, longitude: -0.2029444, connectionLineIds: []),
        Stop(id: "65202", name: "Almenara", latitude: 39.7487737, longitude: -0.2183811, connectionLineIds: []),
        Stop(id: "65200", name: "Sagunt", latitude: 39.6758025, longitude: -0.271542, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65008", name: "Puçol", latitude: 39.6205367, longitude: -0.3031085, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65007", name: "El Puig", latitude: 39.588302, longitude: -0.3116645, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65001", name: "Roca-Cúper", latitude: 39.5262094, longitude: -0.3238405, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65003", name: "València-Cabanyal", latitude: 39.4702456, longitude: -0.3346772, connectionLineIds: ["valencia_c5"]),
        Stop(id: "65002", name: "València-La Font De Sant Lluís", latitude: 39.4416052, longitude: -0.371422, connectionLineIds: ["valencia_c3", "valencia_c5"]),
        Stop(id: "65000", name: "València-Estació Del Nord", latitude: 39.4669305, longitude: -0.3772239, connectionLineIds: ["valencia_c1", "valencia_c2", "valencia_c3", "valencia_c5"])
    ],
    city: "Valencia"
)

let málagaC1 = Line(
    id: "málaga_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#4a8ccc",
    stops: [
        Stop(id: "54516", name: "Fuengirola", latitude: 36.5418947, longitude: -4.623858, connectionLineIds: []),
        Stop(id: "54515", name: "Los Boliches", latitude: 36.5546583, longitude: -4.6145767, connectionLineIds: []),
        Stop(id: "54514", name: "Torreblanca Del Sol", latitude: 36.5649071, longitude: -4.6067106, connectionLineIds: []),
        Stop(id: "54513", name: "Carvajal", latitude: 36.570259, longitude: -4.5940491, connectionLineIds: []),
        Stop(id: "54512", name: "Torremuelle", latitude: 36.5822966, longitude: -4.5670183, connectionLineIds: []),
        Stop(id: "54511", name: "Benalmádena-Arroyo De La Miel", latitude: 36.5991116, longitude: -4.5363459, connectionLineIds: []),
        Stop(id: "54510", name: "El Pinillo", latitude: 36.6098688, longitude: -4.5153735, connectionLineIds: []),
        Stop(id: "54519", name: "Montemar Alto", latitude: 36.6136673, longitude: -4.5094259, connectionLineIds: []),
        Stop(id: "54509", name: "Torremolinos", latitude: 36.6225596, longitude: -4.49957, connectionLineIds: []),
        Stop(id: "54508", name: "La Colina", latitude: 36.6419236, longitude: -4.4926383, connectionLineIds: []),
        Stop(id: "54518", name: "Los álamos", latitude: 36.6450587, longitude: -4.4851186, connectionLineIds: []),
        Stop(id: "54520", name: "Plaza Mayor", latitude: 36.6562029, longitude: -4.4803044, connectionLineIds: []),
        Stop(id: "54505", name: "Málaga-Aeropuerto", latitude: 36.6777169, longitude: -4.4901607, connectionLineIds: []),
        Stop(id: "54503", name: "Guadalhorce", latitude: 36.6920757, longitude: -4.4836844, connectionLineIds: ["málaga_c2"]),
        Stop(id: "54412", name: "Málaga-Los Prados", latitude: 36.6986108, longitude: -4.47815, connectionLineIds: ["málaga_c2"]),
        Stop(id: "54501", name: "Victoria Kent", latitude: 36.7012229, longitude: -4.4544145, connectionLineIds: ["málaga_c2"]),
        Stop(id: "54500", name: "Málaga M.z. Cercanías", latitude: 36.7113885, longitude: -4.4328909, connectionLineIds: ["málaga_c2"]),
        Stop(id: "54517", name: "Málaga-Centro Alameda", latitude: 36.7159539, longitude: -4.4265335, connectionLineIds: ["málaga_c2"])
    ],
    city: "Málaga"
)

let málagaC2 = Line(
    id: "málaga_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#0fcf34",
    stops: [
        Stop(id: "54517", name: "Málaga-Centro Alameda", latitude: 36.7159539, longitude: -4.4265335, connectionLineIds: ["málaga_c1"]),
        Stop(id: "54500", name: "Málaga M.z. Cercanías", latitude: 36.7113885, longitude: -4.4328909, connectionLineIds: ["málaga_c1"]),
        Stop(id: "54501", name: "Victoria Kent", latitude: 36.7012229, longitude: -4.4544145, connectionLineIds: ["málaga_c1"]),
        Stop(id: "54412", name: "Málaga-Los Prados", latitude: 36.6986108, longitude: -4.47815, connectionLineIds: ["málaga_c1"]),
        Stop(id: "54503", name: "Guadalhorce", latitude: 36.6920757, longitude: -4.4836844, connectionLineIds: ["málaga_c1"]),
        Stop(id: "54410", name: "Campanillas", latitude: 36.7050436, longitude: -4.5454825, connectionLineIds: []),
        Stop(id: "54408", name: "Cártama", latitude: 36.7337392, longitude: -4.6083966, connectionLineIds: []),
        Stop(id: "54407", name: "Aljaima", latitude: 36.7330833, longitude: -4.6645001, connectionLineIds: []),
        Stop(id: "54406", name: "Pizarra", latitude: 36.7641515, longitude: -4.7118313, connectionLineIds: []),
        Stop(id: "54405", name: "álora", latitude: 36.8198747, longitude: -4.6996105, connectionLineIds: [])
    ],
    city: "Málaga"
)

let bilbaoC1 = Line(
    id: "bilbao_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#D7001E",
    stops: [
        Stop(id: "13405", name: "Santurtzi", latitude: 43.3286605, longitude: -3.0295685, connectionLineIds: []),
        Stop(id: "13404", name: "Peñota", latitude: 43.3263563, longitude: -3.0234574, connectionLineIds: []),
        Stop(id: "13403", name: "Portugalete", latitude: 43.318676, longitude: -3.0152296, connectionLineIds: []),
        Stop(id: "13402", name: "La Iberia", latitude: 43.3127031, longitude: -3.0044959, connectionLineIds: ["bilbao_c2"]),
        Stop(id: "13401", name: "Sestao", latitude: 43.3085201, longitude: -2.9940107, connectionLineIds: ["bilbao_c2"]),
        Stop(id: "13400", name: "Desertu-Barakaldo", latitude: 43.3000264, longitude: -2.984409, connectionLineIds: ["bilbao_c2"]),
        Stop(id: "13305", name: "Lutxana-Barakaldo", latitude: 43.2878137, longitude: -2.9754132, connectionLineIds: ["bilbao_c2"]),
        Stop(id: "13304", name: "Zorrotza", latitude: 43.2778039, longitude: -2.9721188, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "05457", name: "Zorrotza Zorrozgoiti", latitude: 43.2740398, longitude: -2.9740116, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "13303", name: "Olabeaga", latitude: 43.2643804, longitude: -2.9553272, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "05455", name: "Basurto Hospital", latitude: 43.2597699, longitude: -2.9538267, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "13208", name: "San Mamés", latitude: 43.2615306, longitude: -2.9488341, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "13207", name: "Autonomía", latitude: 43.2581339, longitude: -2.9460321, connectionLineIds: ["bilbao_c2", "bilbao_c4"]),
        Stop(id: "13206", name: "Ametzola", latitude: 43.2547065, longitude: -2.9436598, connectionLineIds: ["bilbao_c2", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13120", name: "Miribilla", latitude: 43.250429, longitude: -2.9305155, connectionLineIds: ["bilbao_c2", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13205", name: "Zabalburu", latitude: 43.2567911, longitude: -2.9322841, connectionLineIds: ["bilbao_c2", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "05451", name: "Bilbao La Concordia", latitude: 43.2601901, longitude: -2.9263839, connectionLineIds: ["bilbao_c2", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13200", name: "Bilbao-Intermod. Abando Indalecio Prieto", latitude: 43.2601304, longitude: -2.9285592, connectionLineIds: ["bilbao_c2", "bilbao_c3", "bilbao_c4"])
    ],
    city: "Bilbao"
)

let bilbaoC2 = Line(
    id: "bilbao_c2",
    name: "C2",
    type: .cercanias,
    colorHex: "#0F8C2D",
    stops: [
        Stop(id: "13506", name: "Muskiz", latitude: 43.3215111, longitude: -3.1123207, connectionLineIds: []),
        Stop(id: "13505", name: "Putxeta", latitude: 43.3156801, longitude: -3.0911356, connectionLineIds: []),
        Stop(id: "13508", name: "Gallarta", latitude: 43.3193319, longitude: -3.0674521, connectionLineIds: []),
        Stop(id: "13504", name: "Ortuella", latitude: 43.3115122, longitude: -3.0603549, connectionLineIds: []),
        Stop(id: "13509", name: "Sagrada Familia", latitude: 43.3082365, longitude: -3.0528979, connectionLineIds: []),
        Stop(id: "13507", name: "Urioste", latitude: 43.3075315, longitude: -3.041072, connectionLineIds: []),
        Stop(id: "13503", name: "Valle De Trápaga/Trapagaran", latitude: 43.3014842, longitude: -3.0287951, connectionLineIds: []),
        Stop(id: "13502", name: "Trápaga", latitude: 43.3030265, longitude: -3.0169907, connectionLineIds: []),
        Stop(id: "13501", name: "Galindo", latitude: 43.3041349, longitude: -3.0101966, connectionLineIds: []),
        Stop(id: "13402", name: "La Iberia", latitude: 43.3127031, longitude: -3.0044959, connectionLineIds: ["bilbao_c1"]),
        Stop(id: "13401", name: "Sestao", latitude: 43.3085201, longitude: -2.9940107, connectionLineIds: ["bilbao_c1"]),
        Stop(id: "13400", name: "Desertu-Barakaldo", latitude: 43.3000264, longitude: -2.984409, connectionLineIds: ["bilbao_c1"]),
        Stop(id: "13305", name: "Lutxana-Barakaldo", latitude: 43.2878137, longitude: -2.9754132, connectionLineIds: ["bilbao_c1"]),
        Stop(id: "13304", name: "Zorrotza", latitude: 43.2778039, longitude: -2.9721188, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "05457", name: "Zorrotza Zorrozgoiti", latitude: 43.2740398, longitude: -2.9740116, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "13303", name: "Olabeaga", latitude: 43.2643804, longitude: -2.9553272, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "05455", name: "Basurto Hospital", latitude: 43.2597699, longitude: -2.9538267, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "13208", name: "San Mamés", latitude: 43.2615306, longitude: -2.9488341, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "13207", name: "Autonomía", latitude: 43.2581339, longitude: -2.9460321, connectionLineIds: ["bilbao_c1", "bilbao_c4"]),
        Stop(id: "13206", name: "Ametzola", latitude: 43.2547065, longitude: -2.9436598, connectionLineIds: ["bilbao_c1", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13120", name: "Miribilla", latitude: 43.250429, longitude: -2.9305155, connectionLineIds: ["bilbao_c1", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13205", name: "Zabalburu", latitude: 43.2567911, longitude: -2.9322841, connectionLineIds: ["bilbao_c1", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "05451", name: "Bilbao La Concordia", latitude: 43.2601901, longitude: -2.9263839, connectionLineIds: ["bilbao_c1", "bilbao_c3", "bilbao_c4"]),
        Stop(id: "13200", name: "Bilbao-Intermod. Abando Indalecio Prieto", latitude: 43.2601304, longitude: -2.9285592, connectionLineIds: ["bilbao_c1", "bilbao_c3", "bilbao_c4"])
    ],
    city: "Bilbao"
)

let bilbaoC3 = Line(
    id: "bilbao_c3",
    name: "C3",
    type: .cercanias,
    colorHex: "#78B4E1",
    stops: [
        Stop(id: "05451", name: "Bilbao La Concordia", latitude: 43.2601901, longitude: -2.9263839, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c4"]),
        Stop(id: "13200", name: "Bilbao-Intermod. Abando Indalecio Prieto", latitude: 43.2601304, longitude: -2.9285592, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c4"]),
        Stop(id: "13205", name: "Zabalburu", latitude: 43.2567911, longitude: -2.9322841, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c4"]),
        Stop(id: "13206", name: "Ametzola", latitude: 43.2547065, longitude: -2.9436598, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c4"]),
        Stop(id: "13120", name: "Miribilla", latitude: 43.250429, longitude: -2.9305155, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c4"]),
        Stop(id: "13119", name: "La Peña De Bilbao", latitude: 43.2401669, longitude: -2.9240429, connectionLineIds: []),
        Stop(id: "13114", name: "Ollargan", latitude: 43.2424974, longitude: -2.9164564, connectionLineIds: []),
        Stop(id: "13113", name: "Bidebieta-Basauri", latitude: 43.237057, longitude: -2.8894856, connectionLineIds: []),
        Stop(id: "13118", name: "Abaroa-San Miguel", latitude: 43.225648, longitude: -2.8871139, connectionLineIds: []),
        Stop(id: "13112", name: "Basauri", latitude: 43.2235298, longitude: -2.8823858, connectionLineIds: []),
        Stop(id: "13111", name: "Arrigorriaga", latitude: 43.2100868, longitude: -2.8885723, connectionLineIds: []),
        Stop(id: "13110", name: "Ugao-Miraballes", latitude: 43.1790833, longitude: -2.902696, connectionLineIds: []),
        Stop(id: "13115", name: "Bakiola", latitude: 43.1769858, longitude: -2.90907, connectionLineIds: []),
        Stop(id: "13109", name: "Arrankudiaga", latitude: 43.1694994, longitude: -2.9184485, connectionLineIds: []),
        Stop(id: "13108", name: "Arbide", latitude: 43.1632587, longitude: -2.9278362, connectionLineIds: []),
        Stop(id: "13117", name: "Arakaldo", latitude: 43.1535592, longitude: -2.9382027, connectionLineIds: []),
        Stop(id: "13107", name: "Areta", latitude: 43.1451273, longitude: -2.9433913, connectionLineIds: []),
        Stop(id: "13106", name: "Llodio", latitude: 43.1423514, longitude: -2.9606511, connectionLineIds: []),
        Stop(id: "13104", name: "Santa Cruz De Llodio", latitude: 43.132863, longitude: -2.9698375, connectionLineIds: []),
        Stop(id: "13103", name: "Luiaondo", latitude: 43.0935926, longitude: -2.9996644, connectionLineIds: []),
        Stop(id: "13102", name: "Salbio", latitude: 43.074172, longitude: -2.9993953, connectionLineIds: []),
        Stop(id: "13121", name: "Amurrio Iparralde", latitude: 43.0578453, longitude: -2.9960659, connectionLineIds: []),
        Stop(id: "13101", name: "Amurrio", latitude: 43.049051, longitude: -3.0020176, connectionLineIds: []),
        Stop(id: "13116", name: "Iñarratxu", latitude: 43.0358243, longitude: -3.0038794, connectionLineIds: []),
        Stop(id: "13100", name: "Orduña", latitude: 42.9946191, longitude: -3.0158139, connectionLineIds: [])
    ],
    city: "Bilbao"
)

let bilbaoC4 = Line(
    id: "bilbao_c4",
    name: "C4",
    type: .cercanias,
    colorHex: "#E93CAC",
    stops: [
        Stop(id: "05485", name: "La Calzada", latitude: 43.1901154, longitude: -3.1974062, connectionLineIds: []),
        Stop(id: "05483", name: "Balmaseda", latitude: 43.1963551, longitude: -3.1899562, connectionLineIds: []),
        Stop(id: "05481", name: "La Herrera", latitude: 43.2034521, longitude: -3.1705687, connectionLineIds: []),
        Stop(id: "05479", name: "Ibarra", latitude: 43.203959, longitude: -3.1448388, connectionLineIds: []),
        Stop(id: "05477", name: "Colegio", latitude: 43.2112674, longitude: -3.1381409, connectionLineIds: []),
        Stop(id: "05484", name: "Mimetiz", latitude: 43.2132627, longitude: -3.1352774, connectionLineIds: []),
        Stop(id: "05475", name: "Zalla", latitude: 43.2129096, longitude: -3.1333368, connectionLineIds: []),
        Stop(id: "05474", name: "Aranguren-Apeadero", latitude: 43.2103517, longitude: -3.1140505, connectionLineIds: []),
        Stop(id: "05473", name: "Aranguren", latitude: 43.2104561, longitude: -3.108399, connectionLineIds: []),
        Stop(id: "05471", name: "Güeñes", latitude: 43.2090276, longitude: -3.0952113, connectionLineIds: []),
        Stop(id: "05470", name: "Lambarri", latitude: 43.2060733, longitude: -3.0825107, connectionLineIds: []),
        Stop(id: "05469", name: "Artxube", latitude: 43.200993, longitude: -3.0715031, connectionLineIds: []),
        Stop(id: "05467", name: "Sodupe", latitude: 43.2020301, longitude: -3.050517, connectionLineIds: []),
        Stop(id: "05465", name: "La Quadra", latitude: 43.222723, longitude: -3.0249848, connectionLineIds: []),
        Stop(id: "05463", name: "Zaramillo", latitude: 43.2332894, longitude: -3.015904, connectionLineIds: []),
        Stop(id: "05461", name: "Irauregui", latitude: 43.248418, longitude: -2.9900734, connectionLineIds: []),
        Stop(id: "05460", name: "Kastrexana", latitude: 43.2554758, longitude: -2.9721445, connectionLineIds: []),
        Stop(id: "05459", name: "Santa águeda", latitude: 43.261857, longitude: -2.9730218, connectionLineIds: []),
        Stop(id: "05457", name: "Zorrotza Zorrozgoiti", latitude: 43.2740398, longitude: -2.9740116, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "13304", name: "Zorrotza", latitude: 43.2778039, longitude: -2.9721188, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "13303", name: "Olabeaga", latitude: 43.2643804, longitude: -2.9553272, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "05455", name: "Basurto Hospital", latitude: 43.2597699, longitude: -2.9538267, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "13208", name: "San Mamés", latitude: 43.2615306, longitude: -2.9488341, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "13207", name: "Autonomía", latitude: 43.2581339, longitude: -2.9460321, connectionLineIds: ["bilbao_c1", "bilbao_c2"]),
        Stop(id: "13206", name: "Ametzola", latitude: 43.2547065, longitude: -2.9436598, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c3"]),
        Stop(id: "13120", name: "Miribilla", latitude: 43.250429, longitude: -2.9305155, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c3"]),
        Stop(id: "13205", name: "Zabalburu", latitude: 43.2567911, longitude: -2.9322841, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c3"]),
        Stop(id: "13200", name: "Bilbao-Intermod. Abando Indalecio Prieto", latitude: 43.2601304, longitude: -2.9285592, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c3"]),
        Stop(id: "05451", name: "Bilbao La Concordia", latitude: 43.2601901, longitude: -2.9263839, connectionLineIds: ["bilbao_c1", "bilbao_c2", "bilbao_c3"])
    ],
    city: "Bilbao"
)

let sanC1 = Line(
    id: "san_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#DA001C",
    stops: [
        Stop(id: "11305", name: "Brinkola", latitude: 43.0189865, longitude: -2.3346811, connectionLineIds: []),
        Stop(id: "11306", name: "Legazpi", latitude: 43.0510385, longitude: -2.3306103, connectionLineIds: []),
        Stop(id: "11400", name: "Zumarraga", latitude: 43.0870824, longitude: -2.3202298, connectionLineIds: []),
        Stop(id: "11402", name: "Ormáiztegui", latitude: 43.0402752, longitude: -2.256462, connectionLineIds: []),
        Stop(id: "11404", name: "Beasain", latitude: 43.0462687, longitude: -2.2022994, connectionLineIds: []),
        Stop(id: "11405", name: "Ordizia", latitude: 43.0527547, longitude: -2.1791923, connectionLineIds: []),
        Stop(id: "11406", name: "Itsasondo", latitude: 43.0683298, longitude: -2.162485, connectionLineIds: []),
        Stop(id: "11407", name: "Legorreta", latitude: 43.0856948, longitude: -2.1408977, connectionLineIds: []),
        Stop(id: "11408", name: "Ikaztegieta", latitude: 43.0940398, longitude: -2.1255773, connectionLineIds: []),
        Stop(id: "11409", name: "Alegia", latitude: 43.1017599, longitude: -2.09714, connectionLineIds: []),
        Stop(id: "11500", name: "Tolosa", latitude: 43.1354472, longitude: -2.0790886, connectionLineIds: []),
        Stop(id: "11501", name: "Tolosa-Centro", latitude: 43.1393963, longitude: -2.0741122, connectionLineIds: []),
        Stop(id: "11502", name: "Anoeta", latitude: 43.1626064, longitude: -2.0703897, connectionLineIds: []),
        Stop(id: "11503", name: "Billabona-Zizurkil", latitude: 43.1891906, longitude: -2.0553722, connectionLineIds: []),
        Stop(id: "11504", name: "Andoain-Centro", latitude: 43.2155738, longitude: -2.0204595, connectionLineIds: []),
        Stop(id: "11505", name: "Andoain", latitude: 43.2220458, longitude: -2.0156757, connectionLineIds: []),
        Stop(id: "11506", name: "Urnieta", latitude: 43.2474669, longitude: -1.9884271, connectionLineIds: []),
        Stop(id: "11507", name: "Hernani-Erdia", latitude: 43.2664779, longitude: -1.9726232, connectionLineIds: []),
        Stop(id: "11508", name: "Hernani", latitude: 43.2725113, longitude: -1.9637735, connectionLineIds: []),
        Stop(id: "11509", name: "Martutene", latitude: 43.2991128, longitude: -1.9561747, connectionLineIds: []),
        Stop(id: "11510", name: "Loiola", latitude: 43.3046746, longitude: -1.9636294, connectionLineIds: []),
        Stop(id: "11511", name: "San Sebastián-Donostia", latitude: 43.3176961, longitude: -1.9767172, connectionLineIds: []),
        Stop(id: "11512", name: "Gros", latitude: 43.3218457, longitude: -1.9738835, connectionLineIds: []),
        Stop(id: "11513", name: "Ategorrieta", latitude: 43.3203225, longitude: -1.9598127, connectionLineIds: []),
        Stop(id: "11522", name: "Intxaurrondo", latitude: 43.3200487, longitude: -1.9517673, connectionLineIds: []),
        Stop(id: "11514", name: "Herrera", latitude: 43.3193537, longitude: -1.9370173, connectionLineIds: []),
        Stop(id: "11515", name: "Pasaia", latitude: 43.3189428, longitude: -1.9171727, connectionLineIds: []),
        Stop(id: "11516", name: "Lezo-Rentería", latitude: 43.3159364, longitude: -1.8994386, connectionLineIds: []),
        Stop(id: "11518", name: "Ventas De Irún", latitude: 43.3304116, longitude: -1.8167813, connectionLineIds: []),
        Stop(id: "11600", name: "Irun", latitude: 43.3395365, longitude: -1.8012519, connectionLineIds: [])
    ],
    city: "San Sebastián"
)

        // Collect all lines
        lines = [
            // Madrid Metro (Mock - to be replaced)
            line1, line2,
            // All Spanish Cercanías (Complete GTFS extraction)
            madridC1,
            madridC10,
            madridC2,
            madridC3,
            madridC4,
            madridC4a,
            madridC4b,
            madridC5,
            madridC7,
            madridC9,
            sevillaC1,
            sevillaC2,
            sevillaC3,
            sevillaC4,
            sevillaC5,
            barcelonaR1,
            barcelonaR11,
            barcelonaR14,
            barcelonaR15,
            barcelonaR16,
            barcelonaR17,
            barcelonaR2,
            barcelonaR2N,
            barcelonaR2S,
            barcelonaR3,
            barcelonaR8,
            barcelonaRT1,
            valenciaC1,
            valenciaC2,
            valenciaC3,
            valenciaC5,
            valenciaC6,
            málagaC1,
            málagaC2,
            bilbaoC1,
            bilbaoC2,
            bilbaoC3,
            bilbaoC4,
            sanC1,
        ]

        // Collect all stops
        var allStops: [Stop] = []
        allStops += line1Stops
        for line in lines {
            allStops += line.stops
        }
        stops = allStops
    }

    private func generateMockArrivals(for stopId: String) -> [Arrival] {
        let now = Date()

        return [
            Arrival(
                id: UUID().uuidString,
                lineId: "madrid_c1",
                lineName: "C1",
                destination: "Aeropuerto T4",
                scheduledTime: now.addingTimeInterval(3 * 60),
                expectedTime: now.addingTimeInterval(3 * 60),
                platform: "1"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "madrid_c3",
                lineName: "C3",
                destination: "Aranjuez",
                scheduledTime: now.addingTimeInterval(12 * 60),
                expectedTime: now.addingTimeInterval(12 * 60),
                platform: "3"
            ),
        ]
    }
}
