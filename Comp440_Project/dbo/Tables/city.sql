CREATE TABLE [dbo].[city] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [city]       VARCHAR (50) NULL,
    [country_id] INT          NULL,
    CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_city_countryid] FOREIGN KEY ([country_id]) REFERENCES [dbo].[country] ([id])
);

