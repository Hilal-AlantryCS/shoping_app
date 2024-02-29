import 'package:bot_toast/bot_toast.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class LocationService {
  Location location = new Location();

  Future<LocationData?> getCurrentLocation({bool? showLoader = false}) async {
    LocationData? _locationData;
    if (!await isServiceEnabled()) return null;
    if (!await isPermissionGranted()) return null;

    if (showLoader!) customLoader();

    _locationData = await location.getLocation();
    BotToast.closeAllLoading();

    return _locationData;
  }

  Future<geo.Placemark?> getLocationInfo(LocationData locationData,
      {bool? showLoader = false}) async {
    if (showLoader!) customLoader();

    List<geo.Placemark>? placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty) {
      return placemarks.first;
    } else
      return null;
  }

  Future<bool> isServiceEnabled() async {
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //! --- Location is required ----
        return false;
      }
    }

    return _serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //!--- Permission required  --
        return false;
      }
    }

    return _permissionGranted != PermissionStatus.denied;
  }
}
