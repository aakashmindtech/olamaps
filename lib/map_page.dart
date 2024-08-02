// class MapPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Map Demo'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(19.05152, 72.83254), // Coordinates of the map center
//           zoom: 13.0, // Initial zoom level
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: const ['a', 'b', 'c'],
//             userAgentPackageName: 'com.example.app', // Replace with your package name
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(19.05152, 72.83254),
//                 builder: (ctx) => const Icon(Icons.location_on, color: Colors.orange, size: 40.0),
//               ),
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(19.02126, 72.83195),
//                 builder: (ctx) => const Icon(Icons.not_started, color: Colors.green, size: 40.0),
//               ),
//             ],
//           ),
//           PolylineLayer(
//             polylines: [
//               Polyline(
//                 points: [
//                   LatLng(19.05152, 72.83254),
//                   // LatLng(18.758280000000013, 73.37561),
//
//                   LatLng(19.05204, 72.83224),
//                   // LatLng(18.760389999999987, 73.42530999999998),
//
//                   LatLng(19.05253, 72.83421000000001),
//                   // LatLng(18.75623999999999, 73.42917999999995),
//
//                   LatLng(19.05253, 72.83421),
//                   // LatLng(18.73356, 73.44588),
//
//                   LatLng(19.050050000000002, 72.83791),
//                   // LatLng(18.73356, 73.44588),
//
//                   LatLng(19.04773, 72.83836),
//
//                   LatLng( 19.03702, 72.84235),
//
//                   LatLng(19.03151,  72.84209),
//
//                   LatLng(19.02063, 72.83293),
//
//                   LatLng(19.02126, 72.83195),
//
//
//                 ],
//                 strokeWidth: 4.0,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }