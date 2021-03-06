BACKUP DATABASE reportsdb   
   TO DISK = 'resportsdb_august_03.bak';  
GO  

--. If you specify only the file name or a relative path when you are backing up to a file,
-- the backup file is put in the default backup directory. The default backup directory is
-- C:\Program Files\Microsoft SQL Server\MSSQL.n\MSSQL\Backup, where n is the number of the server instance.
-- Therefore, for the default server instance, the default backup directory is: 
-- C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup.

-- C:\Program Files(x86)\Microsoft SQL Server\MSSQL12.SQLExpress\MSSQL\Backup\resportsdb_august_03.bak  on this machine

-- use this to restore the backup to a new database
-- https://msdn.microsoft.com/en-us/library/ms186390.aspx