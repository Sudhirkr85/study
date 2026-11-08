# 🖥️ BPSC CS Module 02: COA & Microprocessors (Sequence & Trick Master Notes)

> **🎯 Target:** 12 / 12 Marks in Part-III (BPSC TRE Standard)  
> **Rule:** No extra fluff. Pure sequence, exact numbers, hardware specs, and 5-option trap alerts.

---

## 🔢 Sequence 1: Basic Computer Org, Architecture & Instruction Cycle

### 1.1 Von Neumann vs. Harvard (Sequence Comparison)
* **Von Neumann:** **1 Shared Memory + 1 Shared Bus** $\to$ Sequential access $\to$ **Von Neumann Bottleneck**. Used in PCs.
* **Harvard:** **2 Separate Memories + 2 Separate Buses** $\to$ **Simultaneous Fetch** (Instruction aur Data ek sath). Used in DSPs/Microcontrollers.

---

### 1.2 CPU Registers & The 3-Step Instruction Cycle

```
  Step 1: FETCH    ──> MAR <- [PC] ──> MDR <- M[MAR] ──> IR <- [MDR] ──> PC <- [PC] + 1
  Step 2: DECODE   ──> Control Unit (CU) decodes IR opcode
  Step 3: EXECUTE  ──> ALU executes operation, result stored in Accumulator (AC)
```

* **PC (Program Counter):** **NEXT** instruction ka address. Fetch ke baad automatically **$+1$ increment**.
* **MAR:** Memory location ka address hold karta hai. Seedhe **Address Bus** se juda hai.
* **MDR/MBR:** Data hold karta hai. Seedhe **Data Bus** se juda hai.
* **IR:** **CURRENT** instruction hold karta hai jisko CU decode karta hai.
* **AC (Accumulator):** ALU calculations ka **result** hold karta hai.

---

### 1.3 Bus Widths & Memory Limits Sequence

$$\mathbf{\text{Memory Capacity} = 2^k \quad (k = \text{Address Bus Width})}$$

* **16-bit (8085):** $2^{16} = 2^6 \times 2^{10} \implies \mathbf{64\text{ KB}}$
* **20-bit (8086):** $2^{20} = 2^0 \times 2^{20} \implies \mathbf{1\text{ MB}}$
* **24-bit (80286):** $2^{24} = 2^4 \times 2^{20} \implies \mathbf{16\text{ MB}}$
* **32-bit (80386/PC):** $2^{32} = 2^2 \times 2^{30} \implies \mathbf{4\text{ GB}}$
* **Bus Directions:**
  * **Address Bus:** **Unidirectional** (Sirf CPU $\to$ Memory/IO)
  * **Data Bus:** **Bidirectional** (CPU $\leftrightarrow$ Memory/IO)
  * **Control Bus:** **Bidirectional** (Overall timing & command signals)
* **PCI Bus:** Processor bus ki connectivity badhane wali motherboard expansion bus.

---

## 🔢 Sequence 2: Microprocessors (8085 & 8086) & Generations

### 2.1 Generations in Sequence
* **1st Gen:** Intel 4004 (4-bit, 1st commercial processor) / 8008 [PMOS]
* **2nd Gen:** Intel 8080 / **Intel 8085** (8-bit, NMOS, 64 KB memory)
* **3rd Gen:** **Intel 8086** (16-bit, 1 MB memory) / Intel 80286 (16-bit, 16 MB memory) [HMOS]
* **4th Gen:** **Intel 80386** (1st 32-bit Intel processor, 4 GB memory)
* **5th Gen:** Pentium series, Core i3/i5/i7 (64-bit superscalar)

---

### 2.2 Intel 8085 Hardware Facts
* **Specs:** 8-bit, 40-pin DIP, +5V, 3 MHz clock (6 MHz crystal divide by 2).
* **Pins to Remember:**
  * **ALE (Address Latch Enable):** Multiplexed $AD_0-AD_7$ ko alag karta hai. $ALE=1 \implies$ **Address**, $ALE=0 \implies$ **Data**.
  * **$IO/\overline{M}$:** $1 \implies$ I/O operation, $0 \implies$ Memory operation (Bar = Active Low 0).
  * **HL Pair:** Default **Memory Pointer ('M')**.
  * **Flags:** Sign, Zero, Parity, Carry, aur **Auxiliary Carry (AC)** jo $D_3 \to D_4$ carry par set hota hai aur **BCD / `DAA` instruction** me use hota hai.

---

### 2.3 8085 Interrupts Sequence (Priority, Maskability & Vectors)

```
  Priority Sequence: TRAP (Rank 1) ──> RST 7.5 ──> RST 6.5 ──> RST 5.5 ──> INTR (Rank 5)
```

| Interrupt | Priority | Maskable? | Vectored? | Triggering | Vector Address Formula ($N \times 8 \to$ Hex) |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **TRAP** *(RST 4.5)*| 🥇 **1** | **Non-Maskable** | Vectored (`0024H`) | **Edge + Level (Dono)**| $4.5 \times 8 = 36 \implies \mathbf{0024H}$ |
| **RST 7.5** | 🥈 **2** | Maskable | Vectored (`003CH`) | **Edge** (Rising) | $7.5 \times 8 = 60 \implies \mathbf{003CH}$ |
| **RST 6.5** | 🥉 **3** | Maskable | Vectored (`0034H`) | Level | $6.5 \times 8 = 52 \implies \mathbf{0034H}$ |
| **RST 5.5** | 4️⃣ **4** | Maskable | Vectored (`002CH`) | Level | $5.5 \times 8 = 44 \implies \mathbf{002CH}$ |
| **INTR** | 5️⃣ **5** | Maskable | ❌ **Non-Vectored** | Level | External hardware supplies address |

---

### 2.4 Intel 8086: 20-Bit Physical Address Sequence (2-Step Rule)
* 16-bit processor, 20-bit address bus ($1\text{ MB}$ memory), 6-byte instruction queue (BIU).
* **Step 1:** Segment Address ke aage ek **`0`** lagao (5 digits banenge).
* **Step 2:** Usme **Offset** jod do (Hexadecimal addition).

```text
       Example: CS = 2500H, IP = 0480H
       Step 1: 2500 ke aage '0' lagaya ──>  2 5 0 0 0
       Step 2: Offset jod diya         ──> +  0 4 8 0
       ──────────────────────────────────────────────
       Final 20-bit Physical Address   ──>  2 5 4 8 0 H
```

---

### 2.5 Microprocessor vs. Microcontroller
* **Microprocessor:** **Sirf CPU** on chip. RAM, ROM, I/O bahar se lagana padta hai. General purpose (PC). Examples: 8085, 8086, Core i7.
* **Microcontroller:** **"Computer on a Single Chip"**. CPU + RAM + ROM + Timers + I/O sab ek hi IC par pack. Dedicated/embedded systems (Washing machine, Microwave, Cars). Examples: 8051, PIC, Arduino.

---

## 🔢 Sequence 3: Instruction Formats & Addressing Modes

### 3.1 Instruction Formats in Sequence
* **3-Address:** `ADD R1, R2, R3` (Source & Dest alag; RISC).
* **2-Address:** `ADD R1, R2` (One register is both source and destination; x86/CISC).
* **1-Address:** `ADD X` (Destination is implicitly **Accumulator**).
* **0-Address:** `ADD` (Used in **STACK** computers; Postfix/RPN evaluation).
* **Opcode formula:** $N$ operations $\implies 2^{\text{bits}} \ge N$ (e.g. 128 operations $\implies 2^7 \implies \mathbf{7\text{ bits}}$).

---

### 3.2 Addressing Modes in Sequence

| Addressing Mode | Data Location | Memory Accesses | Key Exam Keyword |
| :--- | :--- | :---: | :--- |
| **Immediate** | Instruction ke andar hi ($EA = \text{none}$) | **0** | Constants initialization |
| **Direct (Absolute)**| Fixed memory address par ($EA = A$) | **1** | Global variables |
| **Indirect** | Pointer address points to real address | **2** | **Pointers** implementation |
| **Register** | Inside CPU register ($EA = \text{none}$) | **0 (Fastest)**| Register transfer |
| **Register Indirect**| Register me memory ka address ($EA = [R]$) | **1** | Pointers via registers (`MOV A, M`) |
| **Indexed** | Base + Index register ($EA = A + XR$) | **1** | **Arrays & Tables** traversal |
| **Relative (PC)** | Offset added to PC ($EA = PC + A$) | **1** | **Branch / Jump** instructions |
| **Base Register** | Offset added to Base reg ($EA = BR + A$) | **1** | **Program Relocation** by OS |

---

## 🔢 Sequence 4: Memory Hierarchy & Cache Memory

### 4.1 Memory Hierarchy Sequence (Top $\to$ Bottom)

```
  [1. CPU Registers]  (< 1 ns, few bytes)  ▲ SPEED & COST PER BIT
         │                                 │ (Upar badhti hai)
  [2. Cache Memory]   (1 - 10 ns, SRAM)    │
         │
  [3. Main RAM]       (50 - 100 ns, DRAM)  │
         │
  [4. Secondary Storage] (ms, SSD / HDD)   │
         │                                 ▼ CAPACITY & ACCESS TIME
  [5. Magnetic Tape]     (Seconds, TBs)    (Niche badhti hai)
```

---

### 4.2 SRAM vs. DRAM & ROM
* **SRAM (Static RAM):** Flip-flops, **No refreshing needed**, Fast, **Cache Memory**.
* **DRAM (Dynamic RAM):** 1 Transistor + 1 Capacitor, **PERIODIC REFRESHING REQUIRED** (charge leak hota hai), Slower, **Main System RAM**.
* **ROM Types:**
  * **PROM:** Fusible links burn hote hain, **Sirf 1 baar** program hota hai.
  * **EPROM:** **Ultraviolet (UV) rays** se quartz window ke through erase hota hai.
  * **EEPROM:** **Electrical signals** se byte-by-byte board par erase hota hai.
  * **Flash Memory:** Block-level electrical erase EEPROM (Pen drives, SSDs).

---

### 4.3 Locality of Reference & Cache Policies
* **Temporal Locality (Time):** Recently accessed data will be accessed again soon. $\implies$ **Loops (`for`/`while`)**, counters.
* **Spatial Locality (Space):** Data near recently accessed memory will be accessed soon. $\implies$ **Arrays**, sequential code.
* **Cache Mapping:**
  * Direct Mapping: 1 fixed line per block (Highest conflict miss, simplest).
  * Fully Associative: Block can go in **ANY free line** (Zero conflict miss, complex).
  * Set-Associative: Block maps to a specific Set, then any line in set (Most common).
* **Write Policies:**
  * **Write-Through:** Cache aur RAM dono **ek sath (simultaneously)** update hote hain.
  * **Write-Back:** Sirf cache update hota hai; RAM tab update hoti hai jab block replace ho. Uses **Dirty Bit (Modified Bit)**.

---

## 🔢 Sequence 5: I/O Organization & DMA

1. **Data Transfer Methods:**
   * **Programmed I/O:** CPU busy-waiting polling loop me fasa rehta hai (Time waste).
   * **Interrupt-driven I/O:** Device interrupt bhejti hai; data CPU registers se hokar jata hai.
   * **DMA (Direct Memory Access):** High-speed transfer directly between **Device $\leftrightarrow$ RAM** without passing through CPU registers!
     * CPU parameters given to DMA: Starting Address, Word Count, Direction (Read/Write).
2. **DMA Modes & Chips:**
   * **Burst Mode:** Pura data block ek sath transfer; CPU suspended rehta hai (Fastest).
   * **Cycle Stealing Mode:** DMA CPU se **sirf 1 bus cycle chura kar 1 byte** bhejta hai aur foran bus lauta deta hai; CPU chalta rehta hai.
   * **Chips:** **Intel 8257 / 8237** = DMA Controller. (Compare: 8255 = PPI Parallel Ports, 8259 = PIC Interrupt Controller, 8253 = Timer).
3. **Memory-Mapped vs. Isolated I/O:**
   * **Memory-Mapped I/O:** 1 Common shared address space. Uses normal memory instructions (`MOV`, `LDA`). Usable RAM capacity decreases.
   * **Isolated I/O (I/O-Mapped):** Separate address space. 8-bit port address (**Max 256 Ports**). Uses special instructions: **`IN`** aur **`OUT`**. RAM space unaffected. Uses $IO/\overline{M} = 1$.

---

## 🔢 Sequence 6: Pipelining & RISC vs. CISC

1. **Pipelining 5 Classic Stages Sequence:**
   $$\mathbf{IF \text{ (Fetch)} \longrightarrow ID \text{ (Decode)} \longrightarrow EX \text{ (Execute)} \longrightarrow MEM \text{ (Memory)} \longrightarrow WB \text{ (Write Back)}}$$
   * **Key Advantage:** Individual latency kam nahi hoti; **Throughput badhta hai**!
   * **Maximum Speedup:** $S_{\text{max}} = \mathbf{k}$ (where $k$ = number of stages).
2. **3 Pipeline Hazards Sequence:**
   * **Data Hazard:** Pichhli instruction ke result/data ka intezaar (RAW dependency). $\implies$ Solution: **Operand Forwarding (Bypassing)**.
   * **Control Hazard:** Branch, Jump, Call se rasta bhatakna. $\implies$ Solution: **Branch Prediction**.
   * **Structural Hazard:** Ek hi hardware resource par do instructions ki ladai. $\implies$ Solution: **Separate Instruction & Data Caches**.
3. **RISC vs. CISC Sequence:**
   * **RISC:** **Fixed-length** instructions, **1 clock cycle** execution, **Load/Store Architecture** (sirf Load/Store hi RAM chhu sakte hain), **Hardwired Control Unit**, large register set. Example: **ARM** (Smartphones/Apple Silicon).
   * **CISC:** **Variable-length** instructions, multi-cycle execution, memory arithmetic allowed, **Microprogrammed Control Unit**. Example: **Intel x86** (Pentium, Core series).
