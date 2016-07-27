CREATE TABLE [dbo].[product_category] (
    [product_id] INT          IDENTITY (1, 1) NOT NULL,
    [category]   VARCHAR (25) NULL,
    CONSTRAINT [FK_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([id])
);

