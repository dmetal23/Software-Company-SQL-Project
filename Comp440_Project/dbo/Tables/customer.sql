CREATE TABLE [dbo].[customer] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [first_name] VARCHAR (45) NULL,
    [last_name]  VARCHAR (45) NULL,
    [address_id] INT          NULL,
    [user_id]    INT          NOT NULL,
    CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_customer_address] FOREIGN KEY ([address_id]) REFERENCES [dbo].[address] ([id]),
    CONSTRAINT [FK_customer_userid] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id])
);

