USE [s16guest04]
GO
/****** Object:  StoredProcedure [dbo].[download_report]    Script Date: 5/2/2016 6:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[download_report]

AS 
BEGIN 
    Begin Try
	 SET NOCOUNT ON 
	 Begin Transaction
 select [product_name],
       [version_name],
	   --here below the month of download date is so called as Month
	   MONTH(download_date) AS [Month],
	   ---For counting the number of months in a date we use count operation
	   COUNT(MONTH(download_date)) AS [Count]  
	  
FROM version
INNER JOIN customer_download
ON version.version_id=customer_download.downloaded_version
INNER JOIN product
ON product.product_id=version.product_id
---the records for a particular manner to display we use group by
	   GROUP BY [product_name],[version_name],MONTH(download_date)
Commit Transaction
	End Try
	Begin Catch
	Rollback Transaction
	Select
	   ERROR_NUMBER() as ErrorNumber,
	   ERROR_MESSAGE() as ErrorMessage ,
	   ERROR_PROCEDURE() as ErrorProcedure,
	   ERROR_STATE() as ErrorState,
	   ERROR_SEVERITY() as ErrorSeverity,
	   ERROR_LINE() as ErrorLine
	END Catch
 END	  
GO
/****** Object:  StoredProcedure [dbo].[feature_data]    Script Date: 5/2/2016 6:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[feature_data]
  @feature_id int ,
  @feature_name varchar(50),
  @feature_description varchar(80)
  
  
AS 
BEGIN 
    Begin Try
	 SET NOCOUNT ON 
	 Begin Transaction
 INSERT INTO [dbo].[feature]
           ([feature_id],
          [feature_name],
		  [feature_description]
		  )
           
     VALUES
           ( 
		   @feature_id  , 
           @feature_name,
		   @feature_description
       
            )
	Commit Transaction
	End Try
	Begin Catch
	Rollback Transaction
	Select
	   ERROR_NUMBER() as ErrorNumber,
	   ERROR_MESSAGE() as ErrorMessage,
	   ERROR_PROCEDURE() as ErrorProcedure,
	   ERROR_STATE() as ErrorState,
	   ERROR_SEVERITY() as ErrorSeverity,
	   ERROR_LINE() as ErrorLine
	END Catch
 END
 
GO
/****** Object:  StoredProcedure [dbo].[feature_report]    Script Date: 5/2/2016 6:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[feature_report]

@version_name varchar(90)

AS
Begin
    
 declare  @result int 
SELECT @result=COUNT (feature_name ) 
FROM version_feature
INNER JOIN feature
ON version_feature.feature_id=feature.feature_id
INNER JOIN version
ON version_feature.version_id=version.version_id
WHERE version_name = @version_name 
if(@result<>0)
	print   'For '+ @version_name ++ 'There are '+ CAST(@result AS VARCHAR) +   ' new features';

declare  @Fresult int;


SELECT @Fresult=COUNT (release_feature.feature_id ) 
FROM release_feature
INNER JOIN feature
ON release_feature.feature_id=release_feature.feature_id
INNER JOIN [version_feature]
ON version_feature.feature_id=feature.feature_id
INNER JOIN [version]
ON version_feature.version_id=[version].version_id
WHERE version_name = @version_name AND release_feature.feature_id LIKE'%bug%'

 
print 'r'+ CAST(@Fresult AS VARCHAR);
END
GO
/****** Object:  StoredProcedure [dbo].[product_version]    Script Date: 5/2/2016 6:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[product_version]
@product_id int,
@product_name varchar(50),
@version_id int,
@version_name varchar(90)

AS 
BEGIN 
    Begin Try
	 SET NOCOUNT ON 
	 Begin Transaction
--updates
update A  
set A.product_name= @product_name
from product A inner join version B
on B.product_id = A.product_id 
and A.product_id  = @product_id 


update B
set B.version_name = @version_name
from version B inner join product A
    on B.product_id = A.product_id 
    and A.product_id  = @product_id 
	WHERE B.version_id=@version_id


Commit Transaction
	End Try
	Begin Catch
	Rollback Transaction
	Select
	   ERROR_NUMBER() as ErrorNumber,
	   ERROR_MESSAGE() as ErrorMessage,
	   ERROR_PROCEDURE() as ErrorProcedure,
	   ERROR_STATE() as ErrorState,
	   ERROR_SEVERITY() as ErrorSeverity,
	   ERROR_LINE() as ErrorLine
	END Catch
 END

GO
