// MÁLAGA Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 2

// ====================================================================================
// C1: Málaga-Centro Alameda                   -Fuengirola
// ====================================================================================
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

// ====================================================================================
// C2: Málaga-Centro Alameda                   -Álora
// ====================================================================================
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

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 2
// C1: 18 stops
// C2: 10 stops
// Total stops: 28 (with duplicates across lines)
