
use Project
use FORLESSON3
create table customers (CustomerID int primary key,Fullname varchar (50),Date_of_birth date ,Email varchar (50),PhoneNumber bigint,Addres varchar (50),NationaId int,
Taxid int,EmploymentStatus varchar (50),AnnualIncome int ,	CreatedAt date, UpdatedAt  date )
/* 2️ Accounts – Stores customer bank accounts.
•	AccountID (PK), CustomerID (FK)
•	AccountType (Savings, Checking, Business, etc.)
•	Balance, Currency, Status
•	BranchID (FK), CreatedDate
 */
 create table Accounts(AccountID int primary key ,CustomerID int foreign key references customers(CustomerID),AccountType varchar (50),Balance int ,Currency varchar (50),
 Status varchar (50),BranchID int ,CreatedDate date )
 /* 3️ Transactions – Logs all banking transactions.
•	TransactionID (PK), AccountID (FK)
•	TransactionType (Deposit, Withdrawal, Transfer, Payment)
•	Amount, Currency, Date, Status, ReferenceNo
*/

create table Transactions (TransactionID int primary key ,AccountId int foreign key references Accounts(AccountID),TransactionType varchar (50),
Amount int , Currency varchar (50), Date date , Status varchar (50), ReferenceNo int )

/* 4️ Branches – Bank branch details.
•	BranchID (PK)
•	BranchName, Address, City, State, Country
•	ManagerID (FK), ContactNumber
 */
 create table Branches (BranchID int primary key,BranchName varchar (50), Address varchar (50), City varchar (50), State varchar (50), Country varchar (50),ManagerID int 
 , ContactNumber bigint)
 /*  5️ Employees – Stores bank staff details.
•	EmployeeID (PK), BranchID (FK)
•	FullName, Position, Department
•	Salary, HireDate, Status
*/
create table Employees1 (EmployeeID int primary key,BranchID int foreign key references Branches(BranchID),FullName varchar (50), Position varchar (50),
Department varchar (50),Salary int , HireDate date , Status varchar (50))
/*6️ CreditCards – Customer credit card details.
•	CardID (PK), CustomerID (FK)
•	CardNumber, CardType, CVV, ExpiryDate, Limit, Status
  */
  create table  CreditCards (CradID int primary key ,CustomerID int  foreign key references customers(CustomerID),CardNumber bigint,
  CardType varchar(50), CVV int , ExpiryDate date , Limit int , Status varchar(50))

  /* 7️ CreditCardTransactions – Logs credit card transactions.
•	TransactionID (PK), CardID (FK)
•	Merchant, Amount, Currency, Date, Status
  */
  create table CreditCardTransactions (TransactionID int primary key ,CardID int foreign key references  CreditCards(CradID),
  Merchant varchar(50), Amount int , Currency varchar (50), Date date, Status varchar (50))
  /* 8️ OnlineBankingUsers – Customers registered for internet banking.
•	UserID (PK), CustomerID (FK)
•	Username, PasswordHash, LastLogin
 */

 create table  OnlineBankingUsers (UserID int primary key ,CustomerID int foreign key references Customers(CustomerID),Username varchar(50),
 PasswordHash int , LastLogin int)
 /* 9️ BillPayments – Tracks utility bill payments.
•	PaymentID (PK), CustomerID (FK)
•	BillerName, Amount, Date, Status
 */

 create table BillPayments (PaymentID int primary key ,CustomerID int foreign key references Customers(CustomerID),BillerName varchar(50), Amount int , Date
 date , Status varchar (50))
 /*10 MobileBankingTransactions – Tracks mobile banking activity.
•	TransactionID (PK), CustomerID (FK)
•	DeviceID, AppVersion, TransactionType, Amount, Date
 */
 create table MobileBankingTransactions (TransactionID int primary key,CustomerID int foreign key references Customers(CustomerID),DeviceID int
 , AppVersion varchar (50), TransactionType varchar(50), Amount int, Date date)

 /* 1️1️ Loans – Stores loan details.
•	LoanID (PK), CustomerID (FK)
•	LoanType (Mortgage, Personal, Auto, Business)
•	Amount, InterestRate, StartDate, EndDate, Status
 */
 create table Loans (LoanID int primary key,CustomerID int foreign key references Customers(CustomerID),LoanType varchar (50),Amount int
 , InterestRate int , StartDate date , EndDate date , Status varchar (50))
 /*1️2️ LoanPayments – Tracks loan repayments.
•	PaymentID (PK), LoanID (FK)
•	AmountPaid, PaymentDate, RemainingBalance
 */
 create table LoanPayments (PaymentID int primary key ,LoanID int foreign key references  Loans(LoanID),AmountPaid int , PaymentDate date , RemainingBalance int)
 /*1️3️ CreditScores – Customer credit scores.
•	CustomerID (FK), CreditScore, UpdatedAt
*/
create table CreditScores (CustomerID int foreign key references Customers(CustomerID),CreditScore int , UpdatedAt date)
/* 1️4️ DebtCollection – Tracks overdue loans.
•	DebtID (PK), CustomerID (FK)
•	AmountDue, DueDate, CollectorAssigned 

*/

create table DebtCollection (DebtID int primary key ,CustomerID int foreign key references Customers(CustomerID),AmountDue int, DueDate date, CollectorAssigned varchar (50))

/*15️ KYC (Know Your Customer) – Stores customer verification info.
•	KYCID (PK), CustomerID (FK)
•	DocumentType, DocumentNumber, VerifiedBy
*/
create table   Know_Your_Customer (KYCID int primary key ,CustomerID int foreign key references Customers(CustomerID),DocumentType varchar (50),
DocumentNumber int, VerifiedBy varchar (50))
/*1️6️ FraudDetection – Flags suspicious transactions.
•	FraudID (PK), CustomerID (FK)
•	TransactionID, RiskLevel, ReportedDate
  */
  create table FraudDetection (FraudID int primary key ,CustomerID int foreign key references Customers(CustomerID),TransactionID int , RiskLevel varchar
  (50), ReportedDate date)

  /*1️7️ AML (Anti-Money Laundering) Cases – Investigates financial crimes.
•	CaseID (PK), CustomerID (FK)
•	CaseType, Status, InvestigatorID
 */
 create table Anti_Money_Laundering (CaseID int primary key ,CustomerID int foreign key references Customers(CustomerID),CaseType varchar (50), Status
 varchar (50), InvestigatorID int)
 /* 1️8️ RegulatoryReports – Stores financial reports for regulators.
•	ReportID (PK), ReportType, SubmissionDate
*/
create table  RegulatoryReports (ReportID int primary key,ReportType varchar (50), SubmissionDate date)
/*1️9️ Departments – Stores company departments.
•	DepartmentID (PK), DepartmentName, ManagerID
*/
create table  Departments (DepartmentID  int primary key ,DepartmentName varchar (50), ManagerID int)
/* 2️0️ Salaries – Employee payroll data.
•	SalaryID (PK), EmployeeID (FK)
•	BaseSalary, Bonus, Deductions, PaymentDate
*/
create table Salaries( SalaryID  int primary key,EmployeeID int foreign key references Employees1(EmployeeID),BaseSalary int, Bonus int, Deductions int, PaymentDate date)

/*2️1️ EmployeeAttendance – Tracks work hours.
•	AttendanceID (PK), EmployeeID (FK)
•	CheckInTime, CheckOutTime, TotalHours 
*/
create table EmployeeAttendance (AttendanceID int primary key,EmployeeID int foreign key references Employees1(EmployeeID),CheckInTime datetime, CheckOutTime
datetime , TotalHours int)
/*2️2️ Investments – Stores customer investment details.
•	InvestmentID (PK), CustomerID (FK)
•	InvestmentType, Amount, ROI, MaturityDate
*/
create table Investments  ( InvestmentID int primary key ,CustomerID int foreign key references Customers(CustomerID),InvestmentType varchar (50), Amount
int , ROI int, MaturityDate date )
/*2️3️ StockTradingAccounts – Customers trading stocks via bank.
•	AccountID (PK), CustomerID (FK)
•	BrokerageFirm, TotalInvested, CurrentValue
*/
create table StockTradingAccounts ( AccountID int primary key,CustomerID int foreign key references Customers(CustomerID),BrokerageFirm varchar (50)
, TotalInvested  int, CurrentValue int)

/*2️4️ ForeignExchange – Tracks forex transactions.
•	FXID (PK), CustomerID (FK)
•	CurrencyPair, ExchangeRate, AmountExchanged

*/
create table ForeignExchange (FXID int primary key ,CustomerID int foreign key references Customers(CustomerID),CurrencyPair varchar (50), ExchangeRate int, AmountExchanged int)

/*2️5️ InsurancePolicies – Customer insurance plans.
•	PolicyID (PK), CustomerID (FK)
•	InsuranceType, PremiumAmount, CoverageAmount
*/
create table InsurancePolicies (PolicyID int primary key,CustomerID int foreign key references Customers(CustomerID),InsuranceType varchar (50),
PremiumAmount int, CoverageAmount int )
/* 2️6️ Claims – Tracks insurance claims.
•	ClaimID (PK), PolicyID (FK)
•	ClaimAmount, Status, FiledDate
*/
create table Claims (ClaimID int primary key, PolicyID int foreign key references InsurancePolicies (PolicyID),ClaimAmount int, Status varchar (50), FiledDate date)
/* 2️7️ UserAccessLogs – Security logs for banking system users.
•	LogID (PK), UserID, ActionType, Timestamp
*/

create table UserAccessLogs (LogID int primary key,UserID int, ActionType varchar (50), Timestamp date)
/*2️8️ CyberSecurityIncidents – Stores data breach or cyber attack cases.
•	IncidentID (PK), AffectedSystem, ReportedDate, ResolutionStatus 

*/
create table CyberSecurityIncidents (IncidentID int primary key,AffectedSystem varchar (50), ReportedDate date , ResolutionStatus varchar (50))
/* 2️9️ Merchants – Stores merchant details for bank partnerships.
•	MerchantID (PK), MerchantName, Industry, Location, CustomerID
*/
create table Merchants (MerchantID int primary key , MerchantName varchar (50), Industry varchar (50), Location varchar (50), CustomerID int )
/* 3️0️ MerchantTransactions – Logs merchant banking transactions.
•	TransactionID (PK), MerchantID (FK)
*/
create table MerchantTransactions (TransactionID int primary key,MerchantID int foreign key references  Merchants(MerchantID))

alter table MerchantTransactions
add 	Amount int, PaymentMethod varchar , Date date

alter table Accounts 
add constraint FK_Branch_accounts 
foreign key (BranchID) references Branches (BranchID)

alter table Branches 
add constraint FK_Branch_managers 
foreign key (ManagerID) references Employees1 (EmployeeID)


alter table Accounts 
add constraint FK_accounts 
foreign key (BranchID) references Branches (BranchID)
select * from customers

insert into customers values (7, 'David Garcia', '1993-08-14', 'david.garcia@email.com', 1234567896, '404 Elm St', 10007, 20007, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(8, 'Laura Martinez', '1987-05-23', 'laura.martinez@email.com', 1234567897, '505 Oak St', 10008, 20008, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(9, 'James Rodriguez', '1980-11-30', 'james.rodriguez@email.com', 1234567898, '606 Pine St', 10009, 20009, 'Unemployed', 55000, '2023-01-01', '2023-01-01'),
(10, 'Mary Hernandez', '1995-02-18', 'mary.hernandez@email.com', 1234567899, '707 Maple St', 10010, 20010, 'Employed', 95000, '2023-01-01', '2023-01-01'),
(11, 'Daniel Lee', '1984-07-09', 'daniel.lee@email.com', 1234567900, '808 Birch St', 10011, 20011, 'Self-Employed', 68000, '2023-01-01', '2023-01-01'),
(12, 'Emma Clark', '1998-04-12', 'emma.clark@email.com', 1234567901, '909 Cedar St', 10012, 20012, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(13, 'David Walker', '1985-07-07', 'david.walker@email.com', 1234567902, '1010 Elm St', 10013, 20013, 'Employed', 72000, '2023-01-01', '2023-01-01'),
(14, 'Olivia Lewis', '1992-02-19', 'olivia.lewis@email.com', 1234567903, '1111 Oak St', 10014, 20014, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(15, 'Samuel White', '1989-11-11', 'samuel.white@email.com', 1234567904, '1212 Pine St', 10015, 20015, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(16, 'Sophia Harris', '1991-04-04', 'sophia.harris@email.com', 1234567905, '1313 Maple St', 10016, 20016, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(17, 'Lucas Robinson', '1988-05-05', 'lucas.robinson@email.com', 1234567906, '1414 Birch St', 10017, 20017, 'Self-Employed', 74000, '2023-01-01', '2023-01-01'),
(18, 'Amelia Brown', '1990-01-09', 'amelia.brown@email.com', 1234567907, '1515 Cedar St', 10018, 20018, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(19, 'Jackson Young', '1987-08-20', 'jackson.young@email.com', 1234567908, '1616 Elm St', 10019, 20019, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(20, 'Mia Martinez', '1992-11-28', 'mia.martinez@email.com', 1234567909, '1717 Oak St', 10020, 20020, 'Employed', 94000, '2023-01-01', '2023-01-01'),
(21, 'Aiden Gonzalez', '1984-06-13', 'aiden.gonzalez@email.com', 1234567910, '1818 Pine St', 10021, 20021, 'Self-Employed', 77000, '2023-01-01', '2023-01-01'),
(22, 'Isabella Johnson', '1993-02-11', 'isabella.johnson@email.com', 1234567911, '1919 Maple St', 10022, 20022, 'Employed', 82000, '2023-01-01', '2023-01-01'),
(23, 'Ethan Smith', '1985-09-04', 'ethan.smith@email.com', 1234567912, '2020 Birch St', 10023, 20023, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(24, 'Harper Lee', '1991-10-22', 'harper.lee@email.com', 1234567913, '2121 Cedar St', 10024, 20024, 'Employed', 84000, '2023-01-01', '2023-01-01'),
(25, 'Benjamin Walker', '1989-07-03', 'benjamin.walker@email.com', 1234567914, '2222 Elm St', 10025, 20025, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(26, 'Ella Davis', '1994-03-05', 'ella.davis@email.com', 1234567915, '2323 Oak St', 10026, 20026, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(27, 'Mason Brown', '1996-04-09', 'mason.brown@email.com', 1234567916, '2424 Pine St', 10027, 20027, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(28, 'Chloe Martinez', '1985-06-21', 'chloe.martinez@email.com', 1234567917, '2525 Maple St', 10028, 20028, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(29, 'William Anderson', '1993-07-14', 'william.anderson@email.com', 1234567918, '2626 Birch St', 10029, 20029, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(30, 'Abigail Wilson', '1988-12-25', 'abigail.wilson@email.com', 1234567919, '2727 Cedar St', 10030, 20030, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(31, 'Sophia Harris', '1992-03-10', 'sophia.harris@email.com', 1234567920, '323 Birch St', 10031, 20031, 'Employed', 75000, '2023-01-01', '2023-01-01'),
(32, 'Jacob Lewis', '1985-12-12', 'jacob.lewis@email.com', 1234567921, '333 Cedar St', 10032, 20032, 'Self-Employed', 70000, '2023-01-01', '2023-01-01'),
(33, 'Mia Thompson', '1990-11-19', 'mia.thompson@email.com', 1234567922, '343 Elm St', 10033, 20033, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(34, 'William Scott', '1989-09-28', 'william.scott@email.com', 1234567923, '353 Oak St', 10034, 20034, 'Employed', 82000, '2023-01-01', '2023-01-01'),
(35, 'Emily Lee', '1993-07-16', 'emily.lee@email.com', 1234567924, '363 Pine St', 10035, 20035, 'Self-Employed', 73000, '2023-01-01', '2023-01-01'),
(36, 'Oliver White', '1984-10-23', 'oliver.white@email.com', 1234567925, '373 Maple St', 10036, 20036, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(37, 'Ava Martin', '1991-06-14', 'ava.martin@email.com', 1234567926, '383 Birch St', 10037, 20037, 'Employed', 84000, '2023-01-01', '2023-01-01'),
(38, 'Noah Brown', '1987-03-15', 'noah.brown@email.com', 1234567927, '393 Cedar St', 10038, 20038, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(39, 'Lucas Harris', '1986-08-27', 'lucas.harris@email.com', 1234567928, '403 Elm St', 10039, 20039, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(40, 'Harper Jones', '1992-05-24', 'harper.jones@email.com', 1234567929, '413 Oak St', 10040, 20040, 'Employed', 95000, '2023-01-01', '2023-01-01'),
(41, 'Ethan Jackson', '1989-11-05', 'ethan.jackson@email.com', 1234567930, '423 Pine St', 10041, 20041, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(42, 'Amelia Brown', '1994-01-17', 'amelia.brown@email.com', 1234567931, '433 Maple St', 10042, 20042, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(43, 'Logan Smith', '1987-10-12', 'logan.smith@email.com', 1234567932, '443 Birch St', 10043, 20043, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(44, 'Lily Johnson', '1988-04-28', 'lily.johnson@email.com', 1234567933, '453 Cedar St', 10044, 20044, 'Self-Employed', 90000, '2023-01-01', '2023-01-01'),
(45, 'Mason White', '1990-07-08', 'mason.white@email.com', 1234567934, '463 Elm St', 10045, 20045, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(46, 'Ella Green', '1993-02-21', 'ella.green@email.com', 1234567935, '473 Oak St', 10046, 20046, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(47, 'Alexander Hall', '1989-09-25', 'alexander.hall@email.com', 1234567936, '483 Pine St', 10047, 20047, 'Self-Employed', 95000, '2023-01-01', '2023-01-01'),
(48, 'Grace Brown', '1987-05-30', 'grace.brown@email.com', 1234567937, '493 Maple St', 10048, 20048, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(49, 'Carter Adams', '1992-11-18', 'carter.adams@email.com', 1234567938, '503 Birch St', 10049, 20049, 'Employed', 70000, '2023-01-01', '2023-01-01'),
(50, 'Madison Wilson', '1985-12-19', 'madison.wilson@email.com', 1234567939, '513 Cedar St', 10050, 20050, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(51, 'Henry Allen', '1991-02-05', 'henry.allen@email.com', 1234567940, '523 Elm St', 10051, 20051, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(52, 'Charlotte Murphy', '1984-08-13', 'charlotte.murphy@email.com', 1234567941, '533 Oak St', 10052, 20052, 'Unemployed', 59000, '2023-01-01', '2023-01-01'),
(53, 'Sebastian Rivera', '1986-11-20', 'sebastian.rivera@email.com', 1234567942, '543 Pine St', 10053, 20053, 'Employed', 74000, '2023-01-01', '2023-01-01'),
(54, 'Mila Cooper', '1989-03-28', 'mila.cooper@email.com', 1234567943, '553 Maple St', 10054, 20054, 'Self-Employed', 93000, '2023-01-01', '2023-01-01'),
(55, 'Sebastian King', '1995-09-10', 'sebastian.king@email.com', 1234567944, '563 Birch St', 10055, 20055, 'Employed', 77000, '2023-01-01', '2023-01-01'),
(56, 'Lucas Hill', '1992-04-17', 'lucas.hill@email.com', 1234567945, '573 Cedar St', 10056, 20056, 'Unemployed', 61000, '2023-01-01', '2023-01-01'),
(57, 'Ava Scott', '1991-10-06', 'ava.scott@email.com', 1234567946, '583 Elm St', 10057, 20057, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(58, 'Daniel Moore', '1987-12-23', 'daniel.moore@email.com', 1234567947, '593 Oak St', 10058, 20058, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(59, 'Sophia Allen', '1990-07-31', 'sophia.allen@email.com', 1234567948, '603 Pine St', 10059, 20059, 'Employed', 96000, '2023-01-01', '2023-01-01'),
(60, 'Harper Wright', '1988-06-15', 'harper.wright@email.com', 1234567949, '613 Maple St', 10060, 20060, 'Unemployed', 58000, '2023-01-01', '2023-01-01'),
(61, 'Isaac Clark', '1983-05-30', 'isaac.clark@email.com', 1234567950, '623 Birch St', 10061, 20061, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(62, 'Zoey Miller', '1994-10-15', 'zoey.miller@email.com', 1234567951, '633 Cedar St', 10062, 20062, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(63, 'Owen Perez', '1990-03-21', 'owen.perez@email.com', 1234567952, '643 Elm St', 10063, 20063, 'Unemployed', 64000, '2023-01-01', '2023-01-01'),
(64, 'Hannah Collins', '1986-08-07', 'hannah.collins@email.com', 1234567953, '653 Oak St', 10064, 20064, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(65, 'Liam Turner', '1989-11-28', 'liam.turner@email.com', 1234567954, '663 Pine St', 10065, 20065, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(66, 'Aria Baker', '1992-02-09', 'aria.baker@email.com', 1234567955, '673 Maple St', 10066, 20066, 'Unemployed', 67000, '2023-01-01', '2023-01-01'),
(67, 'Nathan Hall', '1984-07-21', 'nathan.hall@email.com', 1234567956, '683 Birch St', 10067, 20067, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(68, 'Addison Young', '1991-04-19', 'addison.young@email.com', 1234567957, '693 Cedar St', 10068, 20068, 'Self-Employed', 79000, '2023-01-01', '2023-01-01'),
(69, 'Isaac King', '1987-09-10', 'isaac.king@email.com', 1234567958, '703 Elm St', 10069, 20069, 'Unemployed', 73000, '2023-01-01', '2023-01-01'),
(70, 'Emily Allen', '1990-12-25', 'emily.allen@email.com', 1234567959, '713 Oak St', 10070, 20070, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(71, 'Carter Wright', '1988-05-18', 'carter.wright@email.com', 1234567960, '723 Pine St', 10071, 20071, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(72, 'Amelia Perez', '1995-06-02', 'amelia.perez@email.com', 1234567961, '733 Maple St', 10072, 20072, 'Unemployed', 61000, '2023-01-01', '2023-01-01'),
(73, 'Charlotte Clark', '1993-01-13', 'charlotte.clark@email.com', 1234567962, '743 Birch St', 10073, 20073, 'Employed', 82000, '2023-01-01', '2023-01-01'),
(74, 'Luke Collins', '1986-03-27', 'luke.collins@email.com', 1234567963, '753 Cedar St', 10074, 20074, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(75, 'Ethan Turner', '1989-08-04', 'ethan.turner@email.com', 1234567964, '763 Elm St', 10075, 20075, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(76, 'Avery Hall', '1991-02-20', 'avery.hall@email.com', 1234567965, '773 Oak St', 10076, 20076, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(77, 'Mason Young', '1990-09-12', 'mason.young@email.com', 1234567966, '783 Pine St', 10077, 20077, 'Self-Employed', 75000, '2023-01-01', '2023-01-01'),
(78, 'Lily Martin', '1987-07-17', 'lily.martin@email.com', 1234567967, '793 Maple St', 10078, 20078, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(79, 'Michael Harris', '1992-08-03', 'michael.harris@email.com', 1234567968, '803 Birch St', 10079, 20079, 'Employed', 94000, '2023-01-01', '2023-01-01'),
(80, 'Zoe White', '1991-11-29', 'zoe.white@email.com', 1234567969, '813 Cedar St', 10080, 20080, 'Self-Employed', 77000, '2023-01-01', '2023-01-01'),
(81, 'Isaac Clark', '1983-05-30', 'isaac.clark@email.com', 1234567950, '623 Birch St', 10061, 20061, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(82, 'Zoey Miller', '1994-10-15', 'zoey.miller@email.com', 1234567951, '633 Cedar St', 10062, 20062, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(83, 'Owen Perez', '1990-03-21', 'owen.perez@email.com', 1234567952, '643 Elm St', 10063, 20063, 'Unemployed', 64000, '2023-01-01', '2023-01-01'),
(84, 'Hannah Collins', '1986-08-07', 'hannah.collins@email.com', 1234567953, '653 Oak St', 10064, 20064, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(85, 'Liam Turner', '1989-11-28', 'liam.turner@email.com', 1234567954, '663 Pine St', 10065, 20065, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(86, 'Aria Baker', '1992-02-09', 'aria.baker@email.com', 1234567955, '673 Maple St', 10066, 20066, 'Unemployed', 67000, '2023-01-01', '2023-01-01'),
(87, 'Nathan Hall', '1984-07-21', 'nathan.hall@email.com', 1234567956, '683 Birch St', 10067, 20067, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(88, 'Addison Young', '1991-04-19', 'addison.young@email.com', 1234567957, '693 Cedar St', 10068, 20068, 'Self-Employed', 79000, '2023-01-01', '2023-01-01'),
(89, 'Isaac King', '1987-09-10', 'isaac.king@email.com', 1234567958, '703 Elm St', 10069, 20069, 'Unemployed', 73000, '2023-01-01', '2023-01-01'),
(90, 'Emily Allen', '1990-12-25', 'emily.allen@email.com', 1234567959, '713 Oak St', 10070, 20070, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(91, 'Carter Wright', '1988-05-18', 'carter.wright@email.com', 1234567960, '723 Pine St', 10071, 20071, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(92, 'Amelia Perez', '1995-06-02', 'amelia.perez@email.com', 1234567961, '733 Maple St', 10072, 20072, 'Unemployed', 61000, '2023-01-01', '2023-01-01'),
(93, 'Charlotte Clark', '1993-01-13', 'charlotte.clark@email.com', 1234567962, '743 Birch St', 10073, 20073, 'Employed', 82000, '2023-01-01', '2023-01-01'),
(94, 'Luke Collins', '1986-03-27', 'luke.collins@email.com', 1234567963, '753 Cedar St', 10074, 20074, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(95, 'Ethan Turner', '1989-08-04', 'ethan.turner@email.com', 1234567964, '763 Elm St', 10075, 20075, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(96, 'Avery Hall', '1991-02-20', 'avery.hall@email.com', 1234567965, '773 Oak St', 10076, 20076, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(97, 'Mason Young', '1990-09-12', 'mason.young@email.com', 1234567966, '783 Pine St', 10077, 20077, 'Self-Employed', 75000, '2023-01-01', '2023-01-01'),
(98, 'Lily Martin', '1987-07-17', 'lily.martin@email.com', 1234567967, '793 Maple St', 10078, 20078, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(99, 'Michael Harris', '1992-08-03', 'michael.harris@email.com', 1234567968, '803 Birch St', 10079, 20079, 'Employed', 94000, '2023-01-01', '2023-01-01'),
(100, 'Zoe White', '1991-11-29', 'zoe.white@email.com', 1234567969, '813 Cedar St', 10080, 20080, 'Self-Employed', 77000, '2023-01-01', '2023-01-01'),
(101, 'Madison Roberts', '1993-06-30', 'madison.roberts@email.com', 1234567970, '823 Elm St', 10081, 20081, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(102, 'Jackson Clark', '1988-12-14', 'jackson.clark@email.com', 1234567971, '833 Oak St', 10082, 20082, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(103, 'Ava Martin', '1984-04-22', 'ava.martin@email.com', 1234567972, '843 Pine St', 10083, 20083, 'Self-Employed', 73000, '2023-01-01', '2023-01-01'),
(104, 'William Davis', '1992-01-29', 'william.davis@email.com', 1234567973, '853 Maple St', 10084, 20084, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(105, 'Lily Johnson', '1987-10-13', 'lily.johnson@email.com', 1234567974, '863 Birch St', 10085, 20085, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(106, 'Henry Wilson', '1989-05-06', 'henry.wilson@email.com', 1234567975, '873 Cedar St', 10086, 20086, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(107, 'Sofia Lopez', '1993-03-31', 'sofia.lopez@email.com', 1234567976, '883 Elm St', 10087, 20087, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(108, 'James Anderson', '1986-09-08', 'james.anderson@email.com', 1234567977, '893 Oak St', 10088, 20088, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(109, 'Isabella Martin', '1988-07-20', 'isabella.martin@email.com', 1234567978, '903 Pine St', 10089, 20089, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(110, 'Oliver Brown', '1990-10-12', 'oliver.brown@email.com', 1234567979, '913 Maple St', 10090, 20090, 'Unemployed', 68000, '2023-01-01', '2024-04-09'),
(111, 'Oliver Brown', '1990-10-12', 'oliver.brown@email.com', 1234567979, '913 Maple St', 10090, 20090, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(112, 'Avery Wilson', '1987-01-14', 'avery.wilson@email.com', 1234567980, '923 Birch St', 10091, 20091, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(113, 'Isabella Garcia', '1993-09-23', 'isabella.garcia@email.com', 1234567981, '933 Cedar St', 10092, 20092, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(114, 'Jackson Hernandez', '1986-11-05', 'jackson.hernandez@email.com', 1234567982, '943 Elm St', 10093, 20093, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(115, 'Evelyn Martinez', '1994-07-18', 'evelyn.martinez@email.com', 1234567983, '953 Oak St', 10094, 20094, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(116, 'Liam Anderson', '1988-03-19', 'liam.anderson@email.com', 1234567984, '963 Pine St', 10095, 20095, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(117, 'Emma Robinson', '1991-06-09', 'emma.robinson@email.com', 1234567985, '973 Maple St', 10096, 20096, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(118, 'James Clark', '1984-12-28', 'james.clark@email.com', 1234567986, '983 Birch St', 10097, 20097, 'Employed', 80000, '2023-01-01', '2023-01-01'),
(119, 'Abigail Lewis', '1990-08-15', 'abigail.lewis@email.com', 1234567987, '993 Cedar St', 10098, 20098, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(120, 'Benjamin Scott', '1987-05-11', 'benjamin.scott@email.com', 1234567988, '1003 Elm St', 10099, 20099, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(121, 'Avery Wilson', '1987-01-14', 'avery.wilson@email.com', 1234567980, '923 Birch St', 10091, 20091, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(122, 'Isabella Garcia', '1993-09-23', 'isabella.garcia@email.com', 1234567981, '933 Cedar St', 10092, 20092, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(123, 'Jackson Hernandez', '1986-11-05', 'jackson.hernandez@email.com', 1234567982, '943 Elm St', 10093, 20093, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(124, 'Evelyn Martinez', '1994-07-18', 'evelyn.martinez@email.com', 1234567983, '953 Oak St', 10094, 20094, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(125, 'Liam Anderson', '1988-03-19', 'liam.anderson@email.com', 1234567984, '963 Pine St', 10095, 20095, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(126, 'Emma Robinson', '1991-06-09', 'emma.robinson@email.com', 1234567985, '973 Maple St', 10096, 20096, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(127, 'James Clark', '1984-12-28', 'james.clark@email.com', 1234567986, '983 Birch St', 10097, 20097, 'Employed', 80000, '2023-01-01', '2023-01-01'),
(128, 'Abigail Lewis', '1990-08-15', 'abigail.lewis@email.com', 1234567987, '993 Cedar St', 10098, 20098, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(129, 'Benjamin Scott', '1987-05-11', 'benjamin.scott@email.com', 1234567988, '1003 Elm St', 10099, 20099, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(130, 'Lily Johnson', '1987-10-13', 'lily.johnson@email.com', 1234567974, '863 Birch St', 10085, 20085, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(131, 'Henry Wilson', '1989-05-06', 'henry.wilson@email.com', 1234567975, '873 Cedar St', 10086, 20086, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(132, 'Sofia Lopez', '1993-03-31', 'sofia.lopez@email.com', 1234567976, '883 Elm St', 10087, 20087, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(133, 'James Anderson', '1986-09-08', 'james.anderson@email.com', 1234567977, '893 Oak St', 10088, 20088, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(134, 'Isabella Martin', '1988-07-20', 'isabella.martin@email.com', 1234567978, '903 Pine St', 10089, 20089, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(135, 'Oliver Brown', '1990-10-12', 'oliver.brown@email.com', 1234567979, '913 Maple St', 10090, 20090, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(136, 'Avery Wilson', '1987-01-14', 'avery.wilson@email.com', 1234567980, '923 Birch St', 10091, 20091, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(137, 'Isabella Garcia', '1993-09-23', 'isabella.garcia@email.com', 1234567981, '933 Cedar St', 10092, 20092, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(138, 'Jackson Hernandez', '1986-11-05', 'jackson.hernandez@email.com', 1234567982, '943 Elm St', 10093, 20093, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(139, 'Evelyn Martinez', '1994-07-18', 'evelyn.martinez@email.com', 1234567983, '953 Oak St', 10094, 20094, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(140, 'Liam Anderson', '1988-03-19', 'liam.anderson@email.com', 1234567984, '963 Pine St', 10095, 20095, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(141, 'Emma Robinson', '1991-06-09', 'emma.robinson@email.com', 1234567985, '973 Maple St', 10096, 20096, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(142, 'James Clark', '1984-12-28', 'james.clark@email.com', 1234567986, '983 Birch St', 10097, 20097, 'Employed', 80000, '2023-01-01', '2023-01-01'),
(143, 'Abigail Lewis', '1990-08-15', 'abigail.lewis@email.com', 1234567987, '993 Cedar St', 10098, 20098, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(144, 'Benjamin Scott', '1987-05-11', 'benjamin.scott@email.com', 1234567988, '1003 Elm St', 10099, 20099, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(145, 'Lily Johnson', '1987-10-13', 'lily.johnson@email.com', 1234567974, '863 Birch St', 10085, 20085, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(146, 'Henry Wilson', '1989-05-06', 'henry.wilson@email.com', 1234567975, '873 Cedar St', 10086, 20086, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(147, 'Sofia Lopez', '1993-03-31', 'sofia.lopez@email.com', 1234567976, '883 Elm St', 10087, 20087, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(148, 'James Anderson', '1986-09-08', 'james.anderson@email.com', 1234567977, '893 Oak St', 10088, 20088, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(149, 'Isabella Martin', '1988-07-20', 'isabella.martin@email.com', 1234567978, '903 Pine St', 10089, 20089, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(150, 'Oliver Brown', '1990-10-12', 'oliver.brown@email.com', 1234567979, '913 Maple St', 10090, 20090, 'Unemployed', 34545,'2023-01-01', '2023-01-01'),
(151, 'Emily Turner', '1991-11-05', 'emily.turner@email.com', 1234567989, '1004 Birch St', 10100, 20100, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(152, 'James Martinez', '1987-06-14', 'james.martinez@email.com', 1234567990, '1014 Cedar St', 10101, 20101, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(153, 'Isabella Hernandez', '1993-08-23', 'isabella.hernandez@email.com', 1234567991, '1024 Elm St', 10102, 20102, 'Unemployed', 63000, '2023-01-01', '2023-01-01'),
(154, 'Jackson Wilson', '1986-02-11', 'jackson.wilson@email.com', 1234567992, '1034 Oak St', 10103, 20103, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(155, 'Evelyn Lee', '1994-10-17', 'evelyn.lee@email.com', 1234567993, '1044 Pine St', 10104, 20104, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(156, 'Liam Robinson', '1988-04-12', 'liam.robinson@email.com', 1234567994, '1054 Maple St', 10105, 20105, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(157, 'Emma Clark', '1991-12-26', 'emma.clark@email.com', 1234567995, '1064 Birch St', 10106, 20106, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(158, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 1234567996, '1074 Cedar St', 10107, 20107, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(159, 'Abigail Scott', '1990-01-29', 'abigail.scott@email.com', 1234567997, '1084 Elm St', 10108, 20108, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(160, 'Benjamin Young', '1987-06-08', 'benjamin.young@email.com', 1234567998, '1094 Oak St', 10109, 20109, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(161, 'Lily Hall', '1991-09-14', 'lily.hall@email.com', 1234567999, '1104 Pine St', 10110, 20110, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(162, 'Henry King', '1985-10-19', 'henry.king@email.com', 1234568000, '1114 Maple St', 10111, 20111, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(163, 'Sofia Adams', '1994-03-22', 'sofia.adams@email.com', 1234568001, '1124 Birch St', 10112, 20112, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(164, 'James Nelson', '1988-02-14', 'james.nelson@email.com', 1234568002, '1134 Cedar St', 10113, 20113, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(165, 'Isabella Rodriguez', '1992-09-23', 'isabella.rodriguez@email.com', 1234568003, '1144 Elm St', 10114, 20114, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(166, 'Liam Martinez', '1989-07-17', 'liam.martinez@email.com', 1234568004, '1154 Oak St', 10115, 20115, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(167, 'Emma Wilson', '1993-11-09', 'emma.wilson@email.com', 1234568005, '1164 Pine St', 10116, 20116, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(168, 'James Brown', '1986-05-12', 'james.brown@email.com', 1234568006, '1174 Maple St', 10117, 20117, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(169, 'Abigail Thomas', '1990-06-28', 'abigail.thomas@email.com', 1234568007, '1184 Birch St', 10118, 20118, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(170, 'Benjamin White', '1987-01-01', 'benjamin.white@email.com', 1234568008, '1194 Cedar St', 10119, 20119, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(171, 'Lily Harris', '1991-08-20', 'lily.harris@email.com', 1234568009, '1204 Elm St', 10120, 20120, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(172, 'Henry Davis', '1985-03-25', 'henry.davis@email.com', 1234568010, '1214 Oak St', 10121, 20121, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(173, 'Sofia Lee', '1994-12-31', 'sofia.lee@email.com', 1234568011, '1224 Pine St', 10122, 20122, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(174, 'James Martinez', '1987-06-14', 'james.martinez@email.com', 1234567990, '1014 Cedar St', 10101, 20101, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(175, 'Isabella Hernandez', '1993-08-23', 'isabella.hernandez@email.com', 1234567991, '1024 Elm St', 10102, 20102, 'Unemployed', 63000, '2023-01-01', '2023-01-01'),
(176, 'Jackson Wilson', '1986-02-11', 'jackson.wilson@email.com', 1234567992, '1034 Oak St', 10103, 20103, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(177, 'Evelyn Lee', '1994-10-17', 'evelyn.lee@email.com', 1234567993, '1044 Pine St', 10104, 20104, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(178, 'Liam Robinson', '1988-04-12', 'liam.robinson@email.com', 1234567994, '1054 Maple St', 10105, 20105, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(179, 'Emma Clark', '1991-12-26', 'emma.clark@email.com', 1234567995, '1064 Birch St', 10106, 20106, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(180, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 123456799,'2333 New st ',122121,219099,'Unemployed',56000,'2023-03-04','2023-09-09'),
(181, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 1234567996, '1074 Cedar St', 10107, 20107, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(182, 'Abigail Scott', '1990-01-29', 'abigail.scott@email.com', 1234567997, '1084 Elm St', 10108, 20108, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(183, 'Benjamin Young', '1987-06-08', 'benjamin.young@email.com', 1234567998, '1094 Oak St', 10109, 20109, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(184, 'Lily Hall', '1991-09-14', 'lily.hall@email.com', 1234567999, '1104 Pine St', 10110, 20110, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(185, 'Henry King', '1985-10-19', 'henry.king@email.com', 1234568000, '1114 Maple St', 10111, 20111, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(186, 'Sofia Adams', '1994-03-22', 'sofia.adams@email.com', 1234568001, '1124 Birch St', 10112, 20112, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(187, 'James Nelson', '1988-02-14', 'james.nelson@email.com', 1234568002, '1134 Cedar St', 10113, 20113, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(188, 'Isabella Rodriguez', '1992-09-23', 'isabella.rodriguez@email.com', 1234568003, '1144 Elm St', 10114, 20114, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(189, 'Liam Martinez', '1989-07-17', 'liam.martinez@email.com', 1234568004, '1154 Oak St', 10115, 20115, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(190, 'Emma Wilson', '1993-11-09', 'emma.wilson@email.com', 1234568005, '1164 Pine St', 10116, 20116, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(191, 'James Brown', '1986-05-12', 'james.brown@email.com', 1234568006, '1174 Maple St', 10117, 20117, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(192, 'Abigail Thomas', '1990-06-28', 'abigail.thomas@email.com', 1234568007, '1184 Birch St', 10118, 20118, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(193, 'Benjamin White', '1987-01-01', 'benjamin.white@email.com', 1234568008, '1194 Cedar St', 10119, 20119, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(194, 'Lily Harris', '1991-08-20', 'lily.harris@email.com', 1234568009, '1204 Elm St', 10120, 20120, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(195, 'Henry Davis', '1985-03-25', 'henry.davis@email.com', 1234568010, '1214 Oak St', 10121, 20121, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(196, 'Sofia Lee', '1994-12-31', 'sofia.lee@email.com', 1234568011, '1224 Pine St', 10122, 20122, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(197, 'James Martinez', '1987-06-14', 'james.martinez@email.com', 1234568012, '1234 Cedar St', 10123, 20123, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(198, 'Isabella Hernandez', '1993-08-23', 'isabella.hernandez@email.com', 1234568013, '1244 Elm St', 10124, 20124, 'Unemployed', 63000, '2023-01-01', '2023-01-01'),
(199, 'Jackson Wilson', '1986-02-11', 'jackson.wilson@email.com', 1234568014, '1254 Oak St', 10125, 20125, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(200, 'Evelyn Lee', '1994-10-17', 'evelyn.lee@email.com', 1234568015, '1264 Pine St', 10126, 20126, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(201, 'Liam Robinson', '1988-04-12', 'liam.robinson@email.com', 1234567994, '1054 Maple St', 10105, 20105, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(202, 'Emma Clark', '1991-12-26', 'emma.clark@email.com', 1234567995, '1064 Birch St', 10106, 20106, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(203, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 1234567996, '1074 Cedar St', 10107, 20107, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(204, 'Abigail Scott', '1990-01-29', 'abigail.scott@email.com', 1234567997, '1084 Elm St', 10108, 20108, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(205, 'Benjamin Young', '1987-06-08', 'benjamin.young@email.com', 1234567998, '1094 Oak St', 10109, 20109, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(206, 'Lily Hall', '1991-09-14', 'lily.hall@email.com', 1234567999, '1104 Pine St', 10110, 20110, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(207, 'Henry King', '1985-10-19', 'henry.king@email.com', 1234568000, '1114 Maple St', 10111, 20111, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(208, 'Sofia Adams', '1994-03-22', 'sofia.adams@email.com', 1234568001, '1124 Birch St', 10112, 20112, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(209, 'James Nelson', '1988-02-14', 'james.nelson@email.com', 1234568002, '1134 Cedar St', 10113, 20113, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(210, 'Isabella Rodriguez', '1992-09-23', 'isabella.rodriguez@email.com', 1234568003, '1144 Elm St', 10114, 20114, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(211, 'Liam Martinez', '1989-07-17', 'liam.martinez@email.com', 1234568004, '1154 Oak St', 10115, 20115, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(212, 'Emma Wilson', '1993-11-09', 'emma.wilson@email.com', 1234568005, '1164 Pine St', 10116, 20116, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(213, 'James Brown', '1986-05-12', 'james.brown@email.com', 1234568006, '1174 Maple St', 10117, 20117, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(214, 'Abigail Thomas', '1990-06-28', 'abigail.thomas@email.com', 1234568007, '1184 Birch St', 10118, 20118, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(215, 'Benjamin White', '1987-01-01', 'benjamin.white@email.com', 1234568008, '1194 Cedar St', 10119, 20119, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(216, 'Lily Harris', '1991-08-20', 'lily.harris@email.com', 1234568009, '1204 Elm St', 10120, 20120, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(217, 'Henry Davis', '1985-03-25', 'henry.davis@email.com', 1234568010, '1214 Oak St', 10121, 20121, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(218, 'Sofia Lee', '1994-12-31', 'sofia.lee@email.com', 1234568011, '1224 Pine St', 10122, 20122, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(219, 'James Martinez', '1987-06-14', 'james.martinez@email.com', 1234568012, '1234 Cedar St', 10123, 20123, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(220, 'Isabella Hernandez', '1993-08-23', 'isabella.hernandez@email.com', 1234568013, '1244 Elm St', 10124, 20124, 'Unemployed', 63000, '2023-01-01', '2023-01-01'),
(221, 'Jackson Wilson', '1986-02-11', 'jackson.wilson@email.com', 1234568014, '1254 Oak St', 10125, 20125, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(222, 'Evelyn Lee', '1994-10-17', 'evelyn.lee@email.com', 1234568015, '1264 Pine St', 10126, 20126, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(223, 'Liam Robinson', '1988-04-12', 'liam.robinson@email.com', 1234568016, '1274 Maple St', 10127, 20127, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(224, 'Emma Clark', '1991-12-26', 'emma.clark@email.com', 1234568017, '1284 Birch St', 10128, 20128, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(225, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 1234568018, '1294 Cedar St', 10129, 20129, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(226, 'Abigail Scott', '1990-01-29', 'abigail.scott@email.com', 1234568019, '1304 Elm St', 10130, 20130, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(227, 'Benjamin Young', '1987-06-08', 'benjamin.young@email.com', 1234568020, '1314 Oak St', 10131, 20131, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(228, 'Lily Hall', '1991-09-14', 'lily.hall@email.com', 1234568021, '1324 Pine St', 10132, 20132, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(229, 'Henry King', '1985-10-19', 'henry.king@email.com', 1234568022, '1334 Maple St', 10133, 20133, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(230, 'Sofia Adams', '1994-03-22', 'sofia.adams@email.com', 1234568023, '134 London ST',12222,32132, 'Employed',78000,'2023-09-09','2023-03-05'),
(231, 'Sofia Adams', '1994-03-22', 'sofia.adams@email.com', 1234568023, '1344 Birch St', 10134, 20134, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(232, 'James Nelson', '1988-02-14', 'james.nelson@email.com', 1234568024, '1354 Cedar St', 10135, 20135, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(233, 'Isabella Rodriguez', '1992-09-23', 'isabella.rodriguez@email.com', 1234568025, '1364 Elm St', 10136, 20136, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(234, 'Liam Martinez', '1989-07-17', 'liam.martinez@email.com', 1234568026, '1374 Oak St', 10137, 20137, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(235, 'Emma Wilson', '1993-11-09', 'emma.wilson@email.com', 1234568027, '1384 Pine St', 10138, 20138, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(236, 'James Brown', '1986-05-12', 'james.brown@email.com', 1234568028, '1394 Maple St', 10139, 20139, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(237, 'Abigail Thomas', '1990-06-28', 'abigail.thomas@email.com', 1234568029, '1404 Birch St', 10140, 20140, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(238, 'Benjamin White', '1987-01-01', 'benjamin.white@email.com', 1234568030, '1414 Cedar St', 10141, 20141, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(239, 'Lily Harris', '1991-08-20', 'lily.harris@email.com', 1234568031, '1424 Elm St', 10142, 20142, 'Unemployed', 62000, '2023-01-01', '2023-01-01'),
(240, 'Henry Davis', '1985-03-25', 'henry.davis@email.com', 1234568032, '1434 Oak St', 10143, 20143, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(241, 'Sofia Lee', '1994-12-31', 'sofia.lee@email.com', 1234568033, '1444 Pine St', 10144, 20144, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(242, 'James Martinez', '1987-06-14', 'james.martinez@email.com', 1234568034, '1454 Cedar St', 10145, 20145, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(243, 'Isabella Hernandez', '1993-08-23', 'isabella.hernandez@email.com', 1234568035, '1464 Elm St', 10146, 20146, 'Unemployed', 63000, '2023-01-01', '2023-01-01'),
(244, 'Jackson Wilson', '1986-02-11', 'jackson.wilson@email.com', 1234568036, '1474 Oak St', 10147, 20147, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(245, 'Evelyn Lee', '1994-10-17', 'evelyn.lee@email.com', 1234568037, '1484 Pine St', 10148, 20148, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(246, 'Liam Robinson', '1988-04-12', 'liam.robinson@email.com', 1234568038, '1494 Maple St', 10149, 20149, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(247, 'Emma Clark', '1991-12-26', 'emma.clark@email.com', 1234568039, '1504 Birch St', 10150, 20150, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(248, 'James Lewis', '1984-07-18', 'james.lewis@email.com', 1234568040, '1514 Cedar St', 10151, 20151, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(249, 'Abigail Scott', '1990-01-29', 'abigail.scott@email.com', 1234568041, '1524 Elm St', 10152, 20152, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(250, 'Benjamin Young', '1987-06-08', 'benjamin.young@email.com', 1234568042, '1534 Oak St', 10153, 20153, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(251, 'Liam Wilson', '1988-09-05', 'liam.wilson@email.com', 1234568043, '1544 Pine St', 10154, 20154, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(252, 'Emma Davis', '1991-07-14', 'emma.davis@email.com', 1234568044, '1554 Maple St', 10155, 20155, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(253, 'James Miller', '1984-06-22', 'james.miller@email.com', 1234568045, '1564 Birch St', 10156, 20156, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(254, 'Abigail Martinez', '1990-10-30', 'abigail.martinez@email.com', 1234568046, '1574 Cedar St', 10157, 20157, 'Self-Employed', 93000, '2023-01-01', '2023-01-01'),
(255, 'Benjamin Anderson', '1987-05-19', 'benjamin.anderson@email.com', 1234568047, '1584 Elm St', 10158, 20158, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(256, 'Lily Robinson', '1991-02-13', 'lily.robinson@email.com', 1234568048, '1594 Oak St', 10159, 20159, 'Employed', 82000, '2023-01-01', '2023-01-01'),
(257, 'Henry Hernandez', '1985-12-18', 'henry.hernandez@email.com', 1234568049, '1604 Pine St', 10160, 20160, 'Self-Employed', 94000, '2023-01-01', '2023-01-01'),
(258, 'Sofia Clark', '1994-04-26', 'sofia.clark@email.com', 1234568050, '1614 Maple St', 10161, 20161, 'Unemployed', 60000, '2023-01-01', '2023-01-01'),
(259, 'James Lewis', '1988-07-21', 'james.lewis@email.com', 1234568051, '1624 Birch St', 10162, 20162, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(260, 'Isabella Scott', '1993-11-12', 'isabella.scott@email.com', 1234568052, '1634 Cedar St', 10163, 20163, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(261, 'Liam Young', '1986-05-16', 'liam.young@email.com', 1234568053, '1644 Elm St', 10164, 20164, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(262, 'Emma White', '1990-09-27', 'emma.white@email.com', 1234568054, '1654 Oak St', 10165, 20165, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(263, 'James Harris', '1984-03-23', 'james.harris@email.com', 1234568055, '1664 Pine St', 10166, 20166, 'Self-Employed', 77000, '2023-01-01', '2023-01-01'),
(264, 'Abigail Martin', '1990-08-19', 'abigail.martin@email.com', 1234568056, '1674 Maple St', 10167, 20167, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(265, 'Benjamin Lee', '1987-02-11', 'benjamin.lee@email.com', 1234568057, '1684 Birch St', 10168, 20168, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(266, 'Lily Gonzalez', '1991-12-05', 'lily.gonzalez@email.com', 1234568058, '1694 Cedar St', 10169, 20169, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(267, 'Henry Walker', '1985-11-14', 'henry.walker@email.com', 1234568059, '1704 Elm St', 10170, 20170, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(268, 'Sofia King', '1994-03-03', 'sofia.king@email.com', 1234568060, '1714 Oak St', 10171, 20171, 'Employed', 84000, '2023-01-01', '2023-01-01'),
(269, 'James Allen', '1988-10-20', 'james.allen@email.com', 1234568061, '1724 Pine St', 10172, 20172, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(270, 'Isabella Hall', '1991-06-28', 'isabella.hall@email.com', 1234568062, '1734 Maple St', 10173, 20173, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(271, 'Liam Lopez', '1985-09-12', 'liam.lopez@email.com', 1234568063, '1744 Birch St', 10174, 20174, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(272, 'Emma Thompson', '1993-04-18', 'emma.thompson@email.com', 1234568064, '1754 Cedar St', 10175, 20175, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(273, 'James Mitchell', '1986-01-17', 'james.mitchell@email.com', 1234568065, '1764 Elm St', 10176, 20176, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(274, 'Abigail Perez', '1990-11-30', 'abigail.perez@email.com', 1234568066, '1774 Oak St', 10177, 20177, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(275, 'Benjamin Roberts', '1987-08-07', 'benjamin.roberts@email.com', 1234568067, '1784 Pine St', 10178, 20178, 'Self-Employed', 86000, '2023-01-01', '2023-01-01'),
(276, 'Lily Ramirez', '1991-05-11', 'lily.ramirez@email.com', 1234568068, '1794 Maple St', 10179, 20179, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(277, 'Henry Turner', '1985-07-22', 'henry.turner@email.com', 1234568069, '1804 Birch St', 10180, 20180, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(278, 'Sofia Gonzalez', '1994-02-09', 'sofia.gonzalez@email.com', 1234568070, '1814 Cedar St', 10181, 20181, 'Self-Employed', 93000, '2023-01-01', '2023-01-01'),
(279, 'James Nelson', '1988-06-13', 'james.nelson@email.com', 1234568071, '1824 Elm St', 10182, 20182, 'Unemployed', 66000, '2023-01-01', '2023-01-01'),
(280, 'Isabella Hernandez', '1990-03-01', 'isabella.hernandez@email.com', 1234568072,'12Wold',10390,20183,'self-emplyed',90000,'2023-09-07','2023-09-16'),
(281, 'Isabella Hernandez', '1990-03-01', 'isabella.hernandez@email.com', 1234568072, '1834 Oak St', 10183, 20183, 'Employed', 75000, '2023-01-01', '2023-01-01'),
(282, 'Jackson Lewis', '1987-04-22', 'jackson.lewis@email.com', 1234568073, '1844 Pine St', 10184, 20184, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(283, 'Emma Martinez', '1994-09-05', 'emma.martinez@email.com', 1234568074, '1854 Maple St', 10185, 20185, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(284, 'Henry Davis', '1986-06-14', 'henry.davis@email.com', 1234568075, '1864 Birch St', 10186, 20186, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(285, 'Sofia Anderson', '1991-11-18', 'sofia.anderson@email.com', 1234568076, '1874 Cedar St', 10187, 20187, 'Self-Employed', 76000, '2023-01-01', '2023-01-01'),
(286, 'James Clark', '1989-03-17', 'james.clark@email.com', 1234568077, '1884 Elm St', 10188, 20188, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(287, 'Liam Robinson', '1984-02-12', 'liam.robinson@email.com', 1234568078, '1894 Oak St', 10189, 20189, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(288, 'Emma Miller', '1990-07-19', 'emma.miller@email.com', 1234568079, '1904 Pine St', 10190, 20190, 'Self-Employed', 80000, '2023-01-01', '2023-01-01'),
(289, 'Henry Johnson', '1986-10-23', 'henry.johnson@email.com', 1234568080, '1914 Maple St', 10191, 20191, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(290, 'Sofia Martinez', '1991-05-27', 'sofia.martinez@email.com', 1234568081, '1924 Birch St', 10192, 20192, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(291, 'James Lee', '1989-01-13', 'james.lee@email.com', 1234568082, '1934 Cedar St', 10193, 20193, 'Self-Employed', 93000, '2023-01-01', '2023-01-01'),
(292, 'Liam Harris', '1985-08-31', 'liam.harris@email.com', 1234568083, '1944 Elm St', 10194, 20194, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(293, 'Emma Scott', '1994-04-11', 'emma.scott@email.com', 1234568084, '1954 Oak St', 10195, 20195, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(294, 'Henry Young', '1988-03-16', 'henry.young@email.com', 1234568085, '1964 Pine St', 10196, 20196, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(295, 'Sofia Davis', '1990-09-29', 'sofia.davis@email.com', 1234568086, '1974 Maple St', 10197, 20197, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(296, 'James Walker', '1987-07-23', 'james.walker@email.com', 1234568087, '1984 Birch St', 10198, 20198, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(297, 'Isabella Lopez', '1991-11-12', 'isabella.lopez@email.com', 1234568088, '1994 Cedar St', 10199, 20199, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(298, 'Liam Gonzalez', '1985-02-10', 'liam.gonzalez@email.com', 1234568089, '2004 Elm St', 10200, 20200, 'Unemployed', 67000, '2023-01-01', '2023-01-01'),
(299, 'Emma Hernandez', '1993-08-18', 'emma.hernandez@email.com', 1234568090, '2014 Oak St', 10201, 20201, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(300, 'James Miller', '1987-11-21', 'james.miller@email.com', 1234568091, '2024 Pine St', 10202, 20202, 'Self-Employed', 76000, '2023-01-01', '2023-01-01'),
(301, 'James Wilson', '1987-04-14', 'james.wilson@email.com', 1234568092, '2034 Cedar St', 10203, 20203, 'Employed', 78000, '2023-01-01', '2023-01-01'),
(302, 'Isabella Lewis', '1991-06-27', 'isabella.lewis@email.com', 1234568093, '2044 Elm St', 10204, 20204, 'Self-Employed', 89000, '2023-01-01', '2023-01-01'),
(303, 'Liam Walker', '1985-08-05', 'liam.walker@email.com', 1234568094, '2054 Oak St', 10205, 20205, 'Unemployed', 66000, '2023-01-01', '2023-01-01'),
(304, 'Emma Hill', '1993-03-15', 'emma.hill@email.com', 1234568095, '2064 Pine St', 10206, 20206, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(305, 'Henry Scott', '1984-09-11', 'henry.scott@email.com', 1234568096, '2074 Maple St', 10207, 20207, 'Self-Employed', 79000, '2023-01-01', '2023-01-01'),
(306, 'Sofia White', '1990-04-18', 'sofia.white@email.com', 1234568097, '2084 Birch St', 10208, 20208, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(307, 'James Clark', '1987-07-24', 'james.clark@email.com', 1234568098, '2094 Cedar St', 10209, 20209, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(308, 'Liam Lee', '1985-10-31', 'liam.lee@email.com', 1234568099, '2104 Elm St', 10210, 20210, 'Self-Employed', 92000, '2023-01-01', '2023-01-01'),
(309, 'Emma Johnson', '1994-08-07', 'emma.johnson@email.com', 1234568100, '2114 Oak St', 10211, 20211, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(310, 'James Gonzalez', '1986-05-20', 'james.gonzalez@email.com', 1234568101, '2124 Pine St', 10212, 20212, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(311, 'Sofia Harris', '1990-03-13', 'sofia.harris@email.com', 1234568102, '2134 Maple St', 10213, 20213, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(312, 'Liam Martinez', '1987-02-22', 'liam.martinez@email.com', 1234568103, '2144 Birch St', 10214, 20214, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(313, 'Emma Thompson', '1991-11-25', 'emma.thompson@email.com', 1234568104, '2154 Cedar St', 10215, 20215, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(314, 'James King', '1986-07-15', 'james.king@email.com', 1234568105, '2164 Elm St', 10216, 20216, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(315, 'Liam Lopez', '1985-09-12', 'liam.lopez@email.com', 1234568106, '2174 Oak St', 10217, 20217, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(316, 'Emma Smith', '1993-03-03', 'emma.smith@email.com', 1234568107, '2184 Pine St', 10218, 20218, 'Employed', 93000, '2023-01-01', '2023-01-01'),
(317, 'Henry Brown', '1984-06-20', 'henry.brown@email.com', 1234568108, '2194 Maple St', 10219, 20219, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(318, 'Sofia Garcia', '1990-09-29', 'sofia.garcia@email.com', 1234568109, '2204 Birch St', 10220, 20220, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(319, 'James Rodriguez', '1986-01-10', 'james.rodriguez@email.com', 1234568110, '2214 Cedar St', 10221, 20221, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(320, 'Emma Wilson', '1991-12-28', 'emma.wilson@email.com', 1234568111, '2224 Elm St', 10222, 20222, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(321, 'Liam Anderson', '1985-04-09', 'liam.anderson@email.com', 1234568112, '2234 Oak St', 10223, 20223, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(322, 'Henry Hernandez', '1993-08-20', 'henry.hernandez@email.com', 1234568113, '2244 Pine St', 10224, 20224, 'Employed', 94000, '2023-01-01', '2023-01-01'),
(323, 'Sofia Davis', '1984-10-11', 'sofia.davis@email.com', 1234568114, '2254 Maple St', 10225, 20225, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(324, 'James Harris', '1990-02-22', 'james.harris@email.com', 1234568115, '2264 Birch St', 10226, 20226, 'Unemployed', 76000, '2023-01-01', '2023-01-01'),
(325, 'Emma Scott', '1987-06-17', 'emma.scott@email.com', 1234568116, '2274 Cedar St', 10227, 20227, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(326, 'Liam Walker', '1985-05-28', 'liam.walker@email.com', 1234568117, '2284 Elm St', 10228, 20228, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(327, 'Henry White', '1991-03-09', 'henry.white@email.com', 1234568118, '2294 Oak St', 10229, 20229, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(328, 'Sofia Gonzalez', '1986-11-13', 'sofia.gonzalez@email.com', 1234568119, '2304 Pine St', 10230, 20230, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(329, 'James Martinez', '1990-04-15', 'james.martinez@email.com', 1234568120, '2314 Maple St', 10231, 20231, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(330, 'Emma Clark', '1984-12-20', 'emma.clark@email.com', 1234568121, '2324 Birch St', 10232,20345,'Employed',78000,'2024-12-12','2024-12-12'),
(351, 'Liam Martinez', '1986-11-02', 'liam.martinez@email.com', 1234568140, '2514 Cedar St', 10251, 20251, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(352, 'Emma Clark', '1991-05-18', 'emma.clark@email.com', 1234568141, '2524 Elm St', 10252, 20252, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(353, 'James Lewis', '1985-02-27', 'james.lewis@email.com', 1234568142, '2534 Oak St', 10253, 20253, 'Self-Employed', 72000, '2023-01-01', '2023-01-01'),
(354, 'Isabella Scott', '1990-04-07', 'isabella.scott@email.com', 1234568143, '2544 Pine St', 10254, 20254, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(355, 'Henry Martinez', '1987-03-22', 'henry.martinez@email.com', 1234568144, '2554 Maple St', 10255, 20255, 'Employed', 93000, '2023-01-01', '2023-01-01'),
(356, 'Sofia Robinson', '1994-06-16', 'sofia.robinson@email.com', 1234568145, '2564 Birch St', 10256, 20256, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(357, 'James Harris', '1986-10-11', 'james.harris@email.com', 1234568146, '2574 Cedar St', 10257, 20257, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(358, 'Emma White', '1990-08-04', 'emma.white@email.com', 1234568147, '2584 Elm St', 10258, 20258, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(359, 'Liam Walker', '1985-09-29', 'liam.walker@email.com', 1234568148, '2594 Oak St', 10259, 20259, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(360, 'Isabella Gonzalez', '1991-07-30', 'isabella.gonzalez@email.com', 1234568149, '2604 Pine St', 10260, 20260, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(361, 'James Young', '1986-04-23', 'james.young@email.com', 1234568150, '2614 Maple St', 10261, 20261, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(362, 'Emma Hall', '1990-03-29', 'emma.hall@email.com', 1234568151, '2624 Birch St', 10262, 20262, 'Self-Employed', 78000, '2023-01-01', '2023-01-01'),
(363, 'Henry Brown', '1987-11-14', 'henry.brown@email.com', 1234568152, '2634 Cedar St', 10263, 20263, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(364, 'Sofia King', '1991-09-07', 'sofia.king@email.com', 1234568153, '2644 Elm St', 10264, 20264, 'Employed', 84000, '2023-01-01', '2023-01-01'),
(365, 'James Martinez', '1985-07-26', 'james.martinez@email.com', 1234568154, '2654 Oak St', 10265, 20265, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(366, 'Emma Rodriguez', '1990-12-08', 'emma.rodriguez@email.com', 1234568155, '2664 Pine St', 10266, 20266, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(367, 'Henry Anderson', '1987-03-19', 'henry.anderson@email.com', 1234568156, '2674 Maple St', 10267, 20267, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(368, 'Sofia Hernandez', '1994-05-11', 'sofia.hernandez@email.com', 1234568157, '2684 Birch St', 10268, 20268, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(369, 'James Wilson', '1986-10-20', 'james.wilson@email.com', 1234568158, '2694 Cedar St', 10269, 20269, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(370, 'Emma Smith', '1990-07-01', 'emma.smith@email.com', 1234568159, '2704 Elm St', 10270, 20270, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(371, 'Liam Scott', '1985-05-30', 'liam.scott@email.com', 1234568160, '2714 Oak St', 10271, 20271, 'Self-Employed', 91000, '2023-01-01', '2023-01-01'),
(372, 'Isabella Turner', '1991-11-26', 'isabella.turner@email.com', 1234568161, '2724 Pine St', 10272, 20272, 'Unemployed', 66000, '2023-01-01', '2023-01-01'),
(373, 'James King', '1987-08-13', 'james.king@email.com', 1234568162, '2734 Maple St', 10273, 20273, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(374, 'Emma Lopez', '1993-04-20', 'emma.lopez@email.com', 1234568163, '2744 Birch St', 10274, 20274, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(375, 'Henry Gonzalez', '1985-12-15', 'henry.gonzalez@email.com', 1234568164, '2754 Cedar St', 10275, 20275, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(376, 'Sofia Harris', '1991-01-05', 'sofia.harris@email.com', 1234568165, '2764 Elm St', 10276, 20276, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(377, 'James Davis', '1987-07-03', 'james.davis@email.com', 1234568166, '2774 Oak St', 10277, 20277, 'Self-Employed', 94000, '2023-01-01', '2023-01-01'),
(378, 'Emma Johnson', '1990-10-17', 'emma.johnson@email.com', 1234568167, '2784 Pine St', 10278, 20278, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(379, 'Liam Martinez', '1985-02-09', 'liam.martinez@email.com', 1234568168, '2794 Maple St', 10279, 20279, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(380, 'Isabella Anderson', '1991-04-22', 'isabella.anderson@email.com', 1234568169, '2804 Birch St', 10280,20800,'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(381, 'Isabella Anderson', '1991-04-22', 'isabella.anderson@email.com', 1234568169, '2804 Birch St', 10280, 20280, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(382, 'Liam Martinez', '1985-02-09', 'liam.martinez@email.com', 1234568170, '2814 Cedar St', 10281, 20281, 'Unemployed', 78000, '2023-01-01', '2023-01-01'),
(383, 'Emma Clark', '1990-10-20', 'emma.clark@email.com', 1234568171, '2824 Elm St', 10282, 20282, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(384, 'Henry Scott', '1986-08-16', 'henry.scott@email.com', 1234568172, '2834 Oak St', 10283, 20283, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(385, 'Sofia Harris', '1994-02-14', 'sofia.harris@email.com', 1234568173, '2844 Pine St', 10284, 20284, 'Unemployed', 67000, '2023-01-01', '2023-01-01'),
(386, 'James Anderson', '1985-06-27', 'james.anderson@email.com', 1234568174, '2854 Maple St', 10285, 20285, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(387, 'Emma Young', '1991-11-05', 'emma.young@email.com', 1234568175, '2864 Birch St', 10286, 20286, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(388, 'Liam Walker', '1987-03-09', 'liam.walker@email.com', 1234568176, '2874 Cedar St', 10287, 20287, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(389, 'Isabella Wilson', '1993-04-24', 'isabella.wilson@email.com', 1234568177, '2884 Elm St', 10288, 20288, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(390, 'Henry Thompson', '1984-09-29', 'henry.thompson@email.com', 1234568178, '2894 Oak St', 10289, 20289, 'Self-Employed', 89000, '2023-01-01', '2023-01-01'),
(391, 'Emma Johnson', '1990-07-18', 'emma.johnson@email.com', 1234568179, '2904 Pine St', 10290, 20290, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(392, 'Liam Rodriguez', '1988-10-10', 'liam.rodriguez@email.com', 1234568180, '2914 Maple St', 10291, 20291, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(393, 'Sofia Garcia', '1991-08-22', 'sofia.garcia@email.com', 1234568181, '2924 Birch St', 10292, 20292, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(394, 'James Lewis', '1987-06-11', 'james.lewis@email.com', 1234568182, '2934 Cedar St', 10293, 20293, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(395, 'Isabella Clark', '1990-05-13', 'isabella.clark@email.com', 1234568183, '2944 Elm St', 10294, 20294, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(396, 'Liam White', '1985-09-07', 'liam.white@email.com', 1234568184, '2954 Oak St', 10295, 20295, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(397, 'Emma Brown', '1991-03-25', 'emma.brown@email.com', 1234568185, '2964 Pine St', 10296, 20296, 'Unemployed', 73000, '2023-01-01', '2023-01-01'),
(398, 'James Miller', '1986-01-15', 'james.miller@email.com', 1234568186, '2974 Maple St', 10297, 20297, 'Employed', 93000, '2023-01-01', '2023-01-01'),
(399, 'Isabella Davis', '1994-07-19', 'isabella.davis@email.com', 1234568187, '2984 Birch St', 10298, 20298, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(400, 'Liam Gonzalez', '1989-02-18', 'liam.gonzalez@email.com', 1234568188, '2994 Cedar St', 10299, 20299, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(401, 'Ethan Martinez', '1993-09-21', 'ethan.martinez@email.com', 1234568189, '3004 Birch St', 10300, 20300, 'Self-Employed', 75000, '2023-01-01', '2023-01-01'),
(402, 'Sophia Lee', '1991-08-12', 'sophia.lee@email.com', 1234568190, '3014 Cedar St', 10301, 20301, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(403, 'Matthew Johnson', '1987-05-20', 'matthew.johnson@email.com', 1234568191, '3024 Elm St', 10302, 20302, 'Employed', 81000, '2023-01-01', '2023-01-01'),
(404, 'Ava Brown', '1992-11-15', 'ava.brown@email.com', 1234568192, '3034 Oak St', 10303, 20303, 'Self-Employed', 76000, '2023-01-01', '2023-01-01'),
(405, 'Lucas Davis', '1986-03-22', 'lucas.davis@email.com', 1234568193, '3044 Pine St', 10304, 20304, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(406, 'Emily Wilson', '1991-07-30', 'emily.wilson@email.com', 1234568194, '3054 Maple St', 10305, 20305, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(407, 'Oliver Martinez', '1988-01-17', 'oliver.martinez@email.com', 1234568195, '3064 Birch St', 10306, 20306, 'Self-Employed', 86000, '2023-01-01', '2023-01-01'),
(408, 'Ella Anderson', '1992-06-24', 'ella.anderson@email.com', 1234568196, '3074 Cedar St', 10307, 20307, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(409, 'Noah Brown', '1990-10-10', 'noah.brown@email.com', 1234568197, '3084 Elm St', 10308, 20308, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(410, 'Grace Harris', '1985-11-19', 'grace.harris@email.com', 1234568198, '3094 Oak St', 10309, 20309, 'Self-Employed', 90000, '2023-01-01', '2023-01-01'),
(411, 'Alexander Clark', '1993-07-12', 'alexander.clark@email.com', 1234568199, '3104 Pine St', 10310, 20310, 'Unemployed', 74000, '2023-01-01', '2023-01-01'),
(412, 'Zoe Davis', '1986-09-23', 'zoe.davis@email.com', 1234568200, '3114 Maple St', 10311, 20311, 'Employed', 89000, '2023-01-01', '2023-01-01'),
(413, 'Jackson Martinez', '1991-02-25', 'jackson.martinez@email.com', 1234568201, '3124 Birch St', 10312, 20312, 'Self-Employed', 81000, '2023-01-01', '2023-01-01'),
(414, 'Amelia Johnson', '1990-08-20', 'amelia.johnson@email.com', 1234568202, '3134 Cedar St', 10313, 20313, 'Unemployed', 73000, '2023-01-01', '2023-01-01'),
(415, 'Daniel Wilson', '1987-05-13', 'daniel.wilson@email.com', 1234568203, '3144 Elm St', 10314, 20314, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(416, 'Victoria Brown', '1994-03-29', 'victoria.brown@email.com', 1234568204, '3154 Oak St', 10315, 20315, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(417, 'Henry Harris', '1988-06-17', 'henry.harris@email.com', 1234568205, '3164 Pine St', 10316, 20316, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(418, 'Emma Clark', '1992-11-09', 'emma.clark@email.com', 1234568206, '3174 Maple St', 10317, 20317, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(419, 'Benjamin Davis', '1985-04-22', 'benjamin.davis@email.com', 1234568207, '3184 Birch St', 10318, 20318, 'Self-Employed', 93000, '2023-01-01', '2023-01-01'),
(420, 'Lily Johnson', '1990-12-15', 'lily.johnson@email.com', 1234568208, '3194 Cedar St', 10319, 20319, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(421, 'Owen Wilson', '1993-10-07', 'owen.wilson@email.com', 1234568209, '3204 Elm St', 10320, 20320, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(422, 'Harper Brown', '1991-05-19', 'harper.brown@email.com', 1234568210, '3214 Oak St', 10321, 20321, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(423, 'Liam Harris', '1985-09-28', 'liam.harris@email.com', 1234568211, '3224 Pine St', 10322, 20322, 'Unemployed', 66000, '2023-01-01', '2023-01-01'),
(424, 'Mia Clark', '1992-06-13', 'mia.clark@email.com', 1234568212, '3234 Maple St', 10323, 20323, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(425, 'Ethan Davis', '1986-02-11', 'ethan.davis@email.com', 1234568213, '3244 Birch St', 10324, 20324, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(426, 'Sophia Johnson', '1990-07-29', 'sophia.johnson@email.com', 1234568214, '3254 Cedar St', 10325, 20325, 'Unemployed', 67000, '2023-01-01', '2023-01-01'),
(427, 'Matthew Wilson', '1987-05-01', 'matthew.wilson@email.com', 1234568215, '3264 Elm St', 10326, 20326, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(428, 'Ava Brown', '1992-01-24', 'ava.brown@email.com', 1234568216, '3274 Oak St', 10327, 20327, 'Self-Employed', 76000, '2023-01-01', '2023-01-01'),
(429, 'Lucas Davis', '1985-06-19', 'lucas.davis@email.com', 1234568217, '3284 Pine St', 10328, 20328, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(430, 'Emily Wilson', '1991-04-30', 'emily.wilson@email.com', 123456821,'Litlle sr 454',10329,20329,'employed',89000,'2023-02-02','2023-09-08'),
(431, 'Emily Wilson', '1991-04-30', 'emily.wilson@email.com', 1234568218, '3294 Elm St', 10329, 20329, 'Employed', 83000, '2023-01-01', '2023-01-01'),
(432, 'Ethan Martinez', '1987-09-16', 'ethan.martinez@email.com', 1234568219, '3304 Oak St', 10330, 20330, 'Self-Employed', 76000, '2023-01-01', '2023-01-01'),
(433, 'Sophia Lee', '1990-11-14', 'sophia.lee@email.com', 1234568220, '3314 Pine St', 10331, 20331, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(434, 'Matthew Johnson', '1993-08-19', 'matthew.johnson@email.com', 1234568221, '3324 Maple St', 10332, 20332, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(435, 'Ava Brown', '1986-05-25', 'ava.brown@email.com', 1234568222, '3334 Birch St', 10333, 20333, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(436, 'Lucas Davis', '1991-03-23', 'lucas.davis@email.com', 1234568223, '3344 Cedar St', 10334, 20334, 'Unemployed', 75000, '2023-01-01', '2023-01-01'),
(437, 'Emily Wilson', '1989-07-27', 'emily.wilson@email.com', 1234568224, '3354 Elm St', 10335, 20335, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(438, 'Oliver Martinez', '1992-01-15', 'oliver.martinez@email.com', 1234568225, '3364 Oak St', 10336, 20336, 'Self-Employed', 94000, '2023-01-01', '2023-01-01'),
(439, 'Ella Anderson', '1987-06-12', 'ella.anderson@email.com', 1234568226, '3374 Pine St', 10337, 20337, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(440, 'Noah Brown', '1990-09-26', 'noah.brown@email.com', 1234568227, '3384 Maple St', 10338, 20338, 'Employed', 95000, '2023-01-01', '2023-01-01'),
(441, 'Grace Harris', '1985-04-13', 'grace.harris@email.com', 1234568228, '3394 Birch St', 10339, 20339, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(442, 'Alexander Clark', '1993-02-14', 'alexander.clark@email.com', 1234568229, '3404 Cedar St', 10340, 20340, 'Unemployed', 78000, '2023-01-01', '2023-01-01'),
(443, 'Zoe Davis', '1990-05-09', 'zoe.davis@email.com', 1234568230, '3414 Elm St', 10341, 20341, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(444, 'Jackson Martinez', '1987-11-28', 'jackson.martinez@email.com', 1234568231, '3424 Oak St', 10342, 20342, 'Self-Employed', 88000, '2023-01-01', '2023-01-01'),
(445, 'Amelia Johnson', '1991-12-10', 'amelia.johnson@email.com', 1234568232, '3434 Pine St', 10343, 20343, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(446, 'Daniel Wilson', '1985-06-15', 'daniel.wilson@email.com', 1234568233, '3444 Maple St', 10344, 20344, 'Employed', 94000, '2023-01-01', '2023-01-01'),
(447, 'Victoria Brown', '1993-09-20', 'victoria.brown@email.com', 1234568234, '3454 Birch St', 10345, 20345, 'Self-Employed', 89000, '2023-01-01', '2023-01-01'),
(448, 'Henry Harris', '1987-08-11', 'henry.harris@email.com', 1234568235, '3464 Cedar St', 10346, 20346, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(449, 'Emma Clark', '1990-02-22', 'emma.clark@email.com', 1234568236, '3474 Elm St', 10347, 20347, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(450, 'Benjamin Davis', '1985-10-17', 'benjamin.davis@email.com', 1234568237, '3484 Oak St', 10348, 20348, 'Self-Employed', 87000, '2023-01-01', '2023-01-01'),
(451, 'Sophia White', '1987-03-18', 'sophia.white@email.com', 1234568238, '3494 Pine St', 10349, 20349, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(452, 'Lucas Wilson', '1993-10-31', 'lucas.wilson@email.com', 1234568239, '3504 Maple St', 10350, 20350, 'Employed', 90000, '2023-01-01', '2023-01-01'),
(453, 'Ava Harris', '1989-07-13', 'ava.harris@email.com', 1234568240, '3514 Birch St', 10351, 20351, 'Self-Employed', 86000, '2023-01-01', '2023-01-01'),
(454, 'Ethan Brown', '1991-11-19', 'ethan.brown@email.com', 1234568241, '3524 Cedar St', 10352, 20352, 'Unemployed', 71000, '2023-01-01', '2023-01-01'),
(455, 'Olivia Johnson', '1990-04-12', 'olivia.johnson@email.com', 1234568242, '3534 Elm St', 10353, 20353, 'Employed', 88000, '2023-01-01', '2023-01-01'),
(456, 'Mason Martinez', '1988-06-20', 'mason.martinez@email.com', 1234568243, '3544 Oak St', 10354, 20354, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(457, 'Isabella Garcia', '1992-02-28', 'isabella.garcia@email.com', 1234568244, '3554 Pine St', 10355, 20355, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(458, 'Michael Wilson', '1985-01-20', 'michael.wilson@email.com', 1234568245, '3564 Maple St', 10356, 20356, 'Employed', 92000, '2023-01-01', '2023-01-01'),
(459, 'Sophia Brown', '1991-09-17', 'sophia.brown@email.com', 1234568246, '3574 Birch St', 10357, 20357, 'Self-Employed', 77000, '2023-01-01', '2023-01-01'),
(460, 'Ethan Harris', '1987-05-30', 'ethan.harris@email.com', 1234568247, '3584 Cedar St', 10358, 20358, 'Unemployed', 65000, '2023-01-01', '2023-01-01'),
(461, 'Olivia Johnson', '1990-12-12', 'olivia.johnson@email.com', 1234568248, '3594 Elm St', 10359, 20359, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(462, 'Mason Martinez', '1986-04-02', 'mason.martinez@email.com', 1234568249, '3604 Oak St', 10360, 20360, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(463, 'Isabella Garcia', '1989-07-22', 'isabella.garcia@email.com', 1234568250, '3614 Pine St', 10361, 20361, 'Unemployed', 69000, '2023-01-01', '2023-01-01'),
(464, 'Michael Wilson', '1992-05-18', 'michael.wilson@email.com', 1234568251, '3624 Maple St', 10362, 20362, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(465, 'Sophia Brown', '1988-08-05', 'sophia.brown@email.com', 1234568252, '3634 Birch St', 10363, 20363, 'Self-Employed', 85000, '2023-01-01', '2023-01-01'),
(466, 'Ethan Harris', '1991-06-16', 'ethan.harris@email.com', 1234568253, '3644 Cedar St', 10364, 20364, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(467, 'Olivia Johnson', '1986-03-21', 'olivia.johnson@email.com', 1234568254, '3654 Elm St', 10365, 20365, 'Employed', 87000, '2023-01-01', '2023-01-01'),
(468, 'Mason Martinez', '1990-08-09', 'mason.martinez@email.com', 1234568255, '3664 Oak St', 10366, 20366, 'Self-Employed', 82000, '2023-01-01', '2023-01-01'),
(469, 'Isabella Garcia', '1985-01-15', 'isabella.garcia@email.com', 1234568256, '3674 Pine St', 10367, 20367, 'Unemployed', 68000, '2023-01-01', '2023-01-01'),
(470, 'Michael Wilson', '1991-10-10', 'michael.wilson@email.com', 1234568257, '3684 Maple St', 10368, 20368, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(471, 'Sophia Brown', '1987-11-26', 'sophia.brown@email.com', 1234568258, '3694 Birch St', 10369, 20369, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(472, 'Ethan Harris', '1990-02-22', 'ethan.harris@email.com', 1234568259, '3704 Cedar St', 10370, 20370, 'Unemployed', 70000, '2023-01-01', '2023-01-01'),
(473, 'Olivia Johnson', '1988-09-13', 'olivia.johnson@email.com', 1234568260, '3714 Elm St', 10371, 20371, 'Employed', 86000, '2023-01-01', '2023-01-01'),
(474, 'Mason Martinez', '1992-07-19', 'mason.martinez@email.com', 1234568261, '3724 Oak St', 10372, 20372, 'Self-Employed', 84000, '2023-01-01', '2023-01-01'),
(475, 'Isabella Garcia', '1986-04-28', 'isabella.garcia@email.com', 1234568262, '3734 Pine St', 10373, 20373, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(476, 'Michael Wilson', '1990-11-24', 'michael.wilson@email.com', 1234568263, '3744 Maple St', 10374, 20374, 'Employed', 91000, '2023-01-01', '2023-01-01'),
(477, 'Sophia Brown', '1987-03-12', 'sophia.brown@email.com', 1234568264, '3754 Birch St', 10375, 20375, 'Self-Employed', 83000, '2023-01-01', '2023-01-01'),
(478, 'Ethan Harris', '1991-05-05', 'ethan.harris@email.com', 1234568265, '3764 Cedar St', 10376, 20376, 'Unemployed', 72000, '2023-01-01', '2023-01-01'),
(479, 'Olivia Johnson', '1988-07-10', 'olivia.johnson@email.com', 1234568266, '3774 Elm St', 10377, 20377, 'Employed', 85000, '2023-01-01', '2023-01-01'),
(480, 'Mason Martinez', '1987-12-12','mason@gmail.com',78278323,'Sydney 78',10378,20378,'Self-Employed',90000,'2023-09-09','2023-09-17')





DECLARE @Counter INT = 481;
DECLARE @MaxRows INT = 10200;
DECLARE @FullName VARCHAR(50);
DECLARE @DateOfBirth DATE;
DECLARE @Email VARCHAR(50);
DECLARE @PhoneNumber BIGINT;
DECLARE @Address VARCHAR(50);
DECLARE @NationalID INT;
DECLARE @TaxID INT;
DECLARE @EmploymentStatus VARCHAR(50);
DECLARE @AnnualIncome INT;

WHILE @Counter <= @MaxRows
BEGIN
    SET @FullName = CONCAT('Fullname ', @Counter);
    SET @DateOfBirth = DATEADD(YEAR, -FLOOR(RAND() * 50 + 18), GETDATE());
    SET @Email = CONCAT('email', @Counter, '@example.com');
    SET @PhoneNumber = FLOOR(RAND() * 1000000000 + 6000000000);
    SET @Address = CONCAT('Address ', @Counter);
    SET @NationalID = FLOOR(RAND() * 900000 + 100000);
    SET @TaxID = FLOOR(RAND() * 900000 + 100000);
    SET @EmploymentStatus = CASE WHEN RAND() > 0.5 THEN 'Employed' ELSE 'Unemployed' END;
    SET @AnnualIncome = FLOOR(RAND() * 70001 + 30000);
    
    INSERT INTO customers (CustomerID, Fullname, Date_of_birth, Email, PhoneNumber, Addres, NationaId, Taxid, EmploymentStatus, AnnualIncome, CreatedAt, UpdatedAt)
    VALUES (@Counter, @FullName, @DateOfBirth, @Email, @PhoneNumber, @Address, @NationalID, @TaxID, @EmploymentStatus, @AnnualIncome, '2023-01-01', '2023-01-01');
    
    SET @Counter = @Counter + 1;
END;

select * from Employees1

---
-- Insert 10,200 rows into Branches table
DECLARE @Counter8 INT = 1;

WHILE @Counter8 <= 10200
BEGIN
    INSERT INTO Branches (BranchID, BranchName, Address, City, State, Country, ManagerID, ContactNumber)
    VALUES (
        @Counter8,
        CONCAT('Branch ', @Counter8),
        CONCAT('456 Bank St, City ', @Counter8),
        CONCAT('City ', @Counter8),
        'State',
        'Country',
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming ManagerID exists in Employees1 table
        CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 10000000000) + 1000000000 AS BIGINT)
    );
    SET @Counter8 = @Counter8 + 1;
END;
-- Insert 10,200 rows into Accounts table
DECLARE @Counter9 INT = 1;

WHILE @Counter9 <= 10200
BEGIN
    INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, Currency, Status, BranchID, CreatedDate)
    VALUES (
        @Counter9,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CASE WHEN @Counter9 % 3 = 0 THEN 'Savings' WHEN @Counter9 % 3 = 1 THEN 'Checking' ELSE 'Business' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000),
        'USD',
        CASE WHEN @Counter9 % 2 = 0 THEN 'Active' ELSE 'Inactive' END,
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming BranchID exists in Branches table
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()) -- Random date within the last 5 years
    );
    SET @Counter9 = @Counter9 + 1;
END;
-- Insert 10,200 rows into Transactions table
DECLARE @Counter10 INT = 1;

WHILE @Counter10 <= 10200
BEGIN
    INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo)
    VALUES (
        @Counter10,
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming AccountID exists in Accounts table
        CASE WHEN @Counter10 % 4 = 0 THEN 'Deposit' WHEN @Counter10 % 4 = 1 THEN 'Withdrawal' WHEN @Counter10 % 4 = 2 THEN 'Transfer' ELSE 'Payment' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000),
        'USD',
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random date within the last 5 years
        CASE WHEN @Counter10 % 2 = 0 THEN 'Completed' ELSE 'Pending' END,
        CEILING(RAND(CHECKSUM(NEWID())) * 1000000) -- Random ReferenceNo
    );
    SET @Counter10 = @Counter10 + 1;
END;
select * from Accounts


-- Insert 10,200 rows into Transactions table
 


 INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(1, 2, 'Deposit', 500, 'USD', '2022-01-15', 'Completed', 100001);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(2, 3, 'Withdrawal', 200, 'USD', '2021-03-20', 'Pending', 100002);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(3, 4, 'Transfer', 700, 'USD', '2020-07-12', 'Completed', 100003);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(4, 5, 'Payment', 150, 'USD', '2019-11-05', 'Completed', 100004);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(5, 6, 'Deposit', 350, 'USD', '2018-05-23', 'Pending', 100005);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(6, 7, 'Withdrawal', 1000, 'USD', '2017-04-17', 'Completed', 100006);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(7, 8, 'Transfer', 200, 'USD', '2022-08-19', 'Pending', 100007);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(8, 9, 'Payment', 400, 'USD', '2021-09-09', 'Completed', 100008);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(9, 10, 'Deposit', 250, 'USD', '2020-12-22', 'Pending', 100009);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo) VALUES 
(10, 11, 'Withdrawal', 600, 'USD', '2019-02-10', 'Completed', 100010);

alter table transactions
drop PK__Transact__55433A4B05B7BB1F

exec sp_help 'Transactions'

-- Insert 10,200 rows into Transactions table
DECLARE @Counter11 INT = 1;

WHILE @Counter11 <= 10200
BEGIN
    INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo)
    VALUES (
        @Counter11,
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming AccountID exists in Accounts table
        CASE WHEN @Counter11 % 4 = 0 THEN 'Deposit' WHEN @Counter11 % 4 = 1 THEN 'Withdrawal' WHEN @Counter11 % 4 = 2 THEN 'Transfer' ELSE 'Payment' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000),
        'USD',
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random date within the last 5 years
        CASE WHEN @Counter11 % 2 = 0 THEN 'Completed' ELSE 'Pending' END,
        CEILING(RAND(CHECKSUM(NEWID())) * 1000000) -- Random ReferenceNo
    );
    SET @Counter11 = @Counter11 + 1;
END;

-- Insert 10,200 rows into CreditCards table
DECLARE @Counter12 INT = 1;

WHILE @Counter12 <= 10200
BEGIN
    INSERT INTO CreditCards (CradID, CustomerID, CardNumber, CardType, CVV, ExpiryDate, Limit, Status)
    VALUES (
        @Counter12,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000000000000000), -- Generate random 16-digit card number
        CASE WHEN @Counter12 % 2 = 0 THEN 'Visa' ELSE 'MasterCard' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000), -- Generate random 3-digit CVV
        DATEADD(YEAR, CEILING(RAND(CHECKSUM(NEWID())) * 5), GETDATE()), -- Random expiry date within the next 5 years
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000), -- Generate random limit
        CASE WHEN @Counter12 % 2 = 0 THEN 'Active' ELSE 'Inactive' END
    );
    SET @Counter12 = @Counter12 + 1;
END;
-- Insert 10,200 rows into CreditCardTransactions table
DECLARE @Counter13 INT = 1;

WHILE @Counter13 <= 10200
BEGIN
    INSERT INTO CreditCardTransactions (TransactionID, CardID, Merchant, Amount, Currency, Date, Status)
    VALUES (
        @Counter13,
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming CardID exists in CreditCards table
        CONCAT('Merchant ', @Counter13),
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000),
        'USD',
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random date within the last 5 years
        CASE WHEN @Counter13 % 2 = 0 THEN 'Completed' ELSE 'Pending' END
    );
    SET @Counter13 = @Counter13 + 1;
END;

-- Insert 10,200 rows into OnlineBankingUsers table
DECLARE @Counter14 INT = 1;

WHILE @Counter14 <= 10200
BEGIN
    INSERT INTO OnlineBankingUsers (UserID, CustomerID, Username, PasswordHash, LastLogin)
    VALUES (
        @Counter14,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CONCAT('User', @Counter14),
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000000), -- Generate random PasswordHash
        FLOOR(RAND(CHECKSUM(NEWID())) * 365 * 5) -- Random LastLogin within the last 5 years
    );
    SET @Counter14 = @Counter14 + 1;
END;
-- Insert 10,200 rows into BillPayments table
DECLARE @Counter15 INT = 1;

WHILE @Counter15 <= 10200
BEGIN
    INSERT INTO BillPayments (PaymentID, CustomerID, BillerName, Amount, Date, Status)
    VALUES (
        @Counter15,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CONCAT('Biller', @Counter15),
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000), -- Generate random amount
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random date within the last 5 years
        CASE WHEN @Counter15 % 2 = 0 THEN 'Completed' ELSE 'Pending' END
    );
    SET @Counter15 = @Counter15 + 1;
END;
--
-- Insert 10,200 rows into MobileBankingTransactions table
DECLARE @Counter16 INT = 1;

WHILE @Counter16 <= 10200
BEGIN
    INSERT INTO MobileBankingTransactions (TransactionID, CustomerID, DeviceID, AppVersion, TransactionType, Amount, Date)
    VALUES (
        @Counter16,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Generate random DeviceID
        CONCAT('v', CEILING(RAND(CHECKSUM(NEWID())) * 5), '.', CEILING(RAND(CHECKSUM(NEWID())) * 10)), -- Generate random AppVersion
        CASE WHEN @Counter16 % 3 = 0 THEN 'Balance Check' WHEN @Counter16 % 3 = 1 THEN 'Money Transfer' ELSE 'Bill Payment' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000), -- Generate random amount
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()) -- Random date within the last 5 years
    );
    SET @Counter16 = @Counter16 + 1;
END;

-- Insert 10,200 rows into Loans table
DECLARE @Counter17 INT = 1;

WHILE @Counter17 <= 10200
BEGIN
    INSERT INTO Loans (LoanID, CustomerID, LoanType, Amount, InterestRate, StartDate, EndDate, Status)
    VALUES (
        @Counter17,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CASE WHEN @Counter17 % 3 = 0 THEN 'Personal' WHEN @Counter17 % 3 = 1 THEN 'Mortgage' ELSE 'Auto' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000), -- Generate random loan amount
        FLOOR(RAND(CHECKSUM(NEWID())) * 15 + 1), -- Generate random interest rate between 1% and 15%
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random start date within the last 5 years
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 2, GETDATE()), -- Random end date within the last 2 years
        CASE WHEN @Counter17 % 2 = 0 THEN 'Active' ELSE 'Closed' END
    );
    SET @Counter17 = @Counter17 + 1;
END;

-- Insert 10,200 rows into LoanPayments table
DECLARE @Counter18 INT = 1;

WHILE @Counter18 <= 10200
BEGIN
    INSERT INTO LoanPayments (PaymentID, LoanID, AmountPaid, PaymentDate, RemainingBalance)
    VALUES (
        @Counter18,
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming LoanID exists in Loans table
        FLOOR(RAND(CHECKSUM(NEWID())) * 5000), -- Generate random amount paid
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random payment date within the last 5 years
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000) -- Generate random remaining balance
    );
    SET @Counter18 = @Counter18 + 1;
END;
-- Insert 10,200 rows into CreditScores table
DECLARE @Counter19 INT = 1;

WHILE @Counter19 <= 10200
BEGIN
    INSERT INTO CreditScores (CustomerID, CreditScore, UpdatedAt)
    VALUES (
        @Counter19,
        FLOOR(RAND(CHECKSUM(NEWID())) * 850) + 300, -- Generate random credit score between 300 and 850
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()) -- Random updated date within the last year
    );
    SET @Counter19 = @Counter19 + 1;
END;


select * from CreditScores

-- Insert 10,200 rows into DebtCollection table
DECLARE @Counter20 INT = 1;

WHILE @Counter20 <= 10200
BEGIN
    INSERT INTO DebtCollection (DebtID, CustomerID, AmountDue, DueDate, CollectorAssigned)
    VALUES (
        @Counter20,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000), -- Generate random amount due
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 2, GETDATE()), -- Random due date within the last 2 years
        CONCAT('Collector ', @Counter20)
    );
    SET @Counter20 = @Counter20 + 1;
END;

-- Insert 10,200 rows into Know_Your_Customer table
DECLARE @Counter21 INT = 1;

WHILE @Counter21 <= 10200
BEGIN
    INSERT INTO Know_Your_Customer (KYCID, CustomerID, DocumentType, DocumentNumber, VerifiedBy)
    VALUES (
        @Counter21,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CASE WHEN @Counter21 % 3 = 0 THEN 'Passport' WHEN @Counter21 % 3 = 1 THEN 'Driver License' ELSE 'National ID' END,
        CEILING(RAND(CHECKSUM(NEWID())) * 1000000), -- Generate random document number
        CONCAT('Verifier ', @Counter21)
    );
    SET @Counter21 = @Counter21 + 1;
END;
-- Insert 10,200 rows into FraudDetection table
DECLARE @Counter22 INT = 1;

WHILE @Counter22 <= 10200
BEGIN
    INSERT INTO FraudDetection (FraudID, CustomerID, TransactionID, RiskLevel, ReportedDate)
    VALUES (
        @Counter22,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CEILING(RAND(CHECKSUM(NEWID())) * 10200), -- Assuming TransactionID exists in Transactions table
        CASE WHEN @Counter22 % 3 = 0 THEN 'Low' WHEN @Counter22 % 3 = 1 THEN 'Medium' ELSE 'High' END,
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()) -- Random reported date within the last year
    );
    SET @Counter22 = @Counter22 + 1;
END;
-- Insert 10,200 rows into Anti_Money_Laundering table
DECLARE @Counter23 INT = 1;

WHILE @Counter23 <= 10200
BEGIN
    INSERT INTO Anti_Money_Laundering (CaseID, CustomerID, CaseType, Status, InvestigatorID)
    VALUES (
        @Counter23,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000), -- Assuming CustomerID exists in Customers table
        CASE WHEN @Counter23 % 3 = 0 THEN 'Transaction Monitoring' WHEN @Counter23 % 3 = 1 THEN 'Customer Due Diligence' ELSE 'Suspicious Activity Report' END,
        CASE WHEN @Counter23 % 2 = 0 THEN 'Open' ELSE 'Closed' END,
        CEILING(RAND(CHECKSUM(NEWID())) * 10000) -- Generate random InvestigatorID
    );
    SET @Counter23 = @Counter23 + 1;
END;

--
-- Insert 10,200 rows into RegulatoryReports table
DECLARE @Counter24 INT = 1;

WHILE @Counter24 <= 10200
BEGIN
    INSERT INTO RegulatoryReports (ReportID, ReportType, SubmissionDate)
    VALUES (
        @Counter24,
        CASE WHEN @Counter24 % 3 = 0 THEN 'Financial Report' WHEN @Counter24 % 3 = 1 THEN 'Compliance Report' ELSE 'Audit Report' END,
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 2, GETDATE()) -- Random submission date within the last 2 years
    );
    SET @Counter24 = @Counter24 + 1;
END;

-- Insert 10,200 rows into Departments table
DECLARE @Counter25 INT = 1;

WHILE @Counter25 <= 10200
BEGIN
    INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID)
    VALUES (
        @Counter25,
        CONCAT('Department ', @Counter25),
        CEILING(RAND(CHECKSUM(NEWID())) * 10000) -- Generate random ManagerID
    );
    SET @Counter25 = @Counter25 + 1;
END;
-- Insert 10,200 rows into Salaries table
-- Insert 10,200 rows into Salaries table
DECLARE @Counter26 INT = 1;
DECLARE @MaxEmployeeID INT = (SELECT MAX(EmployeeID) FROM Employees1);

WHILE @Counter26 <= 10200
BEGIN
    INSERT INTO Salaries (SalaryID, EmployeeID, BaseSalary, Bonus, Deductions, PaymentDate)
    VALUES (
        @Counter26,
        CEILING(RAND(CHECKSUM(NEWID())) * @MaxEmployeeID), -- Use EmployeeID that exists in Employees1 table
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000), -- Generate random base salary
        FLOOR(RAND(CHECKSUM(NEWID())) * 20000), -- Generate random bonus
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000), -- Generate random deductions
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()) -- Random payment date within the last year
    );
    SET @Counter26 = @Counter26 + 1;
END;
delete from Salaries

select * from Salaries
update Salaries
set EmployeeID = (select employeeId from Employees1 where EmployeeID is not null)
where employeeId is null
alter table salaries 
drop EmployeeId

-- Insert 10,200 rows into Salaries table
 


DECLARE @Counter27 INT = 1;
DECLARE @MaxEmployee9ID INT = (SELECT MAX(EmployeeID) FROM Employees1);
DECLARE @MinEmployeeID1 INT = (SELECT MIN(EmployeeID) FROM Employees1);

WHILE @Counter27 <= 10200
BEGIN
    INSERT INTO EmployeeAttendance (AttendanceID, EmployeeID, CheckInTime, CheckOutTime, TotalHours)
    VALUES (
        @Counter27,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxEmployeeID - @MinEmployeeID1 + 1)) + @MinEmployeeID1, -- Use EmployeeID that exists in Employees1 table
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()), -- Generate random check-in time within the last year
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()), -- Generate random check-out time within the last year
        FLOOR(RAND(CHECKSUM(NEWID())) * 24) -- Generate random total hours
    );
    SET @Counter27 = @Counter27 + 1;
END;
select * from EmployeeAttendance 
delete from EmployeeAttendance

-- Insert 10,200 rows into Employees1 table
DECLARE @Counter30 INT = 1;
DECLARE @MaxBranchID INT = (SELECT MAX(BranchID) FROM Branches);
DECLARE @MinBranchID INT = (SELECT MIN(BranchID) FROM Branches);

WHILE @Counter30 <= 10200
BEGIN
    INSERT INTO Employees1 (EmployeeID, BranchID, FullName, Position, Department, Salary, HireDate, Status)
    VALUES (
        @Counter30,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxBranchID - @MinBranchID + 1)) + @MinBranchID, -- Use BranchID that exists in Branches table
        CONCAT('Employee ', @Counter30),
        CASE WHEN @Counter30 % 3 = 0 THEN 'Manager' WHEN @Counter30 % 3 = 1 THEN 'Analyst' ELSE 'Clerk' END,
        CASE WHEN @Counter30 % 4 = 0 THEN 'Finance' WHEN @Counter30 % 4 = 1 THEN 'HR' WHEN @Counter30 % 4 = 2 THEN 'IT' ELSE 'Marketing' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000), -- Generate random salary
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365 * 5, GETDATE()), -- Random hire date within the last 5 years
        CASE WHEN @Counter30 % 2 = 0 THEN 'Active' ELSE 'Inactive' END
    );
    SET @Counter30 = @Counter30 + 1;
END;

-- Insert 10,200 rows into Investments table
DECLARE @Counter31 INT = 1;
DECLARE @MaxCustomerID INT = (SELECT MAX(CustomerID) FROM Customers);
DECLARE @MinCustomerID INT = (SELECT MIN(CustomerID) FROM Customers);

WHILE @Counter31 <= 10200
BEGIN
    INSERT INTO Investments (InvestmentID, CustomerID, InvestmentType, Amount, ROI, MaturityDate)
    VALUES (
        @Counter31,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxCustomerID - @MinCustomerID + 1)) + @MinCustomerID, -- Use CustomerID that exists in Customers table
        CASE WHEN @Counter31 % 3 = 0 THEN 'Stocks' WHEN @Counter31 % 3 = 1 THEN 'Bonds' ELSE 'Mutual Funds' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000), -- Generate random investment amount
        FLOOR(RAND(CHECKSUM(NEWID())) * 20), -- Generate random ROI percentage
        DATEADD(DAY, RAND(CHECKSUM(NEWID())) * 365 * 10, GETDATE()) -- Random maturity date within the next 10 years
    );
    SET @Counter31 = @Counter31 + 1;
END;
-- Insert 10,200 rows into StockTradingAccounts table
DECLARE @Counter32 INT = 1;
DECLARE @MaxCustomer7ID INT = (SELECT MAX(CustomerID) FROM Customers);
DECLARE @MinCustomer7ID INT = (SELECT MIN(CustomerID) FROM Customers);

WHILE @Counter32 <= 10200
BEGIN
    INSERT INTO StockTradingAccounts (AccountID, CustomerID, BrokerageFirm, TotalInvested, CurrentValue)
    VALUES (
        @Counter32,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxCustomerID - @MinCustomerID + 1)) + @MinCustomerID, -- Use CustomerID that exists in Customers table
        CASE WHEN @Counter32 % 3 = 0 THEN 'Brokerage A' WHEN @Counter32 % 3 = 1 THEN 'Brokerage B' ELSE 'Brokerage C' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000000), -- Generate random total invested amount
        FLOOR(RAND(CHECKSUM(NEWID())) * 1000000) -- Generate random current value
    );
    SET @Counter32 = @Counter32 + 1;
END;
select * from StockTradingAccounts


-- Insert 10,200 rows into ForeignExchange table
DECLARE @Counter33 INT = 1;
DECLARE @MaxCustomer6ID INT = (SELECT MAX(CustomerID) FROM Customers);
DECLARE @MinCustomer6ID INT = (SELECT MIN(CustomerID) FROM Customers);

WHILE @Counter33 <= 10200
BEGIN
    INSERT INTO ForeignExchange (FXID, CustomerID, CurrencyPair, ExchangeRate, AmountExchanged)
    VALUES (
        @Counter33,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxCustomerID - @MinCustomerID + 1)) + @MinCustomerID, -- Use CustomerID that exists in Customers table
        CASE WHEN @Counter33 % 3 = 0 THEN 'USD/EUR' WHEN @Counter33 % 3 = 1 THEN 'GBP/USD' ELSE 'JPY/USD' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 200), -- Generate random exchange rate
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000) -- Generate random amount exchanged
    );
    SET @Counter33 = @Counter33 + 1;
END;


-- Insert 10,200 rows into InsurancePolicies table
DECLARE @Counter34 INT = 1;
DECLARE @MaxCustomerID3 INT = (SELECT MAX(CustomerID) FROM Customers);
DECLARE @MinCustomerID3 INT = (SELECT MIN(CustomerID) FROM Customers);

WHILE @Counter34 <= 10200
BEGIN
    INSERT INTO InsurancePolicies (PolicyID, CustomerID, InsuranceType, PremiumAmount, CoverageAmount)
    VALUES (
        @Counter34,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxCustomerID - @MinCustomerID + 1)) + @MinCustomerID, -- Use CustomerID that exists in Customers table
        CASE WHEN @Counter34 % 3 = 0 THEN 'Health' WHEN @Counter34 % 3 = 1 THEN 'Life' ELSE 'Auto' END,
        FLOOR(RAND(CHECKSUM(NEWID())) * 10000), -- Generate random premium amount
        FLOOR(RAND(CHECKSUM(NEWID())) * 500000) -- Generate random coverage amount
    );
    SET @Counter34 = @Counter34 + 1;
END;

-- Insert 10,200 rows into Claims table
DECLARE @Counter35 INT = 1;
DECLARE @MaxPolicyID INT = (SELECT MAX(PolicyID) FROM InsurancePolicies);
DECLARE @MinPolicyID INT = (SELECT MIN(PolicyID) FROM InsurancePolicies);

WHILE @Counter35 <= 10200
BEGIN
    INSERT INTO Claims (ClaimID, PolicyID, ClaimAmount, Status, FiledDate)
    VALUES (
        @Counter35,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxPolicyID - @MinPolicyID + 1)) + @MinPolicyID, -- Use PolicyID that exists in InsurancePolicies table
        FLOOR(RAND(CHECKSUM(NEWID())) * 100000), -- Generate random claim amount
        CASE WHEN @Counter35 % 2 = 0 THEN 'Approved' ELSE 'Pending' END,
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()) -- Random filed date within the last year
    );
    SET @Counter35 = @Counter35 + 1;
END;
-- Insert 10,200 rows into UserAccessLogs table
DECLARE @Counter36 INT = 1;
DECLARE @MaxUserID INT = (SELECT MAX(UserID) FROM OnlineBankingUsers);
DECLARE @MinUserID INT = (SELECT MIN(UserID) FROM OnlineBankingUsers);

WHILE @Counter36 <= 10200
BEGIN
    INSERT INTO UserAccessLogs (LogID, UserID, ActionType, Timestamp)
    VALUES (
        @Counter36,
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxUserID - @MinUserID + 1)) + @MinUserID, -- Use UserID that exists in OnlineBankingUsers table
        CASE WHEN @Counter36 % 3 = 0 THEN 'Login' WHEN @Counter36 % 3 = 1 THEN 'Transaction' ELSE 'Logout' END,
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()) -- Random timestamp within the last year
    );
    SET @Counter36 = @Counter36 + 1;
END;
-- Insert 10,200 rows into CyberSecurityIncidents table
DECLARE @Counter37 INT = 1;

WHILE @Counter37 <= 10200
BEGIN
    INSERT INTO CyberSecurityIncidents (IncidentID, AffectedSystem, ReportedDate, ResolutionStatus)
    VALUES (
        @Counter37,
        CASE WHEN @Counter37 % 3 = 0 THEN 'System A' WHEN @Counter37 % 3 = 1 THEN 'System B' ELSE 'System C' END,
        DATEADD(DAY, -RAND(CHECKSUM(NEWID())) * 365, GETDATE()), -- Random reported date within the last year
        CASE WHEN @Counter37 % 2 = 0 THEN 'Resolved' ELSE 'Pending' END
    );
    SET @Counter37 = @Counter37 + 1;
END;
-- Insert 10,200 rows into Merchants table
DECLARE @Counter38 INT = 1;
DECLARE @MaxCustomerID1 INT = (SELECT MAX(CustomerID) FROM Customers);
DECLARE @MinCustomerID1 INT = (SELECT MIN(CustomerID) FROM Customers);

WHILE @Counter38 <= 10200
BEGIN
    INSERT INTO Merchants (MerchantID, MerchantName, Industry, Location, CustomerID)
    VALUES (
        @Counter38,
        CONCAT('Merchant ', @Counter38),
        CASE WHEN @Counter38 % 3 = 0 THEN 'Retail' WHEN @Counter38 % 3 = 1 THEN 'Food & Beverage' ELSE 'Services' END,
        CONCAT('Location ', @Counter38),
        FLOOR(RAND(CHECKSUM(NEWID())) * (@MaxCustomerID - @MinCustomerID + 1)) + @MinCustomerID -- Use CustomerID that exists in Customers table
    );
    SET @Counter38 = @Counter38 + 1;
END;


-- Insert 10,200 rows into MerchantTransactions table




create table MerchantTransactions1 (TransactionID int primary key,MerchantID int foreign key references  Merchants(MerchantID),Amount int,PaymentMethod varchar , Date date)

insert into MerchantTransactions1 values (23,54,56,'Cash','2023-12-12')

ALTER TABLE MerchantTransactions1 
ALTER COLUMN PaymentMethod VARCHAR(50);

exec sp_help'MerchantTransactions1'


-- Insert dummy data
DECLARE @Counter0 INT = 1;
DECLARE @TotalRows INT = 10200;

WHILE @Counter <= @TotalRows
BEGIN
    INSERT INTO MerchantTransactions1 (TransactionID, MerchantID, Amount, PaymentMethod, Date)
    VALUES (
        @Counter, 
        ABS(CHECKSUM(NEWID())) % 100 + 1, -- Random MerchantID (1-100)
        ABS(CHECKSUM(NEWID())) % 1000 + 10, -- Random Amount ($10-$1000)
        CASE ABS(CHECKSUM(NEWID())) % 4 -- Random PaymentMethod
            WHEN 0 THEN 'Credit'
            WHEN 1 THEN 'Debit'
            WHEN 2 THEN 'Cash'
            WHEN 3 THEN 'Online'
        END,
        DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 365, GETDATE()) -- Random Date (past year)
    );
    SET @Counter += 1;
END;

select * from Know_Your_Customer

select * from Accounts
--•	Top 3 Customers with the Highest Total Balance Across All Accounts 
select top 3 Fullname	, sum(Balance) as Highestsalary from customers t1
join Accounts t2 on t1.CustomerID=t2.CustomerID
group by Fullname 
order by sum(Balance) desc
--•	Customers Who Have More Than One Active Loan
select * from Loans
 select Fullname from customers 
 where CustomerID in (select CustomerID from Loans where Status='Active' group by Status,CustomerID having count(CustomerID)>1)

 
 select * from Loans
 where CustomerID =14

 select * from Transactions
 --•	Total Loan Amount Issued Per Branch
 select * from Branches
 select * from Loans
 select * from Accounts
 select concat(sum(amount),'USD') Totalloan,BranchName from Loans t1
 join Accounts t2 on t1.CustomerID=t2.CustomerID
 join Branches t3 on t3.BranchID=t2.BranchID
 group by BranchName
 --•	Customers who made multiple large transactions (above $10,000) within a short time frame (less than 1 hour apart)
 select * from customers
 select * from Transactions
 select * from Accounts

  select Fullname from customers t1 
  join Accounts t2 on t1.CustomerID=t2.CustomerID
  join Transactions t3 on t3.AccountId=t2.AccountID
  where Amount>500 
