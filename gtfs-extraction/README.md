# GTFS Extraction Files

This directory contains all the GTFS extraction work for Spanish Cercanías networks.

## Directory Structure

```
gtfs-extraction/
├── scripts/              # Python extraction scripts
├── swift-complete/       # Complete Swift line definitions
├── data/                 # JSON extraction results
└── README.md            # This file
```

## Scripts (`scripts/`)

### Main Extraction Scripts
- **`extract_complete_hybrid.py`** - Main hybrid extraction (stop_times.txt + shapes.txt)
- **`extract_using_shapes.py`** - Shape-based extraction only
- **`extract_ALL_complete_lines.py`** - Attempted stop_times.txt extraction (Sevilla only)

### Code Generation
- **`generate_swift_from_json.py`** - Generates Swift code from JSON data
- **`merge_dataservice.py`** - Merges all Swift files into DataService.swift

### Analysis Scripts
- **`analyze_cercanias_v2.py`** - Sevilla Cercanías analysis
- **`analyze_cercanias.py`** - Initial Cercanías analysis
- **`analyze_sevilla_gtfs.py`** - Sevilla GTFS analysis
- **`analyze_madrid_c1.py`** - Madrid C1 specific analysis
- **`extract_barcelona.py`** - Barcelona extraction
- **`extract_all_madrid.py`** - Madrid extraction

## Swift Files (`swift-complete/`)

### Complete Extractions (FINAL)
- **`madrid_COMPLETE.swift`** - 10 Madrid Cercanías lines (144 stops)
- **`sevilla_COMPLETE.swift`** - 5 Sevilla Cercanías lines (51 stops)
- **`barcelona_COMPLETE.swift`** - 12 Barcelona Rodalies lines (320 stops)
- **`valencia_COMPLETE.swift`** - 5 Valencia Cercanías lines (72 stops)
- **`málaga_COMPLETE.swift`** - 2 Málaga Cercanías lines (28 stops)
- **`bilbao_bizkaia_COMPLETE.swift`** - 4 Bilbao lines (96 stops)
- **`san_sebastián_gipuzkoa_COMPLETE.swift`** - 1 San Sebastián line (30 stops)
- **`DataService_COMPLETE.swift`** - Merged DataService.swift (all networks)

### Earlier Versions (BASIC - superseded)
- `*_BASIC.swift` - Earlier extractions with main stations only

## Data (`data/`)

- **`complete_hybrid_extraction.json`** - Final extraction with all 39 lines and 741 stops
- **`sevilla_cercanias_sequences.json`** - Sevilla-specific sequences
- **`shape_based_extraction_results.json`** - Shape-only extraction results

## Data Source

All data extracted from GTFS file:
- **Location:** `/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/`
- **Date:** 2026-01-13
- **Source:** Renfe official GTFS

## Methodology

### Hybrid Approach
1. **Sevilla:** Used `stop_times.txt` (100% accurate)
2. **Other networks:** Used `shapes.txt` geographic matching (1.0 km tolerance)

### Why Hybrid?
The GTFS `stop_times.txt` file only contains Sevilla data. Other networks required shape-based matching to infer stop sequences.

## Integration Status

✅ **COMPLETE** - All data integrated into `WatchTransApp/WatchTrans/WatchTrans Watch App/Services/DataService.swift`

## Statistics

- **39 lines** extracted
- **741 stops** with GPS coordinates
- **6 networks** covered (Madrid, Sevilla, Barcelona, Valencia, Málaga, Bilbao/San Sebastián)
- **100% coverage** of available GTFS data

## See Also

- `../docs/INTEGRATION_COMPLETE.md` - Full integration documentation
- `../docs/COMPLETE_EXTRACTION_SUMMARY.md` - Extraction methodology and results
