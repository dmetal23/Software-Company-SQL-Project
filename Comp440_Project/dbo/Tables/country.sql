CREATE TABLE [dbo].[country] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [country] VARCHAR (50) NULL,
    CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED ([id] ASC)
);

