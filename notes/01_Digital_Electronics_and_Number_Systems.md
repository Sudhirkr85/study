# 📘 BPSC CS Module 01: Digital Electronics & Number Systems (Desi Tricks & Sequence Notes)

> **🎯 Target:** 15 / 15 Marks in Part-III (BPSC TRE Standard)  
> **Rule:** Bina kisi faltu formula ya LaTeX code ke — Seedhi sequence, Desi tricks, aur pakke marks.

---

## 🔢 Sequence 1: Number Systems & Fast Conversion

### 1.1 Base aur Bit Capacity (1 Line Yaad Rakho)
* **Binary (Base 2):** Digits `0, 1` → Har digit **1 bit** leta hai.
* **Octal (Base 8):** Digits `0 se 7` → Har digit **3 bits** leta hai ($2^3 = 8$).
* **Decimal (Base 10):** Digits `0 se 9`
* **Hexadecimal (Base 16):** Digits `0 se 9` aur `A(10), B(11), C(12), D(13), E(14), F(15)` → Har digit **4 bits** leta hai ($2^4 = 16$).

---

### 1.2 Binary se Octal aur Hexadecimal Grouping Rule

```
                      [ POINT . ]
        INTEGER PART                        POINT KE BAAD
  <=== (Right se Left jao)                 (Left se Right jao) ===>
  Point se shuru karke PEECHE chalo        Point se shuru karke AAGE chalo
  (Kam pade to aage 0 lagao)               (Kam pade to peeche 0 lagao)
```

#### 📌 Point ke dono taraf ka simple rule:
1. **Octal ke liye:** **3-3 bits** ke jode banao.
2. **Hexadecimal ke liye:** **4-4 bits** ke jode banao.
3. **Point se pehle:** Point ke theek bagal se shuru karo aur **Ulte haath (Left ←)** ki taraf chalo.
4. **Point ke baad:** Point ke theek bagal se shuru karo aur **Seedhe haath (Right →)** ki taraf chalo.

* **Example 1: (110101.11)₂ ko Octal me badlo**
  * Point se pehle (←): `101` = **5**, `110` = **6** ⇒ Ban gaya **65**
  * Point ke baad (→): `11` tha, 3 bit banane ke liye right me 0 joda → `110` = **6** ⇒ Ban gaya **.6**
  * 👉 **Answer:** **(65.6)₈**

* **Example 2: (10110111)₂ ko Hex me badlo**
  * 4-4 ka joda banao right to left:
  * Pehla joda: `0111` = **7**
  * Doosra joda: `1011` = 11 = **B**
  * 👉 **Answer:** **(B7)₁₆**

---

### 1.3 Point wala Decimal se Binary (2 se Multiply Trick)

Agar point wala decimal number diya ho (jaise `0.625`), toh divide nahi karte — **2 se guna (multiply)** karte hain:
1. Har baar **× 2** karo.
2. Point se pehle jo number (`1` ya `0`) aaye, usko bahar nikal kar alag likh lo.
3. Bacha hua point wala hissa fir se 2 se guna karo.
4. Jab point ke baad `.00` ho jaye toh ruk jao, aur **Upar se Neeche** padh lo:

```
0.625 × 2 = 1.25  --> 1 bahar nikala (bacha 0.25)
0.25  × 2 = 0.50  --> 0 bahar nikala (bacha 0.50)
0.50  × 2 = 1.00  --> 1 bahar nikala (bacha 0.00 -> Bas yahan ruk jao!)

Upar se neeche padho: 1 -> 0 -> 1
👉 Answer: (0.101)₂
```

---

## 🔢 Sequence 2: 2's Complement 3-Second Inspection Trick

Pen chalane ki zaroorat nahi hai, bas aankhon se dekho:

```
           [ 1   0   1   1   0   0 ]
             │   │   │   │   └───┴── Right side ke 0s: Bilkul SAME rakho (00)
             │   │   │   └────────── Pehla 1 jo mila: Isko bhi SAME rakho (1)
             └───┴───┴────────────── Iske baad Left ki saari bits ko ULAT do (010)

             Result: 0 1 0 1 0 0
```

* **Step 1:** Rightmost (seedhe haath) se dekhna shuru karo.
* **Step 2:** Jab tak **pehla 1** na mile, saare 0 aur wo pehla 1 **SAME** utaar do.
* **Step 3:** Us pehle 1 ke baad baayein (left) side ki baaki saari bits ko **ULAT do (0 ko 1, 1 ko 0)**.

---

## 🔢 Sequence 3: n-Bit Range Direct Formula

| Representation | Minimum se Maximum Range | Zero (0) ke roop | Total Distinct Values |
| :--- | :--- | :---: | :---: |
| **Unsigned (Positive only)** | **0 se +(2ⁿ - 1)** | Sirf 1 (`00...0`) | 2ⁿ |
| **Signed Magnitude** | **-(2ⁿ⁻¹ - 1) se +(2ⁿ⁻¹ - 1)** | 2 (`+0` aur `-0`) | 2ⁿ - 1 |
| **1's Complement** | **-(2ⁿ⁻¹ - 1) se +(2ⁿ⁻¹ - 1)** | 2 (`+0` aur `-0`) | 2ⁿ - 1 |
| **2's Complement** | **-2ⁿ⁻¹ se +(2ⁿ⁻¹ - 1)** | **Sirf 1 (`00...0`)** | **2ⁿ** |

* 🎯 **8-Bit Direct Exam Numbers ($n = 8$):**
  * 2's Complement range: **-128 se +127**
  * Extra negative number: **-128** (`10000000`)
  * MSB ka weight 2's complement me hamesha negative hota hai: **-2ⁿ⁻¹** (8-bit me `-128`).

---

## 🔢 Sequence 4: Codes (BCD, Excess-3, Gray, Hamming)

1. **BCD (8421):**
   * Valid digits: **0 se 9** (`0000` se `1001`).
   * Invalid states: **10 se 15** (Total 6 invalid codes hote hain).
   * **Addition Rule:** Agar do BCD jodte waqt sum 9 se bada aa jaye ya carry nikle → **+6 (`0110`)** add kar do.
2. **Excess-3 (XS-3):**
   * Formula: **BCD + 3 (`0011`)**.
   * **Self-Complementing Code:** Excess-3 ka 1's complement nikaloge toh wo us number ka **9's complement** ban jata hai.
3. **Gray Code (Unit Distance Code):**
   * Do lagatar numbers ke beech me **sirf 1 bit** ka difference hota hai.
   * Shaft encoders aur error reduction me use hota hai.
4. **Hamming Code (Error Detection & Correction):**
   * Error Detect karne ke liye minimum distance: **d_min ≥ s + 1**
   * Error Correct karne ke liye minimum distance: **d_min ≥ 2t + 1**
   * Parity bits ($p$) formula: **2ᵖ ≥ m + p + 1**

---

## 🔢 Sequence 5: Universal Gates Ginti Trick (1, 2, 3, 4, 5)

Dono universal gates ke liye bas ye simple sequence yaad rakho:

```
  NAND Gates ki Ginti:  NOT (1) ──> AND (2) ──> OR (3) ──> XOR (4) ──> XNOR (5)
  NOR Gates ki Ginti:   NOT (1) ──> OR (2)  ──> AND (3) ──> XNOR (4) ──> XOR (5)
```

| Target Gate | Kitne NAND Lagenge? | Kitne NOR Lagenge? |
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
   * Sum = A ⊕ B, Carry = A · B
   * Hardware: **1 XOR + 1 AND** (ya **5 NAND**)
2. **Full Adder:**
   * Sum = A ⊕ B ⊕ Cin, Carry = AB + BCin + ACin
   * Hardware: **2 Half Adders + 1 OR Gate** (ya **9 NAND**)
3. **Multiplexer (MUX) Formula:**
   * Inputs = $2^{\text{Select Lines}}$
   * **Tree MUX Formula:** 2×1 MUX ka use karke agar N×1 MUX banana ho, toh hamesha **N - 1** MUX lagenge.
   * Example: 16×1 MUX banane ke liye: $16 - 1 =$ **15** MUX lagenge.

---

## 🔢 Sequence 7: Flip-Flop Table & Key Features

| Flip-Flop | Inputs | Agli State (Equation) | Khaas Baat Jo BPSC Poochhta Hai |
| :--- | :---: | :--- | :--- |
| **SR** | S, R | Q(next) = S + R'Q | S=1, R=1 par **Invalid / Forbidden** state aati hai. |
| **JK** | J, K | Q(next) = J·Q' + K'·Q | J=1, K=1 par **Toggle** karta hai (Race Around problem). |
| **D** | D | Q(next) = D | **Data Buffer / Delay** — jo input doge wahi output aayega. |
| **T** | T | Q(next) = T ⊕ Q | T=1 par **Toggle** karta hai — **Frequency Divider (÷2)** ke roop me use hota hai. |

* **Race-Around Problem:** Sirf JK Flip-Flop me aati hai jab J=1, K=1 ho.
* **Isko solve kaise karte hain?** **Master-Slave JK Flip-Flop** laga kar ya Edge Triggering use karke.

---

## 🎯 Top 5 BPSC Model Questions (Direct Solutions)

1. **(110101.11)₂ ko Octal me badlo:**
   * Point ke pehle 3-3 ka group: `110 101` → 65
   * Point ke baad 3 bit: `.110` → .6
   * 👉 **Answer:** `(65.6)₈`

2. **`10110010` ka 2's complement kya hoga?**
   * Right side se pehla 1 mila bit 2 par (`...10`).
   * Baaki left side ki bits ulat do → `01001110`.
   * 👉 **Answer:** `01001110`

3. **8-bit 2's complement `11110000` ka decimal value kya hai?**
   * Pehli bit 1 hai matlab negative number hai.
   * Weight: -128 + 64 + 32 + 16 = -16.
   * 👉 **Answer:** `-16`

4. **XOR Gate banane ke liye kam se kam kitne NAND Gate chahiye?**
   * Sequence yaad karo: NOT(1), AND(2), OR(3), XOR(4).
   * 👉 **Answer:** `4`

5. **16×1 MUX banane ke liye kitne 2×1 MUX lagenge?**
   * Formula: N - 1 = 16 - 1 = 15.
   * 👉 **Answer:** `15`
