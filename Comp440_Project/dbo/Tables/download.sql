CREATE TABLE [dbo].[download] (
    [customer_id]   INT           NULL,
    [release_id]    INT           NULL,
    [version_id]    INT           NULL,
    [features_id]   INT           NULL,
    [download_link] VARCHAR (100) NOT NULL,
    CONSTRAINT [FK_download_customer] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customer] ([id]),
    CONSTRAINT [FK_download_features] FOREIGN KEY ([features_id]) REFERENCES [dbo].[feature] ([id]),
    CONSTRAINT [FK_download_release] FOREIGN KEY ([release_id]) REFERENCES [dbo].[release] ([id]),
    CONSTRAINT [FK_download_version] FOREIGN KEY ([version_id]) REFERENCES [dbo].[version] ([id])
);

