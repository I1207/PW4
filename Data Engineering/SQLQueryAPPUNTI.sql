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
	--,[Località]						-- geo non rilevante
	--,[Provincia]
	--,[Regione Italiana]
	--,[zona]
	,[Ind.: Cod.ISTAT Com.]			-- non rilevante, la regione è la stessa
	--,[Permanenza (giorni)]			-- fanno tutti almeno 1 mese circa, tranne 2 che hanno fatto 16 e 19 gg
	,[provv diff]					-- sempre 0
	,[Altri ricavi annui]			-- pochi valori, non relazionato/rilevante con il resto 
	,[Coso annuo G&A]				-- fisso al valore 24.580
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

--controllo duplicati

select *
  from pw.DatiConsumi_view a
  join ( select CodAgenzia, CodContratto ,count(*) as conteggio
           from  pw.DatiConsumi_view
          group by CodAgenzia, CodContratto 
         having count(*) > 1 ) b
    on a.CodAgenzia = b.CodAgenzia
   and a.CodContratto = b.CodContratto

   -- 10 duplicati, abbiamo fatto screen, non li abbiamo tolti


   -- se la geo è rilevante:
   -- 1 aggiungi colonne su lab 10 dati consumi
   
   -- Aggiungi una colonna chiamata 'NuovaColonna' di tipo DECIMAL senza valori NULL alla tabella 'MiaTabella'
