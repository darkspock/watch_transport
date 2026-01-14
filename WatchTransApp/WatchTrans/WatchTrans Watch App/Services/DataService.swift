//
//  DataService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
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

    // MARK: - Mock Data (Temporary)

    private func loadMockData() async {
        // Mock Madrid Metro Line 1
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

        // Mock Cercanías C3
        let c3Stops = [
            Stop(id: "stop_chamartin_c", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"]),
            Stop(id: "stop_nuevos_ministerios", name: "Nuevos Ministerios", latitude: 40.4461, longitude: -3.6926, connectionLineIds: ["line6", "line8", "line10"]),
            Stop(id: "stop_sol_c", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line1", "line2", "line3"]),
            Stop(id: "stop_atocha", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"]),
        ]

        let lineC3 = Line(
            id: "c3",
            name: "C3",
            type: .cercanias,
            colorHex: "#813380",
            stops: c3Stops,
            city: "Madrid"
        )

        // Mock Madrid Metro Line 2
        let line2Stops = [
            Stop(id: "stop_cuatro_caminos", name: "Cuatro Caminos", latitude: 40.4456, longitude: -3.7098, connectionLineIds: ["line1", "line6"]),
            Stop(id: "stop_goya", name: "Goya", latitude: 40.4265, longitude: -3.6768, connectionLineIds: []),
            Stop(id: "stop_retiro", name: "Retiro", latitude: 40.4120, longitude: -3.6830, connectionLineIds: []),
        ]

        let line2 = Line(
            id: "line2",
            name: "L2",
            type: .metro,
            colorHex: "#e0292f",
            stops: line2Stops,
            city: "Madrid"
        )

        // Mock Madrid Metro Line 3
        let line3Stops = [
            Stop(id: "stop_moncloa", name: "Moncloa", latitude: 40.4344, longitude: -3.7172, connectionLineIds: ["line6"]),
            Stop(id: "stop_callao", name: "Callao", latitude: 40.4201, longitude: -3.7058, connectionLineIds: []),
            Stop(id: "stop_sol_l3", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line1", "line2"]),
        ]

        let line3 = Line(
            id: "line3",
            name: "L3",
            type: .metro,
            colorHex: "#ffe114",
            stops: line3Stops,
            city: "Madrid"
        )

        // Mock Cercanías C1
        let c1Stops = [
            Stop(id: "stop_principe_pio", name: "Príncipe Pío", latitude: 40.4195, longitude: -3.7180, connectionLineIds: ["line6", "line10"]),
            Stop(id: "stop_atocha_c1", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"]),
        ]

        let lineC1 = Line(
            id: "c1",
            name: "C1",
            type: .cercanias,
            colorHex: "#5eafe4",
            stops: c1Stops,
            city: "Madrid"
        )

        // Mock Madrid Metro Line 4
        let line4 = Line(
            id: "line4",
            name: "L4",
            type: .metro,
            colorHex: "#814109",
            stops: [
                Stop(id: "stop_argüelles", name: "Argüelles", latitude: 40.4292, longitude: -3.7186, connectionLineIds: ["line3", "line6"]),
                Stop(id: "stop_diego_leon", name: "Diego de León", latitude: 40.4364, longitude: -3.6670, connectionLineIds: ["line5", "line6"]),
                Stop(id: "stop_avenida_america", name: "Avenida de América", latitude: 40.4399, longitude: -3.6709, connectionLineIds: ["line6", "line7", "line9"])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 5
        let line5 = Line(
            id: "line5",
            name: "L5",
            type: .metro,
            colorHex: "#96bf0d",
            stops: [
                Stop(id: "stop_alameda", name: "Alameda de Osuna", latitude: 40.4495, longitude: -3.6150, connectionLineIds: []),
                Stop(id: "stop_pueblo_nuevo", name: "Pueblo Nuevo", latitude: 40.4512, longitude: -3.6704, connectionLineIds: []),
                Stop(id: "stop_alonso_martinez", name: "Alonso Martínez", latitude: 40.4242, longitude: -3.6961, connectionLineIds: ["line4", "line10"])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 6
        let line6 = Line(
            id: "line6",
            name: "L6",
            type: .metro,
            colorHex: "#9a9999",
            stops: [
                Stop(id: "stop_principe_pio_l6", name: "Príncipe Pío", latitude: 40.4195, longitude: -3.7180, connectionLineIds: ["line10"]),
                Stop(id: "stop_nuevos_ministerios_l6", name: "Nuevos Ministerios", latitude: 40.4461, longitude: -3.6926, connectionLineIds: ["line8", "line10"]),
                Stop(id: "stop_ciudad_universitaria", name: "Ciudad Universitaria", latitude: 40.4497, longitude: -3.7273, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 7
        let line7 = Line(
            id: "line7",
            name: "L7",
            type: .metro,
            colorHex: "#f96611",
            stops: [
                Stop(id: "stop_hospital_henares", name: "Hospital del Henares", latitude: 40.4354, longitude: -3.3621, connectionLineIds: []),
                Stop(id: "stop_las_rosas", name: "Las Rosas", latitude: 40.4110, longitude: -3.5874, connectionLineIds: []),
                Stop(id: "stop_pueblo_nuevo_l7", name: "Pueblo Nuevo", latitude: 40.4512, longitude: -3.6704, connectionLineIds: ["line5"])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 8
        let line8 = Line(
            id: "line8",
            name: "L8",
            type: .metro,
            colorHex: "#f373b7",
            stops: [
                Stop(id: "stop_aeropuerto_t4", name: "Aeropuerto T4", latitude: 40.4937, longitude: -3.5940, connectionLineIds: []),
                Stop(id: "stop_nuevos_ministerios_l8", name: "Nuevos Ministerios", latitude: 40.4461, longitude: -3.6926, connectionLineIds: ["line6", "line10"]),
                Stop(id: "stop_colombia", name: "Colombia", latitude: 40.4473, longitude: -3.6904, connectionLineIds: ["line9"])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 9
        let line9 = Line(
            id: "line9",
            name: "L9",
            type: .metro,
            colorHex: "#990d66",
            stops: [
                Stop(id: "stop_paco_de_lucia", name: "Paco de Lucía", latitude: 40.3219, longitude: -3.7648, connectionLineIds: []),
                Stop(id: "stop_puerta_del_sur", name: "Puerta del Sur", latitude: 40.3361, longitude: -3.7453, connectionLineIds: []),
                Stop(id: "stop_sainz_baranda", name: "Sainz de Baranda", latitude: 40.4099, longitude: -3.6710, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 10
        let line10 = Line(
            id: "line10",
            name: "L10",
            type: .metro,
            colorHex: "#1b0c80",
            stops: [
                Stop(id: "stop_hospital_infanta_sofia", name: "Hospital Infanta Sofía", latitude: 40.5367, longitude: -3.6285, connectionLineIds: []),
                Stop(id: "stop_plaza_castilla", name: "Plaza de Castilla", latitude: 40.4660, longitude: -3.6891, connectionLineIds: []),
                Stop(id: "stop_nuevos_ministerios_l10", name: "Nuevos Ministerios", latitude: 40.4461, longitude: -3.6926, connectionLineIds: ["line6", "line8"])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 11
        let line11 = Line(
            id: "line11",
            name: "L11",
            type: .metro,
            colorHex: "#136926",
            stops: [
                Stop(id: "stop_la_fortuna", name: "La Fortuna", latitude: 40.4509, longitude: -3.6303, connectionLineIds: []),
                Stop(id: "stop_plaza_eliptica", name: "Plaza Elíptica", latitude: 40.3852, longitude: -3.6949, connectionLineIds: []),
                Stop(id: "stop_carabanchel", name: "Carabanchel", latitude: 40.3802, longitude: -3.7418, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Madrid Metro Line 12
        let line12 = Line(
            id: "line12",
            name: "L12",
            type: .metro,
            colorHex: "#999933",
            stops: [
                Stop(id: "stop_metrosur_oeste", name: "MetroSur Oeste", latitude: 40.3195, longitude: -3.8627, connectionLineIds: []),
                Stop(id: "stop_alcorcon_central", name: "Alcorcón Central", latitude: 40.3459, longitude: -3.8237, connectionLineIds: []),
                Stop(id: "stop_loranca", name: "Loranca", latitude: 40.3363, longitude: -3.7953, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C2
        let lineC2 = Line(
            id: "c2",
            name: "C2",
            type: .cercanias,
            colorHex: "#00934b",
            stops: [
                Stop(id: "stop_guadalajara", name: "Guadalajara", latitude: 40.6292, longitude: -3.1672, connectionLineIds: []),
                Stop(id: "stop_alcala_henares", name: "Alcalá de Henares", latitude: 40.4820, longitude: -3.3649, connectionLineIds: []),
                Stop(id: "stop_chamartin_c2", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C4a
        let lineC4a = Line(
            id: "c4a",
            name: "C4a",
            type: .cercanias,
            colorHex: "#27317c",
            stops: [
                Stop(id: "stop_parla", name: "Parla", latitude: 40.2357, longitude: -3.7722, connectionLineIds: []),
                Stop(id: "stop_atocha_c4a", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"]),
                Stop(id: "stop_sol_c4a", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line1", "line2", "line3"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C4b
        let lineC4b = Line(
            id: "c4b",
            name: "C4b",
            type: .cercanias,
            colorHex: "#27317c",
            stops: [
                Stop(id: "stop_alcobendas", name: "Alcobendas-San Sebastián de los Reyes", latitude: 40.5505, longitude: -3.6411, connectionLineIds: []),
                Stop(id: "stop_chamartin_c4b", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"]),
                Stop(id: "stop_atocha_c4b", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C5
        let lineC5 = Line(
            id: "c5",
            name: "C5",
            type: .cercanias,
            colorHex: "#f8c431",
            stops: [
                Stop(id: "stop_mostoles", name: "Móstoles-El Soto", latitude: 40.3205, longitude: -3.8778, connectionLineIds: []),
                Stop(id: "stop_humanes", name: "Humanes", latitude: 40.2543, longitude: -3.8276, connectionLineIds: []),
                Stop(id: "stop_atocha_c5", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C7
        let lineC7 = Line(
            id: "c7",
            name: "C7",
            type: .cercanias,
            colorHex: "#da3239",
            stops: [
                Stop(id: "stop_alcala_c7", name: "Alcalá de Henares", latitude: 40.4820, longitude: -3.3649, connectionLineIds: []),
                Stop(id: "stop_principe_pio_c7", name: "Príncipe Pío", latitude: 40.4195, longitude: -3.7180, connectionLineIds: ["line6", "line10"]),
                Stop(id: "stop_atocha_c7", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C8a
        let lineC8a = Line(
            id: "c8a",
            name: "C8a",
            type: .cercanias,
            colorHex: "#737773",
            stops: [
                Stop(id: "stop_villalba", name: "Villalba", latitude: 40.6222, longitude: -4.0114, connectionLineIds: []),
                Stop(id: "stop_el_escorial", name: "El Escorial", latitude: 40.5920, longitude: -4.1286, connectionLineIds: []),
                Stop(id: "stop_atocha_c8a", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C8b
        let lineC8b = Line(
            id: "c8b",
            name: "C8b",
            type: .cercanias,
            colorHex: "#737773",
            stops: [
                Stop(id: "stop_cercedilla", name: "Cercedilla", latitude: 40.7413, longitude: -4.0555, connectionLineIds: []),
                Stop(id: "stop_villalba_c8b", name: "Villalba", latitude: 40.6222, longitude: -4.0114, connectionLineIds: []),
                Stop(id: "stop_atocha_c8b", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C9
        let lineC9 = Line(
            id: "c9",
            name: "C9",
            type: .cercanias,
            colorHex: "#7c553a",
            stops: [
                Stop(id: "stop_cercedilla_c9", name: "Cercedilla", latitude: 40.7413, longitude: -4.0555, connectionLineIds: []),
                Stop(id: "stop_cotos", name: "Cotos", latitude: 40.8490, longitude: -3.9667, connectionLineIds: []),
                Stop(id: "stop_puerto_navacerrada", name: "Puerto de Navacerrada", latitude: 40.7847, longitude: -4.0086, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Cercanías C10
        let lineC10 = Line(
            id: "c10",
            name: "C10",
            type: .cercanias,
            colorHex: "#aacc3a",
            stops: [
                Stop(id: "stop_villalba_c10", name: "Villalba", latitude: 40.6222, longitude: -4.0114, connectionLineIds: []),
                Stop(id: "stop_chamartin_c10", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"]),
                Stop(id: "stop_atocha_c10", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"])
            ],
            city: "Madrid"
        )

        // Mock Cercanías CIVIS
        let lineCIVIS = Line(
            id: "civis",
            name: "CIVIS",
            type: .cercanias,
            colorHex: "#d55994",
            stops: [
                Stop(id: "stop_madrid_chamartin_civis", name: "Madrid Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"]),
                Stop(id: "stop_segovia_civis", name: "Segovia", latitude: 40.9429, longitude: -4.1088, connectionLineIds: []),
                Stop(id: "stop_valladolid_civis", name: "Valladolid", latitude: 41.6448, longitude: -4.7120, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Ramal
        let lineRamal = Line(
            id: "ramal",
            name: "R",
            type: .metro,
            colorHex: "#bbcfe4",
            stops: [
                Stop(id: "stop_opera_ramal", name: "Ópera", latitude: 40.4192, longitude: -3.7062, connectionLineIds: ["line2", "line5"]),
                Stop(id: "stop_principe_pio_ramal", name: "Príncipe Pío", latitude: 40.4195, longitude: -3.7180, connectionLineIds: ["line6", "line10"])
            ],
            city: "Madrid"
        )

        // Mock Metro Ligero ML1
        let lineML1 = Line(
            id: "ml1",
            name: "ML1",
            type: .metro,
            colorHex: "#6fa8dc",
            stops: [
                Stop(id: "stop_pinar_chamartin_ml1", name: "Pinar de Chamartín", latitude: 40.4595, longitude: -3.6802, connectionLineIds: ["line1", "line4"]),
                Stop(id: "stop_sanchinarro_ml1", name: "Sanchinarro", latitude: 40.4959, longitude: -3.6638, connectionLineIds: []),
                Stop(id: "stop_las_tablas_ml1", name: "Las Tablas", latitude: 40.5082, longitude: -3.6798, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Metro Ligero ML2
        let lineML2 = Line(
            id: "ml2",
            name: "ML2",
            type: .metro,
            colorHex: "#e06666",
            stops: [
                Stop(id: "stop_colonia_jardin_ml2", name: "Colonia Jardín", latitude: 40.4637, longitude: -3.7742, connectionLineIds: ["ml3"]),
                Stop(id: "stop_pozuelo_ml2", name: "Pozuelo", latitude: 40.4468, longitude: -3.8166, connectionLineIds: []),
                Stop(id: "stop_aravaca_ml2", name: "Estación de Aravaca", latitude: 40.4507, longitude: -3.7932, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // Mock Metro Ligero ML3
        let lineML3 = Line(
            id: "ml3",
            name: "ML3",
            type: .metro,
            colorHex: "#8e44ad",
            stops: [
                Stop(id: "stop_colonia_jardin_ml3", name: "Colonia Jardín", latitude: 40.4637, longitude: -3.7742, connectionLineIds: ["ml2"]),
                Stop(id: "stop_boadilla_centro_ml3", name: "Boadilla Centro", latitude: 40.4018, longitude: -3.8677, connectionLineIds: []),
                Stop(id: "stop_puerta_boadilla_ml3", name: "Puerta de Boadilla", latitude: 40.3920, longitude: -3.8840, connectionLineIds: [])
            ],
            city: "Madrid"
        )

        // ========================================
        // SEVILLA (SEVILLE) - GTFS Data 2026-01-13
        // ========================================

        // Sevilla Metro L1
        let sevillaL1 = Line(
            id: "sevilla_line1",
            name: "L1",
            type: .metro,
            colorHex: "#0d6928",
            stops: [
                Stop(id: "51003", name: "Ciudad Expo", latitude: 37.4108, longitude: -6.0122, connectionLineIds: []),
                Stop(id: "51001", name: "San Juan Alto", latitude: 37.3897, longitude: -5.9845, connectionLineIds: []),
                Stop(id: "51002", name: "Olivar de Quintos", latitude: 37.3652, longitude: -5.9653, connectionLineIds: [])
            ],
            city: "Sevilla"
        )

        // Sevilla Cercanías C1 (Lora del Río - Lebrija) - 17 stops
        let sevillaC1 = Line(
            id: "sevilla_c1",
            name: "C1",
            type: .cercanias,
            colorHex: "#78B4E1",
            stops: [
                Stop(id: "50600", name: "Lora del Río", latitude: 37.6613212, longitude: -5.5295514, connectionLineIds: []),
                Stop(id: "50602", name: "Guadajoz", latitude: 37.5814594, longitude: -5.6699795, connectionLineIds: []),
                Stop(id: "50700", name: "Los Rosales", latitude: 37.5899718, longitude: -5.7261208, connectionLineIds: ["sevilla_c3"]),
                Stop(id: "50701", name: "Cantillana", latitude: 37.5749689, longitude: -5.8032073, connectionLineIds: ["sevilla_c3"]),
                Stop(id: "50702", name: "Brenes", latitude: 37.5463276, longitude: -5.8667821, connectionLineIds: ["sevilla_c3"]),
                Stop(id: "50704", name: "El Cáñamo", latitude: 37.4863952, longitude: -5.9329750, connectionLineIds: ["sevilla_c3"]),
                Stop(id: "50703", name: "La Rinconada", latitude: 37.4800897, longitude: -5.9401190, connectionLineIds: ["sevilla_c3"]),
                Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c2", "sevilla_c3", "sevilla_c4", "sevilla_c5"]),
                Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c4", "sevilla_c5", "sevilla_line1"]),
                Stop(id: "51110", name: "Virgen del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c4", "sevilla_c5"]),
                Stop(id: "51113", name: "Jardines de Hércules", latitude: 37.3328527, longitude: -5.9640940, connectionLineIds: ["sevilla_c5"]),
                Stop(id: "51111", name: "Bellavista", latitude: 37.3215188, longitude: -5.9641924, connectionLineIds: ["sevilla_c5"]),
                Stop(id: "51103", name: "Dos Hermanas", latitude: 37.2872259, longitude: -5.9235322, connectionLineIds: ["sevilla_c5"]),
                Stop(id: "51112", name: "Cantaelgallo", latitude: 37.2782197, longitude: -5.9104397, connectionLineIds: []),
                Stop(id: "51200", name: "Utrera", latitude: 37.1848178, longitude: -5.7907537, connectionLineIds: []),
                Stop(id: "51202", name: "Las Cabezas de San Juan", latitude: 37.0194897, longitude: -5.9465800, connectionLineIds: []),
                Stop(id: "51203", name: "Lebrija", latitude: 36.9116378, longitude: -6.0948487, connectionLineIds: [])
            ],
            city: "Sevilla"
        )

        // Sevilla Cercanías C2 (Santa Justa - Cartuja) - 3 stops
        let sevillaC2 = Line(
            id: "sevilla_c2",
            name: "C2",
            type: .cercanias,
            colorHex: "#067B34",
            stops: [
                Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c3", "sevilla_c4", "sevilla_c5"]),
                Stop(id: "51051", name: "Estadio Olímpico", latitude: 37.4174307, longitude: -6.0074960, connectionLineIds: []),
                Stop(id: "51050", name: "Cartuja", latitude: 37.4074574, longitude: -6.0101856, connectionLineIds: [])
            ],
            city: "Sevilla"
        )

        // Sevilla Cercanías C3 (Santa Justa - Cazalla-Constantina) - 11 stops
        let sevillaC3 = Line(
            id: "sevilla_c3",
            name: "C3",
            type: .cercanias,
            colorHex: "#E4242D",
            stops: [
                Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c4", "sevilla_c5"]),
                Stop(id: "50703", name: "La Rinconada", latitude: 37.4800897, longitude: -5.9401190, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "50704", name: "El Cáñamo", latitude: 37.4863952, longitude: -5.9329750, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "50702", name: "Brenes", latitude: 37.5463276, longitude: -5.8667821, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "50701", name: "Cantillana", latitude: 37.5749689, longitude: -5.8032073, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "50700", name: "Los Rosales", latitude: 37.5899718, longitude: -5.7261208, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "40122", name: "Tocina", latitude: 37.6093044, longitude: -5.7316939, connectionLineIds: []),
                Stop(id: "40121", name: "Alcolea del Río", latitude: 37.6354557, longitude: -5.7308309, connectionLineIds: []),
                Stop(id: "40119", name: "Villanueva del Río-Minas", latitude: 37.6617048, longitude: -5.7121543, connectionLineIds: []),
                Stop(id: "40115", name: "Pedroso", latitude: 37.8373919, longitude: -5.7624522, connectionLineIds: []),
                Stop(id: "40113", name: "Cazalla-Constantina", latitude: 37.9328637, longitude: -5.7044330, connectionLineIds: [])
            ],
            city: "Sevilla"
        )

        // Sevilla Cercanías C4 (Circular: Santa Justa - Palacio Congresos - San Bernardo) - 5 stops
        let sevillaC4 = Line(
            id: "sevilla_c4",
            name: "C4",
            type: .cercanias,
            colorHex: "#8E2182",
            stops: [
                Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c3", "sevilla_c5"]),
                Stop(id: "51009", name: "Palacio de Congresos", latitude: 37.4036456, longitude: -5.9362636, connectionLineIds: []),
                Stop(id: "51010", name: "Padre Pío-Palmete", latitude: 37.3708520, longitude: -5.9394111, connectionLineIds: []),
                Stop(id: "51110", name: "Virgen del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c1", "sevilla_c5"]),
                Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c1", "sevilla_c5", "sevilla_line1"])
            ],
            city: "Sevilla"
        )

        // Sevilla Cercanías C5 (Dos Hermanas - Santa Justa - Benacazón) - 13 stops (2 branches)
        let sevillaC5 = Line(
            id: "sevilla_c5",
            name: "C5",
            type: .cercanias,
            colorHex: "#073588",
            stops: [
                // Eastern branch (Dos Hermanas)
                Stop(id: "51103", name: "Dos Hermanas", latitude: 37.2872259, longitude: -5.9235322, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "51111", name: "Bellavista", latitude: 37.3215188, longitude: -5.9641924, connectionLineIds: ["sevilla_c1"]),
                Stop(id: "51113", name: "Jardines de Hércules", latitude: 37.3328527, longitude: -5.9640940, connectionLineIds: ["sevilla_c1"]),
                // Central corridor
                Stop(id: "51110", name: "Virgen del Rocío", latitude: 37.3628091, longitude: -5.9760105, connectionLineIds: ["sevilla_c1", "sevilla_c4"]),
                Stop(id: "51100", name: "San Bernardo", latitude: 37.3777778, longitude: -5.9796142, connectionLineIds: ["sevilla_c1", "sevilla_c4", "sevilla_line1"]),
                Stop(id: "51003", name: "Sevilla-Santa Justa", latitude: 37.3924955, longitude: -5.9749269, connectionLineIds: ["sevilla_c1", "sevilla_c2", "sevilla_c3", "sevilla_c4"]),
                // Western branch (Benacazón)
                Stop(id: "43000", name: "San Jerónimo", latitude: 37.4331730, longitude: -5.9803600, connectionLineIds: []),
                Stop(id: "43002", name: "Camas", latitude: 37.4177385, longitude: -6.0408469, connectionLineIds: []),
                Stop(id: "43026", name: "Valencina-Santiponce", latitude: 37.4268127, longitude: -6.0566858, connectionLineIds: []),
                Stop(id: "43027", name: "Salteras", latitude: 37.4102348, longitude: -6.0992391, connectionLineIds: []),
                Stop(id: "43003", name: "Villanueva del Ariscal y Olivares", latitude: 37.4071375, longitude: -6.1481895, connectionLineIds: []),
                Stop(id: "43004", name: "Sanlúcar la Mayor", latitude: 37.3814397, longitude: -6.1939625, connectionLineIds: []),
                Stop(id: "43005", name: "Benacazón", latitude: 37.3568512, longitude: -6.2082011, connectionLineIds: [])
            ],
            city: "Sevilla"
        )

        // Collect all lines
        lines = [
            // Madrid Metro Lines
            line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12,
            lineRamal, lineML1, lineML2, lineML3,
            // Madrid Cercanías Lines
            lineC1, lineC2, lineC3, lineC4a, lineC4b, lineC5, lineC7, lineC8a, lineC8b, lineC9, lineC10, lineCIVIS,
            // Sevilla Metro Lines
            sevillaL1,
            // Sevilla Cercanías Lines
            sevillaC1, sevillaC2, sevillaC3, sevillaC4, sevillaC5
        ]

        // Collect all stops from Madrid and Sevilla
        // Break up array concatenation to help compiler
        var allStops: [Stop] = []
        // Madrid stops
        allStops += line1Stops
        allStops += line2Stops
        allStops += line3Stops
        allStops += c1Stops
        allStops += c3Stops
        // Sevilla stops - include ALL from each line
        allStops += sevillaL1.stops
        allStops += sevillaC1.stops
        allStops += sevillaC2.stops
        allStops += sevillaC3.stops
        allStops += sevillaC4.stops
        allStops += sevillaC5.stops
        stops = allStops
    }

    private func generateMockArrivals(for stopId: String) -> [Arrival] {
        let now = Date()

        return [
            Arrival(
                id: UUID().uuidString,
                lineId: "line1",
                lineName: "L1",
                destination: "Valdecarros",
                scheduledTime: now.addingTimeInterval(3 * 60),
                expectedTime: now.addingTimeInterval(3 * 60),
                platform: "1"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "line1",
                lineName: "L1",
                destination: "Pinar de Chamartín",
                scheduledTime: now.addingTimeInterval(7 * 60),
                expectedTime: now.addingTimeInterval(10 * 60), // 3 min delay
                platform: "2"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "c3",
                lineName: "C3",
                destination: "Aranjuez",
                scheduledTime: now.addingTimeInterval(12 * 60),
                expectedTime: now.addingTimeInterval(12 * 60),
                platform: "3"
            ),
        ]
    }
}
