USE [s16guest36]
GO

/****** Object:  StoredProcedure [dbo].[ReportNewFeatures]    Script Date: 5/1/2016 10:27:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Rojas
-- Create date: May 1st, 2016
-- Description:	Reports new features per CustomerRelease
-- =============================================
CREATE PROCEDURE [dbo].[ReportNewFeatures] 
	-- Add the parameters for the stored procedure here

	@TargetCustomerReleaseID int   --The only parameter to this procedure is the ID of the desired CustomerRelease 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CheckExists int        --used to check whether or not the desired CustomerRelease record exists

	SELECT @CheckExists = COUNT(1)        --returns a 0 if no record is found, returns a 1 otherwise
	FROM CustomerRelease
	WHERE CustomerReleaseID = @TargetCustomerReleaseID

	IF @CheckExists = 0     --if no record was found
		BEGIN
		PRINT 'A Customer Release with an ID of ' + CONVERT(varchar(25), @TargetCustomerReleaseID) + ' does not exist.'
		RETURN
		END

	DECLARE @NewFeaturesCount int

	SELECT @NewFeaturesCount = COUNT(*) 
	FROM Feature 
	WHERE CustomerReleaseID = @TargetCustomerReleaseID AND StatusTypeID = 1 --A StatusTypeID of 1 indicates a "new" feature

	IF @NewFeaturesCount >= 1
		PRINT CONVERT(varchar(25), @NewFeaturesCount) + ' new feature(s) are in this release'

	ELSE 
		PRINT 'This is a bug-fix release. There are no new features.'

	SELECT * 
	FROM Feature
	WHERE CustomerReleaseID = @TargetCustomerReleaseID AND StatusTypeID = 1 --A StatusTypeID of 1 indicates a "new" feature
	-- Insert statements for procedure here

END

GO

