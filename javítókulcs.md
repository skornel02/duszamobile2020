### Funkció jellemzők

- [x] Létezik egy duszamobile2020 applikáció fájl
- [x] A programban lehetséges javításokat rögzíteni
  - [x] Lehet rögzíteni hogy márkaszervíz vagy saját javítás útján történt
  - [x] Lehet rögzíteni dátumot, tételeket, költséget, és kilóméteróra állást.
  - [x] Lehet rögzíteni a javítás okát
- [x] Tételenként rendezhető az összes javítás
- [x] A program adjon lehetőséget értesítések bevitelére.
- [x] A program értesítései a következő szempontok szerint működjön
  - [x] Megadott dátum
  - [x] Elkövetkező kilóméter óra állásnál
  - [x] Minden ismétlődő dátumnál
  - [x] Minden adott kilóméterenként vagy dátumnál, ami hamarabb bekövetkezik.
- [x] A program tartsa számban a tankolásokat a következő paraméterek bevitelével: Tankolt üzemanyag, kilóméteróra állás, fizetett pénz.
- [x] Tételenként jelenítse meg a program a javításokat, értesítéseket, és ezeket statisztikával lássa el.
- [x] A program a belső adatait képes legyen exportálni.
- [x] Adjon a program lehetőséget a kötelező biztosítás kifizetésének automatikus emlékesztetésére.
- [x] A program tartsa számon az éppen aktuális autópálya matricákat, és értesítsen azok elavulásáról.
- [x] A programba lehessen megadni az autó kerekét
  - [ ] és értesítsen annak cseréléséről ha szükséges.
- [x] A program adjon lehetőséget Google fiók alapú szinkronizációra.
- [ ] A program belépett felhasználóknak ajánlja fel a google calendar szinkronizációt.

### Technikai elvárások

- [x] A program használjon ROUTE alapú felosztást.
- [x] A program használjon adat tárolásra Provider - repository alapú modelt.
- [x] A program használjon állapot tárolásra Bloc mintát. _Kivételt képeznek az adat bemenetért felelős Widgetek._
- [x] Minden adat bevitele egy ellenőrzésen essen át.
- [x] A szinkronizáció menete ne legyen hosszasabb mint a fiókba belépés, ütközés esetén a felhasználó döntsön a régebbi vagy újabb verziót kívánja megtartani.
- [x] Az értesítések a belső adatok alapján legyenek legenerálva saját formátumba.
- [x] A saját formátumba generált értesítések legyenek a rendszernek átadva értesítésre.
- [x] Az autónak legyenek tulajdonságai amit a benne lévő adatok alapján számoljon ki.
- [x] A program tartalmaz teljes kétnyelvűséget.

### Esztétikai elvárások

- [x ] A programnak legyen neve, és logója.
- [x] A program rendelkezzen egy szín akcentussal
- [x] A program rendelkezzen váltható éjszakai szín akcentussal
- [ ] A program tartalmazzon egy bevezető tutorialt, ami az első autónk adatait beállítja.
- [x] A program legyen dugig tömve szép kimutatásokkal.

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
