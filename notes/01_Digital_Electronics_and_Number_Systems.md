# 📘 BPSC Computer Science - Module 01: Digital Electronics & Number Systems

> **🎯 Target:** 15 / 15 Marks in Part-III (BPSC TRE Standard)  
> **Syllabus Reference:** ELHT 301 (Digital Electronics)  
> **Key Focus:** Zero Confusion, Step-by-Step Logic, High-Yield Memory Tricks

---

## 📌 Chapter 1: Number Systems & Step-by-Step Conversions

### 1.1 Base (Radix) Overview
Computer memory me data ko alag-alag bases me represent kiya jata hai:

| Number System | Base / Radix ($r$) | Allowed Digits (Symbols) | Bits per Digit |
| :--- | :---: | :--- | :---: |
| **Binary** | **2** | `0, 1` | 1 bit |
| **Octal** | **8** | `0, 1, 2, 3, 4, 5, 6, 7` | 3 bits ($2^3 = 8$) |
| **Decimal** | **10** | `0, 1, 2, 3, 4, 5, 6, 7, 8, 9` | - |
| **Hexadecimal** | **16** | `0-9, A(10), B(11), C(12), D(13), E(14), F(15)` | 4 bits ($2^4 = 16$) |

---

### 1.2 Fast Conversion Rules (Grouping Method Samajhiye)

#### 🎯 Rule 1: Binary se Octal me Conversion (3-3 Bits ka Group)
Octal ka base 8 hota hai ($8 = 2^3$), isliye **Binary ke 3 bits milkar Octal ka 1 digit** banate hain.

* **दशमलव (Point) से पहले का हिस्सा (Integer Part):**
  * दशमलव के ठीक बाएं से शुरू karke **दाहिने से बाएं (Right to Left)** 3-3 bits ka group banayein.
  * Agar aakhri group me 3 bits pure na ho rahe hon, to **left side me `0` (Zero)** add karein.
* **दशमलव (Point) के बाद का हिस्सा (Fractional Part):**
  * दशमलव के ठीक बाद से शुरू karke **बाएं से दाहिने (Left to Right)** 3-3 bits ka group banayein.
  * Agar aakhri group me 3 bits pure na ho rahe hon, to **right side me `0` (Zero)** add karein.

**Detailed Example:**
Convert binary `(110101.11)` to Octal:
1. Decimal se pehle (Integer): `110 101`  
   * Group 1: `101` = **5**
   * Group 2: `110` = **6**  
   * Integer part bana: **65**
2. Decimal ke baad (Fraction): `.11`  
   * Right side me ek zero lagakar 3 bit banayein: `110` = **6**
3. **Final Octal Answer:** **`(65.6)` base 8**

---

#### 🎯 Rule 2: Binary se Hexadecimal me Conversion (4-4 Bits ka Group)
Hexadecimal ka base 16 hota hai ($16 = 2^4$), isliye **Binary ke 4 bits milkar Hex ka 1 digit** banate hain.

* **दशमलव से पहले:** Right to Left 4-4 bits ke group banayein (kam pade to left me `0` lagayein).
* **दशमलव के बाद:** Left to Right 4-4 bits ke group banayein (kam pade to right me `0` lagayein).

**Detailed Example:**
Convert `(10110111)` to Hexadecimal:
* Group 1 (Rightmost 4 bits): `0111` = **7**
* Group 2 (Leftmost 4 bits): `1011` = 11 = **B**
* **Final Hex Answer:** **`(B7)` base 16**

---

#### 🎯 Rule 3: Decimal Fraction ko Binary banana
* Decimal ke baad wale number ko lagatar **2 se multiply** karein.
* Har baar jo decimal ke pehle Integer (0 ya 1) aayega, use **upar se niche (Top to Bottom)** note karein.

**Example:** $0.625$ ko binary banayein:
* $0.625 \times 2 = 1.25$ $\implies$ Integer = **1** (bacha $0.25$)
* $0.25 \times 2 = 0.50$ $\implies$ Integer = **0** (bacha $0.50$)
* $0.50 \times 2 = 1.00$ $\implies$ Integer = **1** (bacha $0.00$ - complete!)
* Upar se niche padhein: **`(0.101)` base 2**

---

## 📌 Chapter 2: Complements & Signed Binary Representations

### 2.1 1's and 2's Complement
* **1's Complement:** Saari bits ko ulta kar do (`0` ko `1`, aur `1` ko `0`).
* **2's Complement:** $\text{1's Complement} + 1$.

#### ⚡ 2's Complement Fast Inspection Trick (2 Second me Nikalein):
1. Number ke **Rightmost side (LSB)** se dekhna shuru karein.
2. Jab tak **pehla `1`** na mil jaye, tab tak saari bits ko **WAISE HI (Same)** chhod dein.
3. Us pehle `1` ke baad left ki bachi hui **saari bits ko invert (ulta: 0 ko 1, 1 ko 0)** kar dein!

*Example:* `101100` ka 2's complement:
* Right se chaliye: `00` mila, fir pehla `1` mila $\rightarrow$ `...100` same rakha.
* Bachi hui left bits (`101`) ko ulta kiya $\rightarrow$ `010`.
* Final 2's Complement: **`010100`**!

---

### 2.2 n-Bit Numbers ki Range (Direct BPSC Formula):

| Representation | Minimum Value se Maximum Value ($n$ Bits) | Zero ke Forms | Total Distinct Values |
| :--- | :--- | :---: | :---: |
| **Unsigned** | $0 \text{ se } +(2^n - 1)$ | Sirf 1 (`00...0`) | $2^n$ |
| **Signed Magnitude** | $-(2^{n-1} - 1) \text{ se } +(2^{n-1} - 1)$ | Do: $+0$ aur $-0$ | $2^n - 1$ |
| **1's Complement** | $-(2^{n-1} - 1) \text{ se } +(2^{n-1} - 1)$ | Do: $+0$ aur $-0$ | $2^n - 1$ |
| **2's Complement** | **$-2^{n-1} \text{ se } +(2^{n-1} - 1)$** | **Sirf 1 (`00...0`)** | **$2^n$** |

> 💡 **BPSC Super Point for 8 Bits ($n = 8$):**
> * 2's complement range hoti hai: **$-128 \text{ se } +127$**.
> * Extra negative number hota hai: **$-128$** (`10000000`).
> * MSB ka weight 2's complement me **Negative ($-2^{n-1}$)** hota hai.

---

## 📌 Chapter 3: Codes & Error Detection (BCD, Gray, XS-3, Hamming)

### 3.1 BCD (Binary Coded Decimal / 8421 Code)
* Har decimal digit ($0$ se $9$) ko alag se **4 binary bits** me likha jata hai.
* Ek single BCD digit ki maximum valid value **9 (`1001`)** hoti hai.
* **Invalid BCD codes:** `1010, 1011, 1100, 1101, 1110, 1111` (Total 6 invalid codes hote hain).
* **BCD Addition Correction Rule:** Agar sum $> 9$ ho ya carry generate ho, to result me **$+6$ (`0110`)** add karte hain.

### 3.2 Excess-3 Code (XS-3)
* Formula: $\text{BCD} + 0011_2 (+3)$.
* **Self-Complementing Code:** Excess-3 code ka 1's complement nikalne par us number ka **9's complement** apne aap mil jata hai.

### 3.3 Gray Code (Unit Distance / Reflected Code)
* Kisi bhi do lagatar numbers ke beech **sirf 1 bit** ka difference hota hai.
* K-Maps aur Shaft Encoders me use hota hai taaki transitions me error na aaye.

### 3.4 Hamming Code & Error Correction
* **Hamming Distance:** Do code words me kitni bit positions alag hain (Count of 1s in $A \oplus B$).
* **Formulas:**
  * To detect $s$ bit errors: $d_{\min} \ge s + 1$.
  * To correct $t$ bit errors: $d_{\min} \ge 2t + 1$.
  * $m$ data bits ke liye parity bits ($p$): $2^p \ge m + p + 1$.

---

## 📌 Chapter 4: Boolean Algebra & Logic Gates

### 4.1 Most Important Boolean Theorems
1. **Absorption Law:**
   * $A + AB = A$
   * $A + \bar{A}B = \mathbf{A + B}$ *(Super Important)*
   * $A(\bar{A} + B) = \mathbf{AB}$
2. **Consensus Theorem:**
   * $AB + \bar{A}C + BC = \mathbf{AB + \bar{A}C}$ ($BC$ redundant term hai).
3. **De Morgan's Laws:**
   * $\overline{A \cdot B} = \bar{A} + \bar{B}$ (NAND = Bubbled OR)
   * $\overline{A + B} = \bar{A} \cdot \bar{B}$ (NOR = Bubbled AND)

### 4.2 Minimum Universal Gates Table (Direct Question)

| Target Gate | Minimum NAND Gates Required | Minimum NOR Gates Required |
| :--- | :---: | :---: |
| **NOT** | **1** | **1** |
| **AND** | **2** | **3** |
| **OR** | **3** | **2** |
| **NOR** | **4** | **1** |
| **NAND** | **1** | **4** |
| **XOR** | **4** | **5** |
| **XNOR** | **5** | **4** |

> 🧠 **Memory Sequence:**  
> NAND count (NOT, AND, OR, XOR, XNOR) $\implies$ **1, 2, 3, 4, 5**  
> NOR count (NOT, OR, AND, XNOR, XOR) $\implies$ **1, 2, 3, 4, 5**

---

## 📌 Chapter 5: Combinational Logic Circuits

### 5.1 Adders & Subtractors
* **Half Adder:** 2 single-bit inputs ko jodta hai.
  * $\text{Sum} = A \oplus B$, $\text{Carry} = AB$.
  * Implementation: 1 XOR + 1 AND gate (ya **5 NAND** gates).
* **Full Adder:** 3 inputs ($A, B, C_{\text{in}}$) ko jodta hai.
  * $\text{Sum} = A \oplus B \oplus C_{\text{in}}$.
  * Implementation: **2 Half Adders + 1 OR Gate** (ya **9 NAND** gates).

### 5.2 Multiplexers (MUX - Data Selectors)
* $2^n$ data inputs hote hain, $n$ select lines hoti hain, aur **sirf 1 output** hota hai.
* Formula: $\text{Inputs} = 2^{\text{Select Lines}}$.
* **Tree Multiplexer formula:** $2 \times 1$ MUX se $N \times 1$ MUX banane ke liye hamesha **$N - 1$** MUX lagenge (e.g. $16 \times 1$ banane ke liye $16 - 1 = \mathbf{15}$).

---

## 📌 Chapter 6: Sequential Logic & Flip-Flops

### 6.1 Flip-Flop Truth Tables & Characteristic Equations

| Flip-Flop | Inputs | Characteristic Equation | Key Feature to Remember |
| :--- | :---: | :--- | :--- |
| **SR** | $S, R$ | $Q_{n+1} = S + R'\bar{Q}_n$ | $S=1, R=1$ is **Invalid / Forbidden** |
| **JK** | $J, K$ | $Q_{n+1} = J\bar{Q}_n + K'Q_n$ | $J=1, K=1 \implies$ **Toggle** ($Q_{n+1} = \bar{Q}_n$) |
| **D** | $D$ | $Q_{n+1} = D$ | **Data delay / Buffer** register |
| **T** | $T$ | $Q_{n+1} = T \oplus Q_n$ | $T=1 \implies$ **Toggle**; **Frequency Divider ($\div 2$)** |

### 6.2 Race-Around Condition
* **Kab hoti hai?** JK Flip-Flop me jab $J=1, K=1$ ho aur clock pulse ki width propagation delay se badi ho ($t_p > t_{pd}$).
* **Solution:** **Master-Slave JK Flip-Flop** use karein ya Edge-triggering use karein.

---

## 📌 Chapter 7: Practice Questions with Full Explanations

#### Q1. What is the 2's complement of the binary number `10110010`?
* (A) `01001101`
* (B) `01001110`
* (C) `01001111`
* (D) More than one of the above
* (E) None of the above
> **Solution:** Fast inspection method: Rightmost side se pehla `1` dekho (bit 2 par `...10` mila). Uske left side ki saari bits (`101100`) ko ulta kar do (`010011`). Result bana: `01001110`.  
> **Correct Answer: (B)**

#### Q2. What is the decimal value of the 8-bit signed 2's complement number `11110000`?
* (A) $-16$
* (B) $-240$
* (C) $+240$
* (D) More than one of the above
* (E) None of the above
> **Solution:** MSB ka weight $-128$ hota hai: $-128 + 64 + 32 + 16 = -128 + 112 = -16$.  
> **Correct Answer: (A)**

#### Q3. In an eight-variable Boolean expression, what is the maximum number of minterms possible?
* (A) 64
* (B) 128
* (C) 256
* (D) More than one of the above
* (E) None of the above
> **Solution:** $n$ variables ke liye maximum minterms $= 2^n$. Yahan $n=8 \implies 2^8 = \mathbf{256}$.  
> **Correct Answer: (C)**

#### Q4. Which code is known as a self-complementing code?
* (A) BCD (8421)
* (B) Gray Code
* (C) Excess-3 Code
* (D) More than one of the above
* (E) None of the above
> **Solution:** Excess-3 aur 2421 codes me 1's complement lene par number ka 9's complement mil jata hai.  
> **Correct Answer: (C)**

#### Q5. How many $2 \times 1$ multiplexers are needed to construct a $16 \times 1$ multiplexer?
* (A) 8
* (B) 15
* (C) 16
* (D) More than one of the above
* (E) None of the above
> **Solution:** Shortcut formula: $N - 1 = 16 - 1 = \mathbf{15}$.  
> **Correct Answer: (B)**
