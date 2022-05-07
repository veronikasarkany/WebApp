CREATE TABLE [dbo].[OltasokKezelesek] (
    [Datum]                    DATE  NULL,
    [EgyebVedooltasokParazita] VARCHAR (MAX) NULL,
    [AllatID]                  INT  NOT NULL,
    CONSTRAINT [FK_OltasokKezelesek_Allatok] FOREIGN KEY ([AllatID]) REFERENCES [dbo].[Allatok] ([AllatID])
);