# 🖥️ BPSC Computer Science - Module 02: Computer Organization & Architecture (COA) & Microprocessors
## 📖 Master Classroom Notes & BPSC 5-Option Practice (As Studied in Class)

> **🎯 Mission Target:** 12 / 12 Marks in Part-III (BPSC TRE Standard)  
> **Exam Philosophy:** Anti-GATE Rule (Direct, Factual, Deep First-Principles, NCERT & BCA Core Standard)  
> **Golden BPSC Rule:** Rule of 2 — Har option ko scan karo. Do options sahi mile $\implies$ Option (D) "More than one of the above" guaranteed!

---

# 📑 CHAPTER 1: Basic Computer Organization & System Bus

---

## 🔹 Topic 1.1: Functional Units & Von Neumann vs. Harvard Architecture

### 1. 🏨 Restaurant (Hotel) Analogy se Samajhiye:
Computer ek bade **Restaurant** ki tarah kaam karta hai:
* **👨‍🍳 ALU (Arithmetic & Logic Unit) = Chef / Halwai:**
  * Actual kaam karna (Math operations: `+`, `-`, `*`, `/` aur decisions: `<`, `>`, `==`) sirf ALU karta hai.
* **👮‍♂️ Control Unit (CU) = Manager / Traffic Inspector:**
  * Manager khud khana nahi banata (CU koi calculation nahi karta).
  * Iska kaam hai: Customer ka order padhna (**Instruction Decode karna**) aur sabhi units ko ishara dena (**Timing aur Control Signals generate karna**).
* **📋 Registers = Chef ka Cutting Board:**
  * CPU ke andar sabse chhota aur **duniya ka sabse fast storage**. Temporary data rakhne ke liye.
* **🏬 Main Memory (RAM) = Store Room / Pantry:**
  * Jahan Recipe book (Instructions) aur Masala/Samaan (Data) rakha hota hai.

---

### 2. 🚪 Von Neumann vs. Harvard Architecture (Asli Farak):

```
        VON NEUMANN (Single Door)                  HARVARD (Two Doors)
     ┌─────────────────────────────┐        ┌──────────────┐ ┌──────────────┐
     │  Instruction + Data Memory  │        │ Instr Memory │ │ Data Memory  │
     └──────────────┬──────────────┘        └──────┬───────┘ └──────┬───────┘
                    │ Single Shared Bus            │ Instr Bus      │ Data Bus
                    ▼                              ▼                ▼
             ┌─────────────┐                ┌───────────────────────────────┐
             │     CPU     │                │              CPU              │
             └─────────────┘                └───────────────────────────────┘
```

| Feature | **Von Neumann Architecture** | **Harvard Architecture** |
| :--- | :--- | :--- |
| **Memory** | Data aur Instruction dono ke liye **1 Single Shared Memory** hoti hai. | Data aur Instruction ke liye **2 Alag-Alag Separate Memories** hoti hain. |
| **Bus (Rasta)** | Dono ke liye **1 Single Shared Bus** hoti hai. | Data aur Instruction ke liye **2 Separate Buses** hoti hain. |
| **Simultaneous Fetch?** | ❌ **Nahi!** (Ek hi darwaza hai, pehle instruction aayegi fir data). | ✅ **Haan!** (Ek hi clock cycle me instruction aur data dono ek sath fetch ho sakte hain). |
| **Bottleneck?** | ✅ **Von Neumann Bottleneck** (Shared bus ki speed CPU se slow hone ke karan CPU ko wait karna padta hai). | ❌ **No Bottleneck**. |
| **Kahan use hota hai?** | General purpose PC, Laptops. | Digital Signal Processors (DSP), Microcontrollers. |

---

### 📝 Topic 1.1 Classroom Practice Questions:

#### ❓ Question 1
**Which of the following statements is/are correct regarding the Control Unit (CU) of a CPU?**  
(A) It performs arithmetic calculations and logical comparisons.  
(B) It generates timing and control signals to direct operations of other units.  
(C) It interprets instructions fetched from memory.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem & Explanation:**  
> * (A) Galat: Arithmetic aur logical kaam ALU karta hai, CU nahi.  
> * (B) Sahi: CU sabhi units ke liye timing aur control signals generate karta hai.  
> * (C) Sahi: Instruction register me jo instruction aati hai, use decode/interpret karne ka kaam CU ka Instruction Decoder hi karta hai.  
> * **Rule of 2:** Chunki (B) aur (C) dono sahi hain $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 2
**Kis computer architecture me Instruction aur Data ko ek hi samay par (simultaneously) fetch kiya ja sakta hai?**  
(A) Von Neumann Architecture  
(B) Harvard Architecture  
(C) Turing Machine Architecture  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Harvard me do alag-alag darwaze (separate memories aur separate buses) hote hain, isliye instruction aur data simultaneously fetch hote hain.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 3
**The term 'Von Neumann Bottleneck' refers to:**  
(A) The speed mismatch where CPU throughput is restricted because data and instructions share the same bus.  
(B) The lack of registers inside the ALU.  
(C) The physical overheating of the control unit during instruction decoding.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** CPU tez hai par shared bus par data aur instruction bari-bari se aate hain, jisse CPU ko intezaar karna padta hai. Isi speed restriction ko Von Neumann Bottleneck kehte hain.  
> ✅ **Correct Answer: (A)**

---

## 🔹 Topic 1.2: System Bus Architecture (Address, Data, Control Bus)

### 1. 🛣️ Teeno Buses ka Asli Role:
CPU, Memory aur I/O devices ke beech signals carry karne wale parallel wires ke group ko **System Bus** kehte hain:

1. **Address Bus (पते की सड़क):**
   * **Direction:** **Unidirectional (One-way: Sirf CPU $\to$ Memory/IO)**. CPU hi hamesha address batata hai; memory kabhi CPU ko address nahi bhejti!
   * **Kaam:** Memory ka **Maximum Size (Capacity)** decide karta hai.
2. **Data Bus (सामान की सड़क):**
   * **Direction:** **Bidirectional (Two-way: CPU $\leftrightarrow$ Memory/IO)**. CPU data read bhi karta hai aur write bhi karta hai.
   * **Kaam:** Word size decide karta hai (8-bit bus = 1 byte per cycle, 16-bit bus = 2 bytes per cycle).
3. **Control Bus (कमांड और टाइमिंग):**
   * **Direction:** **Bidirectional**. Read (`RD`), Write (`WR`), Timing clock, aur Interrupt signals carry karta hai.
4. **PCI Bus (Peripheral Component Interconnect):**
   * Motherboard par processor bus ki connectivity ko extend karne ke liye use hoti hai (BPSC TRE 1.0 PYQ).

---

### 2. 🔢 Memory Capacity Formula (Pura Tod Kar):

$$\mathbf{\text{Maximum Memory Capacity} = 2^k \quad (k = \text{Address Bus Width in Bits})}$$

Computer me har 10 bits par unit badalti hai:
* $2^{10} = \mathbf{1\text{ KB}}$ (KiloByte)
* $2^{20} = \mathbf{1\text{ MB}}$ (MegaByte)
* $2^{30} = \mathbf{1\text{ GB}}$ (GigaByte)

#### 🎯 "Tukde Karke Todne Wala" Shortcut:
* **16-bit Address Bus (Intel 8085):**  
  $16 = 6 + 10 \implies 2^6 \times 2^{10} = 64 \times \text{KB} = \mathbf{64\text{ KB}}$!
* **20-bit Address Bus (Intel 8086):**  
  $20 = 0 + 20 \implies 2^0 \times 2^{20} = 1 \times \text{MB} = \mathbf{1\text{ MB}}$!
* **24-bit Address Bus (Intel 80286):**  
  $24 = 4 + 20 \implies 2^4 \times 2^{20} = 16 \times \text{MB} = \mathbf{16\text{ MB}}$!
* **32-bit Address Bus (Intel 80386 / 32-bit PC):**  
  $32 = 2 + 30 \implies 2^2 \times 2^{30} = 4 \times \text{GB} = \mathbf{4\text{ GB}}$!

---

### 📝 Topic 1.2 Classroom Practice Questions:

#### ❓ Question 1
**In a standard computer system, which of the following buses is/are UNIDIRECTIONAL (एकतरफा)?**  
(A) Address Bus  
(B) Data Bus  
(C) Control Bus  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Sirf Address Bus ek-tarfa (Unidirectional: CPU $\to$ Memory) hoti hai. Data bus aur Control bus dono bidirectional hoti hain.  
> ✅ **Correct Answer: (A)**

#### ❓ Question 2
**The maximum memory addressing capacity of a microprocessor with a 16-bit address bus is:**  
(A) $16\text{ KB}$  
(B) $64\text{ KB}$  
(C) $1\text{ MB}$  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** $2^{16} = 2^6 \times 2^{10} = 64\text{ KB}$.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 3
**A computer system has a 20-bit address bus and a 16-bit data bus. Which of the following statements is/are correct?**  
(A) The processor can directly address a maximum of $1\text{ MB}$ of memory.  
(B) The processor transfers 2 bytes of data in a single memory access cycle.  
(C) The address bus carries signals from memory to the CPU.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:**  
> * (A) Sahi: $2^{20} = 1\text{ MB}$.  
> * (B) Sahi: $16\text{ bits} = 2\text{ bytes}$ data bus.  
> * (C) Galat: Address CPU se memory jata hai, ulta nahi.  
> * Rule of 2: (A) aur (B) dono sahi hain $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

---

## 🔹 Topic 1.3: CPU Dedicated Registers & Instruction Cycle

### 1. 🗄️ CPU Registers ka Post-Mortem:
* **PC (Program Counter) — "Next Page Marker":**  
  Ye us instruction ka memory address hold karta hai jo **NEXT (agli)** chalne wali hai. Instruction fetch hote hi PC automatically **$+1$ increment** ho jata hai.
* **MAR (Memory Address Register) — "Address Holder":**  
  Memory ke jis address par data padhna ya likhna hai, wo address MAR me rehta hai. Seedhe **Address Bus** se juda hota hai.
* **MDR / MBR (Memory Data Register) — "Data ka Dabba":**  
  Memory se aane wala ya memory me jaane wala data MDR me rehta hai. Seedhe **Data Bus** se juda hota hai.
* **IR (Instruction Register) — "Current Order":**  
  Jo instruction **ABHI (currently)** chal rahi hai, use IR me rakha jata hai. Control Unit isi ko decode karti hai.
* **AC (Accumulator) — "Chef ki Thaali":**  
  ALU jo bhi calculation ($5 + 3 = 8$) karta hai, uska result hamesha Accumulator me store hota hai.

---

### 2. 🔄 The 3-Step Instruction Cycle (Fetch $\to$ Decode $\to$ Execute):
1. **Step 1 (FETCH):**  
   * $MAR \leftarrow [PC]$ : PC apna address MAR ko deta hai.
   * $MDR \leftarrow \text{Memory}[MAR]$ : Memory se instruction Data Bus ke jariye MDR me aati hai.
   * $IR \leftarrow [MDR]$ : Instruction MDR se nikal kar IR me baithti hai.
   * $PC \leftarrow [PC] + 1$ : PC turant ek kadam aage badh jata hai agli instruction ke liye!
2. **Step 2 (DECODE):** Control Unit IR me rakhe opcode ko interpret karti hai ki karna kya hai.
3. **Step 3 (EXECUTE):** ALU operation perform karta hai aur result Accumulator me daal deta hai.

---

### 📝 Topic 1.3 Classroom Practice Questions:

#### ❓ Question 1
**Which of the following registers holds the address of the NEXT instruction to be fetched from memory?**  
(A) Instruction Register (IR)  
(B) Program Counter (PC)  
(C) Memory Address Register (MAR)  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Agli (NEXT) instruction ka address hamesha Program Counter (PC) hold karta hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which of the following statements is/are correct regarding CPU registers and their bus connections?**  
(A) Memory Address Register (MAR) is directly connected to the Address Bus.  
(B) Memory Data Register (MDR) is directly connected to the Data Bus.  
(C) Accumulator (AC) holds the address of the next instruction.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** (A) Sahi (MAR $\to$ Address Bus), (B) Sahi (MDR $\to$ Data Bus), (C) Galat (Accumulator ALU ka result hold karta hai, next instruction ka address PC rakhta hai). Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 3
**During the 'Instruction Fetch' phase of the CPU instruction cycle, what is the role of the Program Counter (PC)?**  
(A) It decodes the opcode of the fetched instruction.  
(B) It supplies the address to the MAR and then automatically increments to point to the next instruction.  
(C) It stores the intermediate mathematical result of the execution.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** PC address MAR ko deta hai aur turant $+1$ increment ho jata hai.  
> ✅ **Correct Answer: (B)**

---
---

# 📑 CHAPTER 2: Microprocessors (8085 & 8086) & Generations

---

## 🔹 Topic 2.1: Microprocessor Generations & Memory Limits

```
 Gen 1 (4-bit / 8-bit)  ──>  Intel 4004 (1971), 8008  [PMOS Tech]
         │
 Gen 2 (8-bit)          ──>  Intel 8080, Intel 8085  [NMOS Tech]  🔥 (BPSC TRE 2.0 PYQ)
         │
 Gen 3 (16-bit)         ──>  Intel 8086, 8088, 80286  [HMOS Tech]
         │
 Gen 4 (32-bit)         ──>  Intel 80386, 80486
         │
 Gen 5 (64-bit/Pentium) ──>  Pentium (1993), Core i3/i5/i7 (Superscalar)
```

| Processor | Generation & Word Size | Address Bus | Maximum Addressable Memory |
| :--- | :---: | :---: | :---: |
| **Intel 8085** | 2nd Gen (8-bit) | **16-bit** | $2^{16} = \mathbf{64\text{ KB}}$ |
| **Intel 8086** | 3rd Gen (16-bit) | **20-bit** | $2^{20} = \mathbf{1\text{ MB}}$ |
| **Intel 80286** | 3rd Gen (16-bit) | **24-bit** | $2^{24} = \mathbf{16\text{ MB}}$ |
| **Intel 80386** | 4th Gen (32-bit) | **32-bit** | $2^{32} = \mathbf{4\text{ GB}}$ |

---

### 📝 Topic 2.1 Classroom Practice Questions:

#### ❓ Question 1 (TRE 2.0 Direct PYQ)
**Intel 8085 microprocessor belongs to which of the following generations?**  
(A) First generation  
(B) Second generation  
(C) Third generation  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Intel 8085 ek 2nd Generation (8-bit, NMOS) microprocessor hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which of the following pairs of microprocessor and its maximum addressable memory capacity is/are correctly matched?**  
(A) Intel 8085 $\to 64\text{ KB}$  
(B) Intel 8086 $\to 1\text{ MB}$  
(C) Intel 80286 $\to 16\text{ MB}$  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Teeno ke teeno matches bilkul 100% correct hain ($2^{16}=64\text{KB}$, $2^{20}=1\text{MB}$, $2^{24}=16\text{MB}$). Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 3
**Which was the first 32-bit microprocessor introduced by Intel that could address up to $4\text{ GB}$ of physical memory?**  
(A) Intel 8086  
(B) Intel 80286  
(C) Intel 80386  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Intel 80386 (1985) Intel ka pehla 32-bit processor tha jisme 32-bit address bus thi ($4\text{ GB}$ memory).  
> ✅ **Correct Answer: (C)**

---

## 🔹 Topic 2.2: Intel 8085 Hardware Specs, Pins & Flags

### 1. ⚙️ 8085 ke Hardware Specs:
* **Word Size:** 8-bit | **Pins:** 40-Pin DIP | **Power:** $+5\text{V}$ DC | **Technology:** NMOS.
* **Clock Frequency:** Standard **$3\text{ MHz}$** (6 MHz crystal frequency divide by 2).
* **Multiplexed Bus ($AD_0 - AD_7$):** Pins bachane ke liye Address aur Data mix hain:
  * **ALE (Address Latch Enable):**
    * Jab **$ALE = 1$** $\implies$ Bus par **Address ($A_0 - A_7$)** hai.
    * Jab **$ALE = 0$** $\implies$ Bus par **Data ($D_0 - D_7$)** hai.
    * ALE ka kaam hai bus ko **Demultiplex** karna!
* **$IO/\overline{M}$ Pin:**
  * High (1) par $\implies$ I/O device se communication.
  * Low (0) par $\implies$ Memory se communication (Bar wali pin 0 par active hoti hai).
* **READY Pin:** Slow memory ya peripheral ke liye CPU ko wait state me daalti hai.
* **HOLD & HLDA:** DMA controller ke sath bus lene-dene ke handshake signals.

---

### 2. 🗄️ Registers & Flag Register:
* **General Purpose Registers:** B, C, D, E, H, L (All 8-bit).
* **Register Pairs (16-bit):** BC pair, DE pair, aur **HL Pair (HL pair is default Memory Pointer 'M')**.
* **Flag Register (5 Active Flags):**
  1. **S (Sign):** Result negative ($D_7 = 1$) to $S = 1$.
  2. **Z (Zero):** Result $00\text{H}$ aaye to $Z = 1$.
  3. **AC (Auxiliary Carry):** Carry from $D_3 \to D_4$. **BCD arithmetic aur `DAA` instruction** me use hota hai.
  4. **P (Parity):** Result me 1s ki sankhya EVEN ho to $P = 1$.
  5. **CY (Carry):** Final bit ($D_7$) se carry nikle to $CY = 1$.

---

### 📝 Topic 2.2 Classroom Practice Questions:

#### ❓ Question 1
**What is the function of the ALE (Address Latch Enable) signal in the Intel 8085 microprocessor?**  
(A) It is used to demultiplex the multiplexed address/data bus ($AD_0 - AD_7$).  
(B) It indicates whether the processor is communicating with Memory or an I/O device.  
(C) When active high, it signals that the lower 8 lines contain an address ($A_0 - A_7$).  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** (A) Sahi (demultiplex karta hai), (B) Galat (ye kaam $IO/\overline{M}$ pin ka hai), (C) Sahi (high hone par address hold karta hai). Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 2
**In Intel 8085, which register pair is used by default as the 'Memory Pointer (M)' to address a memory location?**  
(A) BC pair  
(B) DE pair  
(C) HL pair  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** HL pair ko 8085 me default Memory Pointer (M) ke roop me use kiya jata hai (`MOV A, M`).  
> ✅ **Correct Answer: (C)**

#### ❓ Question 3
**Which flag of the Intel 8085 microprocessor is set when a carry is generated from bit $D_3$ to bit $D_4$, and is specifically used in BCD arithmetic and the `DAA` instruction?**  
(A) Carry Flag ($CY$)  
(B) Auxiliary Carry Flag ($AC$)  
(C) Parity Flag ($P$)  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Auxiliary Carry Flag ($AC$) $D_3 \to D_4$ carry par set hota hai aur BCD / `DAA` me use hota hai.  
> ✅ **Correct Answer: (B)**

---

## 🔹 Topic 2.3: 8085 Interrupts (Priority & Vectors)

### 1. 🔔 Interrupt kya hai? (Doorbell vs Polling)
* **Polling (Bina Interrupt):** Baar-baar darwaza khol kar dekhna ki delivery aayi kya (CPU ka time waste).
* **Interrupt (Doorbell):** Aap padhai karo, jab delivery boy aayega to ghanti bajayega. CPU bookmark lagakar (PC save karke) kaam handle karta hai aur wapas padhai resume karta hai.

---

### 2. ⚡ 5 Hardware Interrupts Master Table:

```
  Priority Sequence: TRAP (Rank 1) ──> RST 7.5 ──> RST 6.5 ──> RST 5.5 ──> INTR (Rank 5)
```

| Priority Rank | Interrupt Name | Maskable? | Vectored? | Triggering Type | Restart Vector Address Formula ($N \times 8 \to$ Hex) |
| :---: | :---: | :---: | :---: | :---: | :--- |
| 🥇 **1 (Highest)** | **TRAP** *(RST 4.5)*| **Non-Maskable** (Power cut/Emergency) | **Vectored** (`0024H`) | **Edge + Level (Dono!)** | $4.5 \times 8 = 36 \implies 16 \times 2 + 4 \implies \mathbf{0024H}$ |
| 🥈 **2** | **RST 7.5** | **Maskable** | **Vectored** (`003CH`) | **Edge** (Rising edge) | $7.5 \times 8 = 60 \implies 16 \times 3 + 12(\text{C}) \implies \mathbf{003CH}$ |
| 🥉 **3** | **RST 6.5** | **Maskable** | **Vectored** (`0034H`) | **Level** | $6.5 \times 8 = 52 \implies 16 \times 3 + 4 \implies \mathbf{0034H}$ |
| 4️⃣ **4** | **RST 5.5** | **Maskable** | **Vectored** (`002CH`) | **Level** | $5.5 \times 8 = 44 \implies 16 \times 2 + 12(\text{C}) \implies \mathbf{002CH}$ |
| 5️⃣ **5 (Lowest)** | **INTR** | **Maskable** | ❌ **Non-Vectored** | **Level** | External hardware address supply karta hai |

> 💡 **3 Golden Rules for Exam:**
> 1. **Maskable vs Non-Maskable:** Sirf **TRAP** Non-Maskable hai (Emergency siren). Baaki 4 Maskable hain!
> 2. **Vectored vs Non-Vectored:** Jinke naam me **Number** hai wo sab **Vectored** hain. Jiske naam me koi number nahi (**INTR**) wo **Non-Vectored** hai!
> 3. **Active Low Pins:** Bar wali pins (jaise $\overline{\text{INTA}}$, $\overline{\text{RD}}$, $\overline{\text{WR}}$) hamesha **`0`** par active hoti hain!

---

### 📝 Topic 2.3 Classroom Practice Questions:

#### ❓ Question 1
**Which of the following interrupts in Intel 8085 has the HIGHEST priority and cannot be disabled (non-maskable)?**  
(A) RST 7.5  
(B) TRAP  
(C) INTR  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** TRAP (RST 4.5) ki priority sabse unchi hoti hai aur ye akela non-maskable interrupt hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which of the following hardware interrupts in the Intel 8085 microprocessor is/are VECTORED?**  
(A) RST 7.5  
(B) RST 6.5  
(C) INTR  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Jinke naam me number hai (RST 7.5 aur RST 6.5) wo dono vectored hain. INTR non-vectored hai. Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 3
**What is the restart vector address of the `RST 7.5` interrupt in Intel 8085?**  
(A) `0024H`  
(B) `0034H`  
(C) `003CH`  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** $7.5 \times 8 = 60$. 60 ko 16 se divide kiya: $16 \times 3 = 48$, remainder bacha 12. Hex me 12 ko `C` kehte hain. Toh ban gaya `3CH` $\implies$ `003CH`!  
> ✅ **Correct Answer: (C)**

---

## 🔹 Topic 2.4: Intel 8086 Basics & 20-Bit Physical Address Calculation

### 1. ⚙️ 8086 Basics & Architecture:
* 16-bit processor, 40-pin DIP, 16-bit data bus, **20-bit address bus ($2^{20} = \mathbf{1\text{ MB}}$ memory)**.
* **Do Independent Units:**
  * **BIU (Bus Interface Unit):** Bus se instructions fetch karta hai, **6-byte instruction queue (FIFO)** maintain karta hai, aur physical address calculate karta hai.
  * **EU (Execution Unit):** ALU aur general registers (AX, BX, CX, DX) se instruction decode aur execute karta hai.
* **Segmentation:** 1 MB memory ko 64 KB ke 4 segments me baanta jata hai: Code Segment (CS), Data Segment (DS), Stack Segment (SS), Extra Segment (ES).

---

### 2. 🧮 20-Bit Physical Address Calculation (2-Step Shortcut):

$$\mathbf{\text{Physical Address} = (\text{Segment Address ke aage 0 lagao}) + \text{Offset}}$$

```text
       Example Problem: CS = 2500H, IP = 0480H
       
       Step 1: Segment (2500) ke aage '0' lagaya  ──>   2  5  0  0  0  (5 Hex Digits = 20 bits)
       Step 2: Offset (0480) ko normal joda       ──> +    0  4  8  0
       ───────────────────────────────────────────────────────────────
       Final 20-Bit Physical Address              ──>   2  5  4  8  0 H
```

* **Another Example (Hex addition with letters):** CS = `348AH`, IP = `4214H`
  * Step 1: `348A0`
  * Step 2: `348A0 + 4214`:
    * Last digit: $0 + 4 = \mathbf{4}$
    * 2nd digit: $\text{A} + 1 = 10 + 1 = 11 = \mathbf{B}$
    * 3rd digit: $8 + 2 = 10 = \mathbf{A}$
    * 4th digit: $4 + 4 = \mathbf{8}$
    * 5th digit: $3 + 0 = \mathbf{3}$
    * 👉 **Answer:** **`38AB4H`**!

---

### 📝 Topic 2.4 Classroom Practice Questions:

#### ❓ Question 1
**In an 8086 system, if $\text{CS} = 348\text{AH}$ and $\text{IP} = 4214\text{H}$, what is the 20-bit physical address?**  
(A) `38AB4H`  
(B) `38AC4H`  
(C) `769EH`  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** `348A0 + 4214 = 38AB4H`.  
> ✅ **Correct Answer: (A)**

#### ❓ Question 2
**Which of the following functions is/are performed by the Bus Interface Unit (BIU) of Intel 8086?**  
(A) Fetching instructions from memory into the 6-byte instruction queue  
(B) Calculating the 20-bit physical memory address  
(C) Executing arithmetic and logic operations using the ALU  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** (A) Sahi (6-byte queue BIU me hoti hai), (B) Sahi (physical address generator BIU me hota hai), (C) Galat (ALU execution Execution Unit - EU me hota hai). Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 3
**What is the maximum size of any single logical memory segment in Intel 8086?**  
(A) $16\text{ KB}$  
(B) $64\text{ KB}$  
(C) $1\text{ MB}$  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Total memory 1 MB hoti hai, par kisi bhi single segment ka maximum size **$64\text{ KB}$** ($2^{16}$) hota hai kyunki offset registers 16-bit ke hote hain.  
> ✅ **Correct Answer: (B)**

---

## 🔹 Topic 2.5: Microprocessor vs. Microcontroller

* **Microprocessor ($\mu\text{P}$):** **"Sirf Gaadi ka Engine (CPU on a Chip)"**. Is chip par sirf CPU hota hai. RAM, ROM, I/O bahar se lagana padta hai. General purpose (PC, Laptop). E.g. Intel 8085, 8086, Core i7.
* **Microcontroller ($\mu\text{C}$):** **"Puri Gaadi (Computer on a Single Chip)"**. Is ek hi silicon chip par CPU + RAM + ROM + Timers + I/O Ports sab pack hota hai! Dedicated/embedded systems (Washing machine, Microwave, Cars, AC Remote). E.g. Intel 8051, PIC, Arduino.

---

### 📝 Topic 2.5 Classroom Practice Questions:

#### ❓ Question 1 (TRE 2.0 Baseline Leak Fixed)
**A complete computer system fabricated on a single integrated circuit (IC) that integrates CPU, RAM, ROM, timers, and I/O ports is called:**  
(A) Microprocessor  
(B) Microcontroller  
(C) Arithmetic Logic Unit (ALU)  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Single IC chip par pura computer = Microcontroller!  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which of the following statements is/are correct regarding microprocessors and microcontrollers?**  
(A) A microprocessor requires external RAM, ROM, and I/O peripheral chips to build a working system.  
(B) Intel 8051 is a widely used example of an 8-bit microcontroller.  
(C) Microcontrollers are primarily designed for general-purpose applications like desktop PCs.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** (A) Sahi, (B) Sahi, (C) Galat (Microcontroller embedded/dedicated systems ke liye hote hain, general PC ke liye nahi). Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

---
---

# 📑 CHAPTER 3: Instruction Formats & Addressing Modes

---

## 🔹 Topic 3.1: Instruction Formats (0, 1, 2, 3 Address)

* **Instruction Anatomy:** `[ Opcode (Kya karna hai?) ] [ Operands (Kiske upar karna hai?) ]`
* **Opcode Bits Formula:** $2^{\text{bits}} \ge N$ (e.g. 128 distinct operations $\implies 2^7 \implies \mathbf{7\text{ bits}}$).
* **3-Address:** `ADD R1, R2, R3` ($R1 \leftarrow R2 + R3$). Source aur destination alag (RISC).
* **2-Address:** `ADD R1, R2` ($R1 \leftarrow R1 + R2$). Ek hi register Source aur Destination dono (x86/CISC).
* **1-Address:** `ADD X` ($AC \leftarrow AC + M[X]$). Destination register likhna nahi padta, **Accumulator ($AC$) implied** hota hai.
* **0-Address (Zero-Address):** `ADD`. Ye **STACK-organized** computers me use hota hai jahan operands stack ke top se uthaye jate hain (Postfix / RPN evaluation).

---

## 🔹 Topic 3.2: Addressing Modes (Direct Exam Summary)

| Addressing Mode | Data Kahan Milta Hai? | Memory References | Exam Keyword / Use |
| :--- | :--- | :---: | :--- |
| **Immediate** | Instruction ke andar hi ($EA = \text{none}$) | **0 (Zero)** | Constants initialize karna (`MVI A, 05H`) |
| **Direct (Absolute)**| Memory ke fixed address par ($EA = A$) | **1** | Global variables access (`LDA 2000H`) |
| **Indirect** | Pata kisi dusre pate ko point karta hai | **2** | **Pointers** implementation |
| **Register** | CPU Register ke andar ($EA = \text{none}$) | **0 (Fastest)** | Register-to-register data transfer |
| **Register Indirect**| Register me memory ka address ($EA = [R]$) | **1** | Pointers via registers (`MOV A, M`) |
| **Indexed** | Base address + Index register ($EA = A + XR$) | **1** | **Arrays & Tables traversal** |
| **Relative (PC)** | Offset added to PC ($EA = PC + A$) | **1** | **Branch / Jump instructions** |
| **Base Register** | Offset added to Base reg ($EA = BR + A$) | **1** | **Program Relocation by OS** |

---

### 📝 Chapter 3 Classroom Practice Questions:

#### ❓ Question 1
**Zero-Address instructions are primarily used in which computer architecture?**  
(A) Accumulator-based architecture  
(B) Stack-organized architecture  
(C) General Register architecture  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Zero-address instructions hamesha Stack par kaam karti hain.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which addressing mode is most suitable and widely used for accessing elements of linear data structures like Arrays and Tables?**  
(A) Immediate Addressing Mode  
(B) Indexed Addressing Mode  
(C) Direct Addressing Mode  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Arrays aur Tables ke liye hamesha Indexed Addressing Mode ($EA = \text{Base} + \text{Index}$) use hota hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 3
**In which addressing mode does the instruction itself contain the actual operand value, requiring ZERO memory references?**  
(A) Direct Addressing Mode  
(B) Immediate Addressing Mode  
(C) Indirect Addressing Mode  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Immediate mode me data instruction me hi pakda hota hai, isliye 0 memory reference lagte hain. Direct mode me address hota hai isliye 1 reference lagta hai.  
> ✅ **Correct Answer: (B)**

---
---

# 📑 CHAPTER 4: Memory Hierarchy & Cache Memory

---

## 🔹 Topic 4.1: Memory Hierarchy (Speed, Capacity, Cost)

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

* **Upar se Niche:** Speed kam hoti hai, Access time badhta hai (slow), Cost per bit ghati hai, Capacity badhti hai.
* **Niche se Upar:** Speed badhti hai, Access time ghta hai (fast), Cost per bit badhti hai, Capacity ghati hai.

---

## 🔹 Topic 4.2: SRAM vs. DRAM & ROM Types

* **SRAM (Static RAM):** Flip-flops se banta hai. **No refreshing required**. Super fast. **Cache Memory** me use hota hai.
* **DRAM (Dynamic RAM):** 1 Transistor + 1 Capacitor se banta hai. Capacitor charge leak karta hai, isliye **PERIODIC REFRESHING ZAROORI HAI**. **Main System RAM** me use hota hai.
* **ROM Types:**
  * **PROM:** Fusible links burn hote hain, **Sirf 1 baar (Only Once)** program hota hai.
  * **EPROM:** **Ultraviolet (UV) rays** se quartz window ke through erase hota hai.
  * **EEPROM:** **Electrical signals** se byte-by-byte board par hi erase hota hai.
  * **Flash Memory:** Block-level electrical erase EEPROM (Pen drives, SSDs).

---

## 🔹 Topic 4.3: Locality of Reference & Cache Policies

* **Locality of Reference (Kyun Cache 95% Hit karti hai?):**
  1. **Temporal Locality (Time):** Jo data abhi access hua hai, wo jaldi hi dobara access hoga. Example: **Loops (`for`, `while`)**, counters.
  2. **Spatial Locality (Space):** Jo data abhi access hua hai, uske aas-paas (padosi) memory ka data access hoga. Example: **Arrays**, Sequential instruction flow.
* **Cache Mapping Techniques:**
  * **Direct Mapping:** Har block ke liye **sirf 1 fixed line**. Simple, sasta, par high conflict miss.
  * **Fully Associative:** Block cache ki **kisi bhi free line (ANY slot)** me baith sakta hai. Zero conflict miss, expensive hardware.
  * **Set-Associative:** Block specific Set me jata hai, fir us set ke andar kisi bhi slot me. (Modern CPUs me sabse zyada used).
* **Write Policies:**
  * **Write-Through:** Cache aur Main RAM dono me **ek sath (simultaneously)** update hota hai.
  * **Write-Back (Copy-Back):** Sirf cache me update hota hai; RAM me tabhi likha jata hai jab block replace ho. **Dirty Bit (Modified Bit)** use karta hai.

---

### 📝 Chapter 4 Classroom Practice Questions:

#### ❓ Question 1
**Which type of semiconductor RAM stores data in cells consisting of a transistor and a capacitor, and requires periodic refreshing to prevent data loss?**  
(A) Static RAM (SRAM)  
(B) Dynamic RAM (DRAM)  
(C) Flash Memory  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** DRAM me capacitor charge leak karta hai, isliye periodic refreshing chahiye hoti hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**Which programming construct in computer science is the best demonstration of 'Temporal Locality' in cache memory?**  
(A) Consecutive elements stored in an array  
(B) Program loops (such as `for` and `while` loops) and subroutine counters  
(C) Sequential line-by-line execution of instructions  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Loops aur counters baar-baar ghoomte hain isliye ye Temporal (Time) locality dikhate hain. Arrays Spatial (Space) locality dikhate hain.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 3
**In Cache Memory organization (specifically Write-Back policy), what is the function of the 'Dirty Bit' (Modified Bit)?**  
(A) It indicates that the cache block has been modified by the CPU and must be written back to Main Memory before being replaced.  
(B) It is used to detect hardware errors and virus contamination in SRAM cells.  
(C) It indicates that the cache block has never been accessed by the CPU.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Dirty bit batata hai ki cache ka data modify ho chuka hai aur RAM me update karna bacha hai.  
> ✅ **Correct Answer: (A)**

---
---

# 📑 CHAPTER 5: Input-Output (I/O) Organization & DMA

---

## 🔹 Topic 5.1 & 5.2: Data Transfer Techniques & DMA Modes

1. **Programmed I/O:** CPU lagatar loop me device status check karta rehta hai ("Busy Waiting"). CPU ka time barbaad hota hai.
2. **Interrupt-driven I/O:** Device ready hone par interrupt bhejti hai. Busy waiting khatam, par data ka har byte CPU registers se hokar hi jata hai.
3. **Direct Memory Access (DMA):** High-speed devices (Hard disk) bina CPU registers ke seedhe **Device $\leftrightarrow$ RAM** bulk data transfer karti hain.
   * CPU initialization parameters: Starting Address, Word Count, aur Direction (Read/Write).
   * **HOLD:** DMA controller CPU se bus maangta hai.
   * **HLDA (Hold Acknowledge):** CPU bus chhodkar DMA ko confirm karta hai.
   * **Burst Mode:** Pura block ek jhatke me transfer hota hai; CPU suspended rehta hai (Fastest).
   * **Cycle Stealing Mode:** DMA CPU se **sirf 1 bus cycle chura kar 1 byte** bhejta hai aur foran bus lauta deta hai; CPU chalta rehta hai.
   * **Dedicated Chip:** **Intel 8257 / 8237** = DMA Controller. (8255 = PPI Parallel Ports, 8259 = PIC Interrupt Controller, 8253 = Timer).

---

## 🔹 Topic 5.3: Memory-Mapped I/O vs. Isolated I/O

| Feature | **Memory-Mapped I/O** | **Isolated I/O (I/O-Mapped)** |
| :--- | :--- | :--- |
| **Address Space** | Memory aur I/O ka **1 Common Shared Space** | Alag-alag independent address space |
| **Address Bus for I/O** | 16-bit address | **8-bit address (Max 256 Ports)** |
| **Instructions** | Normal memory commands (`MOV`, `LDA`, `STA`) | Special commands: **`IN`** aur **`OUT`** |
| **RAM Capacity** | Usable RAM space kam ho jata hai | RAM ki capacity puri bachi rehti hai |
| **Control Signal** | Normal `MEMR` / `MEMW` | $IO/\overline{M} = 1$ ke sath `IOR` / `IOW` |

---

### 📝 Chapter 5 Classroom Practice Questions:

#### ❓ Question 1
**Which pair of signals is exchanged between the CPU and the DMA controller to request and grant control of the system buses?**  
(A) `INTR` and `INTA`  
(B) `HOLD` and `HLDA`  
(C) `RESET IN` and `RESET OUT`  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** DMA bus maangne ke liye HOLD bhejta hai, aur CPU bus chhodkar HLDA bhejta hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 2
**In which I/O scheme are dedicated machine instructions like `IN` and `OUT` specifically used to communicate with peripheral devices?**  
(A) Memory-Mapped I/O  
(B) Isolated I/O (I/O-Mapped I/O)  
(C) Direct Memory Access (DMA)  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Isolated I/O me I/O devices ke liye alag se 256 ports hote hain aur unhe chalane ke liye special `IN` aur `OUT` instructions use hoti hain.  
> ✅ **Correct Answer: (B)**

---
---

# 📑 CHAPTER 6: Pipelining & RISC vs. CISC

---

## 🔹 Topic 6.1 & 6.2: Pipelining Basics, Stages & Hazards

1. **Pipelining Concept:** Car factory ki assembly line jaisa technique. Multiple instructions ke execution ko overlap karna.
2. **5 Classic Stages:**
   $$\mathbf{IF \text{ (Fetch)} \longrightarrow ID \text{ (Decode)} \longrightarrow EX \text{ (Execute)} \longrightarrow MEM \text{ (Memory)} \longrightarrow WB \text{ (Write Back)}}$$
3. **Maksad:** Individual instruction ka execution time (latency) kam nahi hota; **Throughput (instructions per unit time) badhta hai**!
4. **Maximum Speedup:** $S_{\text{max}} = \mathbf{k}$ (where $k$ = number of stages in pipeline).
5. **3 Pipeline Hazards:**
   * **Data Hazard (Data ka intezaar):** Agli instruction ko pichhli instruction ke result/data ka intezaar (RAW dependency). $\implies$ **Solution: Operand Forwarding (Bypassing)**.
   * **Control Hazard (Mod par bhatakna):** Branch, Jump, Call instructions se pipeline bhatak jana. $\implies$ **Solution: Branch Prediction**.
   * **Structural Hazard (Machine par ladai):** Ek hi hardware resource par do instructions ek sath lad padna. $\implies$ **Solution: Separate Instruction & Data Caches**.

---

## 🔹 Topic 6.3: RISC vs. CISC Architecture

| Feature | **RISC (Reduced Instruction Set)** | **CISC (Complex Instruction Set)** |
| :--- | :--- | :--- |
| **Instruction Size** | **Fixed Length** (e.g. 32-bit) | **Variable Length** (1 to 15 bytes) |
| **Execution Speed** | **Single Clock Cycle** (1 CPI) | Multiple clock cycles per instruction |
| **Memory Access** | **Load/Store Architecture** (Sirf Load/Store hi RAM chhu sakte hain) | Any instruction can access memory directly |
| **Control Unit** | **Hardwired Control Unit** (Direct gates, fast) | **Microprogrammed Control Unit** (ROM microcode) |
| **Pipelining** | **Very Easy & Highly Efficient** | Difficult & Complex |
| **Examples** | **ARM** (Smartphones, Apple M-series), MIPS, RISC-V | **Intel x86** (8086, Pentium, Core series), AMD |

---

### 📝 Chapter 6 Classroom Practice Questions:

#### ❓ Question 1
**Which of the following characteristics is/are typical of a RISC (Reduced Instruction Set Computer) architecture?**  
(A) Memory access is strictly restricted to dedicated `LOAD` and `STORE` instructions.  
(B) Instructions have a fixed length and a consistent encoding format.  
(C) Most instructions are designed to execute in a single clock cycle.  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Teeno statements RISC ke classic hallmarks hain. Rule of 2 $\implies$ **Option (D)!**  
> ✅ **Correct Answer: (D)**

#### ❓ Question 2
**Which technique is widely used in pipelined processors to resolve Data Hazards by routing computed results directly from the ALU output back into subsequent instructions without waiting for register write-back?**  
(A) Branch Prediction  
(B) Operand Forwarding (Bypassing)  
(C) Cache Mapping  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** Data Hazard ka sabse bada solution **Operand Forwarding (Bypassing)** hota hai.  
> ✅ **Correct Answer: (B)**

#### ❓ Question 3
**Which type of Control Unit design is predominantly used in RISC architectures to achieve fast, single-cycle instruction execution?**  
(A) Hardwired Control Unit  
(B) Microprogrammed Control Unit  
(C) Microcode Control Unit  
(D) More than one of the above  
(E) None of the above  
> **💡 Post-Mortem:** RISC me fast single-cycle speed ke liye direct combinatorial gates wala **Hardwired Control Unit** use hota hai.  
> ✅ **Correct Answer: (A)**
