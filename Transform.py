""" Cleaning data from the dataset and transforming the dataset. """

import pandas as pd 

def transform(df):
    print("Dropping rows where the column provider_ccn is missing")
    print("Replacing non-numeric placeholder with NaN")
    print("Deleteing irrelevant columns")
    print("New metrics for analysis")
    print("Data transformation successful")
    df.columns = df.columns.str.lower().str.strip().str.replace(" ", "_").str.replace(r"[()]", "", regex=True).str.replace("+", "")


    df =df.rename(columns={
        'provider_ccn': 'provider_ccn',
        'hospital_name': 'provider_name',
        'state_code': 'state',
        'provider_type': 'provider_type',
        'total_discharges_v__xviii__xix__unknown': 'total_discharges',
        'total_costs': 'total_cost',
        'combined_outpatient__inpatient_total_charges': 'total_charges',
        'total_patient_revenue': 'total_revenue',
        'net_patient_revenue': 'net_revenue',
        'fiscal_year_end_date': 'date'
    })

    cols = [
        'provider_ccn',
        'provider_name',
        'state',
        'provider_type',
        'total_discharges',
        'total_cost',
        'total_charges',
        'total_revenue',
        'net_revenue',
        'date'
    ]

    missing_cols = [col for col in cols if col not in df.columns]
    print("Missing columns:", missing_cols)

    df = df[[col for col in cols if col in df.columns]]

    numeric_cols = [
        'total_discharges',
        'total_cost',
        'total_charges',
        'total_revenue',
        'net_revenue'
    ]

    for col in numeric_cols:
        df[col] = pd.to_numeric(df[col], errors = 'coerce')

    df['date'] = pd.to_datetime(df['date'], errors = 'coerce')

    df = df.dropna(subset=['provider_ccn'])

    df['cost_per_discharge'] =df['total_cost'] / df['total_discharges'].replace(0, pd.NA)

    df['charge_to_cost_ratio'] = df['total_charges'] / df['total_cost']

    df['profit_margin'] = df['net_revenue'] / df['total_cost'] 

    df.to_csv("cleaned_healthcare_data.csv", index = False)

    print("Saved cleaned data to cleaned_healthcare_data.csv")

    return df 