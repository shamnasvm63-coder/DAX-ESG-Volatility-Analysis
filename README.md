# DAX-ESG-Volatility-Analysis
This is your **master README.md**. It is professionally structured to highlight your **SAP/Finance background** alongside your **new R Data Science skills**.

To use this, go to your GitHub repository, click **"Add file"** > **"Create new file"**, name it `README.md`, and paste the following:

---

# DAX 20: ESG Quality vs. Market Volatility Analysis

### *Quantitative Finance & Sustainability Portfolio Project*

## 📌 Project Overview

Does "Sustainability" lead to "Stability"? This project investigates the intersection of **Non-Financial Reporting (ESG)** and **Equity Risk** within the German stock market. By analyzing 20 major DAX companies from 2021 to 2024, this study quantifies how high ESG (Environmental, Social, and Governance) quality scores act as a risk-mitigation tool for institutional investors.

## 🛠 Tech Stack & Methodology

* **Language:** R (Standard for Financial Econometrics)
* **Data Ingestion:** `quantmod` API (Live Yahoo Finance market feed)
* **Data Cleaning:** `tidyverse` & `na.omit` for handling exchange holidays and missing values.
* **Statistics:** OLS (Ordinary Least Squares) Regression Model.
* **Visualization:** `ggplot2` with `ggrepel` for high-resolution financial scatter plots.

## 📊 Key Findings

The empirical results support the **Risk-Mitigation Hypothesis**. The regression model identified a **negative coefficient of -0.0142**, proving an inverse relationship between sustainability and risk.

* **Quantitative Insight:** For every **1-point increase** in a company’s ESG Score, annualized volatility decreased by **1.42%**.
* **Predictive Power:** ESG metrics explain approximately **8.4% of the variance** in idiosyncratic risk among the sampled DAX firms.

## 📁 Repository Structure

* **[`/scripts`](https://www.google.com/search?q=./scripts/):** `esg_analysis_dax.R` — The full R source code including data cleaning and regression.
* **[`/plots`](https://www.google.com/search?q=./plots/):** `DAX_ESG_Volatility_Research_Plot.png` — Research-grade visualization of the findings.
* **[`/data`](https://www.google.com/search?q=./data/):** `DAX_ESG_Analysis_Results.csv` — The final dataset containing Tickers, Volatility, and ESG Scores.

## 💼 Strategic Executive Interpretation

As a professional with an **SAP and Finance background**, this project demonstrates the ability to bridge the gap between **Corporate Governance** and **Market Performance**:

1. **Risk Management:** Statistically proving that ESG is a material "Non-Financial Risk" indicator.
2. **Regulatory Alignment:** This model provides a data-driven perspective on the **German Supply Chain Act (LKSG)** and **EU Taxonomy** requirements.
3. **Data-Driven Finance:** Demonstrating the transition from traditional SAP-based financial tracking to advanced quantitative modeling in R.

---

## 📈 How to Run the Analysis

1. Clone this repository.
2. Open the `scripts/esg_analysis_dax.R` file in RStudio.
3. Ensure the following libraries are installed: `quantmod`, `tidyverse`, `ggplot2`, `ggrepel`.
4. Run the script to fetch live market data and reproduce the regression results.

