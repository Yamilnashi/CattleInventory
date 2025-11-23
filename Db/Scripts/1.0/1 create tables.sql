-- ************************************** [CattleStatus]
CREATE TABLE [CattleStatus]
(
 [StatusCode] tinyint NOT NULL ,
 [StatusName] varchar(50) NOT NULL ,

 CONSTRAINT [PK_1_StatusCode] PRIMARY KEY CLUSTERED ([StatusCode] ASC)
);
GO

-- ************************************** [Cattle]
CREATE TABLE [Cattle]
(
 [CattleId]     int IDENTITY (1, 1) NOT NULL ,
 [StatusCode]   tinyint NOT NULL ,
 [ReceivedDate] datetime2(7) NOT NULL ,
 [IsReadyToShip] bit NOT NULL default('false') ,
 [RowVersion] ROWVERSION NOT NULL ,

 CONSTRAINT [PK_1_CattleId] PRIMARY KEY CLUSTERED ([CattleId] ASC),
 CONSTRAINT [FK_1_CattleStatus_StatusCode] FOREIGN KEY ([StatusCode])  REFERENCES [CattleStatus]([StatusCode])
);
GO

-- ************************************** [ProductType]
CREATE TABLE [ProductType]
(
 [ProductTypeCode] tinyint NOT NULL ,
 [ProductTypeName] varchar(50) NOT NULL ,

 CONSTRAINT [PK_1_ProductTypeCode] PRIMARY KEY CLUSTERED ([ProductTypeCode] ASC)
);
GO


-- ************************************** [BeefProducts]
CREATE TABLE [BeefProducts]
(
 [ProductId]       int NOT NULL ,
 [CattleId]        int NOT NULL ,
 [ProductTypeCode] tinyint NOT NULL ,
 [Quantity]        int NOT NULL ,
 [QualityScore]    tinyint NULL ,

 CONSTRAINT [PK_1_ProductId] PRIMARY KEY CLUSTERED ([ProductId] ASC),
 CONSTRAINT [Index_1_CattleId_ProductTypeCode] UNIQUE NONCLUSTERED ([CattleId] ASC, [ProductTypeCode] ASC),
 CONSTRAINT [FK_1_ProductType_ProductTypeCode] FOREIGN KEY ([ProductTypeCode])  REFERENCES [ProductType]([ProductTypeCode]),
 CONSTRAINT [FK_2_Cattle_CattleId] FOREIGN KEY ([CattleId])  REFERENCES [Cattle]([CattleId])
);
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Cannot have cattle with multiple product types', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BeefProducts', @level2type=N'CONSTRAINT', @level2name=N'Index_1_CattleId_ProductTypeCode';
GO
