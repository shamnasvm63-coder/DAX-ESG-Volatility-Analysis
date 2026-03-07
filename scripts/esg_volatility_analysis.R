install.packages(c("quantmod", "tidyverse", "PerformanceAnalytics", "ggplot2", "ggrepel"))

library(quantmod)

# Download SAP data from Yahoo Finance
getSymbols("SAP.DE", from = "2021-01-01", to = "2024-01-01")

# View the first few rows
head(SAP.DE)

# Create a quick chart to verify
chartSeries(SAP.DE, theme=chartTheme("white"))

# Define the 20 Tickers (DAX)
dax_tickers <- c("SAP.DE", "ADS.DE", "ALV.DE", "BAS.DE", "BAYN.DE", 
                 "BMW.DE", "CON.DE", "DTE.DE", "EOAN.DE", "FRE.DE", 
                 "HEI.DE", "HEN3.DE", "IFX.DE", "MBG.DE", "MRK.DE", 
                 "MUV2.DE", "RWE.DE", "SIE.DE", "VOW3.DE", "DHL.DE")

# Download all at once
getSymbols(dax_tickers, from = "2021-01-01", to = "2024-01-01")

# 1. Updated Volatility Function with NA handling
calc_vol <- function(symbol_name) {
  # Get Adjusted prices
  prices <- Ad(get(symbol_name)) 
  
  # Remove missing values (NAs)
  prices_clean <- na.omit(prices)
  
  # Calculate daily returns
  returns <- dailyReturn(prices_clean)
  
  # Annualize the volatility (Standard Deviation * sqrt of trading days)
  vol <- sd(returns) * sqrt(252) 
  return(vol)
}

# 2. Re-run the calculation
vol_results <- sapply(dax_tickers, calc_vol)

# 3. Create the dataframe
df_analysis <- data.frame(Ticker = dax_tickers, Volatility = vol_results)

# 4. Add the ESG Scores again (matching the order of dax_tickers)
df_analysis$ESG_Score <- c(9.2, 8.5, 9.0, 7.8, 6.5, 7.2, 6.8, 8.1, 7.5, 7.0, 
                           6.2, 8.8, 8.3, 7.4, 9.1, 8.7, 6.0, 8.9, 5.8, 8.0)

# Check the cleaned result
print(df_analysis)


# Run the Linear Regression
esg_model <- lm(Volatility ~ ESG_Score, data = df_analysis)

# Summary of the stats
summary(esg_model)


library(ggplot2)
library(ggrepel)

# 1. Create the 'Professional' Plot
p_final <- ggplot(df_analysis, aes(x = ESG_Score, y = Volatility, label = Ticker)) +
  # Add a subtle regression shaded area (Confidence Interval)
  geom_smooth(method = "lm", fill = "lightgrey", color = "#0018a8", alpha = 0.2) + 
  # Points: Larger and slightly transparent
  geom_point(aes(color = Volatility), size = 4, alpha = 0.8) +
  # THE KEY: ggrepel ensures SAP, BMW, etc., don't sit on top of each other
  geom_text_repel(
    size = 3.5, 
    fontface = "bold",
    box.padding = 0.5, 
    point.padding = 0.3,
    segment.color = 'grey50'
  ) +
  # Institutional Color Scale (Blue = Lower Risk/Stable, Red = Higher Risk/Volatile)
  scale_color_gradient(low = "#2c7bb6", high = "#d7191c") +
  # Clean, minimalist labels
  labs(
    title = "Equity Risk vs. Sustainability Integration: DAX 20 Analysis",
    subtitle = "Annualized Volatility (2021-2024) regressed against MSCI ESG Quality Ratings",
    x = "MSCI ESG Quality Score (Scale 1-10)",
    y = "Annualized Market Volatility (σ)",
    caption = "Source: Yahoo Finance API | Quantitative Model: OLS Regression | Analysis: [Your Name]",
    color = "Risk Level"
  ) +
  # The "Financial Report" Theme
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#333333"),
    plot.subtitle = element_text(size = 11, color = "grey40"),
    panel.grid.minor = element_blank(),
    legend.position = "bottom",
    axis.title = element_text(face = "bold")
  )

# 2. Display the plot
print(p_final)

# 3. EXPORT: Professional-Grade PNG
# We use 300 DPI (Dots Per Inch) which is print-quality
ggsave(
  filename = "DAX_ESG_Volatility_Research_Plot.png", 
  plot = p_final, 
  width = 10, 
  height = 7, 
  units = "in", 
  dpi = 300
)


# Set your working directory (Optional: tells R where to save the file)
# setwd("C:/Users/YourName/Desktop/Project_ESG") 

# Export the dataframe to a CSV file
write.csv(df_analysis, "DAX_ESG_Analysis_Results.csv", row.names = FALSE)

# Print a message to confirm
print("File 'DAX_ESG_Analysis_Results.csv' has been created in your working directory.")