select * from [lab10].[DatiConsumi]
;
GO


CREATE SCHEMA pw		--schema per il lavoro della sottoprova finale
;
GO

CREATE SCHEMA try		--schema per il lavoro della sottoprova 2
;
GO

/*-------------------------------------------------------------------------------------------------
                               PULIZIA PRELIMINARE
--------------------------------------------------------------------------------------------------*/


-- Drop colonne non utili ai fini dell'analisi
ALTER TABLE [lab10].[DatiConsumi]
DROP COLUMN 
	 [Data trasf. in usc.]	        -- row scorrette
	,[Ind.: Cod.ISTAT Com.]			-- non rilevante, la regione è la stessa
	,[Permanenza (giorni)]			-- fanno tutti almeno 1 mese circa, tranne 2 che hanno fatto 16 e 19 gg
	,[provv diff]					-- sempre 0
	,[Altri ricavi annui]			-- pochi valori, non relazionato/rilevante con il resto 
	,[Coso annuo G&A]				-- fisso al valore 24.580
	,[Costo annuo personale ESTRA ENERGIE] -- fisso al valore 15.400
	,[Costo annuo approvvigionamento] -- fisso 0.900
	,[Costo annuo Mantenimento (da 2° anno)] -- fisso 3.040



/*-------------------------------------------------------------------------------------------------
                               CREAZIONE VISTE PER EDA & ML
--------------------------------------------------------------------------------------------------*/


CREATE VIEW pw.DatiConsumi_view
as
SELECT
	CAST(REPLACE([Canale],'0','') AS [varchar](5)) as [Canale],
	CAST(REPLACE([Cod Agenzia],'0','') AS [varchar](5)) as [CodAgenzia],
	CAST(REPLACE([Cluster Agenzia],'0','') AS [varchar](5)) as [ClusterAgenzia],
	CAST([Cod contratto] AS [varchar](10)) as [CodContratto],
	CAST(REPLACE([Categoria cespite],'0','') AS [varchar](5)) as [CategoriaCespite],
	CAST(REPLACE([Cespite],'0','') AS [varchar](5)) as [Cespite],
	CAST(REPLACE([Tipologia Utenza],'0','') AS [varchar](5)) as [TipologiaUtenza],
	CAST([Data trasf. in entr.] AS [date]) as [DataTrasf.entr.],
	CAST([Data trasf. in usc. (new)] AS [date]) as [DataTrasf.usc.],
	CAST(REPLACE([Motivo blocco calc.],'0','') AS [varchar](5)) as [MotivoBloccoCalc.],
	CAST(REPLACE([Età Anagrafica],'0','') AS [varchar](5)) as [Anagrafica],
	CAST(REPLACE([Settore merceologico],'0','') AS [varchar](5)) as [SettoreMerceologico],
	CAST(REPLACE([Listino Proposto],'0','') AS [varchar](5)) as [ListinoProposto],
	CAST(REPLACE([Soc. Vend. Prec.],'0','') AS [varchar](5)) as [Soc.Vend.Prec.],
	CAST(REPLACE([Cluster Soc Vend],'0','') AS [varchar](5)) as [ClusterSocVend],
	CAST(REPLACE([Località],'0','') AS [varchar](10)) as [Localita],
	CAST(REPLACE([Ind.: Cod.ISTAT Com.],'0','') AS [varchar](10)) as [Cod.ISTAT] ,
	CAST(REPLACE([Provincia],'0','') AS [varchar](10)) as [Provincia] ,
	CAST(REPLACE([Regione Italiana],'0','') AS [varchar](10)) as [RegioneItaliana] ,
	CAST(REPLACE([zona],'0','') AS [varchar](10)) as  [Zona],
	CAST(REPLACE([Modalità di pagamento],'0','') AS [varchar](5)) as [ModoPagamento],
	CAST([Permanenza (mesi)] AS float ) as [Permanenza],
	CAST([Consumo medio annuo] AS float) as [ConsumoMedio_annuo],
	CAST([Consumo totale] AS float ) as [ConsumoTotale],
	CAST([Margine fisso QF annua] AS float ) as [MargineFissoQF_annuo],
	CAST([Margine fisso totale] AS float) as [MargineFissoTotale],
	CAST([Margine variabile QV] AS float ) as [MargineVariabileQV],
	CAST([Margine variabile QV annuo] AS float ) as [MargineVariabileQV_annuo],
	CAST([Margine variabile totale] AS float) as [MargineVariabileTotale],
	CAST([Margine totale] AS float ) as [MargineTotale],
	CAST([Provvigioni (€/swin)] AS float ) as [Provvigioni],
	CAST([Acquisizione] AS float ) as [Acquisizione],
	CAST([Costo annuo Post-vendita e Customer care] AS float ) as [CostoAnnuo_Post-vendita_Customer-care],
	CAST([Reddito totale] AS float) as [Reddito totale],
	CAST([Mese 1] AS float  ) as Mese01,
	CAST([Mese 2] AS float  ) as Mese02,
	CAST([Mese 3]  AS float ) as Mese03,
	CAST([Mese 4]  AS float ) as Mese04,
	CAST([Mese 5]  AS float ) as Mese05,
	CAST([Mese 6]  AS float ) as Mese06,
	CAST([Mese 7]  AS float ) as Mese07,
	CAST([Mese 8]  AS float ) as Mese08,
	CAST([Mese 9]  AS float ) as Mese09,
	CAST([Mese 10] AS float ) as Mese10,
	CAST([Mese 11] AS float ) as Mese11,
	CAST([Mese 12] AS float ) as Mese12,
	CAST([Mese 13] AS float ) as Mese13,
	CAST([Mese 14] AS float ) as Mese14,
	CAST([Mese 15] AS float ) as Mese15,
	CAST([Mese 16] AS float ) as Mese16,
	CAST([Mese 17] AS float ) as Mese17,
	CAST([Mese 18] AS float ) as Mese18,
	CAST([Mese 19] AS float ) as Mese19,
	CAST([Mese 20] AS float ) as Mese20,
	CAST([Mese 21] AS float ) as Mese21,
	CAST([Mese 22] AS float ) as Mese22,
	CAST([Mese 23] AS float ) as Mese23,
	CAST([Mese 24] AS float ) as Mese24,
	CAST([Mese 25] AS float ) as Mese25,
	CAST([Mese 26] AS float ) as Mese26,
	CAST([Mese 27] AS float ) as Mese27,
	CAST([Mese 28] AS float ) as Mese28,
	CAST([Mese 29] AS float ) as Mese29,
	CAST([Mese 30] AS float ) as Mese30,
	CAST([Mese 31] AS float ) as Mese31,
	CAST([Mese 32] AS float ) as Mese32,
	CAST([Mese 33] AS float ) as Mese33,
	CAST([Mese 34] AS float ) as Mese34,
	CAST([Mese 35] AS float ) as Mese35,
	CAST([Mese 36] AS float ) as Mese36,
	CAST([Mese 37] AS float ) as Mese37,
	CAST([Mese 38] AS float ) as Mese38,
	CAST([Mese 39] AS float ) as Mese39,
	CAST([Mese 40] AS float ) as Mese40,
	CAST([Mese 41] AS float ) as Mese41,
	CAST([Mese 42] AS float ) as Mese42,
	CAST([Mese 43] AS float ) as Mese43,
	CAST([Mese 44] AS float ) as Mese44,
	CAST([Mese 45] AS float ) as Mese45,
	CAST([Mese 46] AS float ) as Mese46,
	CAST([Mese 47] AS float ) as Mese47,
	CAST([Mese 48] AS float ) as Mese48,
	CAST([Mese 49] AS float ) as Mese49,
	CAST([Mese 50] AS float ) as Mese50,
	CAST([Mese 51] AS float ) as Mese51,
	CAST([Mese 52] AS float ) as Mese52,
	CAST([Mese 53] AS float ) as Mese53,
	CAST([Mese 54] AS float ) as Mese54,
	CAST([Mese 55] AS float ) as Mese55,
	CAST([Mese 56] AS float ) as Mese56,
	CAST([Mese 57] AS float ) as Mese57,
	CAST([Mese 58] AS float ) as Mese58,
	CAST([Mese 59] AS float ) as Mese59,
	CAST([Mese 60] AS float ) as Mese60,
	CAST([Mesi BEP] AS [tinyint]) as MesiBEP,
	CAST([Mesi attivi] AS [tinyint]) as MesiAttivi,
	CAST([Reddito complessivo 5 anni] AS float) as UltimoReddito,
	CASE
	WHEN [BEP] like '%02' THEN 1
	ELSE 0
	END AS BEP
FROM [lab10].[DatiConsumi]

/*-------------------------------------------------------------------------------------------------
                               CREAZIONE VISTE PER POWER BI
--------------------------------------------------------------------------------------------------*/

CREATE VIEW pw.Contratti AS
WITH CTEAS AS(
    SELECT RN = ROW_NUMBER() OVER(PARTITION BY [CodContratto] ORDER BY [CodContratto]),
    * FROM [pw].[DatiConsumi_view])
SELECT  
	   [CodContratto]
	  ,[DataTrasf.entr.]
	  ,[DataTrasf.usc.]
	  ,[CodAgenzia]
      ,[MotivoBloccoCalc.]
	  ,[Cespite]
	  ,CONCAT('G',REPLACE([Provincia],'AT',''),REPLACE([Localita],'AR',''),REPLACE([Cod.ISTAT],'AS',''),REPLACE([RegioneItaliana],'AU',''),REPLACE([Zona],'AV','')) AS IdGeo
      ,[SettoreMerceologico]
      ,[ListinoProposto]
	  ,[Permanenza]
      ,[ConsumoMedio_annuo]
      ,[ConsumoTotale]
      ,[MargineFissoTotale]
      ,[MargineTotale]
      ,[Provvigioni]
      ,[Acquisizione]
      ,[CostoAnnuo_Post-vendita_Customer-care]
      ,[RedditoTotale]
	  ,[MesiBEP]
      ,[MesiAttivi]
      ,[UltimoReddito]
      ,[BEP] 
FROM CTEAS
WHERE RN = 1 
;
GO


CREATE VIEW pw.Cespite as(
select DISTINCT [Cespite],
      [Categoriacespite]
	  from [pw].[DatiConsumi_view]
	  )
	
      

CREATE VIEW pw.Agenzia AS(
	SELECT DISTINCT[CodAgenzia]
      , [Canale]     
  FROM [pw].[DatiConsumi_view]
  )
;
GO


CREATE VIEW pw.Geography AS(
	SELECT  distinct
	CONCAT('G',REPLACE([Provincia],'AT',''),REPLACE([Localita],'AR',''),REPLACE([Cod.ISTAT],'AS',''),REPLACE([RegioneItaliana],'AU',''),REPLACE([Zona],'AV','')) AS IdGeo
      ,[Cod.ISTAT]
      ,[Localita]
	  ,[Provincia]
      ,[RegioneItaliana]
      ,[Zona]
  FROM [pw].[DatiConsumi_view]
) --6841
;
GO


CREATE VIEW pw.FactTable AS( SELECT 
 [CodContratto] 
      ,[Mese01] 
      ,[Mese02] 
      ,[Mese03] 
      ,[Mese04] 
      ,[Mese05] 
      ,[Mese06] 
      ,[Mese07] 
      ,[Mese08]	
      ,[Mese09]	
      ,[Mese10]	
      ,[Mese11]	
      ,[Mese12]	
      ,[Mese13]	
      ,[Mese14]	
      ,[Mese15]	
      ,[Mese16]	
      ,[Mese17]	
      ,[Mese18]	
      ,[Mese19]	
      ,[Mese20]	
      ,[Mese21]	
      ,[Mese22]	
      ,[Mese23]	
      ,[Mese24]	
      ,[Mese25]	
      ,[Mese26]	
      ,[Mese27]	
      ,[Mese28]	
      ,[Mese29]	
      ,[Mese30]	
      ,[Mese31]	
      ,[Mese32]	
      ,[Mese33]	
      ,[Mese34]	
      ,[Mese35]	
      ,[Mese36]	
      ,[Mese37]	
      ,[Mese38]	
      ,[Mese39]	
      ,[Mese40]	
      ,[Mese41]	
      ,[Mese42]	
      ,[Mese43]	
      ,[Mese44]	
      ,[Mese45]	
      ,[Mese46]	
      ,[Mese47]	
      ,[Mese48]	
      ,[Mese49]	
      ,[Mese50]	
      ,[Mese51]	
      ,[Mese52]	
      ,[Mese53]	
      ,[Mese54]	
      ,[Mese55]	
      ,[Mese56]	
      ,[Mese57]	
      ,[Mese58]	
      ,[Mese59]	
      ,[Mese60]	
  FROM [pw].[DatiConsumi_view])
  ;
 GO


 /* CHECK DELLE RIGHE DUPLICATE*/
 select count(*) from [pw].[DatiConsumi_view] --474957
 select count(distinct([CodContratto])) from [pw].[Contratti] --474938

 ;
 GO

