CREATE TABLE [dbo].[address] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [street]   VARCHAR (255) NULL,
    [city]     VARCHAR (255) NULL,
    [city_id]  INT           NULL,
    [zip_code] VARCHAR (10)  NULL,
    [state]    VARCHAR (255) NULL,
    CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_address_cityid] FOREIGN KEY ([city_id]) REFERENCES [dbo].[city] ([id])
);

