Lab 7
=====

**Question 1**

* Upon seeing the single spreadsheet, I would say that I could devise for him a better system that would make it easier and safer for him to maintain this information. I would strongly encourage that he adopt my way of doing things, but he does have the last say so I would not be pushy.

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

* The primary key is PackageID and TagNumber, together.

**Question 4**

**PackageID** | **TagNumber** | PackageName       | InstallDate | SoftwareCostUSD | ComputerModel
------------- |:-------------:| ----------------- | ----------- |:---------------:| -------------
AC01          | 32808         | Lotus Notes       | 09-13-2005  | 754.95          | Apple
DB32          | 32808         | Microsoft Access  | 12-03-2005  | 380.00          | Windows
DB32          | 37691         | Microsoft Access  | 06-15-2005  | 380.00          | Windows
DB33          | 57772         | Microsoft Outlook | 05-27-2005  | 412.77          | Windows
WP08          | 32808         | RealPlayer        | 01-12-2006  | 185.00          | Apple
WP08          | 37691         | RealPlayer        | 06-15-2005  | 227.50          | Apple
WP08          | 57222         | RealPlayer        | 05-27-2005  | 170.24          | Windows
WP09          | 59836         | Ask Toolbar       | 10-30-2005  | 35.00           | IBM
WP09          | 77740         | Ask Toolbar       | 05-27-2005  | 35.00           | IBM

**Question 5**

Functional depencencies:

* PackageID, TagNumber --> PackageName, InstallDate, SoftwareCostUSD, ComputerModel

* PackageID --> PackageName

**Question 6**

* This table is *not* in 3NF because __________.

**Question 7**

