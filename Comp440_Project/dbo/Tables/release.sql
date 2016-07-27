CREATE TABLE [dbo].[release] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [branch_id]       INT           NOT NULL,
    [version_id]      INT           NOT NULL,
    [download_link]   VARCHAR (100) NOT NULL,
    [date_of_release] DATETIME      NULL,
    CONSTRAINT [PK_release] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_release_branch] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[branch] ([id])
);

