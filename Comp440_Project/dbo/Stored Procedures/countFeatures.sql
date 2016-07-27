CREATE PROCEDURE [dbo].[countFeatures]
/*
 Procedure that counts the number of features in a particular release.  
*/
	
@releaseID int = NULL

AS

BEGIN

	IF NOT EXISTS(SELECT id FROM dbo.Release WHERE id = @releaseID)
		BEGIN 
			PRINT 'This release does not exist.'
		END
	ELSE
		BEGIN
			DECLARE @fCount int
			SELECT @fCount = COUNT(*) FROM Features WHERE Features.id = @releaseID

		IF(fCount>0) 
			PRINT CONVERT(varchar(25),@fCount) + 'new features'.
		ELSE
			PRINT 'It is a bug –fix release. There are no new features'.
		END 
END