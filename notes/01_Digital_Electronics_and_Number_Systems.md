# 📘 Subject 01: Digital Electronics & Number Systems
> **Target:** 4-Month Master Preparation for CS Exam (20 Seats Selection Plan)  
> **Syllabus Reference:** ELHT 301 (Digital Electronics) & CSHT 101 (Computer Organization)

---

## 📌 Chapter 1: Number Systems & Conversions

### 1.1 Base (Radix) Overview
| System | Radix ($r$) | Symbols / Digits | Binary Bits per Digit |
| :--- | :---: | :--- | :---: |
| **Binary** | 2 | `0, 1` | 1 bit |
| **Octal** | 8 | `0, 1, 2, 3, 4, 5, 6, 7` | 3 bits ($2^3 = 8$) |
| **Decimal** | 10 | `0, 1, 2, 3, 4, 5, 6, 7, 8, 9` | - |
| **Hexadecimal** | 16 | `0-9, A(10), B(11), C(12), D(13), E(14), F(15)` | 4 bits ($2^4 = 16$) |

---

### 1.2 Fast Conversion Tricks (Memory Tricks)

#### 🎯 Trick 1: Binary $\leftrightarrow$ Octal (Group of 3)
* Integer part: Right $\to$ Left group of 3 bits.
* Fractional part: Left $\to$ Right group of 3 bits.
* *Example:* $(110101.11)_2 \to (\underline{110}\ \underline{101} . \underline{110})_2 = (65.6)_8$.

#### 🎯 Trick 2: Binary $\leftrightarrow$ Hexadecimal (Group of 4)
* Integer part: Right $\to$ Left group of 4 bits.
* Fractional part: Left $\to$ Right group of 4 bits.
* *Example:* $(10110111)_2 \to (\underline{1011}\ \underline{0111})_2 = (\text{B}7)_{16}$.

#### 🎯 Trick 3: Decimal Fractions to Binary
* Decimal fraction ko $2$ se continuously multiply karein aur integer part record karein (Top to Bottom).
* *Example:* $0.625 \times 2 = 1.25$ (Carry 1) $\to 0.25 \times 2 = 0.5$ (Carry 0) $\to 0.5 \times 2 = 1.0$ (Carry 1). Result $= (0.101)_2$.

---

## 📌 Chapter 2: Complements & Signed Representations

### 2.1 1's and 2's Complement
* **1's Complement:** Invert all bits ($0 \to 1, 1 \to 0$).
* **2's Complement:** $\text{1's Complement} + 1$.
* **Fast 2's Complement Trick (Inspection Method):**
  * Number ke Right side (LSB) se start karein.
  * Pehle `1` aane tak sab bits same rakhein.
  * Us pehle `1` ke baad left ke sabhi bits invert ($0 \leftrightarrow 1$) kar dein!
  * *Example:* $(101100)_2 \to$ LSB se `00`, pehla `1` mila $\to$ ab baaki left bits invert $\to (010100)_2$.

### 2.2 Representation Ranges for $n$ Bits (Direct Exam Formulas)
| Representation | Range Formula | Zero (0) Representation | Total Distinct Values |
| :--- | :--- | :---: | :---: |
| **Unsigned** | $0 \text{ to } 2^n - 1$ | Unique (`00...0`) | $2^n$ |
| **Signed Magnitude** | $-(2^{n-1} - 1) \text{ to } +(2^{n-1} - 1)$ | Two: $+0$ and $-0$ | $2^n - 1$ |
| **1's Complement** | $-(2^{n-1} - 1) \text{ to } +(2^{n-1} - 1)$ | Two: $+0$ (`00...0`) & $-0$ (`11...1`) | $2^n - 1$ |
| **2's Complement** | **$-2^{n-1} \text{ to } +(2^{n-1} - 1)$** | **Unique (`00...0`)** | **$2^n$** |

> [!IMPORTANT]
> For 8 bits ($n = 8$):
> * 2's complement range is **$-128 \text{ to } +127$**.
> * Extra negative number is $-128 = (10000000)_2$.
> * Weight of MSB in 2's complement is **negative**: Weight $= -2^{n-1}$.

---

## 📌 Chapter 3: Codes & Error Detection (BCD, Gray, XS-3, Hamming)

### 3.1 BCD (Binary Coded Decimal / 8421 Code)
* Har decimal digit $(0-9)$ ko 4 bits se likha jata hai.
* **Maximum valid value of a single BCD digit = 9 (`1001`)**.
* **Invalid BCD codes:** 1010, 1011, 1100, 1101, 1110, 1111 (Total 6 invalid states).
* **BCD Addition Correction Rule:**
  * Agar Sum $> 9$ ho ya Carry out generate ho, toh **$+6 (0110)_2$ add karte hain**.

### 3.2 Excess-3 Code (XS-3)
* Formula: $\text{BCD} + 0011_2 (+3)$.
* **Self-Complementing Code:** Excess-3 ka 1's complement nikalne par us decimal number ka **9's complement** milta hai. (Excess-3 aur 2421 dono self-complementing hote hain).

### 3.3 Gray Code (Reflected Binary / Unit Distance Code)
* Do consecutive numbers mein **sirf 1 bit** ka difference hota hai.
* **Binary to Gray:** MSB same ($G_3 = B_3$), then consecutive XOR ($G_2 = B_3 \oplus B_2$, $G_1 = B_2 \oplus B_1$, $G_0 = B_1 \oplus B_0$).
* **Gray to Binary:** MSB same ($B_3 = G_3$), then diagonal XOR ($B_2 = B_3 \oplus G_2$, $B_1 = B_2 \oplus G_1$, $B_0 = B_1 \oplus G_0$).

### 3.4 Hamming Distance & Hamming Code
* **Hamming Distance:** Do code words mein kitne bit positions alag hain.  
  *Calculation Trick:* $\text{Count of 1's in } (A \oplus B)$.
* **Golden Formulas:**
  * To detect $s$ bits error: $\mathbf{d_{\min} \ge s + 1}$
  * To correct $t$ bits error: $\mathbf{d_{\min} \ge 2t + 1}$
  * Parity bits ($p$) required for $m$ data bits: $\mathbf{2^p \ge m + p + 1}$
* **Hamming (7, 4) Code Construction & Error Syndrome:**
  * Parity positions are powers of 2: Bit 1 ($P_1$), Bit 2 ($P_2$), Bit 4 ($P_4$).
  * Data positions: Bit 3 ($D_3$), Bit 5 ($D_5$), Bit 6 ($D_6$), Bit 7 ($D_7$).
  * $P_1$ covers bits 1, 3, 5, 7.
  * $P_2$ covers bits 2, 3, 6, 7.
  * $P_4$ covers bits 4, 5, 6, 7.
  * **Syndrome word $C_4 C_2 C_1$ gives the exact decimal index of the erroneous bit!**

---

## 📌 Chapter 4: Boolean Algebra & Logic Minimization

### 4.1 Key Boolean Laws
1. **Absorption Laws:**
   * $A + AB = A$
   * $A + \bar{A}B = \mathbf{A + B}$ *(Super Important)*
   * $A(\bar{A} + B) = \mathbf{AB}$
2. **Consensus Theorem:**
   * $\mathbf{AB + \bar{A}C + BC = AB + \bar{A}C}$ ($BC$ redundant hota hai aur cancel ho jata hai).
3. **De Morgan's Laws:**
   * $\overline{A \cdot B} = \bar{A} + \bar{B}$ (NAND = Bubbled OR)
   * $\overline{A + B} = \bar{A} \cdot \bar{B}$ (NOR = Bubbled AND)

### 4.2 Minimum Universal Gates Table (PYQ Direct Hit)
| Gate to Implement | Min NAND Required | Min NOR Required |
| :--- | :---: | :---: |
| **NOT** | 1 | 1 |
| **AND** | 2 | 3 |
| **OR** | 3 | 2 |
| **NOR** | 4 | 1 |
| **NAND** | 1 | 4 |
| **XOR** | **4** | **5** |
| **XNOR** | **5** | **4** |

> 🧠 **Memory Trick:**
> * NAND count for (NOT, AND, OR, XOR, XNOR) $\to$ **1, 2, 3, 4, 5**
> * NOR count for (NOT, OR, AND, XNOR, XOR) $\to$ **1, 2, 3, 4, 5**

---

## 📌 Chapter 5: Combinational Circuits

### 5.1 Adders & Subtractors
* **Half Adder:** Sum $= A \oplus B$, Carry $= AB$ (Needs 1 XOR + 1 AND, or **5 NAND**).
* **Full Adder:** Sum $= A \oplus B \oplus C_{\text{in}}$, Carry $= AB + BC_{\text{in}} + AC_{\text{in}}$ (Needs **2 Half Adders + 1 OR**, or **9 NAND**).

### 5.2 Multiplexer (MUX - Data Selector)
* $2^n$ inputs, $n$ select lines, 1 output $\implies \mathbf{\text{Inputs} = 2^{\text{Select Lines}}}$.
* Higher to lower MUX count: To make $16 \times 1$ using $4 \times 1 \implies \frac{16}{4} + \frac{4}{4} = 4 + 1 = \mathbf{5}$.

---

## 📌 Chapter 6: Sequential Circuits & Flip-Flops

### 6.1 Flip-Flop Equations & Features
| Flip-Flop | Inputs | Characteristic Equation | Key Feature |
| :--- | :---: | :--- | :--- |
| **SR** | $S, R$ | $Q_{n+1} = S + R'Q_n$ | $S=1, R=1$ is **Invalid / Forbidden** |
| **JK** | $J, K$ | $Q_{n+1} = JQ'_n + K'Q_n$ | $J=1, K=1 \implies$ **Toggle** ($Q_{n+1} = Q'_n$) |
| **D** | $D$ | $Q_{n+1} = D$ | **Data delay / Buffer** |
| **T** | $T$ | $Q_{n+1} = T \oplus Q_n$ | $T=1 \implies \text{Toggle}$; Frequency Divider ($\div 2$) |

> [!WARNING]
> **Race Around Condition in JK Flip-Flop:**
> * Happens when: $J=1, K=1$ and clock pulse duration $t_p > t_{pd}$ (propagation delay).
> * **Remedy:** Master-Slave JK flip-flop or edge-triggering.

---

## 🎯 Chapter 7: Practice Questions with Step-by-Step Solutions

### Q1. What is the 2's complement of the binary number `10110010`?
* (A) `01001101`
* (B) `01001110`
* (C) `01001111`
* (D) More than one of the above
* (E) None of the above
> **Solution:** Inspection Trick: Right se dekho, pehla `1` mila bit 2 par (`...10`). Baaki left bits invert kar do: `101100` $\to$ `010011`. Result: `01001110`.  
> **Correct Answer: (B)**

---

### Q2. In an 8-bit computer system, what is the decimal equivalent of the 2's complement number `11110000`?
* (A) $-16$
* (B) $-240$
* (C) $+240$
* (D) More than one of the above
* (E) None of the above
> **Solution:** Weight method: MSB weight is $-128$.  
> Value $= -128 + 64 + 32 + 16 + 0 = -128 + 112 = \mathbf{-16}$.  
> **Correct Answer: (A)**

---

### Q3. When adding two BCD numbers $(0110)_{\text{BCD}}$ and $(0111)_{\text{BCD}}$, what is the correct result?
* (A) `1101`
* (B) `0001 0011`
* (C) `0001 0101`
* (D) More than one of the above
* (E) None of the above
> **Solution:** $6 + 7 = 13$ in decimal. Binary sum $= 0110 + 0111 = 1101_2$ ($13 > 9$, invalid BCD).  
> Add $+6$ (`0110`): $1101 + 0110 = 10011 \to \mathbf{0001\ 0011}_{\text{BCD}}$.  
> **Correct Answer: (B)**

---

### Q4. Which of the following codes is known as a self-complementing code?
* (A) BCD (8421)
* (B) Gray Code
* (C) Excess-3 Code
* (D) More than one of the above
* (E) None of the above
> **Solution:** In Excess-3 and 2421 codes, 1's complement of code yields 9's complement of the decimal digit. Hence it is self-complementing.  
> **Correct Answer: (C)**

---

### Q5. What is the Hamming distance between code words `1100101` and `1001110`?
* (A) 2
* (B) 3
* (C) 4
* (D) More than one of the above
* (E) None of the above
> **Solution:** $1100101 \oplus 1001110 = 0101011$. Total number of 1s $= 4$. Hence Hamming distance $= 4$.  
> **Correct Answer: (C)**

---

### Q6. To detect up to 3 bit errors in a communication channel, what is the minimum Hamming distance required?
* (A) 3
* (B) 4
* (C) 7
* (D) More than one of the above
* (E) None of the above
> **Solution:** Formula to detect $s$ errors: $d_{\min} \ge s + 1$. For $s=3$, $d_{\min} \ge 3 + 1 = 4$.  
> **Correct Answer: (B)**

---

### Q7. The minimum number of NAND gates required to implement an XOR gate is:
* (A) 3
* (B) 4
* (C) 5
* (D) More than one of the above
* (E) None of the above
> **Solution:** Memory trick: NOT (1), AND (2), OR (3), XOR (4), XNOR (5). XOR requires 4 NAND gates.  
> **Correct Answer: (B)**

---

### Q8. Simplify the Boolean expression $F = A + \bar{A}B + AB$:
* (A) $A$
* (B) $B$
* (C) $A + B$
* (D) More than one of the above
* (E) None of the above
> **Solution:** $A + AB = A$ (Absorption law). Then $A + \bar{A}B = A + B$.  
> **Correct Answer: (C)**

---

### Q9. How many $2 \times 1$ multiplexers are needed to construct a $16 \times 1$ multiplexer?
* (A) 8
* (B) 15
* (C) 16
* (D) More than one of the above
* (E) None of the above
> **Solution:** $\frac{16}{2} = 8$, $\frac{8}{2} = 4$, $\frac{4}{2} = 2$, $\frac{2}{2} = 1$. Total $= 8 + 4 + 2 + 1 = \mathbf{15}$.  
> *Shortcut formula:* For $2 \times 1$ MUX, to make $N \times 1$ MUX, always $\mathbf{N - 1}$ MUX are required ($16 - 1 = 15$).  
> **Correct Answer: (B)**

---

### Q10. A T flip-flop acts as a frequency divider when the input $T$ is connected to:
* (A) Logic 0
* (B) Logic 1
* (C) Clock
* (D) More than one of the above
* (E) None of the above
> **Solution:** When $T=1$, the flip-flop toggles on every active clock edge, producing an output frequency exactly half of the clock frequency ($f_{\text{out}} = f_{\text{clk}} / 2$).  
> **Correct Answer: (B)**
