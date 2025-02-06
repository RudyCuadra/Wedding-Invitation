import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constans/assets.dart';
import '../widgets/flower_decoration.dart';

class ConfirmarAsistencia extends StatefulWidget {
  @override
  _ConfirmarAsistenciaState createState() => _ConfirmarAsistenciaState();
}

class _ConfirmarAsistenciaState extends State<ConfirmarAsistencia> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  String? _docId;
  bool? _asistira;

  // Método para buscar al invitado en Firestore
  Future<void> _buscarInvitado() async {
    var query = await FirebaseFirestore.instance
        .collection('confirmaciones')
        .where('nombre', isEqualTo: _nombreController.text)
        .where('apellido', isEqualTo: _apellidoController.text)
        .get();

    if (query.docs.isNotEmpty) {
      setState(() {
        _docId = query.docs.first.id;
        _asistira = query.docs.first['asistira'];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No se encontró tu nombre, verifica los datos.")),
      );
    }
  }

  // Método para confirmar asistencia
  Future<void> _confirmarAsistencia() async {
    if (_docId == null) return;

    await FirebaseFirestore.instance.collection('confirmaciones').doc(_docId).update({
      'asistira': true,
    });

    setState(() {
      _asistira = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("¡Gracias por confirmar tu asistencia! 🎉")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20), // Padding aplicado a la mayoría de los widgets
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Confirmanos tu\nasistencia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    height: 0.8,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'InriaSerif',
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Para confirmar la asistencia a la boda sólo\ntienes que escribir tu nombre y darle a\nBuscar. Aparecera tu nombre y solo tienes\nque decir si vendrás o no a la boda.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.brown[700],
                    fontFamily: 'InriaSerif',
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: InputDecoration(labelText: "Apellido"),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: _buscarInvitado,
                  child: Text("Buscar Invitado"),
                ),
                SizedBox(height: 20),
                if (_docId != null)
                  Column(
                    children: [
                      Text("Estado: ${_asistira == true ? "Confirmado ✅" : "Pendiente ❌"}"),
                      ElevatedButton(
                        onPressed: _confirmarAsistencia,
                        child: Text("Confirmar Asistencia"),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Row fuera del Padding global
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssets.flowersLeft,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AppAssets.flowersRight,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),

        ],
      ),
    );



    /*return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text(
              "Confirmanos tu\nasistencia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'InriaSerif',
              ),
            ),
            SizedBox(height: 40,),
            Text(
              "Para confirmar la asistencia a la boda sólo\ntienes que escribir tu nombre y darle a\nBuscar. Aparecera tu nombre y solo tienes\nque decir si vendrás o no a la boda.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),
            SizedBox(height: 40,),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: _apellidoController,
              decoration: InputDecoration(labelText: "Apellido"),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: _buscarInvitado,
              child: Text("Buscar Invitado"),
            ),
            SizedBox(height: 20),
            if (_docId != null)
              Column(
                children: [
                  Text("Estado: ${_asistira == true ? "Confirmado ✅" : "Pendiente ❌"}"),
                  ElevatedButton(
                    onPressed: _confirmarAsistencia,
                    child: Text("Confirmar Asistencia"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );*/
  }
}
