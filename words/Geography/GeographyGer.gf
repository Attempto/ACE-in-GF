--# -path=.:present
concrete GeographyGer of Geography = AttemptoGer ** open SyntaxGer, ParadigmsGer, OperGer in {
flags coding=utf8 ;
lin
Austria_PN = acePN "Österreich" ;
Belgium_PN = acePN "Belgien" ;
Bern_PN = acePN "Bern" ;
border_V2 = prepV2 (regV "grenzen") (mkPrep "an" accusative) ;
capital_CN = aceN "Hauptstadt" ;
city_CN = aceN "Stadt" ;
contain_V2 = mkV2 (aceV "enthalten" "enthält" "enthalten") accusative ;
country_CN = aceN neuter "Land" "Länder" ;
European_Union_PN = acePN "Europäische Union" ;
France_PN = acePN "Frankreich" ;
French_language_PN = acePN "Französisch" ;
German_language_PN = acePN "Deutsch" ;
Germany_PN = acePN "Deutschland" ;
Italian_language_PN = acePN "Italienisch" ;
Italy_PN = acePN "Italien" ;
language_CN = aceN "Sprache" ;
Liechtenstein_PN = acePN "Liechtenstein" ;
member_CN = aceN "Mitglied" ;
official_language_CN = aceN "offizielle Sprache" ;
sea_CN = aceN neuter "Meer" "Meere" ;
Switzerland_PN = acePN "die Schweiz" "die Schweiz" "der Schweiz" "der Schweiz" ;
Zurich_PN = acePN "Zürich" ;
}