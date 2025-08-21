# 🧾 User Behaviour Analysis

## 📌 Overview
This project analyzes user transaction patterns, card usage, credit score distribution, potential churn, and fraud indicators based on a dataset of 2,000 users and $43M in transactions from Jan–Oct 2010.

---

## 📂 Datasets Used

### 1. `cards_data`  
| Column               | Description                                      |
|----------------------|------------------------------------------------|
| `id`                 | Unique identifier for each card record          |
| `client_id`          | Reference to user ID owning the card             |
| `card_brand`         | Brand of the card (e.g., Mastercard, Visa)      |
| `card_type`          | Type of card (e.g., credit, debit)               |
| `card_number`        | Card number (masked or partial)                   |
| `expires`            | Card expiration date                              |
| `cvv`                | Card verification value                           |
| `has_chip`           | Boolean indicating if the card has chip          |
| `num_cards_issued`   | Number of cards issued to this client             |
| `credit_limit`       | Credit limit assigned to the card                 |
| `acct_open_date`     | Date the card account was opened                  |
| `year_pin_last_changed` | Year the PIN was last updated                  |
| `card_on_dark_web`   | Boolean indicating if card data was found on dark web |

---

### 2. `users_data`  
| Column               | Description                                      |
|----------------------|------------------------------------------------|
| `id`                 | Unique user identifier                           |
| `current_age`        | User's current age                               |
| `retirement_age`     | Expected retirement age                          |
| `birth_year`         | Birth year of user                               |
| `birth_month`        | Birth month of user                              |
| `gender`             | Gender of the user                               |
| `address`            | Residential address                              |
| `latitude`           | Geographic latitude                              |
| `longitude`          | Geographic longitude                             |
| `per_capita_income`  | Income per capita of user's area                 |
| `yearly_income`      | User's yearly income                             |
| `total_debt`         | Total debt user holds                            |
| `credit_score`       | User credit score                                |
| `num_credit_cards`   | Number of credit cards owned by the user         |

---

### 3. `transactions_data`  
| Column               | Description                                      |
|----------------------|------------------------------------------------|
| `id`                 | Unique transaction identifier                    |
| `date`               | Date of the transaction                          |
| `client_id`          | Reference to user ID performing the transaction |
| `card_id`            | Card ID used in the transaction                   |
| `amount`             | Transaction amount                               |
| `use_chip`           | Boolean indicating if chip was used              |
| `merchant_id`        | Merchant unique identifier                       |
| `merchant_city`      | City where transaction occurred                  |
| `merchant_state`     | State where transaction occurred                 |
| `zip`                | Zip code of merchant location                    |
| `mcc`                | Merchant Category Code                           |
| `errors`             | Errors encountered during transaction, if any   |

---

## 📊 Key Insights
- Most transactions are done by users aged 50+.
- Mastercard dominates both in transaction count and value.
- Peak activity occurs between **11 AM – 1 PM**, with a spike in **August**.
- **874 users** have never transacted, while **3 users** are flagged as potential churn.
- Some users transacted in **3 cities on the same day**, a potential fraud signal.

---

## 📈 Deliverables
- Exploratory Data Analysis (EDA)   
- Summary of key findings and recommendations  
- Dashboard ready insights 

---

## 📎 File Structure
project-folder/
│
├── dataset/
│ ├── users_data.csv
│ ├── cards_data.csv
│ └── transactions_data.csv
│
├── notebooks/
│ └── analysis.ipynb
│
├── outputs/
│ └── report.pdf # (optional)
│
└── README.md

---

## ✅ Recommendations
- Re-engage inactive users with targeted campaigns.
- Monitor potential churn and suspicious location, based activity.
- Leverage peak hours and months for marketing efforts.
- Focus partnership strategies around Mastercard usage.

---

## 🛠️ Tools Used
- BigQuery
- Excel / CSV for data inputs
- Looker Studio
- Google Slide

---

## 📬 Contact
For questions or collaboration, feel free to reach out via GitHub Issues or anis.firyal@gmail.com.

