select * from [lab10].[DatiConsumi]
;
GO
CREATE SCHEMA pw
/*
CREATE PROCEDURE pw.UnpackDatiConsumi_sp
as
BEGIN
    INSERT INTO Manufacturer (ManufacturerName)
    SELECT DISTINCT GunManufacturer
    FROM Murder;

    INSERT INTO Gun (ManufacturerId, GunName)
    SELECT DISTINCT mf.ManufacturerId, md.GunName
    FROM Murder md
    JOIN Manufacturer mf ON md.GunManufacturer = mf.ManufacturerName;

    INSERT INTO Villian (VillianName)
    SELECT DISTINCT Villian
    FROM Murder;

    INSERT INTO `Event` (VillianId, GunId, `date`)
    SELECT v.VillianId, g.GunId, md.`date`
    FROM Murder md
    JOIN Manufacturer mf ON md.GunManufacturer = mf.ManufacturerName
    JOIN Gun g ON mf.ManufacturerId = g.ManufacturerId AND md.GunName = g.GunName
    JOIN Villian v ON md.Villian = v.VillianName;
END;;
*/
-- Drop colonne non utili ai fini dell'analisi
ALTER TABLE [lab10].[DatiConsumi]
DROP COLUMN 
	 [Data trasf. in usc.]	        -- row scorrette
	,[Località]						-- geo non rilevante
	,[Provincia]
	,[Regione Italiana]
	,[zona]
	,[Ind.: Cod.ISTAT Com.]			-- non rilevante, la regione è la stessa
	,[Permanenza (giorni)]			-- fanno tutti almeno 1 mese circa, tranne 2 che hanno fatto 16 e 19 gg
	,[provv diff]					-- sempre 0
	,[Altri ricavi annui]			-- pochi valori, non relazionato/rilevante con il resto 
	[Coso annuo G&A]				-- fisso al valore 24.580
	,[Costo annuo personale ESTRA ENERGIE] -- fisso al valore 15.400
	,[Costo annuo approvvigionamento] -- fisso 0.900
	,[Costo annuo Mantenimento (da 2° anno)] -- fisso 3.040


	---
--'Data trasf. in usc.' is not a constraint. Could not drop constraint. 
--See previous errors.

SELECT * FROM sysobjects WHERE name = 'fk_gr_res_resources'

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'fk_gr_res_resources')
BEGIN
  ALTER TABLE [lab10].[DatiConsumi]
  DROP CONSTRAINT fk_gr_res_resources
END;

-- Vediamo la tabella che ci serve
SELECT * FROM [lab10].[DatiConsumi]
	---
-- Cambio Data Type

ALTER TABLE [lab10].[DatiConsumi]
alter column	[Canale] [varchar](10) NULL,
alter column	[Cod Agenzia] [varchar](100) NULL,
alter column	[Cluster Agenzia] [varchar](100) NULL,
alter column	[Cod contratto] [varchar](100) NULL,
alter column	[Categoria cespite] [varchar](100) NULL,
alter column	[Cespite] [varchar](100) NULL,
alter column	[Tipologia Utenza] [varchar](100) NULL,
alter column	[Data trasf. in entr.] [varchar](100) NULL,
alter column	[Data trasf. in usc.] [varchar](100) NULL,
alter column	[Data trasf. in usc. (new)] [varchar](100) NULL,
alter column	[Motivo blocco calc.] [varchar](100) NULL,
alter column	[Età Anagrafica] [varchar](100) NULL,
alter column	[Settore merceologico] [varchar](100) NULL,
alter column	[Listino Proposto] [varchar](100) NULL,
alter column	[Soc. Vend. Prec.] [varchar](100) NULL,
alter column	[Cluster Soc Vend] [varchar](100) NULL,
alter column	[Località] [varchar](100) NULL,
alter column	[Ind.: Cod.ISTAT Com.] [varchar](100) NULL,
alter column	[Provincia] [varchar](100) NULL,
alter column	[Regione Italiana] [varchar](100) NULL,
alter column	[zona] [varchar](100) NULL,
alter column	[Modalità di pagamento] [varchar](100) NULL,
alter column	[Permanenza (giorni)] [numeric](12, 3) NULL,
alter column	[Permanenza (mesi)] [numeric](12, 3) NULL,
alter column	[Consumo medio annuo] [numeric](12, 3) NULL,
alter column	[Consumo totale] [numeric](12, 3) NULL,
alter column	[Margine fisso QF annua] [numeric](12, 3) NULL,
alter column	[Margine fisso totale] [numeric](12, 3) NULL,
alter column	[Margine variabile QV] [numeric](12, 3) NULL,
alter column	[Margine variabile QV annuo] [numeric](12, 3) NULL,
alter column	[Margine variabile totale] [numeric](12, 3) NULL,
alter column	[Margine totale] [numeric](12, 3) NULL,
alter column	[Provvigioni (€/swin)] [numeric](12, 3) NULL,
alter column	[Acquisizione] [numeric](12, 3) NULL,
alter column	[Costo annuo Post-vendita e Customer care] [numeric](12, 3) NULL,
alter column	[Costo annuo Mantenimento (da 2° anno)] [numeric](12, 3) NULL,
alter column	[Costo annuo approvvigionamento] [numeric](12, 3) NULL,
alter column	[Costo annuo personale ESTRA ENERGIE] [numeric](12, 3) NULL,
alter column	[Coso annuo G&A] [numeric](12, 3) NULL,
alter column	[Altri ricavi annui] [numeric](12, 3) NULL,
alter column	[Reddito totale] [numeric](12, 3) NULL,
alter column	[Mese 1] [numeric](12, 3) NULL,
alter column	[Mese 2] [numeric](12, 3) NULL,
alter column	[Mese 3] [numeric](12, 3) NULL,
alter column	[Mese 4] [numeric](12, 3) NULL,
alter column	[Mese 5] [numeric](12, 3) NULL,
alter column	[Mese 6] [numeric](12, 3) NULL,
alter column	[Mese 7] [numeric](12, 3) NULL,
alter column	[Mese 8] [numeric](12, 3) NULL,
alter column	[Mese 9] [numeric](12, 3) NULL,
alter column	[Mese 10] [numeric](12, 3) NULL,
alter column	[Mese 11] [numeric](12, 3) NULL,
alter column	[Mese 12] [numeric](12, 3) NULL,
alter column	[Mese 13] [numeric](12, 3) NULL,
alter column	[Mese 14] [numeric](12, 3) NULL,
alter column	[Mese 15] [numeric](12, 3) NULL,
alter column	[Mese 16] [numeric](12, 3) NULL,
alter column	[Mese 17] [numeric](12, 3) NULL,
alter column	[Mese 18] [numeric](12, 3) NULL,
alter column	[Mese 19] [numeric](12, 3) NULL,
alter column	[Mese 20] [numeric](12, 3) NULL,
alter column	[Mese 21] [numeric](12, 3) NULL,
alter column	[Mese 22] [numeric](12, 3) NULL,
alter column	[Mese 23] [numeric](12, 3) NULL,
alter column	[Mese 24] [numeric](12, 3) NULL,
alter column	[Mese 25] [numeric](12, 3) NULL,
alter column	[Mese 26] [numeric](12, 3) NULL,
alter column	[Mese 27] [numeric](12, 3) NULL,
alter column	[Mese 28] [numeric](12, 3) NULL,
alter column	[Mese 29] [numeric](12, 3) NULL,
alter column	[Mese 30] [numeric](12, 3) NULL,
alter column	[Mese 31] [numeric](12, 3) NULL,
alter column	[Mese 32] [numeric](12, 3) NULL,
alter column	[Mese 33] [numeric](12, 3) NULL,
alter column	[Mese 34] [numeric](12, 3) NULL,
alter column	[Mese 35] [numeric](12, 3) NULL,
alter column	[Mese 36] [numeric](12, 3) NULL,
alter column	[Mese 37] [numeric](12, 3) NULL,
alter column	[Mese 38] [numeric](12, 3) NULL,
alter column	[Mese 39] [numeric](12, 3) NULL,
alter column	[Mese 40] [numeric](12, 3) NULL,
alter column	[Mese 41] [numeric](12, 3) NULL,
alter column	[Mese 42] [numeric](12, 3) NULL,
alter column	[Mese 43] [numeric](12, 3) NULL,
alter column	[Mese 44] [numeric](12, 3) NULL,
alter column	[Mese 45] [numeric](12, 3) NULL,
alter column	[Mese 46] [numeric](12, 3) NULL,
alter column	[Mese 47] [numeric](12, 3) NULL,
alter column	[Mese 48] [numeric](12, 3) NULL,
alter column	[Mese 49] [numeric](12, 3) NULL,
alter column	[Mese 50] [numeric](12, 3) NULL,
alter column	[Mese 51] [numeric](12, 3) NULL,
alter column	[Mese 52] [numeric](12, 3) NULL,
alter column	[Mese 53] [numeric](12, 3) NULL,
alter column	[Mese 54] [numeric](12, 3) NULL,
alter column	[Mese 55] [numeric](12, 3) NULL,
alter column	[Mese 56] [numeric](12, 3) NULL,
alter column	[Mese 57] [numeric](12, 3) NULL,
alter column	[Mese 58] [numeric](12, 3) NULL,
alter column	[Mese 59] [numeric](12, 3) NULL,
alter column	[Mese 60] [numeric](12, 3) NULL,
alter column	[Mesi BEP] [int] NULL,
alter column	[Mesi attivi] [int] NULL,
alter column	[Reddito complessivo 5 anni] [numeric](12, 3) NULL,
alter column	[BEP] [varchar](10) NULL,
alter column	[provv diff] [numeric](12, 3) NULL
)
