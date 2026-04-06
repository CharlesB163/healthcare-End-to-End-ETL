from sqlalchemy import create_engine

def load(df):
    print("Connecting to PostgreSQL...")

    engine = create_engine("postgresql://postgres:Ilovesky2!@localhost:5432/healthcare_etl")

    print("Loading data into database...")

    df.to_sql("hospital_costs", engine, if_exists="replace", index=False)

    print("Data loaded successfully!")