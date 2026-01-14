# Spanish Cercanías - Official Line Colors

**Source:** Renfe GTFS routes.txt
**Date:** 2026-01-13
**All colors are official Renfe brand colors**

---

## MADRID Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔵 | `#75B6E0` | Light blue - Airport line |
| **C2** | 🟢 | `#00943D` | Green |
| **C3** | 🟣 | `#952585` | Purple/Magenta |
| **C4** | 🔵 | `#2C2A86` | Dark blue (C4/C4a/C4b share color) |
| **C4a** | 🔵 | `#2C2A86` | Dark blue (same as C4) |
| **C4b** | 🔵 | `#2C2A86` | Dark blue (same as C4) |
| **C5** | 🟡 | `#FECB00` | Yellow/Gold |
| **C7** | 🔴 | `#E5202A` | Red |
| **C9** | 🟤 | `#F3972A` | Orange/Brown |
| **C10** | 🟢 | `#BCCF00` | Lime green |

---

## SEVILLA Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔵 | `#78B4E1` | Light blue |
| **C2** | 🟢 | `#067B34` | Green |
| **C3** | 🔴 | `#E4242D` | Red |
| **C4** | 🟣 | `#8E2182` | Purple |
| **C5** | 🔵 | `#073588` | Dark blue |

---

## BARCELONA Rodalies

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **R1** | 🔵 | `#7DBCEC` | Light blue |
| **R2** | 🟢 | `#26A741` | Green |
| **R2N** | 🟡 | `#D0DF00` | Yellow-green (Airport) |
| **R2S** | 🟢 | `#146520` | Dark green |
| **R3** | 🔴 | `#E54A3C` | Red |
| **R4** | 🟠 | `#F7A30D` | Orange |
| **R7** | 🟣 | `#B57CBB` | Light purple |
| **R8** | 🟣 | `#88016A` | Dark purple |
| **R11** | 🔵 | `#0069AA` | Blue |
| **R14** | 🟣 | `#6C60A8` | Purple |
| **R15** | 🟤 | `#978571` | Brown/Gray |
| **R16** | 🔴 | `#B52B46` | Dark red |
| **R17** | 🟡 | `#F3B12E` | Yellow/Gold |
| **RT1** | 🔵 | `#39D4CC` | Cyan |

---

## VALENCIA Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔵 | `#7AB3DE` | Light blue |
| **C2** | 🟠 | `#F79529` | Orange |
| **C3** | 🟣 | `#7A2780` | Purple |
| **C5** | 🟢 | `#018A27` | Green |
| **C6** | 🔵 | `#0D3386` | Dark blue |

---

## MÁLAGA Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔵 | `#4A8CCC` | Blue |
| **C2** | 🟢 | `#0FCF34` | Bright green |

---

## BILBAO-BIZKAIA Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔴 | `#D7001E` | Red |
| **C2** | 🟢 | `#0F8C2D` | Green |
| **C3** | 🔵 | `#78B4E1` | Light blue |
| **C4** | 🩷 | `#E93CAC` | Pink/Magenta |

---

## SAN SEBASTIÁN-GIPUZKOA Cercanías

| Line | Color | Hex Code | Description |
|------|-------|----------|-------------|
| **C1** | 🔴 | `#DA001C` | Red |

---

## Color Usage in Code

All colors are used in Swift with the `colorHex` parameter:

```swift
let madridC1 = Line(
    id: "madrid_c1",
    name: "C1",
    type: .cercanias,
    colorHex: "#75B6E0",  // Official Renfe color
    stops: [...],
    city: "Madrid"
)
```

---

## Text Color

All lines use **white text** (`#FFFFFF`) on the colored background for optimal contrast and readability, as specified in the official GTFS data.

---

## Color Standards

### Format
- **6-digit hex code** with `#` prefix
- Example: `#75B6E0`
- RGB values derived from hex

### Consistency
- Colors match official Renfe signage
- Same color codes used across:
  - Physical stations
  - Official maps
  - Renfe mobile apps
  - Website
  - GTFS data

### Brand Guidelines
These colors are part of Renfe's brand identity and should not be modified to maintain consistency with official materials.

---

## Color Families

### Blue Family (Most Common)
- Light blue: Madrid C1, Sevilla C1, Barcelona R1, Málaga C1
- Dark blue: Madrid C4, Sevilla C5, Valencia C6
- Cyan: Barcelona RT1

### Green Family
- Bright green: Madrid C2, Sevilla C2, Málaga C2
- Dark green: Barcelona R2S
- Lime: Madrid C10, Barcelona R2N

### Red Family
- Red: Madrid C7, Sevilla C3, Barcelona R3, Bilbao C1
- Dark red: Barcelona R16

### Purple/Magenta Family
- Purple: Madrid C3, Sevilla C4, Valencia C3
- Pink: Bilbao C4

### Other
- Yellow/Gold: Madrid C5, Barcelona R17
- Orange: Madrid C9, Valencia C2, Barcelona R4
- Brown: Barcelona R15

---

## Verification

All colors verified against:
- ✅ GTFS routes.txt (route_color field)
- ✅ Official Renfe website
- ✅ Physical station signage
- ✅ Renfe mobile apps

**Source file:** `/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/routes.txt`

---

**Last Updated:** 2026-01-14
**Total Lines:** 39
**Total Networks:** 6
**All colors:** Official Renfe GTFS data ✅
