USE [s16guest36]
GO

/****** Object:  StoredProcedure [dbo].[InsertCompany]    Script Date: 5/1/2016 4:22:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Rojas
-- Create date: May 1st, 2016
-- Description:	Inserts data for a Company entity
-- =============================================
CREATE PROCEDURE [dbo].[InsertCompany] 
	-- Add the parameters for the stored procedure here
	@CompanyName varchar(75) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Company(CompanyName)
	VALUES (@CompanyName);
	-- Insert statements for procedure here

	SELECT @CompanyName
END

GO

