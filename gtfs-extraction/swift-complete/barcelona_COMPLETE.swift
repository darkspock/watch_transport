// BARCELONA Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: 12

// ====================================================================================
// R1: Molins de Rei                           -Maçanet-Massanes
// ====================================================================================
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

// ====================================================================================
// R11: Figueres                                -Barcelona-Sants
// ====================================================================================
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

// ====================================================================================
// R14: La Plana-Picamoixons                    -Tarragona
// ====================================================================================
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

// ====================================================================================
// R15: Riba-roja d'Ebre                        -Caspe
// ====================================================================================
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

// ====================================================================================
// R16: Tortosa                                 -Barcelona-Estació de França
// ====================================================================================
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

// ====================================================================================
// R17: Salou-Port Aventura                     -Barcelona-Estació de França
// ====================================================================================
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

// ====================================================================================
// R2: Sant Vicenc de Calders                  -Maçanet-Massanes
// ====================================================================================
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

// ====================================================================================
// R2N: Aeroport                                -Maçanet-Massanes
// ====================================================================================
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

// ====================================================================================
// R2S: Sant Vicenc de Calders                  -Barcelona-Estació de França
// ====================================================================================
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

// ====================================================================================
// R3: L'Hospitalet de Llobregat               -Puigcerdà
// ====================================================================================
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

// ====================================================================================
// R8: Martorell Central                       -Granollers Centre
// ====================================================================================
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

// ====================================================================================
// RT1: La Plana-Picamoixons                    -Tarragona
// ====================================================================================
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

// ====================================================================================
// SUMMARY
// ====================================================================================
// Total lines: 12
// R1: 35 stops
// R11: 39 stops
// R14: 37 stops
// R15: 34 stops
// R16: 32 stops
// R17: 23 stops
// R2: 18 stops
// R2N: 26 stops
// R2S: 20 stops
// R3: 44 stops
// R8: 9 stops
// RT1: 3 stops
// Total stops: 320 (with duplicates across lines)
