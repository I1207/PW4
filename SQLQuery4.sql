select * from [lab10].[DatiConsumi]
;
GO
/*CREATE SCHEMA pw

CREATE PROCEDURE pw.UnpackDatiConsumi
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
DROP COLUMN [Data trasf. in usc.]	-- 
	,[Località]						-- geo non rilevante
	,[Provincia]
	,[Regione Italiana]
	,[zona]
	,[Ind.: Cod.ISTAT Com.]			-- non rilevante, la regione è la stessa
	,[Permanenza (giorni)]			-- fanno tutti almeno 1 mese circa, tranne 2 che hanno fatto 16 e 19 gg
	,[provv diff]					-- sempre 0
	,[Altri ricavi annui]			-- pochi valori, non relazionato/rilevante con il resto 


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