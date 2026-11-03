# 📘 Subject 02: Computer Organization & Architecture (COA) + Microprocessors
> **Target:** 🎯 BPSC TRE Computer Science (Part-III) — Target 12 / 12 Marks  
> **Syllabus Reference:** CSHT-101 / ELHT & NCERT Class 11-12 Computer Systems  
> **Master Rule:** High-yield factual clarity + Memory tricks (Zero GATE theoretical derivations)

---

## 📌 Chapter 1: Basic Computer Organization & System Bus

### 1.1 Computer Architectural Paradigms
| Architecture | Features | Memory Separation | Bus System |
| :--- | :--- | :---: | :---: |
| **Von Neumann (Stored Program)** | Data & Instructions share the same memory & bus. Bottleneck: **Von Neumann Bottleneck** (can't fetch instruction and data simultaneously). | Single shared memory | Shared Bus |
| **Harvard Architecture** | Separate memory for program (code) and data. Simultaneous instruction fetch & data access possible. | Separate Instruction & Data Memory | Separate Buses |

---

### 1.2 System Bus Architecture
The CPU communicates with memory and I/O devices via three distinct buses:

```
+--------------------------------------------------------------+
|                           CPU                                |
+--------------------------------------------------------------+
     |                 | (Unidirectional)   | (Bidirectional)
     |                 v                    v
     |          [Address Bus] --------> [Memory / I/O]
     |                 ^                    ^
     |                 | (Bidirectional)    |
     +--------> [ Data Bus ] <--------------+
     |                 ^
     |                 | (Bidirectional / Individual lines)
     +--------> [Control Bus] <-------------> [Memory / I/O]
```

1. **Address Bus (Unidirectional):**
   * Direction: CPU $\to$ Memory / I/O.
   * If Address bus has **$k$ bits**, total addressable locations $= \mathbf{2^k}$.
   * *Formula:* Capacity $= 2^k \times (\text{word size})$.
2. **Data Bus (Bidirectional):**
   * Direction: Both ways (CPU $\leftrightarrow$ Memory / I/O).
   * Determines the **word length** of the CPU (e.g., 8-bit, 16-bit, 32-bit).
3. **Control Bus:**
   * Transmits control & timing signals: $\overline{\text{RD}}$ (Read), $\overline{\text{WR}}$ (Write), $\text{IO}/\overline{\text{M}}$, Clock, Reset, Interrupts.

---

## 📌 Chapter 2: CPU Registers & Instruction Execution Cycle

### 2.1 Essential CPU Registers (High-Yield BPSC Table)
| Register Name | Full Form | Function / BPSC Direct Fact |
| :--- | :--- | :--- |
| **PC** | Program Counter | Holds the address of the **NEXT instruction** to be fetched and executed. Automatically incremented. |
| **IR** | Instruction Register | Holds the **CURRENT instruction** that was fetched and is currently being decoded. |
| **MAR** | Memory Address Register | Holds the physical address of the memory location currently being read from or written to. Connected directly to **Address Bus**. |
| **MDR / MBR** | Memory Data / Buffer Register | Holds the data/contents read from or to be written into memory. Connected directly to **Data Bus**. |
| **AC** | Accumulator | Holds immediate operands and stores the output/result of ALU operations. |
| **SP** | Stack Pointer | Holds the memory address of the **top of the stack** (LIFO). In 8085: Decrements during `PUSH`, Increments during `POP`. |
| **PSW** | Program Status Word | Combination of **Accumulator + Flag Register** (Status flags: Carry, Zero, Sign, Parity, Auxiliary Carry). |

---

### 2.2 Instruction Execution Cycle Steps
1. **Fetch:**
   * $\text{MAR} \leftarrow \text{PC}$
   * $\text{MDR} \leftarrow \text{Memory}[\text{MAR}]$
   * $\text{IR} \leftarrow \text{MDR}$
   * $\text{PC} \leftarrow \text{PC} + 1$ (points to next instruction)
2. **Decode:** Control unit decodes opcode in $\text{IR}$ to determine required operation.
3. **Read Effective Address:** If indirect addressing is used, fetch effective memory address.
4. **Execute:** ALU performs operation; result stored in Accumulator/Registers.
5. **Interrupt Check:** Check for pending interrupt signals before next instruction cycle.

---

## 📌 Chapter 3: Microprocessor Evolution & Generations (Past Error Fix!)

> [!IMPORTANT]
> **Candidate Mistake Trap in TRE 2.0:** 
> * 8085 is **2nd Generation** (8-bit, NMOS).
> * Microprocessor vs Microcontroller difference.

### 3.1 Generations Table
| Generation | Word Size | Clock / Tech | Examples | Features |
| :---: | :---: | :---: | :--- | :--- |
| **1st Gen (1971-73)** | 4-bit / 8-bit | PMOS | Intel **4004** (world's 1st $\mu\text{P}$), 4040, 8008 | Low speed, single-function calculators |
| **2nd Gen (1974-78)** | **8-bit** | **NMOS, +5V** | **Intel 8080, Intel 8085**, Motorola 6800, Zilog Z80 | Faster, multi-power supply (8080) to single +5V (8085) |
| **3rd Gen (1978-81)** | **16-bit** | HMOS | **Intel 8086, 8088, 80186, 80286**, Z8000 | Pipelining introduced (8086), segmentation |
| **4th Gen (1981-93)** | **32-bit** | HMOS / CMOS | **Intel 80386, 80486**, Motorola 68020/030 | Paging, Virtual Memory, built-in Math coprocessor (80486) |
| **5th Gen (1993+)** | **64-bit** | Superscalar | **Pentium series, Core i3/i5/i7/i9**, AMD Ryzen | Superscalar execution, Multi-core |

---

### 3.2 Address Bus & Maximum Addressable Memory (Direct PYQ Formula)
$$\text{Max Addressable Memory} = 2^{(\text{Address Lines})} \text{ Bytes}$$

| Processor | Address Bus Width | Data Bus Width | Maximum Direct Memory Capacity |
| :--- | :---: | :---: | :--- |
| **Intel 8085** | 16 bits | 8 bits | $2^{16} = \mathbf{64\text{ KB}}$ |
| **Intel 8086** | 20 bits | 16 bits | $2^{20} = \mathbf{1\text{ MB}}$ |
| **Intel 8088** | 20 bits | 8 bits (external) | $2^{20} = \mathbf{1\text{ MB}}$ |
| **Intel 80286** | 24 bits | 16 bits | $2^{24} = \mathbf{16\text{ MB}}$ |
| **Intel 80386** | 32 bits | 32 bits | $2^{32} = \mathbf{4\text{ GB}}$ |
| **Intel 80486** | 32 bits | 32 bits | $2^{32} = \mathbf{4\text{ GB}}$ |

---

### 3.3 Microprocessor vs Microcontroller
* **Microprocessor ($\mu\text{P}$):**
  * **"CPU on a single chip"**.
  * Contains ALU, Control Unit, and Registers ONLY.
  * RAM, ROM, I/O ports, timers, and serial interfaces must be connected **externally**.
  * Used in general-purpose computing (PCs, Laptops). Examples: 8085, 8086, Core i5.
* **Microcontroller ($\mu\text{C}$):**
  * **"Complete Computer on a single chip"** (Single chip computer).
  * Contains CPU + RAM + ROM + I/O ports + Timers/Counters on a single integrated chip.
  * Used in embedded dedicated systems (Washing machines, Microwave ovens, Cars). Examples: **Intel 8051**, PIC, ATmega328.

---

## 📌 Chapter 4: Intel 8085 Microprocessor Architecture & Details

### 4.1 Key Specifications of 8085
* **Pin Count:** **40 pins** (DIP - Dual In-line Package).
* **Power Supply:** Single **$+5\text{V}$ DC**.
* **Operating Frequency:** **$3\text{ MHz}$** standard (External crystal frequency is divided by 2: Crystal $= 6\text{ MHz}$).
* **Data Bus:** 8-bit ($D_0 - D_7$), multiplexed with lower address bus as $\mathbf{AD_0 - AD_7}$.
* **Address Bus:** 16-bit ($A_8 - A_{15}$ upper 8 bits, $AD_0 - AD_7$ lower 8 bits).
* **ALE (Address Latch Enable):** Active HIGH signal used to demultiplex $AD_0 - AD_7$.
  * When $\text{ALE} = 1 \implies$ Bus contains **Address** ($A_0 - A_7$).
  * When $\text{ALE} = 0 \implies$ Bus contains **Data** ($D_0 - D_7$).

---

### 4.2 8085 Interrupts (Priority & Vector Locations)
BPSC loves direct questions on 8085 interrupts!

| Interrupt | Priority | Maskable / Non-maskable | Trigger Type | Vectored? | Vector Location |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **TRAP (RST 4.5)** | **1 (Highest)** | **Non-Maskable (NMI)** | Level & Edge | Yes | $4.5 \times 8 = 36 = \mathbf{0024H}$ |
| **RST 7.5** | 2 | Maskable | Edge-triggered | Yes | $7.5 \times 8 = 60 = \mathbf{003CH}$ |
| **RST 6.5** | 3 | Maskable | Level-triggered | Yes | $6.5 \times 8 = 52 = \mathbf{0034H}$ |
| **RST 5.5** | 4 | Maskable | Level-triggered | Yes | $5.5 \times 8 = 44 = \mathbf{002CH}$ |
| **INTR** | **5 (Lowest)** | Maskable | Level-triggered | **No (Non-vectored)** | Provided externally |

> [!TIP]
> **Vector Address Calculation Formula:**  
> $\text{Vector Address in Hex} = (\text{RST Number} \times 8) \text{ converted to Hexadecimal}$.  
> *Example:* For RST 7.5 $\implies 7.5 \times 8 = 60$.  
> $60 \div 16 = 3$ (Remainder 12, which is $\text{C}$) $\implies \mathbf{003CH}$.

---

## 📌 Chapter 5: Addressing Modes (Definitions & Examples)

| Addressing Mode | Definition | Example Instruction |
| :--- | :--- | :--- |
| **Immediate** | Data (operand) is directly specified in the instruction itself. | `MVI A, 32H` (Move 32H immediately into Reg A) |
| **Register** | Operand is stored in a CPU register; no memory reference. | `MOV A, B` (Copy contents of Reg B into Reg A) |
| **Direct** | 16-bit physical memory address of operand is given in instruction. | `LDA 2050H` (Load Accumulator from memory `2050H`) |
| **Register Indirect** | Address of operand is stored in a register pair (usually H-L pair). | `MOV A, M` (Move content of memory pointed by HL into A) |
| **Implied / Implicit** | Operand is implicitly defined by the opcode itself; no operand specified. | `CMA` (Complement Accumulator), `STC` (Set Carry), `NOP` |
| **Relative** | Effective address $= \text{PC} + \text{Displacement}$ (used in branch/jumps). | `BR +12` |
| **Indexed** | Effective address $= \text{Base/Index Register} + \text{Offset}$. | Array access `A[i]` |

---

## 📌 Chapter 6: Memory Hierarchy & Cache Memory

### 6.1 Memory Hierarchy Pyramid
$$\text{Registers} \longrightarrow \text{Cache (L1, L2, L3)} \longrightarrow \text{Main Memory (RAM/ROM)} \longrightarrow \text{Secondary (SSD/HDD)} \longrightarrow \text{Magnetic Tape}$$

* **Going Top $\to$ Bottom:**
  * Access Time / Latency: **Increases** (Registers fastest, Tape slowest)
  * Storage Capacity: **Increases**
  * Cost per bit: **Decreases**

---

### 6.2 Cache Mapping Techniques
| Mapping Scheme | Mechanism | Advantages | Disadvantages |
| :--- | :--- | :--- | :--- |
| **Direct Mapping** | Each memory block maps to exactly ONE fixed cache line: $i = j \pmod m$. | Simple, fastest tag search, cheapest. | High **conflict miss / thrashing**. |
| **Fully Associative** | A memory block can be placed in **ANY** cache line. | Minimum conflict miss, most flexible. | Expensive hardware (requires parallel associative tag comparison). |
| **$k$-way Set Associative** | Cache divided into sets of $k$ lines. Block maps to a specific set, but can go into any line within that set. | Best trade-off between Direct & Fully Associative. | Moderate complexity. |

---

### 6.3 Cache Write Policies & Formulas
1. **Write-Through:**
   * CPU writes data simultaneously to both **Cache** and **Main Memory**.
   * *Advantage:* Always consistent. *Disadvantage:* Slower memory write speed.
2. **Write-Back (Copy-Back):**
   * CPU updates only the **Cache**. Main memory updated only when that block is replaced/evicted.
   * Uses a **Dirty Bit** (Modified bit): $1 =$ Block modified, $0 =$ Unmodified.
3. **Average Memory Access Time (AMAT):**
   $$T_{\text{avg}} = T_{\text{cache}} + (1 - H) \times T_{\text{miss\_penalty}}$$
   *(where $H$ is the Cache Hit Ratio)*

---

## 📌 Chapter 7: Control Unit (CU) & RISC vs CISC

### 7.1 Hardwired vs Microprogrammed Control Unit
| Parameter | Hardwired Control Unit | Microprogrammed Control Unit |
| :--- | :--- | :--- |
| **Implementation** | Combinational logic gates, flip-flops, decoders. | Microprograms stored in a special **Control Memory (ROM)**. |
| **Speed** | **Very Fast** | Slower (requires micro-instruction fetch) |
| **Flexibility / Modification** | Extremely difficult (requires rewiring) | **Easy** (just update ROM microcode) |
| **Instruction Set** | Suited for **RISC** | Suited for **CISC** |

---

### 7.2 RISC vs CISC Architecture
| Feature | RISC (Reduced Instruction Set Computer) | CISC (Complex Instruction Set Computer) |
| :--- | :--- | :--- |
| **Instruction Count & Size** | Fewer, fixed-length instructions (e.g. 32-bit). | Large number, variable-length instructions. |
| **Execution Speed** | Single-cycle execution per instruction. | Multi-cycle execution. |
| **Memory Access** | **Load/Store architecture** (Only LOAD and STORE access memory). | Memory operands allowed in arithmetic instructions (e.g. `ADD [BX], AX`). |
| **Registers** | Large number of general-purpose registers. | Few general-purpose registers. |
| **Pipelining** | Highly efficient and easy to pipeline. | Difficult to pipeline. |
| **Examples** | ARM, MIPS, RISC-V, SPARC. | Intel x86 (8086, Pentium), Motorola 68000. |
