# 📘 BPSC CS Module 01: Digital Electronics & Number Systems (Sequence & Trick Master Notes)

> **🎯 Target:** 15 / 15 Marks in Part-III (BPSC TRE Standard)  
> **Rule:** No extra fluff. Pure sequence, exact steps, and memory formulas.

---

## 🔢 Sequence 1: Number Systems & Fast Conversion

### 1.1 Base & Bit Capacity
* **Binary (Base 2):** Digits `0, 1` $\to$ **1 bit** per digit
* **Octal (Base 8):** Digits `0 to 7` $\to$ **3 bits** per digit ($2^3 = 8$)
* **Decimal (Base 10):** Digits `0 to 9`
* **Hexadecimal (Base 16):** Digits `0 to 9, A(10), B(11), C(12), D(13), E(14), F(15)` $\to$ **4 bits** per digit ($2^4 = 16$)

---

### 1.2 Binary $\leftrightarrow$ Octal & Hexadecimal Grouping Rule

```
                      [ DECIMAL POINT . ]
        INTEGER PART                        FRACTIONAL PART
  <=== (Right to Left)                     (Left to Right) ===>
  Group from Point towards LEFT            Group from Point towards RIGHT
  (Add 0 on extreme LEFT if needed)        (Add 0 on extreme RIGHT if needed)
```

#### 📌 Step-by-Step Sequence:
1. **Octal ke liye:** **3-3 bits** ke groups banayein.
2. **Hexadecimal ke liye:** **4-4 bits** ke groups banayein.
3. **Point se pehle:** Point ke bagal se shuru karke **Left ki taraf ($\leftarrow$)** chalo. Kam pade to Left me `0` lagao.
4. **Point ke baad:** Point ke bagal se shuru karke **Right ki taraf ($\rightarrow$)** chalo. Kam pade to Right me `0` lagao.

* **Example 1 (Binary to Octal):** `(110101.11)₂`
  * Point ke pehle ($\leftarrow$): `101` = **5**, `110` = **6** $\implies$ **65**
  * Point ke baad ($\rightarrow$): `11` me ek zero joda $\to$ `110` = **6** $\implies$ **.6**
  * 👉 **Answer:** **`(65.6)₈`**
* **Example 2 (Binary to Hex):** `(10110111)₂`
  * Right group (4 bits): `0111` = **7**
  * Left group (4 bits): `1011` = 11 = **B**
  * 👉 **Answer:** **`(B7)₁₆`**

---

### 1.3 Decimal Fraction $\to$ Binary Sequence
* Number ko lagatar **$\times 2$** karo.
* Har baar jo Integer (0 ya 1) aayega, use **Top to Bottom** likho:
  * $0.625 \times 2 = \mathbf{1}.25$ (Carry 1)
  * $0.25 \times 2 = \mathbf{0}.50$ (Carry 0)
  * $0.50 \times 2 = \mathbf{1}.00$ (Carry 1 $\to$ finish!)
  * 👉 **Answer:** **`(0.101)₂`**

---

## 🔢 Sequence 2: 2's Complement 3-Second Inspection Rule

* **1's Complement:** Saari bits ulto (`0 ↔ 1`).
* **2's Complement:** $\text{1's Complement} + 1$.

```
           [ 1   0   1   1   0   0 ]
             │   │   │   │   └───┴── Rightmost 0s: Same rakho (00)
             │   │   │   └────────── Pehla 1: Same rakho (1)
             └───┴───┴────────────── Iske baad Left ki saari bits INVERT kar do (010)
             Result: 0 1 0 1 0 0
```

* **Step 1:** Rightmost (LSB) se dekhna shuru karo.
* **Step 2:** Jab tak **pehla 1** na mile, tab tak saari bits **SAME** rakho.
* **Step 3:** Us pehle 1 ke baad Left side ki baaki saari bits ko **INVERT (0 ko 1, 1 ko 0)** kar do!

---

## 🔢 Sequence 3: n-Bit Ranges (Direct Formula Sequence)

| Representation | Minimum to Maximum Range | Zero (0) ke roop | Total Distinct Values |
| :--- | :--- | :---: | :---: |
| **Unsigned** | **$0$ se $+(2^n - 1)$** | 1 (`00...0`) | $2^n$ |
| **Signed Magnitude** | **$-(2^{n-1} - 1)$ se $+(2^{n-1} - 1)$** | 2 (`+0` aur `-0`) | $2^n - 1$ |
| **1's Complement** | **$-(2^{n-1} - 1)$ se $+(2^{n-1} - 1)$** | 2 (`+0` aur `-0`) | $2^n - 1$ |
| **2's Complement** | **$-2^{n-1}$ se $+(2^{n-1} - 1)$** | **Sirf 1 (`00...0`)** | **$2^n$** |

* 🎯 **8-Bit Direct Numbers ($n = 8$):**
  * 2's Complement range: **$-128$ se $+127$**
  * Extra negative number: **$-128$** (`10000000`)
  * MSB weight in 2's complement: **$-2^{n-1}$** (Negative weight)

---

## 🔢 Sequence 4: Codes (BCD, Excess-3, Gray, Hamming)

1. **BCD (8421):**
   * Valid digits: **$0$ se $9$** (`0000` se `1001`).
   * Invalid states: **$10$ se $15$** (Total 6 invalid codes).
   * **Addition Rule:** Agar sum $> 9$ ho ya carry out aaye $\implies$ **$+6$ (`0110`)** add karo.
2. **Excess-3 (XS-3):**
   * Formula: **$\text{BCD} + 0011_2 (+3)$**.
   * **Self-Complementing:** Excess-3 ka 1's complement = Us number ka **9's complement**.
3. **Gray Code (Unit Distance Code):**
   * Do consecutive numbers me **sirf 1 bit** ka difference hota hai.
   * **Binary $\to$ Gray:** MSB same rakho ($G_3 = B_3$), fir consecutive XOR karo ($G_2 = B_3 \oplus B_2$).
   * **Gray $\to$ Binary:** MSB same rakho ($B_3 = G_3$), fir diagonal XOR karo ($B_2 = B_3 \oplus G_2$).
4. **Hamming Code (Error Detection & Correction):**
   * Detect $s$ bit errors: $\mathbf{d_{\min} \ge s + 1}$
   * Correct $t$ bit errors: $\mathbf{d_{\min} \ge 2t + 1}$
   * Parity bits ($p$) for $m$ data bits: $\mathbf{2^p \ge m + p + 1}$

---

## 🔢 Sequence 5: Minimum Universal Gates Sequence (1, 2, 3, 4, 5)

Dono universal gates ke liye bas ye sequence yaad rakhiye:

```
  NAND Gates Sequence:  NOT (1) ──> AND (2) ──> OR (3) ──> XOR (4) ──> XNOR (5)
  NOR Gates Sequence:   NOT (1) ──> OR (2)  ──> AND (3) ──> XNOR (4) ──> XOR (5)
```

| Target Gate | Min NAND Required | Min NOR Required |
| :--- | :---: | :---: |
| **NOT** | **1** | **1** |
| **AND** | **2** | **3** |
| **OR** | **3** | **2** |
| **NOR** | **4** | **1** |
| **NAND** | **1** | **4** |
| **XOR** | **4** | **5** |
| **XNOR** | **5** | **4** |

---

## 🔢 Sequence 6: Adders & Multiplexers

1. **Half Adder:**
   * $\text{Sum} = A \oplus B$, $\text{Carry} = AB$
   * Hardware: **1 XOR + 1 AND** (ya **5 NAND**)
2. **Full Adder:**
   * $\text{Sum} = A \oplus B \oplus C_{\text{in}}$, $\text{Carry} = AB + BC_{\text{in}} + AC_{\text{in}}$
   * Hardware: **2 Half Adders + 1 OR Gate** (ya **9 NAND**)
3. **Multiplexer (MUX):**
   * Formula: $\mathbf{\text{Inputs} = 2^{\text{Select Lines}}}$
   * **Tree MUX shortcut:** $2 \times 1$ MUX se $N \times 1$ MUX banane ke liye hamesha **$N - 1$** MUX lagenge ($16 \times 1$ banane ke liye $16 - 1 = \mathbf{15}$).

---

## 🔢 Sequence 7: Flip-Flop Equations & Key Features

| Flip-Flop | Inputs | Characteristic Equation | Key Feature to Remember |
| :--- | :---: | :--- | :--- |
| **SR** | $S, R$ | $Q_{n+1} = S + R'\bar{Q}_n$ | $S=1, R=1 \implies$ **Invalid / Forbidden** |
| **JK** | $J, K$ | $Q_{n+1} = J\bar{Q}_n + K'Q_n$ | $J=1, K=1 \implies$ **Toggle** ($Q_{n+1} = \bar{Q}_n$) |
| **D** | $D$ | $Q_{n+1} = D$ | **Data delay / Buffer** (Output = Input) |
| **T** | $T$ | $Q_{n+1} = T \oplus Q_n$ | $T=1 \implies$ **Toggle**; **Frequency Divider ($\div 2$)** |

* **Race-Around Condition (in JK):** Jab $J=1, K=1$ ho aur clock pulse $t_p > t_{pd}$ ho.
  * **Solution:** **Master-Slave JK Flip-Flop** ya Edge Triggering.

---

## 🎯 Top 5 BPSC Model Questions (Sequence Applied)

1. **Binary `(110101.11)₂` in Octal:** Point ke left 3-3 group (`110 101` $\to$ 65), right group (`.110` $\to$ .6) $\implies$ **`65.6₈`**.
2. **2's complement of `10110010`:** Right se pehla 1 mila bit 2 par (`...10`). Baaki left bits ulto $\implies$ **`01001110`**.
3. **8-bit 2's complement `11110000` in decimal:** MSB weight is $-128 \implies -128 + 64 + 32 + 16 = \mathbf{-16}$.
4. **Minimum NAND for XOR gate:** Sequence 1, 2, 3, 4 $\implies$ **4 NAND**.
5. **How many $2 \times 1$ MUX for $16 \times 1$ MUX:** $N - 1 = 16 - 1 = \mathbf{15}$.
