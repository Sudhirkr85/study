# 🖥️ BPSC Computer Science - Module 02: Computer Organization & Architecture (COA) & Microprocessors

> **🎯 Target:** 12 / 12 Marks in Part-III (BPSC TRE Standard)  
> **Syllabus Reference:** CSHT 204 (Computer System Architecture)  
> **Key Focus:** Deep First-Principles, Step-by-Step Logic, Anti-GATE Direct Exam Facts

---

## 📌 Chapter 1: Basic Computer Organization & System Bus

### 1.1 Core Functional Units
Ek standard computer system me 5 basic functional units hote hain:
1. **Input Unit:** Raw data aur instructions ko binary me convert karke computer me enter karta hai (e.g. Keyboard, Scanner).
2. **Central Processing Unit (CPU - The Brain):**
   * **ALU (Arithmetic & Logic Unit):** Actual calculations (`+`, `-`, `*`, `/`) aur logical comparisons (`<`, `>`, `==`) perform karta hai.
   * **Control Unit (CU - The Supervisor / Manager):** Khud calculation nahi karta; ye timing aur control signals generate karta hai jo baaki units ko direct karte hain, aur instructions ko decode karta hai.
   * **Registers:** CPU ke internal, high-speed temporary storage cells.
3. **Memory Unit:**
   * **Primary / Main Memory (RAM/ROM):** Currently executing programs aur active data ko hold karta hai.
   * **Secondary Memory:** Permanent storage (HDD, SSD).
4. **Output Unit:** Processed binary results ko human-readable format me present karta hai (Monitor, Printer).

---

### 1.2 Von Neumann vs. Harvard Architecture

| Feature | **Von Neumann Architecture** | **Harvard Architecture** |
| :--- | :--- | :--- |
| **Memory Structure** | Data aur Instructions dono ke liye **1 Single Shared Memory** hoti hai. | Data aur Instructions ke liye **2 Alag-Alag Separate Memories** hoti hain. |
| **System Bus** | Data aur Instruction ke liye **1 Common Shared Bus** hoti hai. | Data aur Instruction ke liye **2 Separate Buses** hoti hain. |
| **Simultaneous Fetch?** | ❌ **Nahi!** (Pehle instruction aayegi, fir data aayega). | ✅ **Haan!** (Ek hi clock cycle me instruction aur data simultaneously fetch ho sakte hain). |
| **Bottleneck?** | ✅ **Von Neumann Bottleneck hota hai** (CPU bus ka intezaar karta rehta hai). | ❌ **No Bottleneck**. |
| **Usage** | General purpose PCs, Laptops. | Digital Signal Processors (DSP), Microcontrollers. |

---

### 1.3 System Bus Architecture (Address, Data, Control Bus)

```
        ┌────────────────────────────────────────────────────────┐
        │                          CPU                           │
        └───────┬────────────────────────┬───────────────────▲───┘
                │ Address (Unidirectional)│ Data (Bidirectional)│ Control Signals
                ▼                        ▼▲                  ▼▲
  ══════════════╪════════════════════════╪═══════════════════╪══════ System Bus
                │                        │                   │
        ┌───────┴────────────────────────┴───────────────────┴───┐
        │                     MAIN MEMORY / I/O                  │
        └────────────────────────────────────────────────────────┘
```

1. **Address Bus (पते की सड़क):**
   * **Direction:** **Unidirectional (Sirf CPU se Memory/IO ki taraf)**.
   * **Width Formula:** Address bus ki width ($k$ bits) computer ki **Maximum Memory Capacity** decide karti hai:
     $$\mathbf{\text{Maximum Memory Locations} = 2^k}$$
   * **Breakdown Numbers (Direct Exam Hits):**
     * 16-bit address bus (8085): $2^{16} = 2^6 \times 2^{10} = \mathbf{64\text{ KB}}$
     * 20-bit address bus (8086): $2^{20} = 2^0 \times 2^{20} = \mathbf{1\text{ MB}}$
     * 24-bit address bus (80286): $2^{24} = 2^4 \times 2^{20} = \mathbf{16\text{ MB}}$
     * 32-bit address bus (80386/PC): $2^{32} = 2^2 \times 2^{30} = \mathbf{4\text{ GB}}$
2. **Data Bus (सामान की सड़क):**
   * **Direction:** **Bidirectional (Two-way: CPU $\leftrightarrow$ Memory/IO)**.
   * **Width:** Word size decide karta hai (8-bit bus = 1 byte per cycle; 16-bit bus = 2 bytes per cycle).
3. **Control Bus (कमांड और टाइमिंग):**
   * **Direction:** **Bidirectional**. Read (`RD`), Write (`WR`), Timing clock, aur Reset signals carry karta hai.
4. **Expansion & Peripheral Buses:**
   * **PCI Bus (Peripheral Component Interconnect):** Processor bus ki connectivity ko extend karne ke liye motherboard par expansion bus hoti hai.

---

### 1.4 Dedicated CPU Registers & Instruction Cycle

#### 🗄️ CPU Registers ka Post-Mortem:
* **PC (Program Counter):** Ye us instruction ka address hold karta hai jo **NEXT (agli)** execute hone wali hai. Instruction fetch hote hi ye automatically $+1$ increment ho jata hai.
* **MAR (Memory Address Register):** Memory ke jis location par read/write karna hai, uska address hold karta hai. Ye seedhe **Address Bus** se juda hota hai.
* **MDR / MBR (Memory Data Register):** Memory se aane wala ya memory me jaane wala data hold karta hai. Ye seedhe **Data Bus** se juda hota hai.
* **IR (Instruction Register):** Jo instruction **ABHI (currently)** chal rahi hai, use hold karta hai. Control Unit ise decode karti hai.
* **AC (Accumulator):** ALU ke calculations ka **intermediate aur final result** hold karta hai.

#### 🔄 Instruction Cycle (Fetch $\to$ Decode $\to$ Execute):
1. **Fetch:** $MAR \leftarrow [PC]$ $\implies$ $MDR \leftarrow \text{Memory}[MAR]$ $\implies$ $IR \leftarrow [MDR]$ $\implies$ $PC \leftarrow [PC] + 1$.
2. **Decode:** Control Unit IR me rakhe opcode ko decode karti hai.
3. **Execute:** ALU operation perform karke result Accumulator me store karta hai.

---

## 📌 Chapter 2: Microprocessors (8085 & 8086) & Generations

### 2.1 Microprocessor Generations
* **1st Generation (1971):** Intel 4004 (4-bit, 1st commercial processor), Intel 8008 (8-bit) [PMOS].
* **2nd Generation (1974-1976):** Intel 8080, **Intel 8085** (8-bit, NMOS technology).
* **3rd Generation (1978):** **Intel 8086** (16-bit, 1MB memory), Intel 80286 (16-bit, 16MB memory) [HMOS].
* **4th Generation (1985):** **Intel 80386** (1st 32-bit Intel processor, 4GB memory), 80486.
* **5th Generation (1993+):** Pentium series, Core i3/i5/i7 (64-bit superscalar architecture).

---

### 2.2 Intel 8085 Microprocessor Specs & Pin Features
* **Word Size:** 8-bit. Pins: **40-Pin DIP**. Clock: **3 MHz** (6 MHz crystal divide by 2). Power: **+5V DC**.
* **Buses:** 8-bit Data Bus ($D_0 - D_7$) aur 16-bit Address Bus ($A_0 - A_{15}$).
* **Multiplexed Bus ($AD_0 - AD_7$):** Lower 8 address lines aur data lines ek hi pin par mix hoti hain.
  * **ALE (Address Latch Enable):**
    * Jab $ALE = 1$ $\implies$ Pins par **Address ($A_0 - A_7$)** hai.
    * Jab $ALE = 0$ $\implies$ Pins par **Data ($D_0 - D_7$)** hai.
    * ALE ka kaam hai bus ko **Demultiplex** karna!
* **Control Pins:**
  * **$IO/\overline{M}$:** High (1) par I/O operation, Low (0) par Memory operation.
  * **READY:** Slow memory/devices ke liye CPU ko wait state me dalta hai.
  * **HOLD & HLDA:** DMA controller ke sath bus lene-dene ke liye handshake signals.
* **Registers:** Accumulator (A), B, C, D, E, H, L (all 8-bit). Pairs: BC, DE, **HL (HL pair is default Memory Pointer 'M')**. 16-bit registers: PC aur SP.
* **Flag Register (5 active flags):**
  * **S (Sign):** Result negative ($D_7 = 1$) to 1.
  * **Z (Zero):** Result $00\text{H}$ to 1.
  * **AC (Auxiliary Carry):** Carry from $D_3 \to D_4$. **BCD arithmetic / `DAA` instruction** me use hota hai.
  * **P (Parity):** Result me 1s ki sankhya EVEN ho to 1.
  * **CY (Carry):** Final bit ($D_7$) se carry nikle to 1.

---

### 2.3 8085 Hardware Interrupts (Priority, Maskability & Vectors)

| Priority | Interrupt Name | Maskable? (Roka ja sakta hai?) | Vectored? (Fixed Address?) | Triggering Type | Restart Vector Address Formula |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 🥇 **1** | **TRAP** *(RST 4.5)* | **Non-Maskable** (Emergency/Power cut) | **Vectored** (`0024H`) | **Edge + Level (Dono!)** | $4.5 \times 8 = 36 \implies \mathbf{0024H}$ |
| 🥈 **2** | **RST 7.5** | **Maskable** | **Vectored** (`003CH`) | **Edge** (Rising edge) | $7.5 \times 8 = 60 \implies \mathbf{003CH}$ |
| 🥉 **3** | **RST 6.5** | **Maskable** | **Vectored** (`0034H`) | **Level** | $6.5 \times 8 = 52 \implies \mathbf{0034H}$ |
| 4️⃣ **4** | **RST 5.5** | **Maskable** | **Vectored** (`002CH`) | **Level** | $5.5 \times 8 = 44 \implies \mathbf{002CH}$ |
| 5️⃣ **5** | **INTR** | **Maskable** | ❌ **Non-Vectored** | **Level** | Bahar se address aata hai |

> 💡 **Active Low Note:** Bar wali pins (jaise $\overline{\text{INTA}}$, $\overline{\text{RD}}$, $\overline{\text{WR}}$) hamesha **`0` (Zero)** par activate hoti hain!

---

### 2.4 Intel 8086 Basics & 20-Bit Physical Address Calculation
* 16-bit processor, 40 pins, 16-bit data bus, 20-bit address bus ($2^{20} = \mathbf{1\text{ MB}}$ memory).
* **Two Units:** **BIU (Bus Interface Unit)** jo instructions 6-byte queue me fetch karta hai aur physical address nikalta hai; aur **EU (Execution Unit)** jo ALU aur registers se execute karta hai.
* **Segmentation:** 1 MB memory ko 64 KB ke 4 segments me baanta jata hai: Code Segment (CS), Data Segment (DS), Stack Segment (SS), Extra Segment (ES).

#### 🧮 20-Bit Physical Address Shortcut (5-Second Rule):
$$\mathbf{\text{Physical Address} = (\text{Segment Address ke aage 0 lagao}) + \text{Offset}}$$

**Step-by-Step Example:** If $\text{CS} = 2500\text{H}$ and $\text{IP} = 0480\text{H}$:
1. Segment `2500` ke aage `0` lagao $\implies$ `25000` (Ban gaya 5 digits = 20 bits).
2. Offset `0480` jodo:
   ```text
          2   5   0   0   0
      +       0   4   8   0
      ─────────────────────
          2   5   4   8   0 H
   ```
3. Final Answer: **`25480H`**!

---

### 2.5 Microprocessor vs. Microcontroller

| Feature | **Microprocessor ($\mu\text{P}$)** | **Microcontroller ($\mu\text{C}$)** |
| :--- | :--- | :--- |
| **Silicon Chip par kya hai?** | **Sirf CPU** hota hai (ALU, CU, Registers). | **CPU + RAM + ROM + Timers + I/O Ports** sab kuch ek hi chip par! |
| **Popular Title** | CPU on a chip | **Single-Chip Computer** / Computer on a chip |
| **Application** | General purpose (PC, Laptops) | Dedicated / Embedded Systems (Washing Machine, Microwave, Cars) |
| **Examples** | Intel 8085, 8086, Core i7 | Intel 8051, PIC, Arduino ATmega328P |

---

## 📌 Chapter 3: Instruction Formats & Addressing Modes

### 3.1 Instruction Formats (0, 1, 2, 3 Address)
* **Instruction Anatomy:** `[ Opcode ] [ Operands / Addresses ]`.
* **Opcode Bit Formula:** Agar system me $N$ operations hain, to opcode ke bits: $2^{\text{bits}} \ge N$ (e.g. 128 operations $\implies 2^7 \implies \mathbf{7\text{ bits}}$).
* **3-Address:** `ADD R1, R2, R3` ($R1 \leftarrow R2 + R3$). Source aur destination alag hote hain (RISC).
* **2-Address:** `ADD R1, R2` ($R1 \leftarrow R1 + R2$). Ek register Source aur Destination dono banta hai (x86/CISC).
* **1-Address:** `ADD X` ($AC \leftarrow AC + M[X]$). Destination register likhna nahi padta, **Accumulator ($AC$) implied** hota hai.
* **0-Address (Zero-Address):** `ADD`. Ye **STACK-organized computers** me use hota hai jahan operands stack ke top se uthaye jate hain (Postfix / RPN evaluation).

---

### 3.2 Addressing Modes (Direct Exam Summary)

| Addressing Mode | Data Kahan Milta Hai? | Effective Address ($EA$) | Memory References | Exam Keyword / Use |
| :--- | :--- | :---: | :---: | :--- |
| **Immediate** | Instruction ke andar hi | Data $= \text{Value}$ | **0 (Zero)** | Constants (`MVI A, 05H`) |
| **Direct (Absolute)**| Memory ke fixed address par | $EA = A$ | **1** | Global variables (`LDA 2000H`) |
| **Indirect** | Pate ke andar asli pata | $EA = \text{Mem}[A]$ | **2** | **Pointers** implementation |
| **Register** | CPU Register ke andar | Data $= R$ | **0 (Fastest)** | Register transfer (`MOV A, B`) |
| **Register Indirect**| Register me memory ka pata | $EA = [R]$ | **1** | Pointer via register (`MOV A, M`) |
| **Indexed** | Base se aage index offset | $EA = A + XR$ | **1** | **Arrays & Tables traversal** |
| **Relative (PC)** | Program Counter se aage/pichhe | $EA = PC + A$ | **1** | **Branch / Jump Instructions** |
| **Base Register** | Base register me offset jodo | $EA = BR + A$ | **1** | **Program Relocation by OS** |

---

## 📌 Chapter 4: Memory Hierarchy & Cache Memory

### 4.1 Memory Hierarchy Pyramid
* **Top to Bottom Sequence (Fastest to Slowest):**  
  **CPU Registers ($<1\text{ ns}$) $\to$ Cache Memory ($1-10\text{ ns}$) $\to$ Main RAM ($50-100\text{ ns}$) $\to$ Secondary SSD/HDD ($\text{ms}$) $\to$ Magnetic Tape**.
* **Pyramid Rules:**
  * Upar se Niche jaane par: Speed kam hoti hai, Access time badhta hai, Cost per bit kam hoti hai, Capacity badhti hai.
  * Niche se Upar jaane par: Speed badhti hai, Access time kam hota hai, Cost per bit badhti hai, Capacity kam hoti hai.

---

### 4.2 SRAM vs. DRAM & ROM Types
* **SRAM (Static RAM):** Flip-flops se banta hai. **No refreshing required**. Super fast. **Cache Memory** me use hota hai.
* **DRAM (Dynamic RAM):** 1 Transistor + 1 Capacitor se banta hai. Capacitor charge leak karta hai, isliye **PERIODIC REFRESHING ZAROORI HAI**. **Main System RAM** me use hota hai.
* **ROM Types:**
  * **PROM:** Fusible links burn hote hain, **sirf EK BAAR (Only Once)** program hota hai.
  * **EPROM:** **Ultraviolet (UV) rays** se quartz window ke through pura data erase hota hai.
  * **EEPROM:** **Electrical signals** se byte-by-byte board par hi erase hota hai.
  * **Flash Memory:** Block-level electrical erase EEPROM (Pen drives, SSDs).

---

### 4.3 Locality of Reference (Cache ka Asli Niyam)
* **Hit Ratio ($H$):** $\text{Cache Hits} / \text{Total Memory References}$. Miss Ratio $= 1 - H$.
* **Why Cache Works? Locality of Reference:**
  1. **Temporal Locality (Time):** Jo data abhi access hua hai, wo jaldi hi dobara access hoga. Example: **Loops (`for`, `while`)**, Subroutine counters.
  2. **Spatial Locality (Space):** Jo data abhi access hua hai, uske aas-paas (padosi) memory ka data access hoga. Example: **Arrays**, Sequential instruction flow.

---

### 4.4 Cache Mapping & Write Policies
* **Direct Mapping:** Har memory block ke liye cache me **sirf 1 fixed line**. Simple, sasta, par high conflict miss.
* **Fully Associative:** Memory block cache ki **kisi bhi free line (ANY slot)** me baith sakta hai. Zero conflict miss, expensive hardware.
* **Set-Associative:** Cache lines Sets me divide hoti hain. Block pehle set me jata hai, fir set ke andar kisi bhi slot me. (Modern CPUs me sabse zyada used).
* **Write Policies:**
  * **Write-Through:** Cache aur Main Memory dono me **ek sath (simultaneously)** update hota hai.
  * **Write-Back (Copy-Back):** Sirf cache me update hota hai; memory me tabhi likha jata hai jab block replace ho. **Dirty Bit (Modified Bit)** use karta hai.

---

## 📌 Chapter 5: Input-Output (I/O) Organization & DMA

### 5.1 Data Transfer Techniques
1. **Programmed I/O:** CPU lagatar loop me device status check karta hai ("Busy Waiting"). CPU ka time barbaad hota hai.
2. **Interrupt-driven I/O:** Device ready hone par interrupt bhejti hai. Busy waiting khatam, par data CPU registers se hokar hi jata hai.
3. **Direct Memory Access (DMA):** High-speed devices (Hard disk) bina CPU registers ke seedhe **Device $\leftrightarrow$ RAM** data transfer karti hain.
   * CPU initialization parameters: Starting Address, Word Count, aur Direction (Read/Write).

### 5.2 DMA Controllers & Modes
* **Signals:** **HOLD** (DMA requests bus) aur **HLDA** (CPU grants bus, puts lines in high-impedance).
* **Burst Mode:** Pura data block ek jhatke me transfer hota hai; transfer ke dauran CPU suspended rehta hai (Fastest).
* **Cycle Stealing Mode:** DMA CPU se **sirf 1 bus cycle chura kar 1 byte** bhejta hai aur turant bus CPU ko lauta deta hai; CPU lagatar chalta rehta hai.
* **Chips:** **Intel 8257 / 8237** (DMA Controller). Compare: Intel 8255 (PPI Parallel Ports), 8259 (PIC Interrupt Controller), 8253 (Timer).

### 5.3 Memory-Mapped I/O vs. Isolated I/O

| Feature | **Memory-Mapped I/O** | **Isolated I/O (I/O-Mapped)** |
| :--- | :--- | :--- |
| **Address Space** | Memory aur I/O ka **1 Common Shared Space** | Alag-alag independent space |
| **Address Bus for I/O** | 16-bit address | **8-bit address (Max 256 Ports)** |
| **Instructions** | Normal memory commands (`MOV`, `LDA`, `STA`) | Special commands: **`IN`** aur **`OUT`** |
| **Usable RAM** | RAM ki capacity kam ho jaati hai | RAM ki capacity puri bachi rehti hai |
| **Control Signal** | Normal `MEMR` / `MEMW` | $IO/\overline{M} = 1$ |

---

## 📌 Chapter 6: Pipelining & RISC vs. CISC

### 6.1 Pipelining Basics & Speedup
* Multiple instructions ke execution ko overlap karna (Assembly line technique).
* **5 Stages:** `IF` (Fetch) $\to$ `ID` (Decode) $\to$ `EX` (Execute) $\to$ `MEM` (Memory) $\to$ `WB` (Write Back).
* **Benefit:** Individual instruction ki latency kam nahi hoti; **Throughput (instructions per second) badhta hai**!
* **Maximum Theoretical Speedup:** $S_{\text{max}} = \mathbf{k}$ (where $k$ = number of stages in pipeline).

### 6.2 Pipeline Hazards & Solutions
1. **Structural Hazard (Resource Conflict):** Ek hi hardware resource par do instructions ek sath lad padti hain.  
   * *Solution:* Separate Instruction Cache aur Data Cache (Harvard architecture style).
2. **Data Hazard (Data Dependency / RAW):** Agli instruction ko pichhli instruction ke result ka intezaar hota hai.  
   * *Solution:* **Operand Forwarding (Bypassing)** — ALU output se direct agle stage me data bhejna.
3. **Control Hazard (Branch Hazard):** Program me `JMP`, `CALL`, ya `if-else` aane par pipeline bhatak jati hai.  
   * *Solution:* **Branch Prediction** aur Delayed Branching.

### 6.3 RISC vs. CISC Architecture

| Feature | **RISC (Reduced Instruction Set)** | **CISC (Complex Instruction Set)** |
| :--- | :--- | :--- |
| **Instruction Size** | **Fixed Length** (e.g. 32-bit) | **Variable Length** (1 to 15 bytes) |
| **Execution Speed** | **Single Clock Cycle** (1 CPI) | Multiple clock cycles |
| **Memory Access** | **Load/Store Architecture** (Sirf Load/Store) | Koi bhi instruction memory chhu sakti hai |
| **Control Unit** | **Hardwired Control Unit** (Direct gates, fast)| **Microprogrammed Control Unit** (ROM microcode) |
| **Pipelining** | **Very Easy & High Efficiency** | Difficult & Complex |
| **Examples** | **ARM** (Smartphones, Apple M-series), MIPS | **Intel x86** (Pentium, Core i3/i5/i7/i9), AMD |

---
