// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hu';

  static m0(targetDate, date) => "${targetDate}-nak/nek ${date} után kell lennie";

  static m1(item) => "${item} nem lehet üres!";

  static m2(item) => "${item} csak érvényes dátum lehet";

  static m3(item) => "${item} csak érvényes szám lehet";

  static m4(item) => "${item} csak érvényes szám lehet";

  static m5(item, amount) => "${item} nem lehet több, mint ${amount} karakter";

  static m6(item, otherItem) => "${item} nagyobbnak kell lennie, mint ${otherItem}";

  static m7(name) => "Biztosan teljesíteni szeretnéd: \'${name}\'?";

  static m8(efficiency) => "Hatékonyság: ${efficiency} l/100km";

  static m9(efficiency) => "${efficiency} Ft";

  static m10(day) => "${day} nap maradt";

  static m11(car_name) => "autó törlése \'${car_name}\'";

  static m12(date) => "ettől érvéney autópálya matrica törlése ${date}";

  static m13(date) => "tankolás törlése ekkor: ${date}";

  static m14(title) => "emlékeztető törlése: \'${title}\'";

  static m15(date) => "szervizelés törlése ekkor: ${date}";

  static m16(do_something) => "Szeretnéd elvégezni: ${do_something}?";

  static m17(area) => "[E-Vignette] ${area} le fog járni";

  static m18(s) => "Nincs még ${s} hozzáadva";

  static m19(date) => "Érvényes eddig: ${date}";

  static m20(km) => "${km} km maradt";

  static m21(area, time) => "Utolsó ${area} változás: ${time}";

  static m22(price) => "Liter ár: ${price} Ft";

  static m23(date, title) => "Az emlékeztető ezen a dátumon ${date} lejárt! ${title}";

  static m24(title) => "Nézd meg az emlékeztetőd: ${title}";

  static m25(milage, title) => "Elérted a kilométer ${milage} célodat! ${title}";

  static m26(carName) => "Tankolások - ${carName}";

  static m27(item, amount) => "${item}: ${amount} Ft";

  static m28(name) => "Üdvözlünk ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "active" : MessageLookupByLibrary.simpleMessage("Aktív"),
    "add" : MessageLookupByLibrary.simpleMessage("Hozzáadás"),
    "add_car" : MessageLookupByLibrary.simpleMessage("Autó hozzáadása"),
    "add_evignette" : MessageLookupByLibrary.simpleMessage("Autópálya matrica hozzáadása"),
    "add_refuel" : MessageLookupByLibrary.simpleMessage("Tankolás hozzáadása"),
    "add_reminder" : MessageLookupByLibrary.simpleMessage("Értesítés hozzáadása"),
    "add_repair" : MessageLookupByLibrary.simpleMessage("Szervizelés hozzáadása"),
    "after_milage" : MessageLookupByLibrary.simpleMessage("Kilométer után"),
    "are_you_sure" : MessageLookupByLibrary.simpleMessage("Biztos vagy benne?"),
    "automatically_generated" : MessageLookupByLibrary.simpleMessage("Automatikusan generált"),
    "back_to_cars_menuitem" : MessageLookupByLibrary.simpleMessage("Másik autó választása"),
    "both" : MessageLookupByLibrary.simpleMessage("Mindkettő"),
    "bought" : MessageLookupByLibrary.simpleMessage("Megvett"),
    "calendar_synchronisation" : MessageLookupByLibrary.simpleMessage("Naptár szinkronizáció"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Mégse"),
    "cant_be_before" : m0,
    "cant_be_empty" : m1,
    "cant_be_invalid_date" : m2,
    "cant_be_not_double" : m3,
    "cant_be_not_int" : m4,
    "cant_be_over" : m5,
    "cant_be_smaller" : m6,
    "car_name" : MessageLookupByLibrary.simpleMessage("Autó név"),
    "car_settings" : MessageLookupByLibrary.simpleMessage("Autó beállítások"),
    "car_settings_page_menuitem" : MessageLookupByLibrary.simpleMessage("Autó beállítások"),
    "change_car" : MessageLookupByLibrary.simpleMessage("Autó váltás"),
    "cheese" : MessageLookupByLibrary.simpleMessage("Sajt"),
    "complete_reminder" : m7,
    "consumption" : m8,
    "consumption_label" : MessageLookupByLibrary.simpleMessage("100 kilométerenkénti fogyasztás literben"),
    "county" : MessageLookupByLibrary.simpleMessage("Megye"),
    "create" : MessageLookupByLibrary.simpleMessage("Létrehozás"),
    "currency" : m9,
    "dark_theme" : MessageLookupByLibrary.simpleMessage("Sötét mód"),
    "date" : MessageLookupByLibrary.simpleMessage("Dátum"),
    "date_format" : MessageLookupByLibrary.simpleMessage("nn-HH-éééé"),
    "date_format_to_show" : MessageLookupByLibrary.simpleMessage("éééé.HH.nn"),
    "days_left" : m10,
    "description" : MessageLookupByLibrary.simpleMessage("Leírás"),
    "do_remove_car" : m11,
    "do_remove_e_vignette" : m12,
    "do_remove_refuel" : m13,
    "do_remove_reminder" : m14,
    "do_remove_repair" : m15,
    "do_you_want_to" : m16,
    "e_vignette_expiration_reminder" : m17,
    "e_vignette_page_menuitem" : MessageLookupByLibrary.simpleMessage("Autópálya matricák"),
    "edit" : MessageLookupByLibrary.simpleMessage("Szerkesztés"),
    "edit_car" : MessageLookupByLibrary.simpleMessage("Autó szerkesztése"),
    "edit_refuel" : MessageLookupByLibrary.simpleMessage("Tankolás szerkesztése"),
    "edit_reminder" : MessageLookupByLibrary.simpleMessage("Értesítés szerkesztése"),
    "edit_repair" : MessageLookupByLibrary.simpleMessage("Szervizelés szerkesztése"),
    "empty" : m18,
    "evignettes" : MessageLookupByLibrary.simpleMessage("Autópálya matricák"),
    "expiration" : MessageLookupByLibrary.simpleMessage("Lejárat"),
    "expiration_date" : m19,
    "expiration_monthly" : MessageLookupByLibrary.simpleMessage("Havi"),
    "expiration_weekly" : MessageLookupByLibrary.simpleMessage("Heti"),
    "expiration_yearly" : MessageLookupByLibrary.simpleMessage("Éves"),
    "expired" : MessageLookupByLibrary.simpleMessage("Lejárt"),
    "export" : MessageLookupByLibrary.simpleMessage("Exportálás"),
    "export_json" : MessageLookupByLibrary.simpleMessage("A JSON exportom"),
    "filter" : MessageLookupByLibrary.simpleMessage("Szűrő"),
    "general_statistics" : MessageLookupByLibrary.simpleMessage("Általános statisztikák"),
    "google_login" : MessageLookupByLibrary.simpleMessage("Google belépés"),
    "km_left" : m20,
    "language" : MessageLookupByLibrary.simpleMessage("Nyelv"),
    "last_change" : m21,
    "last_milage" : MessageLookupByLibrary.simpleMessage("Kilométer óra állása legutóbbi tankolásnál"),
    "last_refuel_was_recorded" : MessageLookupByLibrary.simpleMessage("Utolsó tankolás rögzítve"),
    "liter_price" : m22,
    "local_area" : MessageLookupByLibrary.simpleMessage("helyi"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Főoldal"),
    "milage" : MessageLookupByLibrary.simpleMessage("Kilométer óra állása"),
    "monthly" : MessageLookupByLibrary.simpleMessage("Havi"),
    "more_regions" : MessageLookupByLibrary.simpleMessage("Több megye"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("Autóim"),
    "name" : MessageLookupByLibrary.simpleMessage("Név"),
    "no" : MessageLookupByLibrary.simpleMessage("Nem"),
    "notification_date" : m23,
    "notification_date_and_milage" : m24,
    "notification_milage" : m25,
    "notify_after_kilometers" : MessageLookupByLibrary.simpleMessage("Emlékeztető ennyi kilométer után"),
    "notify_on_date" : MessageLookupByLibrary.simpleMessage("Emlékeztető ekkor"),
    "only_annual_for_county" : MessageLookupByLibrary.simpleMessage("Csak országos elérhető"),
    "other_regions" : MessageLookupByLibrary.simpleMessage("Más megyék"),
    "petrol_price_over_time" : MessageLookupByLibrary.simpleMessage("Üzemanyag árváltozás"),
    "price" : MessageLookupByLibrary.simpleMessage("Ár"),
    "reason" : MessageLookupByLibrary.simpleMessage("Ok"),
    "refuel" : MessageLookupByLibrary.simpleMessage("tankolás"),
    "refuels" : MessageLookupByLibrary.simpleMessage("Tankolások"),
    "refuels_page_menuitem" : MessageLookupByLibrary.simpleMessage("Tankolások"),
    "refuels_page_title" : m26,
    "region" : MessageLookupByLibrary.simpleMessage("Megye"),
    "regional" : MessageLookupByLibrary.simpleMessage("Megyei"),
    "remind_about_e_vignette" : MessageLookupByLibrary.simpleMessage("Szeretnél emlékeztetőt létrehoznyi, amikor az autpálya matrica lejár?"),
    "reminders" : MessageLookupByLibrary.simpleMessage("Értesítések"),
    "reminders_page_menuitem" : MessageLookupByLibrary.simpleMessage("Értesitők"),
    "remote_area" : MessageLookupByLibrary.simpleMessage("távoli"),
    "repair" : MessageLookupByLibrary.simpleMessage("Szervizelés"),
    "repairs" : MessageLookupByLibrary.simpleMessage("Szervizelések"),
    "repairs_page_menuitem" : MessageLookupByLibrary.simpleMessage("Szervizek"),
    "repeat_this_reminder_again" : MessageLookupByLibrary.simpleMessage("Meg akarod ismételni ezt az emlékeztetőt?"),
    "save" : MessageLookupByLibrary.simpleMessage("Mentés"),
    "settings_description" : MessageLookupByLibrary.simpleMessage("Itt érhető el a felhőbe való szinkronizálástól kezdve a sötét módig minden. Bökj meg pár gombot és nézd mi történik!"),
    "spending_format" : m27,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statisztikák"),
    "statistics_page_menuitem" : MessageLookupByLibrary.simpleMessage("Statisztikák"),
    "suggestion" : MessageLookupByLibrary.simpleMessage("Ajánlás"),
    "synchronise" : MessageLookupByLibrary.simpleMessage("Szinkronizáció"),
    "test_notification" : MessageLookupByLibrary.simpleMessage("Teszt értesítés"),
    "time_format" : MessageLookupByLibrary.simpleMessage("éééé-HH-nn – kk:mm"),
    "tire_type" : MessageLookupByLibrary.simpleMessage("Abroncs típus"),
    "tire_type_all_year" : MessageLookupByLibrary.simpleMessage("Egész éves"),
    "tire_type_other" : MessageLookupByLibrary.simpleMessage("Egyéb"),
    "tire_type_summer" : MessageLookupByLibrary.simpleMessage("Nyári"),
    "tire_type_winter" : MessageLookupByLibrary.simpleMessage("Téli"),
    "title" : MessageLookupByLibrary.simpleMessage("Dusza mobil 2020"),
    "total_spending" : MessageLookupByLibrary.simpleMessage("Összes költség"),
    "type" : MessageLookupByLibrary.simpleMessage("Típus"),
    "upcoming" : MessageLookupByLibrary.simpleMessage("Közelgő"),
    "user_settings" : MessageLookupByLibrary.simpleMessage("Felhasználói beállítások"),
    "user_settings_page_menuitem" : MessageLookupByLibrary.simpleMessage("Felhasználói beállitás"),
    "warranty" : MessageLookupByLibrary.simpleMessage("Garanciális"),
    "weekly" : MessageLookupByLibrary.simpleMessage("Heti"),
    "welcome" : m28,
    "year" : MessageLookupByLibrary.simpleMessage("Év"),
    "yearly_countrywide" : MessageLookupByLibrary.simpleMessage("Éves országos"),
    "yearly_regional" : MessageLookupByLibrary.simpleMessage("Éves megyei"),
    "yes" : MessageLookupByLibrary.simpleMessage("Igen")
  };
}
