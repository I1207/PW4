/****** Object:  Database [db-ai]    Script Date: 20/11/2023 11:08:15 ******/
CREATE DATABASE [db-ai]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [db-ai] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [db-ai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db-ai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db-ai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db-ai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db-ai] SET ARITHABORT OFF 
GO
ALTER DATABASE [db-ai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db-ai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db-ai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db-ai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db-ai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db-ai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db-ai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db-ai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db-ai] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [db-ai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db-ai] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [db-ai] SET  MULTI_USER 
GO
ALTER DATABASE [db-ai] SET ENCRYPTION ON
GO
ALTER DATABASE [db-ai] SET QUERY_STORE = ON
GO
ALTER DATABASE [db-ai] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Schema [lab10]    Script Date: 20/11/2023 11:08:15 ******/
CREATE SCHEMA [lab10]
GO
/****** Object:  Table [lab10].[DatiConsumi]    Script Date: 20/11/2023 11:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab10].[DatiConsumi](
	[Canale] [varchar](100) NULL,
	[Cod Agenzia] [varchar](100) NULL,
	[Cluster Agenzia] [varchar](100) NULL,
	[Cod contratto] [varchar](100) NULL,
	[Categoria cespite] [varchar](100) NULL,
	[Cespite] [varchar](100) NULL,
	[Tipologia Utenza] [varchar](100) NULL,
	[Data trasf. in entr.] [varchar](100) NULL,
	[Data trasf. in usc.] [varchar](100) NULL,
	[Data trasf. in usc. (new)] [varchar](100) NULL,
	[Motivo blocco calc.] [varchar](100) NULL,
	[Età Anagrafica] [varchar](100) NULL,
	[Settore merceologico] [varchar](100) NULL,
	[Listino Proposto] [varchar](100) NULL,
	[Soc. Vend. Prec.] [varchar](100) NULL,
	[Cluster Soc Vend] [varchar](100) NULL,
	[Località] [varchar](100) NULL,
	[Ind.: Cod.ISTAT Com.] [varchar](100) NULL,
	[Provincia] [varchar](100) NULL,
	[Regione Italiana] [varchar](100) NULL,
	[zona] [varchar](100) NULL,
	[Modalità di pagamento] [varchar](100) NULL,
	[Permanenza (giorni)] [numeric](12, 3) NULL,
	[Permanenza (mesi)] [numeric](12, 3) NULL,
	[Consumo medio annuo] [numeric](12, 3) NULL,
	[Consumo totale] [numeric](12, 3) NULL,
	[Margine fisso QF annua] [numeric](12, 3) NULL,
	[Margine fisso totale] [numeric](12, 3) NULL,
	[Margine variabile QV] [numeric](12, 3) NULL,
	[Margine variabile QV annuo] [numeric](12, 3) NULL,
	[Margine variabile totale] [numeric](12, 3) NULL,
	[Margine totale] [numeric](12, 3) NULL,
	[Provvigioni (€/swin)] [numeric](12, 3) NULL,
	[Acquisizione] [numeric](12, 3) NULL,
	[Costo annuo Post-vendita e Customer care] [numeric](12, 3) NULL,
	[Costo annuo Mantenimento (da 2° anno)] [numeric](12, 3) NULL,
	[Costo annuo approvvigionamento] [numeric](12, 3) NULL,
	[Costo annuo personale ESTRA ENERGIE] [numeric](12, 3) NULL,
	[Coso annuo G&A] [numeric](12, 3) NULL,
	[Altri ricavi annui] [numeric](12, 3) NULL,
	[Reddito totale] [numeric](12, 3) NULL,
	[Mese 1] [numeric](12, 3) NULL,
	[Mese 2] [numeric](12, 3) NULL,
	[Mese 3] [numeric](12, 3) NULL,
	[Mese 4] [numeric](12, 3) NULL,
	[Mese 5] [numeric](12, 3) NULL,
	[Mese 6] [numeric](12, 3) NULL,
	[Mese 7] [numeric](12, 3) NULL,
	[Mese 8] [numeric](12, 3) NULL,
	[Mese 9] [numeric](12, 3) NULL,
	[Mese 10] [numeric](12, 3) NULL,
	[Mese 11] [numeric](12, 3) NULL,
	[Mese 12] [numeric](12, 3) NULL,
	[Mese 13] [numeric](12, 3) NULL,
	[Mese 14] [numeric](12, 3) NULL,
	[Mese 15] [numeric](12, 3) NULL,
	[Mese 16] [numeric](12, 3) NULL,
	[Mese 17] [numeric](12, 3) NULL,
	[Mese 18] [numeric](12, 3) NULL,
	[Mese 19] [numeric](12, 3) NULL,
	[Mese 20] [numeric](12, 3) NULL,
	[Mese 21] [numeric](12, 3) NULL,
	[Mese 22] [numeric](12, 3) NULL,
	[Mese 23] [numeric](12, 3) NULL,
	[Mese 24] [numeric](12, 3) NULL,
	[Mese 25] [numeric](12, 3) NULL,
	[Mese 26] [numeric](12, 3) NULL,
	[Mese 27] [numeric](12, 3) NULL,
	[Mese 28] [numeric](12, 3) NULL,
	[Mese 29] [numeric](12, 3) NULL,
	[Mese 30] [numeric](12, 3) NULL,
	[Mese 31] [numeric](12, 3) NULL,
	[Mese 32] [numeric](12, 3) NULL,
	[Mese 33] [numeric](12, 3) NULL,
	[Mese 34] [numeric](12, 3) NULL,
	[Mese 35] [numeric](12, 3) NULL,
	[Mese 36] [numeric](12, 3) NULL,
	[Mese 37] [numeric](12, 3) NULL,
	[Mese 38] [numeric](12, 3) NULL,
	[Mese 39] [numeric](12, 3) NULL,
	[Mese 40] [numeric](12, 3) NULL,
	[Mese 41] [numeric](12, 3) NULL,
	[Mese 42] [numeric](12, 3) NULL,
	[Mese 43] [numeric](12, 3) NULL,
	[Mese 44] [numeric](12, 3) NULL,
	[Mese 45] [numeric](12, 3) NULL,
	[Mese 46] [numeric](12, 3) NULL,
	[Mese 47] [numeric](12, 3) NULL,
	[Mese 48] [numeric](12, 3) NULL,
	[Mese 49] [numeric](12, 3) NULL,
	[Mese 50] [numeric](12, 3) NULL,
	[Mese 51] [numeric](12, 3) NULL,
	[Mese 52] [numeric](12, 3) NULL,
	[Mese 53] [numeric](12, 3) NULL,
	[Mese 54] [numeric](12, 3) NULL,
	[Mese 55] [numeric](12, 3) NULL,
	[Mese 56] [numeric](12, 3) NULL,
	[Mese 57] [numeric](12, 3) NULL,
	[Mese 58] [numeric](12, 3) NULL,
	[Mese 59] [numeric](12, 3) NULL,
	[Mese 60] [numeric](12, 3) NULL,
	[Mesi BEP] [int] NULL,
	[Mesi attivi] [int] NULL,
	[Reddito complessivo 5 anni] [numeric](12, 3) NULL,
	[BEP] [varchar](10) NULL,
	[provv diff] [numeric](12, 3) NULL
) ON [PRIMARY]
GO
ALTER DATABASE [db-ai] SET  READ_WRITE 
GO
