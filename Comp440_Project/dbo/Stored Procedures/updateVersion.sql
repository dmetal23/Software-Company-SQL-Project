USE [s16guest36]
GO

/****** Object:  StoredProcedure [dbo].[UpdateVersion]    Script Date: 5/2/2016 1:15:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Rojas
-- Create date: May 1st, 2016
-- Description:	Updates the version number for a Version record
-- =============================================
CREATE PROCEDURE [dbo].[UpdateVersion] 
	-- Add the parameters for the stored procedure here
	@TargetNameOfProduct varchar(50),  --name of the product associated with the version
	@TargetVersionNumber varchar(7), --the version number of the version you wish to update
	@NewVersionNumber varchar(7) --the version number will be updated to this parameter
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CheckProductExists int,        --used to check whether or not the desired product name exists
			@TargetProductID int,			--ID of the product associated with the version
			@TargetVersionID int,				--ID of the version record being updated
			@MajorVersionNumber varchar(3),		--the first number in the version (for example, 2 is the MajorVersionNumber of 2.1)
			@MinorVersionNumber varchar(3),      --the second number in the version (for example, 1 is the MinorVersionNumber of 2.1)   
			@NewMajorVersionNumber varchar(3),  
			@NewMinorVersionNumber varchar(3)

	SELECT @CheckProductExists = COUNT(1)        --returns a 0 if no record is found, returns a 1 otherwise
	FROM Product
	WHERE UPPER(NameOfProduct) = UPPER(@TargetNameOfProduct)       --utilizes UPPER to ignore case

	IF @CheckProductExists = 0     --if no record was found
		BEGIN
		PRINT 'A Product with the name ' + @TargetNameOfProduct + ' does not exist.'
		RETURN						--exit the procedure
		END

	SELECT @TargetProductID = ProductID   --retrieve the ID of the product associated with the version
	FROM Product
	WHERE UPPER(NameOfProduct) = UPPER(@TargetNameOfProduct)   

	SELECT @MinorVersionNumber = PARSENAME(@TargetVersionNumber, 1) --split the version number strings with the '.' character as a delimiter
	SELECT @MajorVersionNumber = PARSENAME(@TargetVersionNumber, 2) 
	SELECT @NewMinorVersionNumber = PARSENAME(@NewVersionNumber, 1)
	SELECT @NewMajorVersionNumber = PARSENAME(@NewVersionNumber, 2)

	SELECT @TargetVersionID = VersionID --retrieve the ID of the Version record that matches the input parameters
	FROM Version
	WHERE ProductID = @TargetProductID 
	AND MajorVersionNumber = CONVERT(tinyint, @MajorVersionNumber) 
	AND MinorVersionNumber = CONVERT(tinyint, @MinorVersionNumber)


	UPDATE Version          --update to new values 
	SET MajorVersionNumber = CONVERT(tinyint, @NewMajorVersionNumber), 
		MinorVersionNumber = CONVERT(tinyint, @NewMinorVersionNumber)
	WHERE VersionID = @TargetVersionID 

	-- Insert statements for procedure here
	SELECT * FROM Version
END

GO

