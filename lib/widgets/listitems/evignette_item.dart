import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class EVignetteItem extends StatelessWidget {
  final EVignette eVignette;

  EVignetteItem(this.eVignette);

  void _onOpen(BuildContext context) {
    ReadyState state = BlocProvider.of<CarBloc>(context).state;
    print("Opening eVignette #${eVignette.id}");
    Navigator.pushNamed(
        context, "/cars/${state.car.id}/evignette/${eVignette.id}");
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description: "",
      onAccept: () {
        BlocProvider.of<CarBloc>(context)
            .add(RemoveEVignetteItem(eVignette.id));
      },
    );
  }

  String getImagePath(String area) {
    switch (area) {
      case "Országos":
        return 'images/icon_orszagos.png';
      case "Bács-Kiskun megye":
        return 'images/icon_bacs-kiskun.png';
      case "Baranya megye":
        return 'images/icon_baranya.png';
      case "Borsod-Abaúj-Zemplén megye":
        return 'images/icon_baz.png';
      case "Fejér megyer":
        return 'images/icon_fejer.png';
      case "Csongrád-Csanád megye":
        return 'images/icon_csongrad-csanad.png';
      case "Győr-Moson-Sopron megye":
        return 'images/icon_gyor-moson-sopron.png';
      case "Hajdú-Bihar megye":
        return 'images/icon_hajdu-bihar.png';
      case "Heves megye":
        return 'images/icon_heves.png';
      case "Komárom-Esztergom megye":
        return 'images/icon_komarom-esztergom.png';
      case "Pest megye":
        return 'images/icon_pest.png';
      case "Somogy megye":
        return 'images/icon_somogy.png';
      case "Szabolcs-Szatmár-Bereg megye":
        return 'images/icon_szabolcs-szatmar-bereg.png';
      case "Tolna megye":
        return 'images/icon_tolna.png';
      case "Vas megye":
        return 'images/icon_vas.png';
      case "Veszprém megye":
        return 'images/icon_veszprem.png';
      case "Zala megye":
        return 'images/icon_zala.png';
      default:
        return 'images/icon_orszagos.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        onTap: () => _onOpen(context),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(eVignette.area == "Országos"
                    ? "Országos matrica"
                    : "Megyei matrica"),
                if (eVignette.area != "Országos") Text(eVignette.area),
                Text(eVignette.duration == 365
                    ? "Éves"
                    : "${eVignette.duration} napos"),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(S.of(context).expiration_date(
                    (eVignette.start == null || eVignette.duration == null)
                        ? "NULL"
                        : DateFormat(S.of(context).date_format_to_show).format(
                            eVignette.start
                                .add(Duration(days: eVignette.duration))))),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/" + getImagePath(eVignette.area)),
                )
              ],
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.times),
              onPressed: () => _onRemove(context),
            ),
          ],
        ),
      ),
    );
  }
}
