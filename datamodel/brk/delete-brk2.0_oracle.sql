-- cleanup
WHENEVER SQLERROR CONTINUE NONE;
DROP TABLE brmo_metadata CASCADE CONSTRAINTS PURGE;
DROP TABLE recht_aantekeningrecht CASCADE CONSTRAINTS PURGE;
DROP TABLE recht_isbelastmet CASCADE CONSTRAINTS PURGE;
DROP TABLE recht_isbeperkttot CASCADE CONSTRAINTS PURGE;
DROP TABLE objectlocatie CASCADE CONSTRAINTS PURGE;
DROP TABLE adres CASCADE CONSTRAINTS PURGE;
DROP TABLE appartementsrecht CASCADE CONSTRAINTS PURGE;
DROP TABLE natuurlijkpersoon CASCADE CONSTRAINTS PURGE;
DROP TABLE nietnatuurlijkpersoon CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaak CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaakbeperking CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaakfiliatie CASCADE CONSTRAINTS PURGE;
DROP TABLE perceel CASCADE CONSTRAINTS PURGE;
DROP TABLE persoon CASCADE CONSTRAINTS PURGE;
DROP TABLE publiekrechtelijkebeperking CASCADE CONSTRAINTS PURGE;
DROP TABLE recht CASCADE CONSTRAINTS PURGE;
DROP TABLE stuk CASCADE CONSTRAINTS PURGE;
DROP TABLE stukdeel CASCADE CONSTRAINTS PURGE;
DROP TABLE appartementsrecht_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaak_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaakfiliatie_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE perceel_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE recht_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE onroerendezaakbeperking_archief CASCADE CONSTRAINTS PURGE;
DROP TABLE objectlocatie_archief CASCADE CONSTRAINTS PURGE;
DELETE FROM user_sdo_geom_metadata;