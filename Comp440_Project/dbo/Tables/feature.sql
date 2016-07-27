CREATE TABLE [dbo].[feature] (
    [id]                  INT  IDENTITY (1, 1) NOT NULL,
    [version_id]          INT  NULL,
    [new_features]        TEXT NULL,
    [deprecated_features] TEXT NULL,
    CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_features_version] FOREIGN KEY ([version_id]) REFERENCES [dbo].[version] ([id])
);

