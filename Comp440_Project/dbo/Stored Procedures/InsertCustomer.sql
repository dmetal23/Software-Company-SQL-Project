USE [s16guest36]
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 5/1/2016 10:27:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Rojas
-- Create date: May 1st, 2016
-- Description:	Inserts data for a Customer entity
-- =============================================
CREATE PROCEDURE [dbo].[InsertCustomer] 
	-- Add the parameters for the stored procedure here
	@NewFirstName varchar(50) = NULL,
	@NewLastName varchar(50) = NULL,
	@NewEmail varchar(75) = NULL, 
	@NewCompanyName varchar(75) = NULL --must know the customer's associated company in order to assign this customer their CompanyID
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @NewCompanyID int

	SELECT @NewCompanyID = CompanyID FROM Company       --check if the company already exists
	WHERE CompanyName = @NewCompanyName

	IF @NewCompanyID IS NULL  --NULL indicates that a company with that name does not yet exist
	BEGIN

	PRINT 'The company ' + @NewCompanyName + ' does not yet exist, creating a new company record.'
	EXEC InsertCompany @CompanyName = @NewCompanyName   --create a new company record
	SELECT @NewCompanyID = CompanyID FROM Company       --retrieve the newly created CompanyID
	WHERE CompanyName = @NewCompanyName

	END
	
	INSERT INTO Customer(FirstName, LastName, Email, CompanyID)
	VALUES (@NewFirstName, @NewLastName, @NewEmail, @NewCompanyID);
	-- Insert statements for procedure here

	SELECT * FROM Customer
END


GO

