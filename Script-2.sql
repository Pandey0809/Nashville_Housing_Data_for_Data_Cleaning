-- Cleaning data in SQl 





SELECT *
FROM PorfolioProject.NashvilleHousing nh;



-- On the first look it is clearly visible that sate have different format for different values 
-- Standardizing the dates
SELECT 
	SaleDate,
	STR_TO_DATE(SaleDate, '%M %e, %Y') AS ConvertedDate
FROM PorfolioProject.NashvilleHousing nh;

-- Update the table
UPDATE PorfolioProject.nashvillehousing 
SET 
	SaleDate = STR_TO_DATE(SaleDate, '%M %e, %Y');

-- See the results
SELECT * from PorfolioProject.NashvilleHousing nh;

-- The property address right now is just long text value and this needs further analysis
SELECT *
FROM PorfolioProject.nashvillehousing n 
WHERE 
	PropertyAddress  is NULL  ;

-- The data shows that same ParcelId have the same address
SELECT *
FROM PorfolioProject.nashvillehousing n 
order by 
	ParcelID  ;

-- fill in null values in the PropertAddress column
SELECT 
	nh.ParcelID ,
	nh.PropertyAddress,
	nh2.ParcelID ,
	nh2.PropertyAddress,
	IFNULL(nh.PropertyAddress,nh2.PropertyAddress)  
from PorfolioProject.NashvilleHousing nh 
inner join PorfolioProject.NashvilleHousing nh2 
	on (nh.ParcelID = nh2.ParcelID 
	AND 
	nh.UniqueID <> nh2.UniqueID )
where 
	nh.PropertyAddress is null	
;

UPDATE PorfolioProject.NashvilleHousing nh
INNER JOIN PorfolioProject.NashvilleHousing nh2
ON 
	nh.ParcelID = nh2.ParcelID 
	AND 
	nh.UniqueID <> nh2.UniqueID
SET 
	nh.PropertyAddress = IFNULL(nh.PropertyAddress, nh2.PropertyAddress)
WHERE 
	nh.PropertyAddress IS NULL;

-- Divide the Property address into city and address
SELECT 
	RTRIM(SUBSTRING(PropertyAddress,1,INSTR(PropertyAddress ,',')-1)) as Address,
	RTRIM(SUBSTRING(PropertyAddress,(INSTR(PropertyAddress ,',')+1), LENGTH(PropertyAddress))) as City
from	PorfolioProject.NashvilleHousing nh ;

ALTER Table PorfolioProject.NashvilleHousing 
add PropertySplitAddress varchar(255);

UPDATE PorfolioProject.NashvilleHousing
SET 
	PropertySplitAddress = RTRIM(SUBSTRING(PropertyAddress,1,INSTR(PropertyAddress ,',')-1));


ALTER Table PorfolioProject.NashvilleHousing 
add PropertySplitCity varchar(255);

UPDATE PorfolioProject.NashvilleHousing
SET 
	PropertySplitCity = RTRIM(SUBSTRING(PropertyAddress,(INSTR(PropertyAddress ,',')+1), LENGTH(PropertyAddress)));



-- Dividing owner address into city state and address
SELECT 
	OwnerAddress
from PorfolioProject.NashvilleHousing nh ;

SELECT 
	SUBSTRING_INDEX(OwnerAddress,',',1),
	SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress,',',2),',',-1),
	SUBSTRING_INDEX(OwnerAddress,',',-1)
from PorfolioProject.NashvilleHousing nh ;

ALTER Table PorfolioProject.NashvilleHousing 
add OwnerSplitCity varchar(255),
add OwnerSplitAddress varchar(255),
add OwnerSplitState varchar(255);

UPDATE PorfolioProject.NashvilleHousing
SET 
	OwnerSplitAddress = SUBSTRING_INDEX(OwnerAddress,',',1),
	OwnerSplitCity = SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress,',',2),',',-1),
 	OwnerSplitState = SUBSTRING_INDEX(OwnerAddress,',',-1)
;


-- For the next step we will change Y and N to Yes and No in the SoldAsVacant column
SELECT 
	DISTINCT(SoldAsVacant),
	COUNT(*) 
from PorfolioProject.NashvilleHousing nh 
group by SoldAsVacant
;

SELECT 
	CASE 
	WHEN SoldAsVacant ='Y' then 'Yes'
	WHEN SoldAsVacant ='N' then 'No'
	ELSE SoldAsVacant
END
from PorfolioProject.NashvilleHousing nh ;

UPDATE PorfolioProject.NashvilleHousing 
SET
	SoldAsVacant = CASE 
	WHEN SoldAsVacant ='Y' then 'Yes'
	WHEN SoldAsVacant ='N' then 'No'
	ELSE SoldAsVacant
END


-- Remove Duplicates values
with RowNumCTE AS (
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference, OwnerName
           ORDER BY UniqueID
       ) AS row_num
FROM PorfolioProject.NashvilleHousing nh 
-- ORDER BY ParcelID
)
Select *  from RowNumCTE
WHERE row_num>1
-- ORDER by PropertyAddress ;
;

SELECT ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference, OwnerName, COUNT(*)
FROM PorfolioProject.NashvilleHousing nh¢¢
GROUP BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference, OwnerName
HAVING COUNT(*) > 1;

-- DELETE Unsued columns

ALTER TABLE PorfolioProject.NashvilleHousing 
Drop column OwnerAddress,
Drop column TaxDistrict,
Drop column PropertyAddress;

SELECT * FROM PorfolioProject.NashvilleHousing nh ;




