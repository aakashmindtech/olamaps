import 'package:auto_size_text/auto_size_text.dart';
import 'package:coachmarker/controller/distance_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'common/utils/linear_loader.dart';
import 'controller/ola_auto_complete_controller.dart';
import 'main.dart';
import 'map_page.dart';

class OlaAutoComplete extends StatefulWidget {
  const OlaAutoComplete({super.key});

  @override
  State<OlaAutoComplete> createState() => _OlaAutoCompleteState();
}

class _OlaAutoCompleteState extends State<OlaAutoComplete> {
  AutoCompleteController autoCompleteController = AutoCompleteController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  String _address = 'Fetching address...';
  double sourceLatittude = 0.0;
  double sourceLongitude = 0.0;
  double destinationLatittude = 0.0;
  double destinationLongitude = 0.0;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DistanceController distanceController = Get.put(DistanceController());

  @override
  void initState() {
    autoCompleteController.autoCompleteApiCall(context, '');
    // TODO: implement initState
    super.initState();
  }

  _getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, do not continue
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can get the position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {});

      // Convert latitude and longitude to address
      _getAddressFromLatLng(position);
    } catch (e) {}
  }

  _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        _sourceController.text = _address;
        sourceLatittude = position.latitude;
        sourceLongitude = position.longitude;
      });
      await distanceController.distanceApiCall(context, sourceLatittude, sourceLongitude, destinationLatittude, destinationLongitude);

    } catch (e) {
      setState(() {
        _address = 'Could not fetch address';
      });
    }
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * .2),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _sourceController,
                      focusNode: _focusNode2,
                      onTap: () {
                        FocusScope.of(context).requestFocus(_focusNode2);
                      },
                      onChanged: (value) {
                        autoCompleteController.autoCompleteApiCall(
                            context, value);
                      },
                      decoration: InputDecoration(
                        hintText: "Pickup location",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              _getCurrentLocation();
                            },
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.black,
                            )),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1), // Border color and width
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2), // Border color and width when focused
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2), // Border color and width when focused
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1), // Border color and width when enabled
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15), // Adjust padding as needed
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _destinationController,
                      focusNode: _focusNode1,
                      onTap: () {
                        FocusScope.of(context).requestFocus(_focusNode1);
                      },
                      onChanged: (value) {
                        autoCompleteController.autoCompleteApiCall(
                            context, value);
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              _destinationController.clear();
                              autoCompleteController.autoCompleteApiCall(
                                  context, '');
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.grey,
                            )),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1), // Border color and width
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2), // Border color and width when focused
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2), // Border color and width when focused
                        ),
                        hintText: "Destination",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          // Removes rounded corners
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1), // Border color and width when enabled
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15), // Adjust padding as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _focusNode1.hasFocus
                  ? Obx(() {
                      return autoCompleteController.isLoading.value
                          ? _destinationController.text.isEmpty
                              ? const Center(child: Text("No Data Available"))
                              : Center(child: BackAndForthProgressBar())
                          : AutoCompleteController.autoCompleteItems.isEmpty
                              ? const Text("No Data Available")
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: AutoCompleteController
                                      .autoCompleteItems.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _destinationController.text =
                                                  AutoCompleteController
                                                      .autoCompleteItems[index]
                                                      .description;
                                              _focusNode1.unfocus();
                                              setState(() {
                                                destinationLatittude =
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .geometry
                                                        .location
                                                        .lat;
                                                destinationLongitude =
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .geometry
                                                        .location
                                                        .lng;
                                              });

                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                                Expanded(
                                                  child: AutoSizeText(
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .description,
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(),
                                        ],
                                      ),
                                    );
                                  },
                                );
                    })
                  : const SizedBox.shrink(),
              _focusNode2.hasFocus
                  ? Obx(() {
                      return autoCompleteController.isLoading.value
                          ? _destinationController.text.isEmpty
                              ? const Center(child: Text("No Data Available"))
                              : Center(child: BackAndForthProgressBar())
                          : AutoCompleteController.autoCompleteItems.isEmpty
                              ? const Text("No Data Available")
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: AutoCompleteController
                                      .autoCompleteItems.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              _sourceController.text =
                                                  AutoCompleteController
                                                      .autoCompleteItems[index]
                                                      .description;
                                              _focusNode2.unfocus();
                                              setState(() {
                                                sourceLatittude =
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .geometry
                                                        .location
                                                        .lat;
                                                sourceLongitude =
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .geometry
                                                        .location
                                                        .lng;
                                              });
                                              await distanceController.distanceApiCall(context, sourceLatittude, sourceLongitude, destinationLatittude, destinationLongitude);
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                                Expanded(
                                                  child: AutoSizeText(
                                                    AutoCompleteController
                                                        .autoCompleteItems[
                                                            index]
                                                        .description,
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(),
                                        ],
                                      ),
                                    );
                                  },
                                );
                    })
                  : const SizedBox.shrink(),
              _destinationController.text.isEmpty ||
                      _sourceController.text.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.54,
                      child: MapPage(
                        destinationLatittude: destinationLatittude,
                        destinationLongitude: destinationLongitude,
                        sourceLatittude: sourceLatittude,
                        sourceLongitude: sourceLongitude,
                      ),
                    ),
              _destinationController.text.isEmpty ||
                      _sourceController.text.isEmpty
                  ? const SizedBox.shrink()
                  : SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.orange),
                                  color: Colors.green
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width * .8,
                                          child: AutoSizeText(
                                            _sourceController.text,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: List.generate(
                                          10,
                                          (index) => Padding(
                                            padding: const EdgeInsets.only(left: 9.0),
                                            child: Container(
                                              width: 4,
                                              height: 4,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                color: Colors.white,
                                              ),
                                              margin:
                                                  const EdgeInsets.only(bottom: 4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width * .8,
                                          child: AutoSizeText(
                                            _destinationController.text,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //     decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Row(
                                    //         children: [
                                    //           Container(
                                    //             height: 70,
                                    //             width: 70,
                                    //             decoration: BoxDecoration(
                                    //                 color: Colors.white,
                                    //                 border: Border.all(color: Colors.orange),
                                    //               borderRadius: BorderRadius.circular(100.0)
                                    //             ),
                                    //           ),
                                    //
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //     decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Row(
                                    //         children: [
                                    //           Container(
                                    //             height: 70,
                                    //             width: 70,
                                    //             decoration: BoxDecoration(
                                    //                 color: Colors.white,
                                    //               border: Border.all(color: Colors.orange),
                                    //               borderRadius: BorderRadius.circular(100.0)
                                    //             ),
                                    //           ),
                                    //
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //     decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Row(
                                    //         children: [
                                    //           Container(
                                    //             height: 70,
                                    //             width: 70,
                                    //             decoration: BoxDecoration(
                                    //                 color: Colors.white,
                                    //                 border: Border.all(color: Colors.orange),
                                    //               borderRadius: BorderRadius.circular(100.0)
                                    //             ),
                                    //           ),
                                    //
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.orange)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     const Icon(
                                    //       Icons.location_on,
                                    //       color: Colors.white,
                                    //     ),
                                    //     Container(
                                    //       width:
                                    //           MediaQuery.of(context).size.width * .8,
                                    //       child: AutoSizeText(
                                    //         _sourceController.text,
                                    //         overflow: TextOverflow.ellipsis,
                                    //         style:
                                    //             const TextStyle(color: Colors.white),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0),
                                    //   child: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     children: List.generate(
                                    //       10,
                                    //       (index) => Padding(
                                    //         padding: const EdgeInsets.only(left: 9.0),
                                    //         child: Container(
                                    //           width: 4,
                                    //           height: 4,
                                    //           decoration: const BoxDecoration(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(20.0)),
                                    //             color: Colors.white,
                                    //           ),
                                    //           margin:
                                    //               const EdgeInsets.only(bottom: 4),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     const Icon(
                                    //       Icons.location_on,
                                    //       color: Colors.white,
                                    //     ),
                                    //     Container(
                                    //       width:
                                    //           MediaQuery.of(context).size.width * .8,
                                    //       child: AutoSizeText(
                                    //         _destinationController.text,
                                    //         overflow: TextOverflow.ellipsis,
                                    //         style:
                                    //             const TextStyle(color: Colors.white),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 70,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(color: Colors.orange),
                                                    borderRadius: BorderRadius.circular(100.0)
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 70,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(color: Colors.orange),
                                                    borderRadius: BorderRadius.circular(100.0)
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.orange), borderRadius: BorderRadius.circular(100.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 70,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(color: Colors.orange),
                                                    borderRadius: BorderRadius.circular(100.0)
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.orange)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Remarks", style: TextStyle(
                                          color: Colors.grey
                                        ),),
                                      ],
                                    ),
                                    TextField(
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          // Removes rounded corners
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1), // Border color and width
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .8,
                                    child: TextField(
                                      controller: _dateController,
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        hintText: 'Date',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: _selectedDate,
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2100),
                                        );
                                        if (picked != null && picked != _selectedDate) {
                                          setState(() {
                                            _selectedDate = picked;
                                            String daySuffix(int day) {
                                              if (day >= 11 && day <= 13) {
                                                return 'th';
                                              }
                                              switch (day % 10) {
                                                case 1:
                                                  return 'st';
                                                case 2:
                                                  return 'nd';
                                                case 3:
                                                  return 'rd';
                                                default:
                                                  return 'th';
                                              }
                                            }

                                            final DateFormat formatter =
                                            DateFormat("d MMMM, yyyy");
                                            String day = DateFormat('d').format(picked);
                                            String suffix = daySuffix(int.parse(day));
                                            _dateController.text = '$day$suffix ${DateFormat('MMMM, yyyy').format(picked)}';
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * .14,
                                        height: MediaQuery.of(context).size.width * .15,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xffd48a31))),
                                        child: const Icon(
                                          Icons.calendar_month,
                                          color: Color(0xffd48a31),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
