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
      --,[ClusterSocVend] ??
      --,[ModoPagamento]
	  ,[Permanenza]
      ,[ConsumoMedio_annuo]
      ,[ConsumoTotale]
      --,[MargineFissoQF_annuo]
      ,[MargineFissoTotale]
      --,[MargineVariabileQV]
      --,[MargineVariabileQV_annuo]
      --,[MargineVariabileTotale]
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

 

