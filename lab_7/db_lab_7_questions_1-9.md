John Paul Welsh
===============

Lab 7
=====

**Question 1**

Upon seeing the single spreadsheet, I would say that I could devise for him a better system that would make it easier and safer for him to maintain this information. I would strongly encourage that he adopt my way of doing things, but he does have the last say so I would not be pushy.

**Question 2**

PackageID | TagNumber | InstallDate | SoftwareCostUSD
--------- |:---------:| ----------- |:--------------:
AC01      | 32808     | 09-13-2005  | 754.95
DB32      | 32808     | 12-03-2005  | 380.00
DB32      | 37691     | 06-15-2005  | 380.00
DB33      | 57772     | 05-27-2005  | 412.77
WP08      | 32808     | 01-12-2006  | 185.00
WP08      | 37691     | 06-15-2005  | 227.50
WP08      | 57222     | 05-27-2005  | 170.24
WP09      | 59836     | 10-30-2005  | 35.00
WP09      | 77740     | 05-27-2005  | 35.00

**Question 3**

The primary key is PackageID and TagNumber, together.

**Question 4**

PackageID | TagNumber | PackageName       | InstallDate | SoftwareCostUSD | ComputerModel
--------- |:---------:| ----------------- | ----------- |:---------------:| -------------
AC01      | 32808     | Lotus Notes       | 09-13-2005  | 754.95          | Apple
DB32      | 32808     | Microsoft Access  | 12-03-2005  | 380.00          | Windows
DB32      | 37691     | Microsoft Access  | 06-15-2005  | 380.00          | IBM
DB33      | 57772     | Microsoft Outlook | 05-27-2005  | 412.77          | Windows
WP08      | 32808     | RealPlayer        | 01-12-2006  | 185.00          | IBM
WP08      | 37691     | RealPlayer        | 06-15-2005  | 227.50          | Apple
WP08      | 57222     | RealPlayer        | 05-27-2005  | 170.24          | Windows
WP09      | 59836     | Ask Toolbar       | 10-30-2005  | 35.00           | IBM
WP09      | 77740     | Ask Toolbar       | 05-27-2005  | 35.00           | IBM

**Question 5**

(PackageID, TagNumber) ==> PackageName, InstallDate, SoftwareCostUSD, ComputerModel

PackageID ==> PackageName

**Question 6**

This table is *not* in 3NF because the second dependency above is a partial dependency, which violates 2NF (and therefore, 3NF).

**New Tables**

Packages | PackageID | PackageName
-------- | --------- | -----------------
   -     | AC01      | Lotus Notes
   -     | DB32      | Microsoft Access
   -     | DB33      | Microsoft Outlook
   -     | WP08      | RealPlayer
   -     | WP09      | Ask Toolbar

Orders | PackageID | TagNumber
------ | --------- |:---------:
   -   | AC01      | 32808
   -   | DB32      | 32808
   -   | DB32      | 37691
   -   | DB33      | 57772
   -   | WP08      | 32808
   -   | WP08      | 37691
   -   | WP08      | 57222
   -   | WP09      | 59826
   -   | WP09      | 77740

Installations | PackageID | TagNumber | InstallDate | SoftwareCostUSD | ComputerModel
------------- | --------- |:---------:| ----------- |:---------------:| -------------
   -          | AC01      | 32808     | 09-13-2005  | 754.95          | Apple
   -          | DB32      | 32808     | 12-03-2005  | 380.00          | Windows
   -          | DB32      | 37691     | 06-15-2005  | 380.00          | IBM
   -          | DB33      | 57772     | 05-27-2005  | 412.77          | Windows
   -          | WP08      | 32808     | 01-12-2006  | 185.00          | IBM
   -          | WP08      | 37691     | 06-15-2005  | 227.50          | Apple
   -          | WP08      | 57222     | 05-27-2005  | 170.24          | Windows
   -          | WP09      | 59826     | 10-30-2005  | 35.00           | IBM
   -          | WP09      | 77740     | 05-27-2005  | 35.00           | IBM

**Question 7**

Primary key for Packages table = PackageID

Primary key for Orders table = (PackageID, TagNumber)

Primary key for Installations table = (PackageID, TagNumber)

**Question 8**

PackageID ==> PackageName

PackageID ==> (PackageID, TagNumber)

(PackageID, TagNumber) ==> InstallDate, SoftwareCostUSD, ComputerModel

**Question 9**

The new tables are in 3NF because each row-column cell has one value only (1NF), and all dependencies are exhaustive for each respective table, with no partial (2NF) or transitive (3NF) dependencies.
