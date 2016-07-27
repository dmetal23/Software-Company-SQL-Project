CREATE TABLE [dbo].[branch] (
    [id]               INT      IDENTITY (1, 1) NOT NULL,
    [date_of_creation] DATETIME NULL,
    CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED ([id] ASC)
);

