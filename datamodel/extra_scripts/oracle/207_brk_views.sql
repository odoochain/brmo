/*
Views for visualizing the BRK data.
versie 2
28-8-2018
*/
--drop view vb_subject cascade;
--drop view vb_avg_subject cascade;
--drop view vb_util_app_re_splitsing cascade;
--drop view vb_util_app_re_parent_3 cascade;
--drop view vb_util_app_re_parent_2 cascade;
--drop view vb_util_app_re_parent cascade;
--drop view vb_util_app_re_kad_perceel cascade;
--drop view vb_kad_onrrnd_zk_adres cascade;
--drop view vb_subject;
--drop view vb_util_zk_recht cascade;
--drop view vb_zr_rechth cascade;
--drop view vb_avg_zr_rechth cascade;
--drop view vb_koz_rechth cascade;
--drop view vb_avg_koz_rechth cascade;
--drop view vb_kad_onrrnd_zk_archief cascade;

--drop materialized view mb_kad_onrrnd_zk_adres cascade;
--drop materialized view mb_koz_rechth cascade;
--drop materialized view mb_avg_koz_rechth cascade;
--drop materialized view mb_subject cascade;
--drop materialized view mb_avg_subject cascade;
--drop materialized view mb_zr_rechth cascade;
--drop materialized view mb_avg_zr_rechth cascade;

--DROP INDEX mb_avg_koz_rechth_objectid cascade;
--DROP INDEX mb_avg_koz_rechth_identif cascade;
--DROP INDEX mb_avg_koz_rechth_begrenzing_perceel_idx cascade;
--DROP INDEX mb_koz_rechth_objectid cascade;
--DROP INDEX mb_koz_rechth_identif cascade;
--DROP INDEX mb_koz_rechth_begrenzing_perceel_idx cascade;
--DROP INDEX mb_avg_zr_rechth_objectid cascade;
--DROP INDEX mb_avg_zr_rechth_identif cascade;
--DROP INDEX mb_zr_rechth_objectid cascade;
--DROP INDEX mb_zr_rechth_identif cascade;
--DROP INDEX mb_kad_onrrnd_zk_adres_objectid cascade;
--DROP INDEX mb_kad_onrrnd_zk_adres_identif cascade;
--DROP INDEX mb_kad_onrrnd_zk_adres_begrenzing_perceel_idx cascade;
--DROP INDEX mb_avg_subject_objectid cascade;
--DROP INDEX mb_avg_subject_identif cascade;
--DROP INDEX mb_subject_objectid cascade;
--DROP INDEX mb_subject_identif cascade;

--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_kad_onrrnd_zk_adres', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_koz_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_avg_koz_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_avg_zr_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_zr_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_subject', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_avg_subject', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'vb_kad_onrrnd_zk_archief', 'objectid', 'assigned');

--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_kad_onrrnd_zk_adres', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_koz_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_avg_koz_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_avg_zr_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_zr_rechth', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_subject', 'objectid', 'assigned');
--INSERT INTO gt_pk_metadata (table_schema, table_name, pk_column, pk_policy) VALUES ('RSGB', 'mb_avg_subject', 'objectid', 'assigned');

--BEGIN
--DBMS_SNAPSHOT.REFRESH( 'mb_subject','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_avg_subject','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_kad_onrrnd_zk_adres','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_zr_rechth','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_avg_zr_rechth','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_koz_rechth','c'); 
--DBMS_SNAPSHOT.REFRESH( 'mb_avg_koz_rechth','c'); 
--END

alter session set query_rewrite_integrity=stale_tolerated;

--drop view vb_subject cascade;
CREATE OR REPLACE VIEW
    vb_subject
    (
        objectid,
        subject_identif,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER)         AS objectid,
    s.identif                       AS subject_identif,
    s.clazz                         AS soort,
    np.nm_geslachtsnaam             AS geslachtsnaam,
    np.nm_voorvoegsel_geslachtsnaam AS voorvoegsel,
    np.nm_voornamen                 AS voornamen,
    np.aand_naamgebruik,
    CASE
        WHEN ((np.geslachtsaand) = '1')
        THEN CAST('M' AS CHARACTER VARYING(1))
        WHEN ((np.geslachtsaand) = '2')
        THEN CAST('V' AS CHARACTER VARYING(1))
        ELSE np.geslachtsaand
    END AS geslachtsaand,
    CASE
        WHEN (nnp.naam IS NOT NULL)
        THEN CAST(nnp.naam AS CHARACTER VARYING(1000))
        ELSE CAST(
                        ((
                        ((COALESCE(np.nm_voornamen, CAST('' AS CHARACTER VARYING(1)) )) || ' ') 
                        ||
                        ((COALESCE(np.nm_voorvoegsel_geslachtsnaam, CAST('' AS CHARACTER VARYING(1))) )) || ' ')
                        || 
                        ((COALESCE(np.nm_geslachtsnaam, CAST('' AS CHARACTER VARYING(1))) ))
            ) AS CHARACTER VARYING(1000))
    END                     AS naam,
    inp.va_loc_beschrijving AS woonadres,
    CASE
        WHEN (((s.clazz) = 'INGESCHREVEN NATUURLIJK PERSOON')
            AND LENGTH(inp.gb_geboortedatum)=8)
        THEN CAST(
                SUBSTR(TO_CHAR(inp.gb_geboortedatum,'99999999'),2,4) || '-' || 
                SUBSTR(TO_CHAR(inp.gb_geboortedatum,'99999999'),6,2) || '-' || 
                SUBSTR(TO_CHAR(inp.gb_geboortedatum,'99999999'),8,2) 
                AS VARCHAR(10))
        WHEN (((s.clazz) = 'ANDER NATUURLIJK PERSOON')
            AND LENGTH(anp.geboortedatum)=8)
        THEN CAST(
                SUBSTR(TO_CHAR(anp.geboortedatum, '99999999'),2,4) || '-' || 
                SUBSTR(TO_CHAR(anp.geboortedatum, '99999999'),6,2) || '-' || 
                SUBSTR(TO_CHAR(anp.geboortedatum, '99999999'),8,2)  
                AS VARCHAR(10))
        WHEN (((s.clazz) = 'INGESCHREVEN NATUURLIJK PERSOON')
            AND LENGTH(inp.gb_geboortedatum)=5)
        THEN CAST('0001-01-01' AS VARCHAR(10))
        WHEN (((s.clazz) = 'ANDER NATUURLIJK PERSOON')
            AND LENGTH(anp.geboortedatum)=5)
        THEN CAST('0001-01-01' AS VARCHAR(10))
        ELSE CAST(NULL AS VARCHAR(10))
    END                   AS geboortedatum,
    inp.gb_geboorteplaats AS geboorteplaats,
     CASE
        WHEN (((s.clazz) = 'INGESCHREVEN NATUURLIJK PERSOON')
            AND LENGTH(inp.ol_overlijdensdatum)=8)
        THEN CAST(
                SUBSTR(TO_CHAR(inp.ol_overlijdensdatum,'99999999'),2,4) || '-' || 
                SUBSTR(TO_CHAR(inp.ol_overlijdensdatum,'99999999'),6,2) || '-' || 
                SUBSTR(TO_CHAR(inp.ol_overlijdensdatum,'99999999'),8,2) 
                AS VARCHAR(10))
        WHEN (((s.clazz) = 'ANDER NATUURLIJK PERSOON')
            AND LENGTH(anp.overlijdensdatum)=8)
        THEN CAST(
                SUBSTR(TO_CHAR(anp.overlijdensdatum, '99999999'),2,4) || '-' || 
                SUBSTR(TO_CHAR(anp.overlijdensdatum, '99999999'),6,2) || '-' || 
                SUBSTR(TO_CHAR(anp.overlijdensdatum, '99999999'),8,2)  
                AS VARCHAR(10))
        WHEN (((s.clazz) = 'INGESCHREVEN NATUURLIJK PERSOON')
            AND LENGTH(inp.ol_overlijdensdatum)=5)
        THEN CAST('0001-01-01' AS VARCHAR(10))
        WHEN (((s.clazz) = 'ANDER NATUURLIJK PERSOON')
            AND LENGTH(anp.overlijdensdatum)=5)
        THEN CAST('0001-01-01' AS VARCHAR(10))
        ELSE CAST(NULL AS VARCHAR(10))
    END AS overlijdensdatum,
    inp.bsn,
    nnp.naam AS organisatie_naam,
    innp.rechtsvorm,
    innp.statutaire_zetel,
    innp.rsin,
    s.kvk_nummer
FROM
    (((((subject s
LEFT JOIN
    nat_prs np
ON
    (((
                s.identif) = (np.sc_identif))))
LEFT JOIN
    ingeschr_nat_prs inp
ON
    (((
                inp.sc_identif) = (np.sc_identif))))
LEFT JOIN
    ander_nat_prs anp
ON
    (((
                anp.sc_identif) = (np.sc_identif))))
LEFT JOIN
    niet_nat_prs nnp
ON
    (((
                nnp.sc_identif) = (s.identif))))
LEFT JOIN
    ingeschr_niet_nat_prs innp
ON
    (((
                innp.sc_identif) = (nnp.sc_identif))));

--drop materialized view mb_subject cascade;
CREATE MATERIALIZED VIEW mb_subject 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_subject;
CREATE UNIQUE INDEX mb_subject_objectid ON mb_subject (objectid ASC);
CREATE INDEX mb_subject_identif ON mb_subject (subject_identif ASC);

COMMENT ON MATERIALIZED VIEW mb_subject
IS 'commentaar view vb_subject:
samenvoeging alle soorten subjecten: natuurlijk en niet-natuurlijk.
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* subject_identif: natuurlijke id van subject      
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: -       
* voorvoegsel: -     
* voornamen: -     
* aand_naamgebruik:        
- E (= Eigen geslachtsnaam)        
- N (=Geslachtsnaam echtgenoot/geregistreerd partner na eigen geslachtsnaam)        
- P (= Geslachtsnaam echtgenoot/geregistreerd partner)        
- V (= Geslachtsnaam evhtgenoot/geregistreerd partner voor eigen geslachtsnaam)        
* geslachtsaand: M/V   
* naam: samengestelde naam bruikbaar voor natuurlijke en niet-natuurlijke subjecten
* woonadres: meegeleverd adres buiten BAG koppeling om      
* geboortedatum: -       
* geboorteplaats: -       
* overlijdensdatum: -       
* bsn: -       
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -';

--drop view vb_avg_subject cascade;
CREATE OR REPLACE VIEW
    vb_avg_subject
    (
        objectid,
        subject_identif,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer
    ) AS
SELECT
    s.objectid,
    s.subject_identif as subject_identif,
    s.soort,
    CAST(NULL AS CHARACTER VARYING(1)) AS geslachtsnaam,
    CAST(NULL AS CHARACTER VARYING(1)) AS voorvoegsel,
    CAST(NULL AS CHARACTER VARYING(1)) AS voornamen,
    CAST(NULL AS CHARACTER VARYING(1)) AS aand_naamgebruik,
    CAST(NULL AS CHARACTER VARYING(1)) AS geslachtsaand,
    s.organisatie_naam AS naam,
    CAST(NULL AS CHARACTER VARYING(1)) AS woonadres,
    CAST(NULL AS CHARACTER VARYING(1)) AS geboortedatum,
    CAST(NULL AS CHARACTER VARYING(1)) AS geboorteplaats,
    CAST(NULL AS CHARACTER VARYING(1)) AS overlijdensdatum,
    CAST(NULL AS CHARACTER VARYING(1)) AS bsn,
    s.organisatie_naam,
    s.rechtsvorm,
    s.statutaire_zetel,
    s.rsin,
    s.kvk_nummer
FROM
    vb_subject s;

--drop materialized view mb_avg_subject cascade;
CREATE MATERIALIZED VIEW mb_avg_subject 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_avg_subject;
CREATE UNIQUE INDEX mb_avg_subject_objectid ON mb_avg_subject (objectid ASC);
CREATE INDEX mb_avg_subject_identif ON mb_avg_subject (subject_identif ASC);

COMMENT ON MATERIALIZED VIEW mb_avg_subject
IS 'commentaar view vb_avg_subject:
volledig subject (natuurlijk en niet natuurlijk) geschoond voor avg
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* subject_identif: natuurlijke id van subject      
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: NULL (avg)       
* voorvoegsel: NULL (avg)      
* voornamen: NULL (avg)       
* aand_naamgebruik: NULL (avg)         
* geslachtsaand:NULL (avg)     
* naam: gelijk aan organisatie_naam
* woonadres: NULL (avg)        
* geboortedatum: NULL (avg)        
* geboorteplaats: NULL (avg)        
* overlijdensdatum: NULL (avg)        
* bsn: NULL (avg)         
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -';
    
--Views om kad_perceel bij app_re's op te zoeken (inclusief ondersplitsingen)

--drop view vb_util_app_re_splitsing cascade;
CREATE OR REPLACE VIEW
    vb_util_app_re_splitsing AS
SELECT
    b1.ref_id AS child_identif,
    b2.ref_id AS parent_identif
FROM
    brondocument b1
JOIN
    brondocument b2
ON
    b2.identificatie = b1.identificatie
WHERE
    (
        b2.omschrijving = 'betrokkenBij Ondersplitsing'
    OR  b2.omschrijving = 'betrokkenBij HoofdSplitsing')
AND (
        b1.omschrijving = 'ontstaanUit Ondersplitsing'
    OR  b1.omschrijving = 'ontstaanUit HoofdSplitsing')
GROUP BY
    b1.ref_id,
    b2.ref_id;
    
--drop view vb_util_app_re_parent_3 cascade;
CREATE OR REPLACE VIEW
    vb_util_app_re_parent_3 AS
SELECT
    cast(re.sc_kad_identif AS CHARACTER VARYING(50)) AS app_re_identif,
    sp.parent_identif
FROM
    app_re re
LEFT JOIN
    vb_util_app_re_splitsing sp
ON
    cast(re.sc_kad_identif AS CHARACTER VARYING(50)) = sp.child_identif
GROUP BY
    re.sc_kad_identif,
    sp.parent_identif;

--drop view vb_util_app_re_parent_2 cascade;
CREATE OR REPLACE VIEW
    vb_util_app_re_parent_2 AS
SELECT
    u1.app_re_identif,
    CASE
        WHEN sp.parent_identif IS NULL
        THEN u1.parent_identif
        ELSE sp.parent_identif
    END AS parent_identif
FROM
    vb_util_app_re_parent_3 u1
LEFT JOIN
    vb_util_app_re_splitsing sp
ON
    u1.parent_identif = sp.child_identif;

--drop view vb_util_app_re_parent cascade;
CREATE OR REPLACE VIEW
    vb_util_app_re_parent AS
SELECT
    u2.app_re_identif,
    CASE
        WHEN sp.parent_identif IS NULL
        THEN u2.parent_identif
        ELSE sp.parent_identif
    END AS parent_identif
FROM
    vb_util_app_re_parent_2 u2
LEFT JOIN
    vb_util_app_re_splitsing sp
ON
    u2.parent_identif = sp.child_identif;

--drop view vb_util_app_re_kad_perceel cascade;
CREATE OR REPLACE VIEW
    vb_util_app_re_kad_perceel AS
SELECT
    u1.app_re_identif,
    kp.sc_kad_identif AS perceel_identif
FROM
    vb_util_app_re_parent u1
JOIN
    kad_perceel kp
ON
    u1.parent_identif = cast(kp.sc_kad_identif AS CHARACTER VARYING(50))
GROUP BY
    u1.app_re_identif,
    kp.sc_kad_identif;
        
--drop view vb_kad_onrrnd_zk_adres cascade;
CREATE OR REPLACE VIEW
    vb_kad_onrrnd_zk_adres
    (
        objectid,
        koz_identif,
        begin_geldigheid,
        benoemdobj_identif,
        type,
        aanduiding,
        aanduiding2,
        sectie,
        perceelnummer,
        appartementsindex,
        gemeentecode,
        aand_soort_grootte,
        grootte_perceel,
        oppervlakte_geom,
        deelperceelnummer,
        omschr_deelperceel,
        verkoop_datum,
        aard_cultuur_onbebouwd,
        bedrag,
        koopjaar,
        meer_onroerendgoed,
        valutasoort,
        loc_omschr,
        gemeente,
        woonplaats,
        straatnaam,
        huisnummer,
        huisletter,
        huisnummer_toev,
        postcode,
        lon,
        lat,
        begrenzing_perceel
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    qry.identif             AS koz_identif,
    koz.dat_beg_geldh AS begin_geldigheid,
    bok.fk_nn_lh_tgo_identif                       AS benoemdobj_identif,
    qry.type,
    COALESCE(qry.ka_sectie, '') || ' ' || COALESCE(qry.ka_perceelnummer, '') AS aanduiding,
    COALESCE(qry.ka_kad_gemeentecode, '') || ' ' || COALESCE(qry.ka_sectie, '') || ' ' || COALESCE
    (qry.ka_perceelnummer, '') || ' ' || COALESCE(qry.ka_appartementsindex, '') AS aanduiding2,
    qry.ka_sectie,
    qry.ka_perceelnummer,
    qry.ka_appartementsindex,
    qry.ka_kad_gemeentecode,
    qry.aand_soort_grootte,
    qry.grootte_perceel,
    CASE 
        WHEN qry.begrenzing_perceel.get_gtype() is not null
        THEN SDO_GEOM.SDO_AREA(qry.BEGRENZING_PERCEEL, 0.1)
        ELSE NULL
    END AS oppervlakte_geom,
    qry.ka_deelperceelnummer,
    qry.omschr_deelperceel,
    b.datum,
    koz.cu_aard_cultuur_onbebouwd,
    koz.ks_bedrag,
    koz.ks_koopjaar,
    koz.ks_meer_onroerendgoed,
    koz.ks_valutasoort,
    koz.lo_loc__omschr,
    bola.gemeente,
    bola.woonplaats,
    bola.straatnaam,
    bola.huisnummer,
    bola.huisletter,
    bola.huisnummer_toev,
    bola.postcode,
    CASE 
--        WHEN qry.begrenzing_perceel.get_gtype() is not null
--        THEN SDO_GEOM.SDO_CENTROID(qry.begrenzing_perceel, 0.1).sdo_point.x
-- https://docs.oracle.com/cd/E11882_01/appdev.112/e11830/sdo_locator.htm#CFACCEEG stelt dat SDO_CS functies in Locator zitten
        WHEN qry.begrenzing_perceel.get_gtype() is not null
        THEN SDO_CS.TRANSFORM(SDO_GEOM.SDO_CENTROID(qry.begrenzing_perceel, 0.1), 4326 ).sdo_point.x
        ELSE NULL
    END AS lon,
    CASE 
--        WHEN qry.begrenzing_perceel.get_gtype() is not null
--        THEN SDO_GEOM.SDO_CENTROID(qry.begrenzing_perceel, 0.1).sdo_point.y
-- https://docs.oracle.com/cd/E11882_01/appdev.112/e11830/sdo_locator.htm#CFACCEEG stelt dat SDO_CS functies in Locator zitten
        WHEN qry.begrenzing_perceel.get_gtype() is not null
        THEN SDO_CS.TRANSFORM(SDO_GEOM.SDO_CENTROID(qry.begrenzing_perceel, 0.1), 4326 ).sdo_point.y
    END AS lat,
    qry.begrenzing_perceel
FROM
    (
        SELECT
            p.sc_kad_identif AS identif,
            'perceel'        AS type,
            p.ka_sectie,
            p.ka_perceelnummer,
            CAST(NULL AS CHARACTER VARYING(4)) AS ka_appartementsindex,
            p.ka_kad_gemeentecode,
            p.aand_soort_grootte,
            p.grootte_perceel,
            p.ka_deelperceelnummer,
            p.omschr_deelperceel,
            p.BEGRENZING_PERCEEL as begrenzing_perceel
        FROM
            kad_perceel p
        UNION ALL
        SELECT
            ar.sc_kad_identif AS identif,
            'appartement'     AS type,
            ar.ka_sectie,
            ar.ka_perceelnummer,
            ar.ka_appartementsindex,
            ar.ka_kad_gemeentecode,
            CAST(NULL AS CHARACTER VARYING(1))    AS aand_soort_grootte,
            CAST(NULL AS NUMERIC(8,0))            AS grootte_perceel,
            CAST(NULL AS CHARACTER VARYING(4))    AS ka_deelperceelnummer,
            CAST(NULL AS CHARACTER VARYING(1120)) AS omschr_deelperceel,
            kp.BEGRENZING_PERCEEL as begrenzing_perceel
        FROM
            ((vb_util_app_re_kad_perceel v
        JOIN
            kad_perceel kp
        ON
            ((
                    CAST(v.perceel_identif AS NUMERIC) = kp.sc_kad_identif)))
        JOIN
            app_re ar
        ON
            ((
                    CAST(v.app_re_identif AS NUMERIC) = ar.sc_kad_identif)))) qry
JOIN
    kad_onrrnd_zk koz
ON
    (
        koz.kad_identif = qry.identif)
LEFT JOIN
    benoemd_obj_kad_onrrnd_zk bok
ON
    (
        bok.fk_nn_rh_koz_kad_identif = qry.identif)
LEFT JOIN
    vb_benoemd_obj_adres bola
ON
    bok.fk_nn_lh_tgo_identif = bola.benoemdobj_identif
LEFT JOIN
    (
        SELECT
            brondocument.ref_id,
            MAX(brondocument.datum) AS datum
        FROM
            brondocument
        WHERE
            ((
                    brondocument.omschrijving) = 'Akte van Koop en Verkoop')
        GROUP BY
            brondocument.ref_id) b
ON
    (
        koz.kad_identif = b.ref_id);

--drop materialized view mb_kad_onrrnd_zk_adres cascade;
CREATE MATERIALIZED VIEW mb_kad_onrrnd_zk_adres 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_kad_onrrnd_zk_adres;
CREATE UNIQUE INDEX MB_KAD_ONRRND_ZK_ADRES_OBJIDX ON MB_KAD_ONRRND_ZK_ADRES(OBJECTID ASC);
CREATE INDEX MB_KAD_ONRRND_ZK_ADRES_IDENTIF ON MB_KAD_ONRRND_ZK_ADRES(KOZ_IDENTIF ASC);
INSERT INTO USER_SDO_GEOM_METADATA VALUES ('MB_KAD_ONRRND_ZK_ADRES', 'BEGRENZING_PERCEEL', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 12000, 280000, .1),MDSYS.SDO_DIM_ELEMENT('Y', 304000, 620000, .1)), 28992);
CREATE INDEX MB_KAD_ONRRND_ZK_ADR_BGRGPIDX ON MB_KAD_ONRRND_ZK_ADRES (BEGRENZING_PERCEEL)  INDEXTYPE IS MDSYS.SPATIAL_INDEX;

COMMENT ON MATERIALIZED VIEW mb_kad_onrrnd_zk_adres
IS 'commentaar view mb_kad_onrrnd_zk_adres:
alle kadastrale onroerende zaken (perceel en appartementsrecht) met opgezochte verkoop datum, objectid voor geoserver/arcgis en BAG adres
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* koz_identif: natuurlijke id van perceel of appartementsrecht      
* begin_geldigheid: datum wanneer dit object geldig geworden is (ontstaat of bijgewerkt),
* benoemdobj_identif: koppeling met BAG object,
* type: perceel of appartement,
* aanduiding: sectie perceelnummer,
* aanduiding2: kadgem sectie perceelnummer appartementsindex,
* sectie: -,
* perceelnummer: -,
* appartementsindex: -,
* gemeentecode: -,
* aand_soort_grootte: -,
* grootte_perceel: -,
* oppervlakte_geom: oppervlakte berekend uit geometrie, hoort gelijk te zijn aan grootte_perceel,
* deelperceelnummer: -,
* omschr_deelperceel: -,
* verkoop_datum: laatste datum gevonden akten van verkoop,
* aard_cultuur_onbebouwd: -,
* bedrag: -,
* koopjaar: -,
* meer_onroerendgoed: -,
* valutasoort: -,
* loc_omschr: adres buiten BAG om meegegeven,
* gemeente: -,
* woonplaats: -,
* straatnaam: -,
* huisnummer: -,
* huisletter: -,
* huisnummer_toev: -,
* postcode: -,
* lon: coordinaat als WSG84,
* lon: coordinaat als WSG84,
* begrenzing_perceel: perceelvlak';    

--drop view vb_util_zk_recht cascade;
CREATE OR REPLACE VIEW
    vb_util_zk_recht
    (
        zr_identif,
        aandeel,
        ar_teller,
        ar_noemer,
        subject_identif,
        koz_identif,
        indic_betrokken_in_splitsing,
        omschr_aard_verkregenr_recht,
        fk_3avr_aand
    ) AS
SELECT
    zr.kadaster_identif AS zr_identif,
    (CAST( ( COALESCE(CAST(zr.ar_teller AS CHARACTER VARYING(7)), ('0')) || ('/') || COALESCE(CAST
    (zr.ar_noemer AS CHARACTER VARYING(7)), ('0')) ) AS CHARACTER VARYING(20))) AS aandeel,
    zr.ar_teller,
    zr.ar_noemer,
    zr.fk_8pes_sc_identif  AS subject_identif,
    zr.fk_7koz_kad_identif AS koz_identif,
    zr.indic_betrokken_in_splitsing,
    avr.omschr_aard_verkregenr_recht,
    zr.fk_3avr_aand
FROM
    (zak_recht zr
JOIN
    aard_verkregen_recht avr
ON
    (((
                zr.fk_3avr_aand) = (avr.aand))));
    
--drop view vb_zr_rechth cascade;
CREATE OR REPLACE VIEW
    vb_zr_rechth
    (
        objectid,
        zr_identif,
        subject_identif,
        koz_identif,
        aandeel,
        omschr_aard_verkregenr_recht,
        indic_betrokken_in_splitsing,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    uzr.zr_identif as zr_identif,
    uzr.subject_identif,
    uzr.koz_identif,
    uzr.aandeel,
    uzr.omschr_aard_verkregenr_recht,
    uzr.indic_betrokken_in_splitsing,
    vs.soort,
    vs.geslachtsnaam,
    vs.voorvoegsel,
    vs.voornamen,
    vs.aand_naamgebruik,
    vs.geslachtsaand,
    vs.naam,
    vs.woonadres,
    vs.geboortedatum,
    vs.geboorteplaats,
    vs.overlijdensdatum,
    vs.bsn,
    vs.organisatie_naam,
    vs.rechtsvorm,
    vs.statutaire_zetel,
    vs.rsin,
    vs.kvk_nummer
FROM
    (vb_util_zk_recht uzr
JOIN
    vb_subject vs
ON
    (((
                uzr.subject_identif) = (vs.subject_identif))));

--drop materialized view mb_zr_rechth cascade;
CREATE MATERIALIZED VIEW mb_zr_rechth 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_zr_rechth;
CREATE UNIQUE INDEX MB_ZR_RECHTH_OBJECTID ON MB_ZR_RECHTH(OBJECTID ASC);
CREATE INDEX MB_ZR_RECHTH_IDENTIF ON MB_ZR_RECHTH(ZR_IDENTIF ASC);

COMMENT ON MATERIALIZED VIEW mb_zr_rechth
IS 'commentaar view mb_zr_rechth:
alle zakelijke rechten met rechthebbenden en referentie naar kadastraal onroerende zaak (perceel of appartementsrecht)
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* zr_identif: natuurlijke id van zakelijk recht 
* subject_identif: natuurlijk id van subject (natuurlijk of niet natuurlijk) welke rechthebbende is,
* koz_identif: natuurlijk id van kadastrale onroerende zaak (perceel of appratementsrecht) dat gekoppeld is,
* aandeel: samenvoeging van teller en noemer (1/2),
* omschr_aard_verkregenr_recht: tekstuele omschrijving aard recht,
* indic_betrokken_in_splitsing: -,
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: -       
* voorvoegsel: -     
* voornamen: -     
* aand_naamgebruik:        
- E (= Eigen geslachtsnaam)        
- N (=Geslachtsnaam echtgenoot/geregistreerd partner na eigen geslachtsnaam)        
- P (= Geslachtsnaam echtgenoot/geregistreerd partner)        
- V (= Geslachtsnaam evhtgenoot/geregistreerd partner voor eigen geslachtsnaam)        
* geslachtsaand: M/V   
* naam: samengestelde naam bruikbaar voor natuurlijke en niet-natuurlijke subjecten
* woonadres: meegeleverd adres buiten BAG koppeling om      
* geboortedatum: -       
* geboorteplaats: -       
* overlijdensdatum: -       
* bsn: -       
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -';

--drop view vb_avg_zr_rechth cascade;
CREATE OR REPLACE VIEW
    vb_avg_zr_rechth
    (
        objectid,
        zr_identif,
        subject_identif,
        koz_identif,
        aandeel,
        omschr_aard_verkregenr_recht,
        indic_betrokken_in_splitsing,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    uzr.zr_identif as zr_identif,
    uzr.subject_identif,
    uzr.koz_identif,
    uzr.aandeel,
    uzr.omschr_aard_verkregenr_recht,
    uzr.indic_betrokken_in_splitsing,
    vs.soort,
    vs.geslachtsnaam,
    vs.voorvoegsel,
    vs.voornamen,
    vs.aand_naamgebruik,
    vs.geslachtsaand,
    vs.naam,
    vs.woonadres,
    vs.geboortedatum,
    vs.geboorteplaats,
    vs.overlijdensdatum,
    vs.bsn,
    vs.organisatie_naam,
    vs.rechtsvorm,
    vs.statutaire_zetel,
    vs.rsin,
    vs.kvk_nummer
FROM
    (vb_util_zk_recht uzr
JOIN
    vb_avg_subject vs
ON
    (((
                uzr.subject_identif) = (vs.subject_identif))));

--drop materialized view mb_avg_zr_rechth cascade;
CREATE MATERIALIZED VIEW mb_avg_zr_rechth 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_avg_zr_rechth;
CREATE UNIQUE INDEX mb_avg_zr_rechth_objectid ON mb_avg_zr_rechth(objectid ASC);
CREATE INDEX mb_avg_zr_rechth_identif ON mb_avg_zr_rechth(zr_identif ASC);

COMMENT ON MATERIALIZED VIEW mb_avg_zr_rechth
IS 'commentaar view mb_avg_zr_rechth:
alle zakelijke rechten met voor avg geschoonde rechthebbenden en referentie naar kadastraal onroerende zaak (perceel of appartementsrecht)
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* zr_identif: natuurlijke id van zakelijk recht     
* subject_identif: natuurlijk id van subject (natuurlijk of niet natuurlijk) welke rechthebbende is,
* koz_identif: natuurlijk id van kadastrale onroerende zaak (perceel of appratementsrecht) dat gekoppeld is,
* aandeel: samenvoeging van teller en noemer (1/2),
* omschr_aard_verkregenr_recht: tekstuele omschrijving aard recht,
* indic_betrokken_in_splitsing: -,
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: NULL (avg)       
* voorvoegsel: NULL (avg)      
* voornamen: NULL (avg)       
* aand_naamgebruik: NULL (avg)         
* geslachtsaand:NULL (avg)     
* naam: gelijk aan organisatie_naam
* woonadres: NULL (avg)        
* geboortedatum: NULL (avg)        
* geboorteplaats: NULL (avg)        
* overlijdensdatum: NULL (avg)        
* bsn: NULL (avg)         
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -';

--drop view vb_koz_rechth cascade;
CREATE OR REPLACE VIEW
    vb_koz_rechth
    (
        objectid,
        koz_identif,
        begin_geldigheid,
        type,
        aanduiding,
        aanduiding2,
        sectie,
        perceelnummer,
        appartementsindex,
        gemeentecode,
        aand_soort_grootte,
        grootte_perceel,
        oppervlakte_geom,
        deelperceelnummer,
        omschr_deelperceel,
        verkoop_datum,
        aard_cultuur_onbebouwd,
        bedrag,
        koopjaar,
        meer_onroerendgoed,
        valutasoort,
        loc_omschr,
        zr_identif,
        subject_identif,
        aandeel,
        omschr_aard_verkregenr_recht,
        indic_betrokken_in_splitsing,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer,
        gemeente,
        woonplaats,
        straatnaam,
        huisnummer,
        huisletter,
        huisnummer_toev,
        postcode,
        lon,
        lat,
        begrenzing_perceel
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    koz.koz_identif,
    koz.begin_geldigheid,
    koz.type,
    COALESCE(koz.sectie, '') || ' ' || COALESCE(koz.perceelnummer, '') AS aanduiding,
    COALESCE(koz.gemeentecode, '') || ' ' || COALESCE(koz.sectie, '') || ' ' || COALESCE(koz.perceelnummer, '') || ' ' || COALESCE(koz.appartementsindex, '') AS aanduiding2,
    koz.sectie,
    koz.perceelnummer,
    koz.appartementsindex,
    koz.gemeentecode,
    koz.aand_soort_grootte,
    koz.grootte_perceel,
    koz.oppervlakte_geom as oppervlakte_geom,
    koz.deelperceelnummer,
    koz.omschr_deelperceel,
    koz.verkoop_datum,
    koz.aard_cultuur_onbebouwd,
    koz.bedrag,
    koz.koopjaar,
    koz.meer_onroerendgoed,
    koz.valutasoort,
    koz.loc_omschr,
    zrr.zr_identif,
    zrr.subject_identif,
    zrr.aandeel,
    zrr.omschr_aard_verkregenr_recht,
    zrr.indic_betrokken_in_splitsing,
    zrr.soort,
    zrr.geslachtsnaam,
    zrr.voorvoegsel,
    zrr.voornamen,
    zrr.aand_naamgebruik,
    zrr.geslachtsaand,
    zrr.naam,
    zrr.woonadres,
    zrr.geboortedatum,
    zrr.geboorteplaats,
    zrr.overlijdensdatum,
    zrr.bsn,
    zrr.organisatie_naam,
    zrr.rechtsvorm,
    zrr.statutaire_zetel,
    zrr.rsin,
    zrr.kvk_nummer,
    koz.gemeente,
    koz.woonplaats,
    koz.straatnaam,
    koz.huisnummer,
    koz.huisletter,
    koz.huisnummer_toev,
    koz.postcode,
    koz.lon,
    koz.lat,
    koz.begrenzing_perceel
FROM
    (vb_zr_rechth zrr
RIGHT JOIN
    vb_kad_onrrnd_zk_adres koz
ON
    ((
            zrr.koz_identif = koz.koz_identif)));

--drop materialized view mb_koz_rechth cascade;
CREATE MATERIALIZED VIEW mb_koz_rechth 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_koz_rechth;
CREATE UNIQUE INDEX MB_KOZ_RECHTH_OBJECTID ON MB_KOZ_RECHTH(OBJECTID ASC);
CREATE INDEX MB_KOZ_RECHTH_IDENTIF ON MB_KOZ_RECHTH(KOZ_IDENTIF ASC);
INSERT INTO USER_SDO_GEOM_METADATA VALUES ('MB_KOZ_RECHTH', 'BEGRENZING_PERCEEL', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 12000, 280000, .1),MDSYS.SDO_DIM_ELEMENT('Y', 304000, 620000, .1)), 28992);
CREATE INDEX MB_KOZ_RECHTH_BEGR_PRCL_IDX ON MB_KOZ_RECHTH(BEGRENZING_PERCEEL)  INDEXTYPE IS MDSYS.SPATIAL_INDEX;


COMMENT ON MATERIALIZED VIEW mb_koz_rechth
IS 'commentaar view mb_koz_rechth:
kadastrale percelen een appartementsrechten met rechten en rechthebbenden en objectid voor geoserver/arcgis
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* koz_identif: natuurlijke id van perceel of appartementsrecht      
* begin_geldigheid: datum wanneer dit object geldig geworden is (ontstaat of bijgewerkt),
* type: perceel of appartement,
* aanduiding: sectie perceelnummer,
* aanduiding2: kadgem sectie perceelnummer appartementsindex,
* sectie: -,
* perceelnummer: -,
* appartementsindex: -,
* gemeentecode: -,
* aand_soort_grootte: -,
* grootte_perceel: -,
* oppervlakte_geom: oppervlakte berekend uit geometrie, hoort gelijk te zijn aan grootte_perceel,
* deelperceelnummer: -,
* omschr_deelperceel: -,
* verkoop_datum: laatste datum gevonden akten van verkoop,
* aard_cultuur_onbebouwd: -,
* bedrag: -,
* koopjaar: -,
* meer_onroerendgoed: -,
* valutasoort: -,
* loc_omschr: adres buiten BAG om meegegeven,
* zr_identif: natuurlijk id van zakelijk recht,
* subject_identif: natuurlijk id van rechthebbende,
* aandeel: samenvoeging van teller en noemer (1/2),
* omschr_aard_verkregenr_recht: tekstuele omschrijving aard recht,
* indic_betrokken_in_splitsing: -,
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: -       
* voorvoegsel: -     
* voornamen: -     
* aand_naamgebruik:        
- E (= Eigen geslachtsnaam)        
- N (=Geslachtsnaam echtgenoot/geregistreerd partner na eigen geslachtsnaam)        
- P (= Geslachtsnaam echtgenoot/geregistreerd partner)        
- V (= Geslachtsnaam evhtgenoot/geregistreerd partner voor eigen geslachtsnaam)        
* geslachtsaand: M/V   
* naam: samengestelde naam bruikbaar voor natuurlijke en niet-natuurlijke subjecten
* woonadres: meegeleverd adres buiten BAG koppeling om      
* geboortedatum: -       
* geboorteplaats: -       
* overlijdensdatum: -       
* bsn: -       
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -
* gemeente: -,
* woonplaats: -,
* straatnaam: -,
* huisnummer: -,
* huisletter: -,
* huisnummer_toev: -,
* postcode: -,
* lon: coordinaat als WSG84,
* lon: coordinaat als WSG84,
* begrenzing_perceel: perceelvlak';

--drop view vb_avg_koz_rechth cascade;
CREATE OR REPLACE VIEW
    vb_avg_koz_rechth
    (
        objectid,
        koz_identif,
        begin_geldigheid,
        type,
        aanduiding,
        aanduiding2,
        sectie,
        perceelnummer,
        appartementsindex,
        gemeentecode,
        aand_soort_grootte,
        grootte_perceel,
        oppervlakte_geom,
        deelperceelnummer,
        omschr_deelperceel,
        verkoop_datum,
        aard_cultuur_onbebouwd,
        bedrag,
        koopjaar,
        meer_onroerendgoed,
        valutasoort,
        loc_omschr,
        zr_identif,
        subject_identif,
        aandeel,
        omschr_aard_verkregenr_recht,
        indic_betrokken_in_splitsing,
        soort,
        geslachtsnaam,
        voorvoegsel,
        voornamen,
        aand_naamgebruik,
        geslachtsaand,
        naam,
        woonadres,
        geboortedatum,
        geboorteplaats,
        overlijdensdatum,
        bsn,
        organisatie_naam,
        rechtsvorm,
        statutaire_zetel,
        rsin,
        kvk_nummer,
        gemeente,
        woonplaats,
        straatnaam,
        huisnummer,
        huisletter,
        huisnummer_toev,
        postcode,
        lon,
        lat,
        begrenzing_perceel
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    koz.koz_identif as koz_identif,
    koz.begin_geldigheid,
    koz.type,
    COALESCE(koz.sectie, '') || ' ' || COALESCE(koz.perceelnummer, '') AS aanduiding,
    COALESCE(koz.gemeentecode, '') || ' ' || COALESCE(koz.sectie, '') || ' ' || COALESCE(koz.perceelnummer, '') || ' ' || COALESCE(koz.appartementsindex, '') AS aanduiding2,
    koz.sectie,
    koz.perceelnummer,
    koz.appartementsindex,
    koz.gemeentecode,
    koz.aand_soort_grootte,
    koz.grootte_perceel,
    koz.oppervlakte_geom,
    koz.deelperceelnummer,
    koz.omschr_deelperceel,
    koz.verkoop_datum,
    koz.aard_cultuur_onbebouwd,
    koz.bedrag,
    koz.koopjaar,
    koz.meer_onroerendgoed,
    koz.valutasoort,
    koz.loc_omschr,
    zrr.zr_identif,
    zrr.subject_identif,
    zrr.aandeel,
    zrr.omschr_aard_verkregenr_recht,
    zrr.indic_betrokken_in_splitsing,
    zrr.soort,
    zrr.geslachtsnaam,
    zrr.voorvoegsel,
    zrr.voornamen,
    zrr.aand_naamgebruik,
    zrr.geslachtsaand,
    zrr.naam,
    zrr.woonadres,
    zrr.geboortedatum,
    zrr.geboorteplaats,
    zrr.overlijdensdatum,
    zrr.bsn,
    zrr.organisatie_naam,
    zrr.rechtsvorm,
    zrr.statutaire_zetel,
    zrr.rsin,
    zrr.kvk_nummer,
    koz.gemeente,
    koz.woonplaats,
    koz.straatnaam,
    koz.huisnummer,
    koz.huisletter,
    koz.huisnummer_toev,
    koz.postcode,
    koz.lon,
    koz.lat,
    koz.begrenzing_perceel
FROM
    (vb_avg_zr_rechth zrr
RIGHT JOIN
    vb_kad_onrrnd_zk_adres koz
ON
    ((
            zrr.koz_identif = koz.koz_identif)));

--drop materialized view mb_avg_koz_rechth cascade;
CREATE MATERIALIZED VIEW mb_avg_koz_rechth 
BUILD DEFERRED
REFRESH ON DEMAND
AS
SELECT
    *
FROM
    vb_avg_koz_rechth;
CREATE UNIQUE INDEX MB_AVG_KOZ_RECHTH_OBJECTID ON MB_AVG_KOZ_RECHTH(OBJECTID ASC);
CREATE INDEX MB_AVG_KOZ_RECHTH_IDENTIF ON MB_AVG_KOZ_RECHTH(KOZ_IDENTIF ASC);
INSERT INTO USER_SDO_GEOM_METADATA VALUES ('MB_AVG_KOZ_RECHTH', 'BEGRENZING_PERCEEL', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 12000, 280000, .1),MDSYS.SDO_DIM_ELEMENT('Y', 304000, 620000, .1)), 28992);
CREATE INDEX MB_AVG_KOZ_RECHTH_BEGR_P_IDX ON MB_AVG_KOZ_RECHTH (BEGRENZING_PERCEEL) INDEXTYPE IS MDSYS.SPATIAL_INDEX;


COMMENT ON MATERIALIZED VIEW mb_avg_koz_rechth
IS 'commentaar view mb_avg_koz_rechth:
kadastrale percelen een appartementsrechten met rechten en rechthebbenden geschoond voor avg en objectid voor geoserver/arcgis
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* koz_identif: natuurlijke id van perceel of appartementsrecht      
* begin_geldigheid: datum wanneer dit object geldig geworden is (ontstaat of bijgewerkt),
* type: perceel of appartement,
* aanduiding: sectie perceelnummer,
* aanduiding2: kadgem sectie perceelnummer appartementsindex,
* sectie: -,
* perceelnummer: -,
* appartementsindex: -,
* gemeentecode: -,
* aand_soort_grootte: -,
* grootte_perceel: -,
* oppervlakte_geom: oppervlakte berekend uit geometrie, hoort gelijk te zijn aan grootte_perceel,
* deelperceelnummer: -,
* omschr_deelperceel: -,
* verkoop_datum: laatste datum gevonden akten van verkoop,
* aard_cultuur_onbebouwd: -,
* bedrag: -,
* koopjaar: -,
* meer_onroerendgoed: -,
* valutasoort: -,
* loc_omschr: adres buiten BAG om meegegeven,
* zr_identif: natuurlijk id van zakelijk recht,
* subject_identif: natuurlijk id van rechthebbende,
* aandeel: samenvoeging van teller en noemer (1/2),
* omschr_aard_verkregenr_recht: tekstuele omschrijving aard recht,
* indic_betrokken_in_splitsing: -,
* soort: soort subject zoals natuurlijk, niet-natuurlijk enz.  
* geslachtsnaam: NULL (avg)       
* voorvoegsel: NULL (avg)      
* voornamen: NULL (avg)       
* aand_naamgebruik: NULL (avg)         
* geslachtsaand:NULL (avg)     
* naam: gelijk aan organisatie_naam
* woonadres: NULL (avg)        
* geboortedatum: NULL (avg)        
* geboorteplaats: NULL (avg)        
* overlijdensdatum: NULL (avg)        
* bsn: NULL (avg)         
* organisatie_naam: naam niet natuurlijk subject      
* rechtsvorm: -  
* statutaire_zetel: -      
* rsin: -        
* kvk_nummer: -
* gemeente: -,
* woonplaats: -,
* straatnaam: -,
* huisnummer: -,
* huisletter: -,
* huisnummer_toev: -,
* postcode: -,
* lon: coordinaat als WSG84,
* lat: coordinaat als WSG84,
* begrenzing_perceel: perceelvlak';

--drop view vb_kad_onrrnd_zk_archief; 
CREATE OR REPLACE VIEW
    vb_kad_onrrnd_zk_archief
    (
        objectid,
        koz_identif,
        begin_geldigheid,
        eind_geldigheid,
        type,
        aanduiding,
        aanduiding2,
        sectie,
        perceelnummer,
        appartementsindex,
        gemeentecode,
        aand_soort_grootte,
        grootte_perceel,
        deelperceelnummer,
        omschr_deelperceel,
        aard_cultuur_onbebouwd,
        bedrag,
        koopjaar,
        meer_onroerendgoed,
        valutasoort,
        loc_omschr,
        overgegaan_in,
        begrenzing_perceel
    ) AS
SELECT
    CAST(ROWNUM AS INTEGER) AS objectid,
    qry.identif as koz_identif,
    koza.dat_beg_geldh AS begin_geldigheid,
    koza.datum_einde_geldh AS eind_geldigheid,
    qry.type,
    (((COALESCE(qry.ka_sectie, '')) || ' ') || (COALESCE
    (qry.ka_perceelnummer, ''))) AS aanduiding,
    (((((((COALESCE(qry.ka_kad_gemeentecode, '')) || ' ') ||
    (COALESCE(qry.ka_sectie, ''))) || ' ') || (COALESCE
    (qry.ka_perceelnummer, ''))) || ' ') || (COALESCE
    (qry.ka_appartementsindex, ''))) AS aanduiding2,
    qry.ka_sectie                                             AS sectie,
    qry.ka_perceelnummer                                      AS perceelnummer,
    qry.ka_appartementsindex                                  AS appartementsindex,
    qry.ka_kad_gemeentecode                                   AS gemeentecode,
    qry.aand_soort_grootte,
    qry.grootte_perceel,
    qry.ka_deelperceelnummer AS deelperceelnummer,
    qry.omschr_deelperceel,
    koza.cu_aard_cultuur_onbebouwd AS aard_cultuur_onbebouwd,
    koza.ks_bedrag                 AS bedrag,
    koza.ks_koopjaar               AS koopjaar,
    koza.ks_meer_onroerendgoed     AS meer_onroerendgoed,
    koza.ks_valutasoort            AS valutasoort,
    koza.lo_loc__omschr            AS loc_omschr,
    kozhr.fk_sc_rh_koz_kad_identif AS overgegaan_in,
    qry.begrenzing_perceel
FROM
    (
        SELECT
            pa.sc_kad_identif   AS identif,
            pa.sc_dat_beg_geldh AS dat_beg_geldh,
            'perceel'     AS type,
            pa.ka_sectie,
            pa.ka_perceelnummer,
            CAST(NULL AS CHARACTER VARYING(4)) AS ka_appartementsindex,
            pa.ka_kad_gemeentecode,
            pa.aand_soort_grootte,
            pa.grootte_perceel,
            pa.ka_deelperceelnummer,
            pa.omschr_deelperceel,
            pa.begrenzing_perceel
        FROM
            kad_perceel_archief pa
        UNION ALL
        SELECT
            ara.sc_kad_identif   AS identif,
            ara.sc_dat_beg_geldh AS dat_beg_geldh,
            'appartement'  AS type,
            ara.ka_sectie,
            ara.ka_perceelnummer,
            ara.ka_appartementsindex,
            ara.ka_kad_gemeentecode,
            CAST(NULL AS CHARACTER VARYING(1))    AS aand_soort_grootte,
            CAST(NULL as NUMERIC(8,0))            AS grootte_perceel,
            CAST(NULL AS CHARACTER VARYING(4))    AS ka_deelperceelnummer,
            CAST(NULL AS CHARACTER VARYING(1120)) AS omschr_deelperceel,
            NULL                          AS begrenzing_perceel
        FROM
            app_re_archief ara ) qry
JOIN
    kad_onrrnd_zk_archief koza
ON
    koza.kad_identif = qry.identif
AND qry.dat_beg_geldh = koza.dat_beg_geldh
JOIN
    (
        SELECT
            ikoza.kad_identif,
            MAX(ikoza.dat_beg_geldh) bdate
        FROM
            kad_onrrnd_zk_archief ikoza
        GROUP BY
            ikoza.kad_identif ) nqry
ON
    nqry.kad_identif = koza.kad_identif
AND nqry.bdate = koza.dat_beg_geldh
LEFT JOIN
    kad_onrrnd_zk_his_rel kozhr
ON
    (
        kozhr.fk_sc_lh_koz_kad_identif = koza.kad_identif)
ORDER BY
    bdate DESC ;

COMMENT ON TABLE vb_kad_onrrnd_zk_archief
IS   'commentaar view vb_kad_onrrnd_zk_adres:
Nieuwste gearchiveerde versie van ieder kadastrale onroerende zaak (perceel en appartementsrecht) met objectid voor geoserver/arcgis en historische relatie
beschikbare kolommen:
* objectid: uniek id bruikbaar voor geoserver/arcgis,
* koz_identif: natuurlijke id van perceel of appartementsrecht      
* begin_geldigheid: datum wanneer dit object geldig geworden is (ontstaat of bijgewerkt),
* eind_geldigheid: datum wanneer dit object ongeldig geworden is,
* benoemdobj_identif: koppeling met BAG object,
* type: perceel of appartement,
* sectie: -,
* aanduiding: sectie perceelnummer,
* aanduiding2: kadgem sectie perceelnummer appartementsindex,
* perceelnummer: -,
* appartementsindex: -,
* gemeentecode: -,
* aand_soort_grootte: -,
* grootte_perceel: -,
* deelperceelnummer: -,
* omschr_deelperceel: -,
* aard_cultuur_onbebouwd: -,
* bedrag: -,
* koopjaar: -,
* meer_onroerendgoed: -,
* valutasoort: -,
* loc_omschr: adres buiten BAG om meegegeven,
* overgegaan_in: natuurlijk id van kadastrale onroerende zaak waar dit object in is overgegaan,
* begrenzing_perceel: perceelvlak';