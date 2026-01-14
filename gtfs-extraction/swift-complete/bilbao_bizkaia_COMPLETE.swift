// BILBAO-BIZKAIA Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 4

// ====================================================================================
// C1: Abando                                  -Santurtzi
// ====================================================================================
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

// ====================================================================================
// C2: Abando                                  -Muskiz
// ====================================================================================
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

// ====================================================================================
// C3: Abando                                  -Orduña
// ====================================================================================
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

// ====================================================================================
// C4: Bilbao La Concordia                     -La Calzada
// ====================================================================================
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

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 4
// C1: 18 stops
// C2: 24 stops
// C3: 25 stops
// C4: 29 stops
// Total stops: 96 (with duplicates across lines)
