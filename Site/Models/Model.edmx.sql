
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/23/2017 16:14:18
-- Generated from EDMX file: C:\Users\fmunh\OneDrive\Documentos\GitHub\sistema-gestao-conhecimento\Site\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [sgc_];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Celular] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tarefas'
CREATE TABLE [dbo].[Tarefas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(max)  NOT NULL,
    [DataInicio] datetime  NOT NULL,
    [DataFim] datetime  NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL,
    [Projeto_Id] int  NOT NULL
);
GO

-- Creating table 'Competencias'
CREATE TABLE [dbo].[Competencias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(max)  NOT NULL,
    [Tempo] smallint  NOT NULL,
    [Tarefa_Id] int  NULL,
    [Analista_Id] int  NULL
);
GO

-- Creating table 'Avaliacaos'
CREATE TABLE [dbo].[Avaliacaos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Texto] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Projetoes'
CREATE TABLE [dbo].[Projetoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(max)  NOT NULL,
    [DataInicio] datetime  NOT NULL,
    [DataFim] datetime  NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL,
    [Gerente1_Id] int  NOT NULL
);
GO

-- Creating table 'Avaliacaos_AvalTarefa'
CREATE TABLE [dbo].[Avaliacaos_AvalTarefa] (
    [Id] int  NOT NULL,
    [Tarefa_Id] int  NOT NULL
);
GO

-- Creating table 'Usuarios_Analista'
CREATE TABLE [dbo].[Usuarios_Analista] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Avaliacaos_AvalAnalista'
CREATE TABLE [dbo].[Avaliacaos_AvalAnalista] (
    [Id] int  NOT NULL,
    [Analista_Id] int  NOT NULL,
    [Gerente1_Id] int  NOT NULL
);
GO

-- Creating table 'Usuarios_Gerente'
CREATE TABLE [dbo].[Usuarios_Gerente] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Usuarios_Administrador'
CREATE TABLE [dbo].[Usuarios_Administrador] (
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tarefas'
ALTER TABLE [dbo].[Tarefas]
ADD CONSTRAINT [PK_Tarefas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Competencias'
ALTER TABLE [dbo].[Competencias]
ADD CONSTRAINT [PK_Competencias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Avaliacaos'
ALTER TABLE [dbo].[Avaliacaos]
ADD CONSTRAINT [PK_Avaliacaos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projetoes'
ALTER TABLE [dbo].[Projetoes]
ADD CONSTRAINT [PK_Projetoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Avaliacaos_AvalTarefa'
ALTER TABLE [dbo].[Avaliacaos_AvalTarefa]
ADD CONSTRAINT [PK_Avaliacaos_AvalTarefa]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios_Analista'
ALTER TABLE [dbo].[Usuarios_Analista]
ADD CONSTRAINT [PK_Usuarios_Analista]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Avaliacaos_AvalAnalista'
ALTER TABLE [dbo].[Avaliacaos_AvalAnalista]
ADD CONSTRAINT [PK_Avaliacaos_AvalAnalista]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios_Gerente'
ALTER TABLE [dbo].[Usuarios_Gerente]
ADD CONSTRAINT [PK_Usuarios_Gerente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios_Administrador'
ALTER TABLE [dbo].[Usuarios_Administrador]
ADD CONSTRAINT [PK_Usuarios_Administrador]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Tarefa_Id] in table 'Competencias'
ALTER TABLE [dbo].[Competencias]
ADD CONSTRAINT [FK_TarefaCompetencia]
    FOREIGN KEY ([Tarefa_Id])
    REFERENCES [dbo].[Tarefas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TarefaCompetencia'
CREATE INDEX [IX_FK_TarefaCompetencia]
ON [dbo].[Competencias]
    ([Tarefa_Id]);
GO

-- Creating foreign key on [Tarefa_Id] in table 'Avaliacaos_AvalTarefa'
ALTER TABLE [dbo].[Avaliacaos_AvalTarefa]
ADD CONSTRAINT [FK_TarefaAvalTarefa]
    FOREIGN KEY ([Tarefa_Id])
    REFERENCES [dbo].[Tarefas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TarefaAvalTarefa'
CREATE INDEX [IX_FK_TarefaAvalTarefa]
ON [dbo].[Avaliacaos_AvalTarefa]
    ([Tarefa_Id]);
GO

-- Creating foreign key on [Analista_Id] in table 'Competencias'
ALTER TABLE [dbo].[Competencias]
ADD CONSTRAINT [FK_AnalistaCompetencia]
    FOREIGN KEY ([Analista_Id])
    REFERENCES [dbo].[Usuarios_Analista]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnalistaCompetencia'
CREATE INDEX [IX_FK_AnalistaCompetencia]
ON [dbo].[Competencias]
    ([Analista_Id]);
GO

-- Creating foreign key on [Analista_Id] in table 'Avaliacaos_AvalAnalista'
ALTER TABLE [dbo].[Avaliacaos_AvalAnalista]
ADD CONSTRAINT [FK_AnalistaAvalAnalista]
    FOREIGN KEY ([Analista_Id])
    REFERENCES [dbo].[Usuarios_Analista]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnalistaAvalAnalista'
CREATE INDEX [IX_FK_AnalistaAvalAnalista]
ON [dbo].[Avaliacaos_AvalAnalista]
    ([Analista_Id]);
GO

-- Creating foreign key on [Projeto_Id] in table 'Tarefas'
ALTER TABLE [dbo].[Tarefas]
ADD CONSTRAINT [FK_ProjetoTarefa]
    FOREIGN KEY ([Projeto_Id])
    REFERENCES [dbo].[Projetoes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjetoTarefa'
CREATE INDEX [IX_FK_ProjetoTarefa]
ON [dbo].[Tarefas]
    ([Projeto_Id]);
GO

-- Creating foreign key on [Gerente1_Id] in table 'Projetoes'
ALTER TABLE [dbo].[Projetoes]
ADD CONSTRAINT [FK_Gerente1Projeto]
    FOREIGN KEY ([Gerente1_Id])
    REFERENCES [dbo].[Usuarios_Gerente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Gerente1Projeto'
CREATE INDEX [IX_FK_Gerente1Projeto]
ON [dbo].[Projetoes]
    ([Gerente1_Id]);
GO

-- Creating foreign key on [Gerente1_Id] in table 'Avaliacaos_AvalAnalista'
ALTER TABLE [dbo].[Avaliacaos_AvalAnalista]
ADD CONSTRAINT [FK_Gerente1AvalAnalista]
    FOREIGN KEY ([Gerente1_Id])
    REFERENCES [dbo].[Usuarios_Gerente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Gerente1AvalAnalista'
CREATE INDEX [IX_FK_Gerente1AvalAnalista]
ON [dbo].[Avaliacaos_AvalAnalista]
    ([Gerente1_Id]);
GO

-- Creating foreign key on [Id] in table 'Avaliacaos_AvalTarefa'
ALTER TABLE [dbo].[Avaliacaos_AvalTarefa]
ADD CONSTRAINT [FK_AvalTarefa_inherits_Avaliacao]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Avaliacaos]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Usuarios_Analista'
ALTER TABLE [dbo].[Usuarios_Analista]
ADD CONSTRAINT [FK_Analista_inherits_Usuario]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Avaliacaos_AvalAnalista'
ALTER TABLE [dbo].[Avaliacaos_AvalAnalista]
ADD CONSTRAINT [FK_AvalAnalista_inherits_Avaliacao]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Avaliacaos]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Usuarios_Gerente'
ALTER TABLE [dbo].[Usuarios_Gerente]
ADD CONSTRAINT [FK_Gerente_inherits_Usuario]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Usuarios_Administrador'
ALTER TABLE [dbo].[Usuarios_Administrador]
ADD CONSTRAINT [FK_Administrador_inherits_Usuario]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------