CREATE TABLE [dbo].[Befizetesek] (
    [Datum]                DATE          NULL,
    [BefizetesekOssz]   NVARCHAR(50) NULL,
    [KezelesiKoltseg]   NVARCHAR(50) NULL,
    [RendelkezesreAllo] NVARCHAR(50) NULL,
    [GazdiID]           INT NULL,
    CONSTRAINT [FK_Befizetesek_Gazdik] FOREIGN KEY ([GazdiID]) REFERENCES [dbo].[Gazdik] ([GazdiID])
)
