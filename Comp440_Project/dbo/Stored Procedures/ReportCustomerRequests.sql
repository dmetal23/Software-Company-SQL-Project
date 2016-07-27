USE [s16guest36]
GO

/****** Object:  StoredProcedure [dbo].[ReportCustomerRequests]    Script Date: 5/6/2016 2:31:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Rojas
-- Create date: May 1st, 2016
-- Description:	Reports requests for products and their versions per month
-- =============================================
CREATE PROCEDURE [dbo].[ReportCustomerRequests] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	CREATE TABLE #FormatMonth(NameOfProduct varchar(50), MajorVersionNumber tinyint, MinorVersionNumber tinyint, MonthRequested varchar(7), CustomerRequestID int)
	CREATE TABLE #RequestsPerMonth(NameOfProduct varchar(50), MajorVersionNumber tinyint, MinorVersionNumber tinyint, MonthRequested varchar(7), RequestCount smallint)

	INSERT INTO #FormatMonth --Temporary table in order to group by month
	SELECT DISTINCT Product.NameOfProduct, 
					Version.MajorVersionNumber, 
					Version.MinorVersionNumber, 
					CONVERT(varchar(7), CustomerRequest.DateOfRequest), --cuts off the last 3 characters in a Date, leaving only YYYY-MM
					CustomerRequest.CustomerRequestID
	FROM CustomerRequest
	INNER JOIN CustomerRelease
	ON CustomerRequest.CustomerReleaseID = CustomerRelease.CustomerReleaseID
	INNER JOIN Version
	ON CustomerRelease.VersionID = Version.VersionID
	INNER JOIN Product
	ON CustomerRelease.ProductID = Product.ProductID
	GROUP BY Product.NameOfProduct, Version.MajorVersionNumber, Version.MinorVersionNumber, CustomerRequest.DateOfRequest, CustomerRequest.CustomerRequestID


	INSERT INTO #RequestsPerMonth
	SELECT DISTINCT #FormatMonth.NameOfProduct, 
					#FormatMonth.MajorVersionNumber, 
					#FormatMonth.MinorVersionNumber, 
					#FormatMonth.MonthRequested, 
					COUNT(CustomerRequest.CustomerRequestID) --Count the number of requests per month
	FROM #FormatMonth
	INNER JOIN CustomerRequest
	ON #FormatMonth.CustomerRequestID = CustomerRequest.CustomerRequestID
	GROUP BY #FormatMonth.NameOfProduct, #FormatMonth.MajorVersionNumber, #FormatMonth.MinorVersionNumber, #FormatMonth.MonthRequested

	SELECT * FROM #RequestsPerMonth

	DROP TABLE #FormatMonth
	DROP TABLE #RequestsPerMonth

END


GO

