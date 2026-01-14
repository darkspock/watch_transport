#!/usr/bin/env python3

# Barcelona Rodalies line summary from Wikipedia + GTFS
lines = {
    "R1": {"color": "#7DBCEC", "route": "Molins de Rei → Hospital de Bellvitge → Maçanet-Massanes"},
    "R2": {"color": "#26A741", "route": "Sant Vicenç de Calders → Barcelona-Sants → Maçanet-Massanes"},
    "R2N": {"color": "#D0DF00", "route": "Aeroport → Barcelona-Sants → Maçanet-Massanes"},
    "R2S": {"color": "#146520", "route": "Sant Vicenç de Calders → Barcelona-França → Mataró"},
    "R3": {"color": "#E54A3C", "route": "L'Hospitalet → Barcelona-Sants → Vic → Puigcerdà"},
    "R4": {"color": "#F7A30D", "route": "Sant Vicenç de Calders → Barcelona-Sants → Manresa"},
    "R7": {"color": "#B57CBB", "route": "Barcelona-Fabra i Puig → Martorell → Cerdanyola"},
    "R8": {"color": "#88016A", "route": "Martorell → Barcelona-Sants → Granollers"},
    "R11": {"color": "#0069AA", "route": "Barcelona-Sants → Portbou (long distance)"},
    "R14": {"color": "#6C60A8", "route": "Barcelona-França → Lleida (regional)"},
    "R15": {"color": "#978571", "route": "Barcelona-França → Riba-roja d'Ebre (regional)"},
    "R16": {"color": "#B52B46", "route": "Barcelona-Sants → Tortosa (regional)"},
    "R17": {"color": "#F3B12E", "route": "Barcelona-Sants → Tarragona (regional)"},
}

print("=" * 100)
print("BARCELONA RODALIES - LINE SUMMARY")
print("=" * 100)
print()

for line_id, info in sorted(lines.items()):
    print(f"{line_id:5s} | Color: {info['color']:7s} | {info['route']}")

print()
print("=" * 100)
print("Total lines: 13 (R1-R8 core + R11, R14-R17 regional)")
print("Note: R2N = Airport extension, R2S = Southern variant")
print("=" * 100)
