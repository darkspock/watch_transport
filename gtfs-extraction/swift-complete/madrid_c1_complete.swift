// Madrid Cercanías C1
// Source: GTFS 20260113_170011_RENFE_CERCA
// Color: #75B6E0 (Light Blue - Official Renfe)
// Route: Príncipe Pío ↔ Aeropuerto T4

let madridC1 = Line(
    id: "madrid_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#75B6E0",
    stops: [
        Stop(id: "10000", name: "Madrid-Príncipe Pío", latitude: 40.4214895, longitude: -3.7189689, connectionLineIds: ["madrid_c7", "madrid_c10"]),
        Stop(id: "10001", name: "Aravaca", latitude: 40.4484551, longitude: -3.7855547, connectionLineIds: ["madrid_c7", "madrid_c10"]),
        Stop(id: "10002", name: "Pozuelo", latitude: 40.4474569, longitude: -3.8002779, connectionLineIds: ["madrid_c7", "madrid_c10"]),
        Stop(id: "10010", name: "El Barrial-Centro Comercial Pozuelo", latitude: 40.4653918, longitude: -3.8076854, connectionLineIds: ["madrid_c7"]),
        Stop(id: "10005", name: "Las Rozas", latitude: 40.4942887, longitude: -3.8681747, connectionLineIds: ["madrid_c7", "madrid_c10"]),
        Stop(id: "10007", name: "Majadahonda", latitude: 40.4742885, longitude: -3.8462931, connectionLineIds: ["madrid_c7", "madrid_c10"]),
        Stop(id: "18002", name: "Madrid-Nuevos Ministerios", latitude: 40.4466271, longitude: -3.6923468, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10", "line6", "line8", "line10"]),
        Stop(id: "17000", name: "Madrid-Chamartín-Clara Campoamor", latitude: 40.4711789, longitude: -3.6829524, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10", "line1", "line10"]),
        Stop(id: "18001", name: "Madrid-Recoletos", latitude: 40.4233731, longitude: -3.6909310, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c7", "madrid_c8", "madrid_c10"]),
        Stop(id: "18000", name: "Madrid-Atocha Cercanías", latitude: 40.4066191, longitude: -3.6894391, connectionLineIds: ["madrid_c2", "madrid_c3", "madrid_c4", "madrid_c5", "madrid_c7", "madrid_c8", "madrid_c10", "line1"]),
        Stop(id: "18003", name: "Méndez Álvaro", latitude: 40.3957768, longitude: -3.6778440, connectionLineIds: ["madrid_c5"]),
        Stop(id: "98305", name: "Madrid-Aeropuerto T4", latitude: 40.4924023, longitude: -3.5932297, connectionLineIds: ["madrid_c10"])
    ],
    city: "Madrid"
)

// NOTES:
// - Connection IDs are estimated based on typical Madrid network
// - Metro connections at Nuevos Ministerios (L6, L8, L10), Chamartín (L1, L10), Atocha (L1)
// - All central stations (Nuevos Ministerios → Atocha) are major interchange points
// - Western branch serves suburbs (Príncipe Pío → Majadahonda)
// - Need to verify exact metro line connections
