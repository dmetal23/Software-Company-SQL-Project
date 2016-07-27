CREATE TABLE [dbo].[product] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [title]       VARCHAR (255) NULL,
    [description] TEXT          NULL,
    [version_id]  INT           NOT NULL,
    [release_id]  INT           NOT NULL,
    [cost]        FLOAT (53)    NULL,
    CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_product_release] FOREIGN KEY ([release_id]) REFERENCES [dbo].[release] ([id]),
    CONSTRAINT [FK_product_version] FOREIGN KEY ([version_id]) REFERENCES [dbo].[version] ([id])
);

