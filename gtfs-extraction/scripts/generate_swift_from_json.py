#!/usr/bin/env python3
"""
Generate Swift code from the complete extraction JSON
"""
import json

# Load the complete extraction
with open('/Users/juanmaciasgomez/Downloads/complete_hybrid_extraction.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Network city names mapping
network_cities = {
    'MADRID': 'Madrid',
    'SEVILLA': 'Sevilla',
    'MÁLAGA': 'Málaga',
    'VALENCIA': 'Valencia',
    'BARCELONA': 'Barcelona',
    'BILBAO-BIZKAIA': 'Bilbao',
    'SAN SEBASTIÁN-GIPUZKOA': 'San Sebastián'
}

def generate_swift_for_network(network_name, network_data):
    """Generate Swift code for a network"""
    city_name = network_cities.get(network_name, network_name)

    swift_code = f"""// {network_name} Cercanías - COMPLETE EXTRACTION
// Source: GTFS (Hybrid: stop_times.txt + shapes.txt)
// Date: 2026-01-14
// Lines: {len(network_data)}

"""

    # Generate code for each line
    for line_name, line_data in sorted(network_data.items()):
        stops = line_data['stops']
        color = line_data['color']
        route_desc = line_data['route_desc']

        # Build connection IDs for each stop
        # A stop connects to other lines that also have this stop
        connection_map = {}
        for stop in stops:
            stop_id = stop['id']
            connections = []

            # Find other lines in this network that have this stop
            for other_line_name, other_line_data in network_data.items():
                if other_line_name != line_name:
                    other_stop_ids = [s['id'] for s in other_line_data['stops']]
                    if stop_id in other_stop_ids:
                        # Generate line ID
                        network_prefix = network_name.lower().replace('-', '_').replace(' ', '_').split('_')[0]
                        line_id = f"{network_prefix}_{other_line_name.lower().replace(' ', '_')}"
                        connections.append(line_id)

            connection_map[stop_id] = connections

        # Generate line variable name
        network_prefix = network_name.lower().replace('-', '_').replace(' ', '_').split('_')[0]
        line_var = f"{network_prefix}{line_name.replace(' ', '_')}"
        line_id = f"{network_prefix}_{line_name.lower().replace(' ', '_')}"

        swift_code += f"""// {'='*84}
// {line_name}: {route_desc}
// {'='*84}
let {line_var} = Line(
    id: "{line_id}",
    name: "{line_name}",
    type: .cercanias,
    colorHex: "#{color}",
    stops: [
"""

        # Generate stops
        for i, stop in enumerate(stops):
            stop_id = stop['id']
            stop_name = stop['name']
            lat = stop['lat']
            lon = stop['lon']
            connections = connection_map.get(stop_id, [])
            connection_str = '", "'.join(connections)
            if connection_str:
                connection_str = f'["{connection_str}"]'
            else:
                connection_str = '[]'

            comma = ',' if i < len(stops) - 1 else ''

            swift_code += f'        Stop(id: "{stop_id}", name: "{stop_name}", latitude: {lat}, longitude: {lon}, connectionLineIds: {connection_str}){comma}\n'

        swift_code += f"""    ],
    city: "{city_name}"
)

"""

    # Add summary
    swift_code += f"""// {'='*84}
// SUMMARY
// {'='*84}
// Total lines: {len(network_data)}
"""

    for line_name, line_data in sorted(network_data.items()):
        swift_code += f"// {line_name}: {len(line_data['stops'])} stops\n"

    swift_code += f"// Total stops: {sum(len(line_data['stops']) for line_data in network_data.values())} (with duplicates across lines)\n"

    return swift_code

# Generate Swift files for each network
for network_name, network_data in data.items():
    if not network_data:  # Skip empty networks
        continue

    swift_code = generate_swift_for_network(network_name, network_data)

    # Save to file
    filename = f"/Users/juanmaciasgomez/Downloads/{network_name.lower().replace(' ', '_').replace('-', '_')}_COMPLETE.swift"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(swift_code)

    print(f"Generated: {filename}")

print("\nAll Swift files generated successfully!")
