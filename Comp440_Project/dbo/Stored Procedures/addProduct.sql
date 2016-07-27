CREATE PROCEDURE addProduct
/*
 Procedure that adds a Product 
*/
@title varchar(255) , @description text, @version_id int , @release_id int , @cost float 

AS

INSERT INTO [dbo].[product]
           ([title]
		   ,[description]
           ,[version_id]
           ,[release_id]
		   ,[cost])
     VALUES
           (@title,
		   @description,
		   @version_id,
           @release_id,
		   @cost)