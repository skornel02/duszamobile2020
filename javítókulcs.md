### Funkció jellemzők

- [ ] Létezik egy duszamobile2020 applikáció fájl
- [ ] A programban lehetséges javításokat rögzíteni
  - [ ] Lehet rögzíteni hogy márkaszervíz vagy saját javítás útján történt
  - [ ] Lehet rögzíteni dátumot, tételeket, költséget, és kilóméteróra állást.
  - [ ] Lehet rögzíteni a javítás okát
- [ ] Tételenként rendezhető az összes javítás
- [ ] A program adjon lehetőséget értesítések bevitelére.
- [ ] A program értesítései a következő szempontok szerint működjön
  - [ ] Megadott dátum
  - [ ] Elkövetkező kilóméter óra állásnál
  - [ ] Minden ismétlődő dátumnál
  - [ ] Minden adott kilóméterenként vagy dátumnál, ami hamarabb bekövetkezik.
- [ ] A program tartsa számban a tankolásokat a következő paraméterek bevitelével: Tankolt üzemanyag, kilóméteróra állás, fizetett pénz.
- [ ] Tételenként jelenítse meg a program a javításokat, értesítéseket, és ezeket statisztikával lássa el.
- [ ] A program a belső adatait képes legyen exportálni.
- [ ] Adjon a program lehetőséget a kötelező biztosítás kifizetésének automatikus emlékesztetésére.
- [ ] A program tartsa számon az éppen aktuális autópálya matricákat, és értesítsen azok elavulásáról.
- [ ] A programba lehessen megadni az autó kerekét, és értesítsen annak cseréléséről ha szükséges.
- [ ] A program adjon lehetőséget Google fiók alapú szinkronizációra.
- [ ] A program belépett felhasználóknak ajánlja fel a google calendar szinkronizációt.

### Technikai elvárások

- [ ] A program használjon ROUTE alapú felosztást.
- [ ] A program használjon adat tárolásra Provider - repository alapú modelt.
- [ ] A program használjon állapot tárolásra Bloc mintát. _Kivételt képeznek az adat bemenetért felelős Widgetek._
- [ ] Minden adat bevitele egy ellenőrzésen essen át.
- [ ] A szinkronizáció menete ne legyen hosszasabb mint a fiókba belépés, ütközés esetén a felhasználó döntsön a régebbi vagy újabb verziót kívánja megtartani.
- [ ] Az értesítések a belső adatok alapján legyenek legenerálva saját formátumba.
- [ ] A saját formátumba generált értesítések legyenek a rendszernek átadva értesítésre.
- [ ] Az autónak legyenek tulajdonságai amit a benne lévő adatok alapján számoljon ki.
- [ ] A program tartalmaz teljes kétnyelvűséget.

### Esztétikai elvárások

- [ ] A programnak legyen neve, és logója.
- [ ] A program rendelkezzen egy szín akcentussal
- [ ] A program rendelkezzen váltható éjszakai szín akcentussal
- [ ] A program tartalmazzon egy bevezető tutorialt, ami az első autónk adatait beállítja.
- [ ] A program legyen dugig tömve szép kimutatásokkal.

### Bevezető elvárás

- [ ] Tartalmaz egy rövid bevezető szöveget hogy miben segít az applikáció
- [ ] A program felajánlja a fiókba belépést, és ha a fiók tartalmaz már adatokat, akkor befejezi a bemutatót.
- [ ] Továbbá a program egy kocsi bevitelét kéri
- [ ] A megadott kocsi adatait beállítja
- [ ] Felajánlja a kötelező biztosítás megadását

### Dokumentációs elvárások

- [ ] A beadott munka el van látva egy dokumentációval PDF formában.
- [ ] Tartalmaz egy egyszerű egy autót használó (simple) felhasználó számára kitalált bevezetőt
- [ ] Tartalmaz egy autó flottát számontartó (advanced) felhasználó számára kitalált bevezetőt
- [ ] Tartalmaz egy fejlesztők számára írt dokumentációt a program felépítéséről.
