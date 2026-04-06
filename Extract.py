""" Extracting data from DataHealthgov using an CSV file locally to extract data """

import pandas as pd

def extract():
    url = "https://data.cms.gov/sites/default/files/2026-01/3c39f483-c7e0-4025-8396-4df76942e10f/CostReport_2023_Final.csv"

    print("Extracting data from CMS")

    df = pd.read_csv(url, low_memory = False)

    print(f"Extracted successfully: {df.shape[0]} rows, {df.shape[1]} columns")

    df.to_csv("C:\\Users\charl\\Documents\\project1-healthcare-claims\\ETL\\CostReport_2023_Final.csv", index = False)
    
    return df

if __name__ == "__main__":
    df = extract()
    print(df.head())