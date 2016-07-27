CREATE TABLE [dbo].[version] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [title]           VARCHAR (25) NOT NULL,
    [date_of_release] DATETIME     NULL,
    CONSTRAINT [PK_version] PRIMARY KEY CLUSTERED ([id] ASC)
);

