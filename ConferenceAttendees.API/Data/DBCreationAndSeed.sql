Create Database ConferenceAttendeeDb;
GO
USE [ConferenceAttendeeDb]
IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE TABLE [Genders] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Genders] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE TABLE [JobRoles] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_JobRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE TABLE [ReferralSources] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_ReferralSources] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE TABLE [Attendees] (
        [Id] uniqueidentifier NOT NULL,
        [FirstName] nvarchar(50) NOT NULL,
        [LastName] nvarchar(50) NOT NULL,
        [EmailAddress] nvarchar(150) NOT NULL,
        [PhoneNumber] nvarchar(14) NOT NULL,
        [CompanyName] nvarchar(150) NOT NULL,
        [ReferralSourceId] uniqueidentifier NOT NULL,
        [JobRoleId] uniqueidentifier NOT NULL,
        [GenderId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Attendees] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Attendees_Genders_GenderId] FOREIGN KEY ([GenderId]) REFERENCES [Genders] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Attendees_JobRoles_JobRoleId] FOREIGN KEY ([JobRoleId]) REFERENCES [JobRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Attendees_ReferralSources_ReferralSourceId] FOREIGN KEY ([ReferralSourceId]) REFERENCES [ReferralSources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Genders]'))
        SET IDENTITY_INSERT [Genders] ON;
    EXEC(N'INSERT INTO [Genders] ([Id], [Name])
    VALUES (''b66910d4-f789-473d-b997-16efabdcb5d3'', N''Female''),
    (''c2a3bf8d-4340-4adc-85a3-a0be30d572f2'', N''Male'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Genders]'))
        SET IDENTITY_INSERT [Genders] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[JobRoles]'))
        SET IDENTITY_INSERT [JobRoles] ON;
    EXEC(N'INSERT INTO [JobRoles] ([Id], [Name])
    VALUES (''0713d4d5-5560-4d36-b1ec-5bca0f52268a'', N''Sales''),
    (''14c05cd3-7064-46b4-9d61-d003942d4c05'', N''Operations''),
    (''825e19cc-89e1-4f7e-86a7-776efe3a403e'', N''Supervisor''),
    (''e42f1629-367f-42b6-b75c-36a391f7816e'', N''Manager'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[JobRoles]'))
        SET IDENTITY_INSERT [JobRoles] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[ReferralSources]'))
        SET IDENTITY_INSERT [ReferralSources] ON;
    EXEC(N'INSERT INTO [ReferralSources] ([Id], [Name])
    VALUES (''1dbdadbb-3175-44bb-a3aa-fc95b6bfd44f'', N''Newspaper Article''),
    (''2930ec25-e259-49d6-be38-930b0c5a07dc'', N''Internet Advertisement''),
    (''5295ecec-bb38-48f0-b6ab-f51ad57d38bd'', N''Television''),
    (''f2118fcd-7413-42f7-b4cc-a2f6089145c4'', N''Other'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[ReferralSources]'))
        SET IDENTITY_INSERT [ReferralSources] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Attendees_GenderId] ON [Attendees] ([GenderId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Attendees_JobRoleId] ON [Attendees] ([JobRoleId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Attendees_ReferralSourceId] ON [Attendees] ([ReferralSourceId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250120163823_InitialCreate'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250120163823_InitialCreate', N'8.0.2');
END;
GO

COMMIT;
GO

