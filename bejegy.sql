CREATE TABLE [dbo].[BejegyzesekKezelesek] (
    [Datum]     DATE  NULL,
    [Diagnozis] VARCHAR (MAX) NULL,
    [Terapia]   VARCHAR (MAX) NULL,
    [AllatID]   INT  NOT NULL,
    CONSTRAINT [FK_BejegyzesekKezelesek_Allatok] FOREIGN KEY ([AllatID]) REFERENCES [dbo].[Allatok] ([AllatID])
);
