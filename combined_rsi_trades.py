import pandas as pd
import numpy as np
from ta.momentum import RSIIndicator

# Function to compute RSI and prepare data
def load_data(filepath):
    df = pd.read_csv(filepath)
    df.columns = [col.strip() for col in df.columns]  # Clean column names
    df['Time'] = pd.to_datetime(df['Time'])
    df = df.sort_values('Time').reset_index(drop=True)
    df['RSI'] = RSIIndicator(close=df['Price'], window=14).rsi()
    return df[['Time', 'Price', 'RSI']]

# Function to extract trades
def extract_trades(df, asset_name):
    trades = []
    in_trade = False
    last_buy_rsi = None
    for i in range(len(df)):
        rsi = df.loc[i, "RSI"]
        price = df.loc[i, "Price"]
        time = df.loc[i, "Time"]

        if not in_trade:
            if rsi < 20:
                trades.append([asset_name, time, price, round(rsi, 2), "Initial Buy"])
                in_trade = True
                last_buy_rsi = rsi
        else:
            if rsi < last_buy_rsi - 1.5:
                trades.append([asset_name, time, price, round(rsi, 2), "Add Buy"])
                last_buy_rsi = rsi
            elif rsi > 20:
                in_trade = False
                last_buy_rsi = None

    return trades

# Load both datasets
silver_df = load_data("MCX_SILVER1!, 120.csv")
gold_df = load_data("MCX_GOLD1!, 120.csv")

# Get trades
silver_trades = extract_trades(silver_df, "SILVER")
gold_trades = extract_trades(gold_df, "GOLD")

# Combine and export
combined = pd.DataFrame(silver_trades + gold_trades,
                        columns=["Asset", "Time", "Price", "RSI", "Signal Type"])
combined.to_excel("combined_executed_trades.xlsx", index=False)

print("\n✅ Trades saved to 'combined_executed_trades.xlsx'")
print(combined.tail())
