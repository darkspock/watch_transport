// VALENCIA Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 5

// ====================================================================================
// C1: Valencia Nord                           -Platja i Grau de Gandia
// ====================================================================================
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

// ====================================================================================
// C2: Valencia Nord                           -Moixent
// ====================================================================================
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

// ====================================================================================
// C3: Valencia Nord                           -Utiel
// ====================================================================================
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

// ====================================================================================
// C5: Valencia Nord                           -Caudiel
// ====================================================================================
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

// ====================================================================================
// C6: Valencia Nord                           -Castello de la Plana
// ====================================================================================
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

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 5
// C1: 11 stops
// C2: 16 stops
// C3: 15 stops
// C5: 16 stops
// C6: 14 stops
// Total stops: 72 (with duplicates across lines)
