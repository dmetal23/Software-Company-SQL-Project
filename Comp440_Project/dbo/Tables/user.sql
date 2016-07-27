CREATE TABLE [dbo].[user] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [username] VARCHAR (10) NOT NULL,
    [password] VARCHAR (32) NOT NULL,
    [email]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([id] ASC)
);

