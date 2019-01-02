DELETE FROM [dbo].[Margin]

SET IDENTITY_INSERT [dbo].[Margin] ON
INSERT INTO [dbo].[Margin] ([Id], [Name], [Margin]) VALUES (1, N'Standard Labor', 0.45)
INSERT INTO [dbo].[Margin] ([Id], [Name], [Margin]) VALUES (2, N'Custom', 0.65)
SET IDENTITY_INSERT [dbo].[Margin] OFF