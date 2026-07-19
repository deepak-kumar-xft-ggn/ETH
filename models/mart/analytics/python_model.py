import holidays


def is_holiday(date_col):
    # Chez Jaffle
    french_holidays = holidays.France()
    is_holiday = date_col in french_holidays
    return is_holiday


def model(dbt, session):
    dbt.config(packages=['holidays'])

    stablecoin_df = dbt.ref("stablecoin_activity_per_day")
    stablecoin_pdf = stablecoin_df.to_pandas()
    stablecoin_pdf["IS_HOLIDAY"] = stablecoin_pdf["DATE"].apply(is_holiday)

    # dbt Python models on Snowflake must return a Snowpark DataFrame.
    return session.create_dataframe(stablecoin_pdf)
