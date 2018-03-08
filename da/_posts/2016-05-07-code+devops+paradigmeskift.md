---
layout:    post
title:     Et Paradigmeskift inden for softwareudvikling
author:    lakruzz
lang:      da-DK
image:     /images/blog/code-story.png
tags:      [Continuos  Delivery, DevOps, Paradigmeskift]
---

Der blæser kraftige nye vinde inden for gængs opfattelse af hvordan software udvikles mest effektivt. Der er tale en tendens, hvor værdien af software alene måles på, hvad der konkret leveres til slutbrugerne og at de faktisk er glade for det de får.
{: .kicker}

Det nye er, at softwareindustrien er begyndt at bruge software til at verificere og validere software med. Samtidig med at det er software der implementerer den IT-infrastruktur, som vi alle sammen er afhængige af. For udenforstående virker det måske ret oplagt, at bruge software til den slags opgaver, men det er rent faktisk udtryk for revolutionerende nytænkning.

Det nye paradigme inden for softwareudvikling og IT går under navne som _Continuous Delivery_ og _DevOps_.

## Continuous Delivery
Begrebet _Continuous Delivery_ er født ud af det første a tolv principper i [det agile manifest](http://agilemanifesto.org/){: target="_blank" }. Et kampskrift som 17 af datidens mest indflydelsesrige metodetænkere indenfor softwareudvikling forfattede på 3 dage i en skihytte i Utah - i 2001. Manifestet er senere blevet underskrevet af tusindevis af mennesker - Selv signerede jeg tilbage i [september 2005](http://agilemanifesto.org/display/000000049.html){: target="_blank" }.

Det første princip lyder:

>Our highest priority is to satisfy the customer<br/>
>through early and continuous delivery<br/>
>of valuable software.

Det agile manifest omfavner de ideer, som oprindeligt er formuleret inden for industrien, og som havde til formål at optimere et produtktionsanlæg eller en produtionsmetode; LEAN, Toyota Production System (TPS), Six Sigma, Total Quality Management (TQM), Product Lines etc.. Agile (eng: adræt) metoder applicerer de samme ideer teknikker og visioner til softwareudviklingsprocessen.

Agile softwareudvikling er en metode, som ligesom sit ophav i industrien, skaber effektivisering gennem at minimere antallet af opgaver som er i gang samtidig, men til gengæld advokerer, at der ikke findes nogen egentlig faseeinddeling i produktionen. Det er et opgør med vandfaldsmetoder; Når en opgave er meldt færdig, er det fordi den opfylder definitionen af hvad _færdig_ betyder og den kan afleveres til produktion eller slutbruger.

[![Andon cord](/images/blog/andon-cord.png) “Why Buy A Toyota - Andon Cord” (YouTube 1:41)](https://www.youtube.com/watch?v=B_nSvN_L4hc){: .stdcenter target="_blank" }

Agile softwareudvikling er idag et ideal, som på verdensplan gennemsyrer hele softwareindustrien. Men indtil for nylig har der reelt været meget få af de teams og virksomheder, der siger, at de arbejder med agile metoder, som rent faktisk har kunne gøre det, altså levere opgaverne én ad gangen, færdige, direkte i produktion, uden en faseopdelt process.

En kendsgerning er, at selv den dag i dag, gælder det for langt den overvejende del af alle verdens softwareteams, at _udvikling_ er adskilt fra _integration_, som er adskilt fra _udrulning_, som er adskilt fra _test_ som er adskilt fra _driftsætning_.

Det er ikke usædvanligt for en gennemsnitlig softwarudviklingsproces, at den tid der går fra en idé om en forbedring er født, og indtil den er leveret til slutbrugeren, går der måneder - nogen gange endda kvarte eller halve år.

Det hænger ganske enkelt ikke sammen - men de fleste software teams kalder sig agile alligevel.

_Continuous Delivery_ som begreb er nyt. Det kan helt kort sammefattes som en samling af teknikker og _best practices_, som insisterer på, at idealerne inden for Agile gælder. Der skal kontinuerligt leveres software - der er færdigt.

I fremtiden kommer der ikke flere _release parties_. Software - der virker - kommer til at flyde til slutbrugeren i en lind uophørlig strøm.  I fremtiden når en softwareudvikler stolt råber ud i kontorlandskabet til sine kollegaer _“Nu virker det på min maskine”_ og og indtil det 30 minutter senere også er tilgængeligt for slutbrugeren, der er det formentlig fuldstændig uberørt af menneskehånd - og ikke desto mindre virker det.

Al verifikation af kvaliteten af softwaren og aftestningen af den er skrevet som software, og kører automatisk i en _Continuous Delivery Pipeline_.


## DevOps
DevOps en en sammenskriving af ordene _Devlopement_ og _Operations_, de engelsksprogede begreber for det vi på dansk forstår som softwareudvikling og IT-infrastruktur.

Hvor Continuous Delivery i stor grad har med softwareudvikling at gøre, men stiller - hvad der for nogen virker som nærmest - urimelig krav til IT-infrastrukturen for at realisere sin vision. Så adresserer DevOps nogle af de samme problemstillinger, blot kommende fra IT-infrastruktur siden og advokerer for at nedbryde de siloer, som softwareudvikling og IT drift traditionelt er opdelt i. DevOps taler for at løse IT-infrastruktur problemer - med software.

Forestil dig en situation, hvor et software team bliver ambitiøse omkring deres test og derfor går til deres IT afdeling og beder om to ekstra servere til udviklingsteamet, så de kan automatisere nogle flere funktionelle tests, eller udrulninger, eller integrationer eller hvad de nu end har gang i.

IT afdelingen svarer typisk noget i stil med. _“Ja”_ eller _“nej”_ eller _“Ja men det bliver dyrt”_ eller _“Ja men udfyld først lige  den her bestillingsformular”_.  Men faktisk er det komplet ligegyldigt hvad IT afdelingen svarer. I en DevOps vision er der slet ikke nogen sagsbehandling forbundet med at skaffe sig flere ressourcer. Det er altsammen programmeret som software og kører fuldstændig automatisk. DevOps stæber efter en programmérbar infrastruktur.

Så her er hvad der sker istedet:

Softwareudvikleren råber stolt, i _”Det virker”_ (på hans computer) og så gemmer han sine kodeændringer i sit versionsstyringssystem. Derefter er der en overvågningsproces, som automatisk og øjeblikkeligt opdager det, og i et isoleret miljø integrere udviklerens kode med kollegaernes kode. Hvis det går som det skal, så starter det en ny proces, som tester om det nu også stadig virker og hvis det gør, så bliver den integrerede kode afleveret til kollegaerne.

Processen hertil kaldes ofte for _Continuous Integration_ og hvis udfaldet er accepteret, så er processen katalysator for at starte en _Continuous Delivery pipeline_, som typisk vil foretage en række analyser af koden, for at sikre at den ikke indeholder for store mængder teknisk gæld og derefter vil den automatisk blive udrullet til en produktions-lignende infrastruktur, hvor den funktionelle test  - som i mange virksomheder i dag udføres manuelt i stedet - vil blive udført af software programmer, som tester på 5, 10 eller måske 50 servere i parallel for at opnå en testtid der ligger tættere på 13 minutter end 30 dage.

Når testen er accepteret fuldstændig uden fejl, så udarbejdes automatisk dokumentation og eventuelt lovpligtige sporbarhedsrapporter, med dokumentation tilbage til de oprindelige krav. Og derefter sættes det i produktion - automatisk.

[![CoDe Storyline](/images/blog/code-story.png)](/images/blog/code-story.png){: target="_blank" .stdcenter}

Den her proces køre ikke én gang om dagen eller én gang om ugen. Den kører automatisk hver evig eneste gang en softwareudvikler melder klar med en opgave. Det gør han formentlig et par gange om dagen.

Ovenstående er - indrømmet - en vision for fremtiden. Med undtagelse af nogle få virksomheder, som vi i branchen henviser til som enhjørninge, så er det her ikke hver mands eje - endnu! Men alle softwareteams drømmer om sådan et setup, og rigtig mange har allerede taget hul på rejsen dertil.

Forestil jer et team på 10 udviklere som tilsammen afslutter 15 opgaver om dagen, og hver opgave kræver en Continuous Delivery pipeline som måske involverer test på 15 processer i parallel.

Vi kommer til at mangle _mange_ maskiner.

Men vi kommer ikke til at bede IT-afdelingen om at skaffe dem til os. I stedet vil vi udviklet software systemer som selv opdager når der er mangel på maskiner og derefter selv starter flere maskiner op automatisk konfigurer dem til præcis den delopgave, som der mangler ressourcer til. Når opgaven er løst lukkes maskinen ned, og ressourcer stilles til rådighed til en anden process, som har brug for den - selv om den måske har brug for en fuldstændig forskellig konfiguration.

## Hvadsomhelst som kode
I fremtiden vil alle virksomheder være software virksomheder. Lige som der i dag ikke findes en virksomhed, der ikke benytter PC’er i forbindelse med bogføring, administration, tilbudsgivning, markedsføring osv, så vil der i fremtiden ikke findes mange virksomheder, der ikke har behov for en eller anden form for software til at understøtte deres produkt.

Radiator-termostater, cirkulationspumper, telefonopladere og høretelefoner indeholder software i dag. Selv prisskiltene nede i Kvickly indeholder software.

_Software is gonna eat the world._

## Send flere folk
Vi kommer til at mangle mange softwareudviklere i fremtiden, og det er faktisk specielt den type softwareudviklere, som er skolet eller interesseret i at udvikle software, som kan være med til at forbedre software, som vi kommer til at mangle.

Vi skal passe på at sikre, at vi får uddannet unge folk som kan implementere hvadsomhelst som kode. Softwareudviklere, som er specialiseret i at være generalister, som kan indgå i et fremtidige softwareudviklingsteam og selv om de ikke nødvendigvis ved noget om termodynamik, audiologi eller hvad end det produkt, de arbejder på, har som underliggende domæneviden. Så vil de alligevel være en uvurderlig hjælp til teamet, simpelthen ved at betragte ethvert problem som et software problem, og på den vis bidrage til, at teamet i fremtiden arbejder mellem 100 og 3000 gang mere effektivt, end de gjorde tilbage i 2016.

Efterspørgslen på folk med disse egenskaber og talenter er allerede enorm. Større end udbudet. Men på trods af dette vakum er der ingen læreansalter eller universiteter, der i dag har disse discipliner med i deres studieordning. Så er vi allerede i underskud - og det kommer til at gøre endnu mere ondt.

## Ulven kommer! - kommer ulven?
Thomas Kuhn, amerikansk fysiker, historiker og filosof, er den oprindelige ophavsmand til begrebet paradigmeskift. Det stammer fra han bog  _The Structure of Scientific Revolutions (1962)_ og beskriver det fænomen, at der indfinder sig en fundamental ændring i de grundlæggende koncepter og eksperimenterende praksis inden for en videnskabelig disciplin.

Indenfor softwareudviklingens relativt korte historie, er der blevet råbt pardigmeskift mange gange. En håndfuld eksempler er Objekt Orienterede sprog (OO), Service Orienteret Arkitektur (SOA), selv JAVA og World Wide Web er blevet udråbt til at være revolutionære skift indenfor vores videnskab.

At råbe _"Paradigmeskift!"_ Indenfor softwareindustrien er ligesom Peter der råber _"Ulv!"_ - _"Ååh - ikke igen!"_" Tænker nogen, mens andre farer forvildede rundt og rent faktisk tror på, at de er fortabte, hvis ikke de straks styrter afsted i den nye retning.

Det er relevant at spørge; _"er Continuous Delivery og DevOps reelt udtryk for et paradigmeskift?"_ Er det virkelig fundamentalt anderledes og udtryk for en anderledes eksperimenterede  praksis end den vi har benyttet indenfor software industrien hidtil?

_- Ja!_

Med den teknologi der er udviklet indenfor server virtualisering, cloud og applikations containere er det reelt første gang, siden vi startede med at lave software, at vi ikke behøver at bliver skræmt eller forskrækkede over, at en softwareudvikler gerne vil have 50 private servere til at understøtte, at han ikke melder klar før han reelt er færdig. I dag er det potentiet bare at programmere sin infrastruktur.

Indenfor server virtualisering er det nye sort, at benytte container-teknologi frem for virtuelle maskiner. Containere bytyder, kort fortalt, at fundamentet - som for en virtuel maskine er hardwaren som den kører på - med container-teknologi løftes et niveau op, så containeren definere sin afhængighed til operativsystemet. Konkret gør det hele konceptet om at virtualisere infrastruktur meget mere light-weight og selv performance under eksekvering er forbedret.

Førende på dette felt er i øjeblikket Docker, en Open Source teknologi som kører containere på Linux. Docker er helt nyt, det har netop fejret tre-års fødselsdag, og der er flere konkurrerende teknologier på vej. Det bliver stort! I dag er det reelt muligt at realisere visionen om et produktions-lignende infrastruktur med 15 servere i parallel på en MacBook - uden internetforbindelse - på vej hjem i S-toget.

Open Source teknologier, som i øvrigt ofte indretter deres communities baseret på disse principper, har overtaget store dele af den teknologi som vi troede var ejet tungt af denne verdens mastodonter. IBM, Oracle og Microsoft har måtte se sig slået af Open Source teknologier som Linux, Jenkins, Docker og Git som har udviklet sig med sådan en hast, at tidligere tiders mastodonterne i dag står tilbage som runkedorer, som har opgivet at indhente - i dag har de sluppet taktstokken - de følger bare med.

I fremtiden er kvalitet noget der er er bygget ind i softwaren når den leveres, det er en del af udviklingsprocessen og ikke bare noget der klistres på bagefter.

Det er et nyt paradigme. _"You ain't done, until you're done done"_

## Tænk hvis...
Forestil jer for eksempel at vores udskældte Rejsekort var implementeret ud fra disse principper. Overvej kategorien af de uhensigtsmæssigheder som Rejeskortet byder sine brugere: Man kan ikke checke ud hvis bussen er kørt. Selv om man sætter penge ind på sit kort er de først tilgængelige 5 timer senere. Selvom jeg har kort tilknyttet min konto, skal jeg alligevel forudbetale mine rejser. Selvom min telefon har fuldstændig styr på hvor jeg er, så har rejeskortet ikke et clue om, hvordan de kan udnytte den teknologi til noget fornuftig.

Alle disse problemer er relativt enkle at løse med software, det er den faseopdelte, manuelle, ineffektive arbejdsproces, der er problement her. Det er forestillingen om at man ikke skal have kontakt til slutbrugeren, før produktet er færdigt. Hvis rejsekortet havde været udviklet udfra agile metoder og softwareudviklerne havde haft en Continuous Delivery pipeline, altså hvis han have haft adgang til at teste opimod definitionene af _færdig_ mens han udviklede, så havde disse fejl slet ikke været præsenteret for brugerne.

SKAT’s EFI havde bare rettet sine fejl når de blev opdaget, Rigspolitiets PolSag havde været sat i produktion 2 år tidligere - så havde man vidst det ikke performede som det skulle - og fixet det. Det samme gælder for Arbejdsskadesstyrelsens PROASK.

Idag sidder både SKAT, ASK og Rigspolitiet og er tilbage og kæmpe med deres IT systemer, som var forældede allerede for 10 år siden - mens milliarder er spildt på ingenting.

Rejsekortet var så lang tid undervejs i sin glasklokke uden slutbrugerkontakt, at det var gammel teknologi allerede inden man begyndte at tage det i brug.

I den samme periode har Google indekseret hele internettet, Tesla har udviklet en bil der køre på elektricitet, som kan accelerere hurtigere end verdens hidtil hurtigst serieproducerede bil - og som kan opdatere sin software med nye features mens den står og lader op. Netflix har ved hjælp af software ændret hele den vestlige verdens TV vaner. Facebook har med software skabt en hel ny generation, som i dag ikke engang ved hvad en email er og Spotify kom ingen steder fra og revolutionerede hele verdens musikbranche og løste et uløseligt problem.

Altsammen gjort med software - Det er vore enhjørninge.

## Hvad skal vi gøre?
Vores virksomhed, [Praqma](http://www.praqma.com){: target="_blank" }, er specialiseret i - hvad der stadig må betegnes som - en niche. Vi hjælper virksomheder, som tror på det nye paradigme med at realisere deres fulde potentiale indefor Continuous Delivery og DevOps. Vi har selv skabt mere ind 35 Open Source projekter. Vi rekrutterer vores senior eksperter rundt omkring i store virksomheder, hvor de ofte sidder alene og betjener stabsfunktioner, uden anerkendelse og uden budget. Mange af vores folk lærer vi op selv gennem praktikforløb og intensiv sidemandsoplæring i deres første år.

I dag er vi 25, for halvandet år siden var vi 8. Vi har kontorer i Danmark. Norge og Sverige - og vi har åbne ubesatte stillinger alle tre steder.

Igennem nogle år har vi tilbudt at komme ind på universiteterne og læreanstalterne og undervise i nogle af de principper og teknologier, som softwareindustrien skriger på. Vi har undervist på Computer Science på Københavns Universitet (DIKU) og Lunds universitet (LTHCS), vi har undervist på IT-universitetet i København og på CPHBusiness Academy i Lyngby.

Og det virker! Vi har rekrutteret studerende, som vi selv har været ude og undervise.

Skandinavien er traditionelt set en region, som nyder stor anerkendelse indenfor softwareudvikling. Vi vil meget gerne - forhåbentlig i samarbejde med universiteter og læreanstalter - være med til at sikre, at Skandinavien får status af at være med blandt dem, som tog initiativet til at løse dette konkret samfundsproblem.

Denne sommer har vi formaliseret undervisningen i et [Continuous Delivery Academy](http://www.code-conf.com/academy2016){: target="_blank" }, Hvor vi hen over sommeren underviser på fire forskellige lokationer, Trondheim, København, Århus og Oslo, med op til 100 deltagere på hvert academy.

[![CoDe Academy](/images/blog/code-academy-2016-front.jpg)CoDe Academy er en 5 dages workshop, som er gratis for studerende, køre i 4 universitetsbyer i Skandinavien hen over sommeren 2016](http://www.code-conf.com/academy2016){: .stdcenter target="_blank"}

Undervisningen kører som træning over 5 dage i intensive workshops, Vi underviser i metoder som _Test Driven Devlopement_ (TDD) og Agile opgavestyring samt Open Source teknologier som [Git](https://git-scm.com/){: target="_blank" }, [Jenkins](https://jenkins.io/){: target="_blank" data-proofer-ignore} og [Docker](https://www.docker.com/){: target="_blank" }. På den sidste dag i kurset, skal eleverne sætte det hele sammen til en fungerende _Continuous Delivery pipeline_.

Undervisningen er gratis, hvis man er studerende på en Computer Science relateret uddannelse. Vi har allokeret tre underviserer på hvert academy og at vi beregner omtrent ligeså meget forberedelsestid som vi har undervisning, Samlet set påregner vi, i vores virksomhed, at levere 120 mandedage på dette projekt. Omkostningerne er sponsoreret af 5 lokale virksomheder per academy, altså 20 sponsorere i alt (bl.a. [Danfoss](http://drives.danfoss.dk/){: target="_blank" }, [Napatech](http://www.napatech.com/){: target="_blank" }), der som tak får deres støtte til projektet får lejlighed til at tale til de studerende og mødes med dem til en barbeque på akademiets sidste dag - og potentielt rekruttere studenterarbejdere til at udføre noget af dette vigtige arbejde i deres organisationer.

Foruden lokale sponsorer har vi et antal teknologisponsorere med, blandt andet [GitHub](http://www.github.com){: target="_blank" }.

## Men hvorfor?
Målet er dels, at vi håber på at kunne tænde lyset i øjnene på en håndfuld af de studerende, så de indser, at der ad denne sti ligger en interessant karrierevej og venter.

Derudover håber vi, at universiteter og læreanstalter vil tillade noget af deres  personale at deltage i vores _train-the-trainer program_. Som i al sin enkelthed går ud på, at lærere fra universiteter og læreanstanlter deltager i undervisningen de fem dage på lige fod med de studerende, men derudover, også deltager i en særlig workshop om aftenen efter den første dag, hvor vi gennemgår kursusmaterialet for dem, og stiller det gratis til rådighed for universiteterne, så de selv kan oprette kurser på deres uddannelser med lignende  indhold.

__I den sidste ende er målet at entydigt at sike, at der i fremtiden er flere mennesker der forstår og mestrer det her paradigme.__
