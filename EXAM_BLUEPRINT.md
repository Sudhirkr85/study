# 🛡️ BPSC TRE Computer Science - Master Preparation Blueprint & Protocol

> **🎯 MISSION TARGET: 75+ / 80 Marks in Computer Science (Part-III)**  
> **Mandatory Rule for AI Mentor:** Har session ya chat start karne se pehle is file ko read karke user ka baseline score, mistakes pattern, syllabus boundary aur 75+ target ko recall karna mandatory hai.

---

## 📊 1. Candidate Baseline Scores & Gap Analysis

| Exam Attempt | Score / 80 | Accuracy | Status | Key Leakage Area |
| :--- | :---: | :---: | :---: | :--- |
| **BPSC TRE 1.0 (Aug 2023)** | 53 / 80 | 66.25% | Baseline | Time Sharing concepts, CPU Control Signals, Buffer registers |
| **BPSC TRE 2.0 (Dec 2023)** | 60 / 80 | 75.00% | High Baseline | Microprocessor generations (8085 2nd gen), Max memory (16MB), Single chip computer (Microcontroller) |
| **BPSC TRE 3.0 (Aug 2024)** | 52 / 80 | 65.00% | Trap Heavy Paper | **Option D & E trap (39.3% mistakes)**, Number conversion silly errors, PLA definition |
| **Consolidated Past PYQs** | **165 / 240** | **68.75%** | **Current Level** | **Gap to 75+/80: +15 to +23 Marks required** |

### 🔍 Root Cause of Mark-Leakage (Mistakes Catalog):
1. **Option (D) "More than one" & Option (E) "None of the above" Traps:**
   - In TRE 3.0, nearly 29% questions were (D) or (E).
   - Candidate often picks the first plausible option (A/B/C) without evaluating the other two.
   - **Target Rule:** *Rule of 2* — If any 2 options are correct $\implies$ Option (D) guaranteed. Always evaluate all options before locking.
2. **Microprocessors & Architecture Generations:**
   - Direct memory limits (8086 = 1MB, 80286 = 16MB, 80386 = 4GB).
   - 8085 generation (2nd gen, 8-bit, NMOS, 40-pin).
   - Microprocessor vs Microcontroller (CPU on single chip vs Computer on single chip).
3. **Execution Under Time Pressure:**
   - Calculation errors in Decimal-to-Binary/Hex (e.g. 1234 conversion).
   - Fast inspection tricks must be practiced daily.
4. **Factual Standard Shortcuts / Syntax:**
   - Turbo C++ shortcuts (`Ctrl+F9` compile/run, `Alt+F5` user screen).
   - File extensions, standard header files, C++ access specifier defaults.

---

## 🧭 2. Strict Exam Boundaries (The Anti-GATE Rule)
* ❌ **STRICTLY NO GATE-LEVEL THEORETICAL DERIVATIONS:**  
  No dynamic programming recurrences, no complex compiler LR parsing tables, no multi-page mathematical proofs.
* ✅ **MANDATORY BPSC / PGT STANDARD:**  
  - CBSE NCERT Class 11-12 (Computer Science & IP - Preeti Arora / Sumita Arora)
  - BCA / B.Tech 1st-2nd Year Core Definitions (Balaguruswamy C++, Forouzan Networking, Korth DBMS)
  - KVS / NVS / DSSSB PGT & STET Level-1 standard.
  - Broad coverage with direct factual & conceptual depth.

---

## 📝 3. Official Syllabus Map (From BPSC CS Syllabus CSHT/ELHT)

1. **CSHT-101: Programming Fundamentals & C++ (Target: 15/15 Qs)**
   - Basic types, constants, variables, operators, loops, control structures.
   - OOPs: Classes, Objects, Abstraction, Encapsulation, Inheritance types, Polymorphism (Compile-time vs Run-time).
   - Constructors, Destructors, `friend` functions, `this` pointer, Virtual functions.
   - Pointers, Dynamic memory (`new`/`delete`), File handling, Error handling.
2. **ELHT-301: Digital Electronics & Number Systems (Target: 15/15 Qs)**
   - Number systems (Binary, Octal, Hex, BCD, Gray code, Hamming code).
   - Complements (1's, 2's, 9's, 10's, signed ranges).
   - Logic Gates, Boolean algebra theorems, De Morgan's laws.
   - Combinational: SOP/POS, K-Maps (2-4 variables), Adders, Subtractors, MUX, DEMUX, Encoders, Decoders, PLA/PAL.
   - Sequential: Latches, Flip-Flops (SR, JK, D, T), Excitation tables, Counters (Synchronous/Asynchronous, Modulo), Registers.
3. **CSHT-102: Discrete Structures (Target: 6/6 Qs)**
   - Sets, Relations, Functions, Pigeonhole Principle, Permutation & Combination.
   - Propositional Logic (Truth tables, Tautology, Equivalences).
   - Graph Theory basics, Trees, Euler & Hamiltonian paths.
4. **Computer Organization & Architecture (Target: 12/12 Qs)**
   - Functional units, Bus architecture, 8085/8086 microprocessors.
   - Addressing modes (Direct, Indirect, Immediate, Indexed, Relative).
   - Memory hierarchy, Cache memory (Direct, Set-associative), Virtual memory.
5. **Data Structures & Algorithms (Target: 12/12 Qs)**
   - Arrays, Stacks (Infix to Postfix, evaluation), Queues (Circular, Priority).
   - Linked Lists (Singly, Doubly, Circular).
   - Trees (Binary trees, BST, Traversals: Pre, In, Post, Height, Leaves).
   - Sorting & Searching (Time & Space complexities: Bubble, Selection, Insertion, Merge, Quick).
6. **Database Management Systems (DBMS & SQL) (Target: 10/10 Qs)**
   - 3-tier architecture, Relational data model, Keys (Super, Candidate, Primary, Foreign, Alternate).
   - Normalization (1NF, 2NF, 3NF, BCNF direct conditions).
   - SQL queries (DDL, DML, DCL, TCL), Joins, Aggregate functions, `GROUP BY`, `HAVING`.
   - Transactions, ACID properties, Serializability basics.
7. **Operating Systems & System Software (Target: 10/10 Qs)**
   - OS types, Process states, Process Control Block (PCB).
   - CPU Scheduling (FCFS, SJF, SRTF, Round Robin, Priority).
   - Synchronization & Deadlocks (4 necessary conditions, Banker's algorithm basics, Semaphores).
   - Memory Management (Paging, Segmentation, Page replacement algorithms: FIFO, LRU, Optimal).
8. **Computer Networks & Security (Target: 10/10 Qs)**
   - OSI vs TCP/IP models, Function of each layer.
   - Protocols & Port numbers (HTTP 80, HTTPS 443, DNS 53, FTP 20/21, SMTP 25, etc.).
   - IP addressing (IPv4 classes, Subnetting, IPv6 basics).
   - Topologies, Transmission media, Basic network devices (Hub, Switch, Router, Gateway).
9. **General Studies - Part-II (Target: 25+ / 40 Marks)**
   - Elementary Mathematics (8 Qs)
   - General Science: Physics, Chemistry, Biology (8 Qs)
   - Indian National Movement & Bihar History (8 Qs)
   - Geography: Physical, Indian & Bihar (8 Qs)
   - Current Affairs & Science/Tech (8 Qs)

---

## 📋 4. AI Mentor Session Execution Protocol (Every Interaction)
1. **Recall Target:** Remind candidate of **Target 75+ / 80**.
2. **Zero GATE Fluff:** Keep explanations concise, bulleted, memory-trick focused.
3. **Mandatory 5-Option Drill:** Every quiz question must strictly follow BPSC options:
   - `(A)`, `(B)`, `(C)`, `(D) More than one of the above`, `(E) None of the above`.
4. **Log Results:** Update `TRACKER.md` on milestone completions.
