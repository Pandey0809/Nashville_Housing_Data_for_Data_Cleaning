# MYSQL
# Nashville_Housing_Data_for_Data_Cleaning


## Getting Started

To run this repository, follow these steps:

1. Install Mysql 
2. Install DBeaver
3. Connect Dbeaver to you running MYSQL server
2. Upload both the excel file or covert it to a csv and then upload 
3. Change the separator and select null for empty values.
4. Load the sql script and run all queries

# Data Cleaning and Standardization in SQL Database

This project involves cleaning and standardizing data in a SQL database for a Nashville housing dataset. The steps involved in this project are as follows:

## Step 1: Standardizing the Format of Dates

Standardize the format of dates in the 'SaleDate' column.

## Step 2: Filling Null Values

Fill in null values for the 'PropertyAddress' column by joining rows with the same 'ParcelID' value.

## Step 3: Dividing the Property Address

Divide the 'PropertyAddress' column into 'PropertySplitAddress' and 'PropertySplitCity' columns.

## Step 4: Dividing the Owner Address

Divide the 'OwnerAddress' column into 'OwnerSplitAddress', 'OwnerSplitCity', and 'OwnerSplitState' columns.

## Step 5: Changing the Values

Change 'Y' and 'N' values in the 'SoldAsVacant' column to 'Yes' and 'No'.

## Step 6: Removing Duplicates and Unused Columns

Remove duplicate rows and unused columns from the dataset.

By following these steps, we can clean and standardize the data in the SQL database for the Nashville housing dataset. This will help to ensure that the data is accurate, consistent, and usable for analysis and reporting.




#Results
Here are few snapshots of the results
Screenshot 2023-03-23 at 16.58.31<img width="1242" alt="image" src="https://user-images.githubusercontent.com/56840145/227269090-c3bb138f-1c6d-4111-8436-d16c2187879b.png">
Screenshot 2023-03-23 at 17.04.16<img width="331" alt="image" src="https://user-images.githubusercontent.com/56840145/227269127-f9c32be1-c5a1-4161-a537-2ef3ecc71c50.png">
Screenshot 2023-03-23 at 17.04.31<img width="1241" alt="image" src="https://user-images.githubusercontent.com/56840145/227269162-c893d83f-92fc-482d-b1bf-869fb0bb16bd.png">
Screenshot 2023-03-23 at 17.04.54<img width="330" alt="image" src="https://user-images.githubusercontent.com/56840145/227269193-1f9a2883-3e4a-4e58-80a4-4f072af0e9e4.png">
Screenshot 2023-03-23 at 17.05.28<img width="1102" alt="image" src="https://user-images.githubusercontent.com/56840145/227269218-c0fcf81a-a2a6-48b7-82d7-aafcc2607730.png">

Screenshot 2023-03-23 at 17.07.21<img width="1219" alt="image" src="https://user-images.githubusercontent.com/56840145/227268998-7e14dc36-2f6e-40bc-afc4-cef9ce20e369.png">
Screenshot 2023-03-23 at 17.05.43<img width="313" alt="image" src="https://user-images.githubusercontent.com/56840145/227269042-fc6b5e63-c315-4663-a52a-bccfed88d0fd.png">


## Contributors

- [Himanshu Pandey](https://github.com/Pandey0809)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
