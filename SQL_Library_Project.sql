create database library;
use library;

select * from authors;
alter table authors rename column ï»¿book_authors_BookID to book_authors_BookID;
alter table authors add column book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT FIRST;

select * from books;
alter table books rename column ï»¿book_BookID to book_BookID;

select * from loans;
alter table loans rename column ï»¿book_loans_BookID to book_loans_BookID;
alter table loans add column book_loans_loanID INT PRIMARY KEY AUTO_INCREMENT first;

select * from branches;
alter table branches add column library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT first;

select * from copies;
alter table copies rename column ï»¿book_copies_BookID to book_copies_BookID;
alter table copies add column book_copies_CopiesID INT PRIMARY KEY AUTO_INCREMENT first;
select * from books;

-- 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
select br.library_branch_BranchName as Branch_Name, b.book_BookID as book_ID, b.book_Title, c.book_copies_No_Of_Copies as No_of_Copies
from copies c join books b on c.book_copies_BookID = b.book_bookID 
join branches br on br.library_branch_BranchID = c.book_copies_BranchID 
where b.book_Title="The Lost Tribe" and br.library_branch_BranchName='Sharpstown';

-- 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? 
select br.library_branch_BranchName as Branch_Name,b.book_BookID, b.book_Title, c.book_copies_No_Of_Copies as No_of_Copies 
from copies c join books b on c.book_copies_BookID = b.book_bookID 
join branches br on br.library_branch_BranchID = c.book_copies_BranchID where b.book_Title="The Lost Tribe";

-- 3. Retrieve the names of all borrowers who do not have any books checked out.
select * from borrower where borrower_CardNo not in (select book_loans_cardno from loans);

-- 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address.  
select b.book_title, bw.borrower_BorrowerName, bw.borrower_BorrowerAddress
from books b join loans l on l.book_loans_BookID= b.book_bookid join borrower bw on l.book_loans_cardno= bw.borrower_cardno
where l.book_loans_branchid in (select library_branch_branchid from branches where library_branch_branchname = 'Sharpstown') and l.book_loans_duedate='2/3/18';

-- 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
 select br.library_branch_BranchName as Branch_Name,count(l.book_loans_branchid) as books_loanedout
 from branches br join loans l on br.library_branch_branchid=l.book_loans_branchid group by br.library_branch_BranchName;
 
-- 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select bw.borrower_BorrowerName, bw.borrower_BorrowerAddress, count(*) as Books_Checked from borrower bw join loans l on bw.borrower_CardNo = l.book_loans_CardNo 
group by bw.borrower_Borrowername, bw.borrower_BorrowerAddress having Books_Checked >5;

-- 7. For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
select b.book_title, c.book_copies_No_Of_Copies as No_of_Copies from copies c join books b on b.book_bookid = book_copies_bookid
where b.book_bookid in (select book_authors_BookID from authors where book_authors_AuthorName= "Stephen King")
and c.book_copies_BranchID = (select library_branch_branchid from branches where library_branch_branchname = "Central");