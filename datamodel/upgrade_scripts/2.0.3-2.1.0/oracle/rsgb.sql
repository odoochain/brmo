-- 
-- upgrade Oracle RSGB datamodel van 2.0.3 naar 2.1.0
--
WHENEVER SQLERROR EXIT SQL.SQLCODE

-- aanpassen woz tabellen
ALTER TABLE WOZ_DEELOBJ MODIFY NUMMER DECIMAL(12,0);
ALTER TABLE WOZ_DEELOBJ MODIFY DAT_BEG_GELDH_DEELOBJ VARCHAR2(19);
ALTER TABLE WOZ_DEELOBJ MODIFY DATUM_EINDE_GELDH_DEELOBJ VARCHAR2(19);
ALTER TABLE WOZ_DEELOBJ_ARCHIEF MODIFY NUMMER DECIMAL(12,0);
ALTER TABLE WOZ_DEELOBJ_ARCHIEF MODIFY DAT_BEG_GELDH_DEELOBJ VARCHAR2(19);
ALTER TABLE WOZ_DEELOBJ_ARCHIEF MODIFY DATUM_EINDE_GELDH_DEELOBJ VARCHAR2(19);
COMMENT ON COLUMN WOZ_DEELOBJ.NUMMER IS '[PK] N12 - Nummer WOZ-deelobject';
COMMENT ON COLUMN WOZ_DEELOBJ.DATUM_EINDE_GELDH_DEELOBJ is 'OnvolledigeDatum - Datum einde geldigheid deelobject';
COMMENT ON COLUMN WOZ_DEELOBJ_ARCHIEF.NUMMER IS '[PK] N12 - Nummer WOZ-deelobject';
COMMENT ON COLUMN WOZ_DEELOBJ_ARCHIEF.DAT_BEG_GELDH_DEELOBJ is '[PK] OnvolledigeDatum - Datum begin geldigheid deelobject';

-- voeg kolommen toe aan tabel woz_obj
ALTER TABLE WOZ_OBJ ADD WATERSCHAP VARCHAR2(4);
ALTER TABLE WOZ_OBJ ADD FK_VERANTW_GEM_CODE NUMERIC(4,0);
COMMENT ON COLUMN WOZ_OBJ.WATERSCHAP IS 'ligt in waterschap (niet-RSGB)';
COMMENT ON COLUMN WOZ_OBJ.FK_VERANTW_GEM_CODE IS 'verantwoordelijke gemeente (niet-RSGB)';

ALTER TABLE WOZ_OBJ_ARCHIEF ADD WATERSCHAP VARCHAR2(4);
ALTER TABLE WOZ_OBJ_ARCHIEF ADD FK_VERANTW_GEM_CODE NUMERIC(4,0);
COMMENT ON COLUMN WOZ_OBJ_ARCHIEF.WATERSCHAP IS 'ligt in waterschap (niet-RSGB)';
COMMENT ON COLUMN WOZ_OBJ_ARCHIEF.FK_VERANTW_GEM_CODE IS 'verantwoordelijke gemeente (niet-RSGB)';

-- koppeltabel voor onroerende zaak
CREATE TABLE WOZ_OMVAT (
    FK_SC_LH_KAD_IDENTIF NUMBER(15,0) NOT NULL,
    FK_SC_RH_WOZ_NUMMER NUMBER(12,0) NOT NULL,
    TOEGEKENDE_OPP NUMBER(11,0) NULL,
    CONSTRAINT WOZ_OMVAT_PK PRIMARY KEY (FK_SC_LH_KAD_IDENTIF, FK_SC_RH_WOZ_NUMMER)
);
ALTER TABLE WOZ_OMVAT ADD CONSTRAINT FK_WOZ_OMVAT_SC_RH FOREIGN KEY (FK_SC_RH_WOZ_NUMMER) REFERENCES WOZ_OBJ (NUMMER) ON DELETE CASCADE;

COMMENT ON COLUMN WOZ_OMVAT.FK_SC_LH_KAD_IDENTIF IS '[FK] N15, FK naar kad_onrrnd_zk.kad_identif';
COMMENT ON COLUMN WOZ_OMVAT.FK_SC_RH_WOZ_NUMMER IS '[FK] N12, FK naar woz_obj.nummer';
COMMENT ON COLUMN WOZ_OMVAT.TOEGEKENDE_OPP IS 'N12, toegekende oppervlakte';


-- onderstaande dienen als laatste stappen van een upgrade uitgevoerd
INSERT INTO brmo_metadata (naam,waarde) SELECT 'upgrade_2.0.3_naar_2.1.0','vorige versie was ' || waarde FROM brmo_metadata WHERE naam='brmoversie';
-- versienummer update
UPDATE brmo_metadata SET waarde='2.1.0' WHERE naam='brmoversie';