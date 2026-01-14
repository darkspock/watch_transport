#!/usr/bin/env python3
import csv

# Load all Madrid stops (10xxx, 17xxx, 18xxx, 98xxx)
stops = {}
with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/stops.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        stop_id = row['stop_id'].strip()
        if stop_id.startswith(('10', '17', '18', '98')):
            stops[stop_id] = {
                'name': row['stop_name'].strip(),
                'lat': row['stop_lat'].strip(),
                'lon': row['stop_lon'].strip()
            }

print("=" * 100)
print(f"MADRID CERCANÍAS - ALL STATIONS ({len(stops)} total)")
print("=" * 100)
print()

# Group by prefix
for prefix in ['10', '17', '18', '98']:
    prefix_stops = {k: v for k, v in stops.items() if k.startswith(prefix)}
    if prefix_stops:
        print(f"\n{prefix}xxx stations ({len(prefix_stops)}):")
        print("-" * 80)
        for stop_id in sorted(prefix_stops.keys()):
            info = prefix_stops[stop_id]
            print(f"  {stop_id} | {info['name']:50s} | {info['lat']:11s}, {info['lon']:11s}")

print("\n" + "=" * 100)
print("Now checking GTFS routes for Madrid lines...")
print("=" * 100)

# Show all Madrid routes
with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/routes.txt', 'r', encoding='utf-8') as f:
    for line in f:
        if line.startswith('10T'):
            parts = line.strip().split(',')
            if len(parts) >= 6:
                route_id = parts[0]
                line_name = parts[1].strip()
                route_desc = parts[2].strip()
                color = parts[4].strip()
                print(f"{line_name:6s} | Color: #{color:6s} | {route_desc}")
