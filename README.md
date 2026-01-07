# 128Kb SRAM Decoder Design in TSMC 16nm FinFET

**Automated hierarchical predecoder and row decoder with SKILL-generated layout**

## Overview

This project implements a 512-row decoder for a 128Kb SRAM using TSMC 16nm FinFET technology. The design uses hierarchical predecoding to generate 512 unique wordline signals from a 9-bit address input, with complete automation through Cadence SKILL programming for both schematic and layout generation.

## Project Scope

- **Technology**: TSMC 16nm FinFET (N16ADFP)
- **Operating Conditions**: VDD = 0.8V, Temperature = 80°C
- **Architecture**: 512 wordlines (9-bit address decoding)
- **Implementation**: Hierarchical 3-stage predecoding with SKILL automation
- **Final Area**: 9.216 µm × 95.948 µm = 884.72 µm²

## Architecture

### Three-Stage Predecoding Hierarchy

**Stage 1: Subblock1 (4-input AND Predecoder)**
- Inputs: CLK, A0, A1, A2
- Outputs: 8 predecoded signals (pd0_0 through pd0_7)
- Clock-gated design ensures all wordlines stay low when CLK=0
- Implementation: 8× AND4 gates

**Stage 2: Subblock2 & Subblock3 (3-input AND Predecoders)**
- Subblock2: A3, A4, A5 → 8 outputs (pd1_0 through pd1_7)
- Subblock3: A6, A7, A8 → 8 outputs (pd2_0 through pd2_7)
- Implementation: 8× AND3 gates each
***
<p align="center">
  <img width="700" height="282" alt="image" src="https://github.com/user-attachments/assets/711d4d06-d499-405a-8fa9-41727ad364a7" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: High-level block diagram of the 512-row hierarchical predecoder, showing the PD2, PD1, and PD0 predecoder blocks</i></p>

**Stage 3: Final AND Matrix**
- 512× 3-input AND gates
- Each gate combines one signal from each predecoder block
- Total combinations: 8 × 8 × 8 = 512 unique wordlines

<p align="center">
  <img width="309" alt="image" src="https://github.com/user-attachments/assets/7ee74c5b-13d2-4212-bb4e-e0b9e525362c" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: Automated schematic generation using Cadence SKILL</i></p>

<p align="center">
  <img width="376" alt="image" src="https://github.com/user-attachments/assets/a2637182-e21f-4d2c-87c5-c21687785911" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: Wordline driver design</i></p>

### Wordline Driver Design

Each decoded signal drives a two-stage buffer chain:
- **Stage 1**: INV4 (4-fin) - intermediate buffering to reduce fanout
- **Stage 2**: INV16 (16-fin) - strong driver sized for 256 SRAM cells
- **Output**: Dual-polarity wordlines (wls and wln) for SRAM array integration
- **Width matching**: 32 poly-pitch width for seamless row integration
***
<p align="center">
  <img width="534" alt="image" src="https://github.com/user-attachments/assets/fef15d28-b55e-43fe-a30f-59101afc5ec6" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: WL driver sized to match load of 256 SRAM cells with physical sizing aligned to 32 poly-pitch width for row integration</i></p>
## Key Features

### SKILL Automation
- Complete schematic generation with automated net/instance naming
- Hierarchical layout placement with 16×16 WL driver arrays
- Pin extraction and routing automation
- Reduced manual errors in 512-wordline repetitive structures

### Layout Optimizations
- Dense standard-cell style packing for area efficiency
- Strategic metal layer allocation to minimize routing congestion
- Uniform signal paths to limit skew across 512 rows
- Filler cell insertion for diffusion continuity and power rail integrity

### Design Verification
- Functional verification through HSPICE simulation
- One-hot wordline behavior confirmed across address patterns
- Signal continuity traced from predecoder outputs to WL drivers
- Clock gating verified (all WLs low when CLK=0)

## Installation

### Prerequisites
- Cadence Virtuoso (for schematic/layout viewing)
- TSMC 16nm FinFET PDK (N16ADFP)
- HSPICE or compatible SPICE simulator
- SKILL programming environment

### Setup
```bash
# Navigate to project directory
cd /path/to/sram-decoder

# Load SKILL scripts in Cadence
load("decoder_512.il")
load("block_measurement.il")

# Generate schematic
create_512_decoder()
```

## Usage

### Schematic Generation
```scheme
; Create 512-row decoder with automated routing
load("decoder_512.il")
create_512_decoder()

; Measure block dimensions
load("block_measurement.il")
reportSymbolLabelsAsPins("NandiniSRAM" "PredecoderComplete")
```

### Layout Access
Project cells stored in Cadence library: `NandiniSRAM`

**Schematics:**
- `rowDecoder512` - Top-level 512-row decoder
- `subblock1`, `subblock2`, `subblock3` - Predecoder blocks

**Layouts:**
- `PredecoderComplete` - Integrated predecoder (3.78 µm × 5.76 µm)
- `WLDriver` - Single wordline driver cell (0.576 µm × 2.88 µm)
- `wl_driver_array_16x16` - 16×16 WL driver array
- `rowDecoder512_complete5` - Final assembled layout

### Simulation
```spice
.TEMP 80
.OPTION POST
.lib /path/to/n16adfp_spice_model_v1d0_usage.l TTMacro_MOS_MOSCAP

.INCLUDE rowDecoder.sp

.PARAM VDD=0.8
VDD vdd! 0 VDD
VSS vss! 0 0

* Address pattern test
VA0 A0 0 PULSE(0 VDD 8n 10p 10p 8n 100n)
VA1 A1 0 PULSE(0 VDD 32n 10p 10p 10n 100n)
* ... (remaining address bits)

.TRAN 0.1n 42n
.END
```

## Results

### Functional Verification
- **One-hot encoding**: Only one wordline asserts high for each address combination
- **Clock gating**: All wordlines remain low when CLK=0
- **Address decoding**: Correct WL activation for test patterns (addr 0, 1, 8, 64, 511)
- **Signal integrity**: Clean transitions with proper slew rates
***
<p align="center">
  <img width="713" alt="image" src="https://github.com/user-attachments/assets/ceb5c451-aed3-41ae-8b2a-54b6d01a6fb6" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: Verified WL functional correctness</i></p>
***
### Layout Metrics
- **Total Area**: 884.72 µm²
- **Height**: 9.216 µm (16 standard cell rows)
- **Width**: 95.948 µm
- **Density**: Standard-cell style packing with structured routing lanes
- **Metal Layers**: M3-M6 (horizontal), M7-M10 (vertical)


### Timing Characteristics
- **Predecoder delay**: Minimized through proper fin sizing
- **Driver strength**: Scaled to drive 256 SRAM cell loads
- **Skew**: Uniform delay across all 512 rows due to identical buffer chains
- **Operating frequency**: Suitable for worst-case 80°C operation

<p align="center">
  <img width="271" alt="image" src="https://github.com/user-attachments/assets/4e51b2cc-5ec8-4b15-a578-5ed231f29d4b" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: Final layout area = 9.216 µm × 95.948 µm = 884.72 µm²</i></p>

## Technical Implementation

### Cell Library
**Basic Gates:**
- `inverter_schematic` - 1-fin minimal inverter
- `inv2` - 2-fin inverter
- `inv4` - 4-fin intermediate buffer
- `Inv8` - 8-fin strong driver
- `Inv16` - 16-fin wordline driver

**Compound Gates:**
- `and3_schematic` - 3-input NAND (4-fin) + inv2
- `and4_schematic` - 4-input NAND (4-fin) + Inv8
- `and3_inv8` - 3-input NAND (4-fin) + Inv8

### Transistor Sizing Rationale
- **Predecoder gates**: 4-fin devices to limit stacked NMOS delay
- **Intermediate buffers**: 4-fin to reduce fanout and improve slew
- **Final drivers**: 16-fin to drive long wordlines and bitcell gate capacitance
- **Two-stage buffering**: Better energy-delay tradeoff than single large inverter

### SKILL Automation Strategy
```scheme
; Key automation features:
; 1. Hierarchical placement with coordinate calculations
; 2. Vertical buses from predecoders (going UP)
; 3. Horizontal buses feeding AND gates
; 4. Power distribution network
; 5. Pin creation and labeling (WL<0> through WL<511>)
; 6. Structured naming for scalability
```

### Layout Hierarchy
```
rowDecoder512_complete5/
├── PredecoderComplete (center)
│   ├── subblock1 (8× AND4 gates)
│   ├── subblock2 (8× AND3 gates)
│   └── subblock3 (8× AND3 gates)
└── wl_driver_array_16x16 (left and right)
    └── 256× WLDriver cells each
        └── NAND3 + INV1 + INV4 + INV16 chain
```

## Design Challenges and Solutions

### Challenge 1: Power Distribution
**Problem**: Global net names (VDD!, VSS!) in schematic conflicted with explicit power pins in standard cell layouts

**Solution**: 
- Used TSMC N16ADFP standard cell power rails
- VDD/VSS treated as global nets in layout for seamless connectivity
- Eliminated schematic/layout power net mismatches

### Challenge 2: Routing Congestion
**Problem**: 512 parallel signal paths from predecoders to WL drivers

**Solution**:
- Strategic metal layer allocation (M3-M6 horizontal, M7-M10 vertical)
- Different metal layers for first 4 outputs in array
- Shift to different metal layer every 4 cells in column to avoid overlap
***
<p align="center">
  <img width="455" height="269" alt="image" src="https://github.com/user-attachments/assets/fadbeaf1-01aa-4c3c-9d62-7c9fff5f32c5" />
</p>
<p align="center"><i>Figure: [Add your caption here]</i></p>
<p align="center"><i>Figure: Routed predecoder outputs with consistent layer usage and via strategy</i></p>
***

### Challenge 3: Layout Scalability
**Problem**: Manual placement of 512 drivers prone to errors

**Solution**:
- SKILL-automated 16×16 array generation
- Consistent pin ordering for WL indexing
- Structured pin grid for clean top-level routing access
***
<img width="730" height="379" alt="image" src="https://github.com/user-attachments/assets/fea57a5c-1dfd-4de9-b156-8e5cd0d6e3ee" />
<p align="center"><i>Figure: Generated 16×16 WL driver array using SKILL</i></p>

### Challenge 4: Signal Skew
**Problem**: Ensuring uniform delay across all 512 wordlines

**Solution**:
- Identical buffer chain for every wordline (INV1→INV4→INV16)
- Uniform routing paths with consistent via count
- Minimized wirelength variations through dense packing

<p align="center">
  <img width="700" height="314" alt="image" src="https://github.com/user-attachments/assets/908d9a6b-7449-4571-941e-0c4fbebf1974" />
</p>
<p align="center"><i>Figure: Wordline driver organization</i></p>

## Project Structure

```
sram-decoder/
├── skill/
│   ├── decoder_512.il              # Main schematic generator
│   ├── block_measurement.il        # Dimension reporting
│   ├── layout_placement.il         # Array placement automation
│   └── pin_extraction.il           # Pin coordinate extraction
├── schematics/
│   ├── rowDecoder512/              # Top-level decoder
│   ├── subblock1/                  # 4-input predecoder
│   ├── subblock2/                  # 3-input predecoder
│   └── subblock3/                  # 3-input predecoder
├── layouts/
│   ├── PredecoderComplete/         # Integrated predecoder
│   ├── WLDriver/                   # Single driver cell
│   ├── wl_driver_array_16x16/      # Driver array
│   └── rowDecoder512_complete5/    # Final layout
├── simulation/
│   ├── rowDecoder.sp               # SPICE netlist
│   └── test_vectors/               # Address pattern testbenches
└── docs/
    ├── phase2_report.pdf           # Preliminary layout documentation
    ├── phase3_presentation.pdf     # Final presentation
    └── images/                     # Layout screenshots
```
<p align="center">
  <img width="884" height="237" alt="image" src="https://github.com/user-attachments/assets/f84c8564-1cbc-45f3-9794-26d8f0012b4e" />
</p>
<p align="center"><i>Figure: Complete placement of required standard cells; WL driver chain implemented as NAND3 + INV1 + INV4 + INV16. No filler cells inside the WL driver chain to maximize density and reduce extra parasitics</i></p>

## Future Enhancements

- Integration with 6T SRAM bitcell array
- Post-layout parasitic extraction and timing analysis
- Power analysis (dynamic and leakage)
- Multi-corner simulation (FF, SS, FS, SF)
- Process variation Monte Carlo analysis
- Extension to 1024 or 2048 wordlines

## References

- TSMC 16nm FinFET Design Manual
- Cadence Virtuoso SKILL Language Reference
- Rabaey, J., Chandrakasan, A., & Nikolić, B. (2003). *Digital Integrated Circuits*
- Weste, N., & Harris, D. (2010). *CMOS VLSI Design: A Circuits and Systems Perspective*

## Course Context

**Course**: EE 8310 - Advanced Topics in VLSI  
**Institution**: University of Minnesota  
**Instructor**: Prof. Chris Kim  
**Semester**: Fall 2025

## Acknowledgments

SKILL code generation and debugging assisted by Claude AI (Anthropic). Layout automation strategies developed through iterative refinement with AI-assisted SKILL programming.

## License

Educational project - University of Minnesota

---

**Author**: Nandini Kumawat  
**Date**: December 2025  
**Contact**: kumaw010@umn.edu
