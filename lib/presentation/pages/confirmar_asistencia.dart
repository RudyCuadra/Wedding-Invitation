import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constans/assets.dart';

class ConfirmarAsistencia extends StatefulWidget {
  @override
  _ConfirmarAsistenciaState createState() => _ConfirmarAsistenciaState();
}

class _ConfirmarAsistenciaState extends State<ConfirmarAsistencia> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  List<DocumentSnapshot> _resultados = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  bool _clearDataForm = false;

  // Método para buscar invitados
  Future<void> _buscarInvitado() async {
    setState(() {
      _isLoading = true;
      _hasSearched = true;
    });

    Query query = FirebaseFirestore.instance.collection('confirmaciones');

    if (_nombreController.text.isNotEmpty) {
      query = query.where('nombre', isEqualTo: _nombreController.text);
    }

    if (_apellidoController.text.isNotEmpty) {
      query = query.where('apellido', isEqualTo: _apellidoController.text);
    }

    var querySnapshot = await query.get();

    setState(() {
      _resultados = querySnapshot.docs;
      _isLoading = false;
    });
  }

  void _mostrarPopup(DocumentSnapshot invitado) {
    bool asistira = invitado['asistira'];
    bool pendiente = invitado['pendiente'];
    bool guardadoConExito = false;

    showDialog(
      context: context,
      barrierDismissible: false, // Evita cerrar el popup al hacer clic fuera de él
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${invitado['nombre']} ${invitado['apellido']}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                            _limpiarFormulario();

                            setState(() {
                              _clearDataForm = false;
                            });

                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Selecciona una opción"),
                    CheckboxListTile(
                      title: Text("Pendiente"),
                      value: pendiente,
                      onChanged: pendiente ? (value) {} : null,
                    ),
                    CheckboxListTile(
                      title: Text("Asistiré"),
                      value: asistira && !pendiente,
                      onChanged: (value) {
                        setState(() {
                          asistira = true;
                          pendiente = false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("No podré asistir"),
                      value: !asistira && !pendiente,
                      onChanged: (value) {
                        setState(() {
                          asistira = false;
                          pendiente = false;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('confirmaciones')
                            .doc(invitado.id)
                            .update({'asistira': asistira, 'pendiente': pendiente});

                        setState(() {
                          guardadoConExito = true;
                          _clearDataForm = true;
                        });
                      },
                      child: Text("Guardar"),
                    ),
                    if (guardadoConExito)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Tu respuesta fue guardada con éxito ✅",
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _limpiarFormulario() {
    setState(() {
      if(_clearDataForm){
        _resultados.clear();
        _nombreController.clear();
        _apellidoController.clear();
        _hasSearched = false;
      }
    });
  }

  String _obtenerEstado(bool asistira, bool pendiente) {
    if (pendiente) return "Pendiente";
    return asistira ? "Asistiré" : "No asistiré";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 60),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _buscarInvitado,
                  child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text("Buscar Invitado"),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _resultados.isNotEmpty
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Selecciona tu nombre por favor:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _resultados.length,
                          itemBuilder: (context, index) {
                            var invitado = _resultados[index];
                            return GestureDetector(
                              onTap: () => _mostrarPopup(invitado),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${invitado['nombre']} ${invitado['apellido']}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      _obtenerEstado(invitado['asistira'], invitado['pendiente']),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: invitado['pendiente']
                                            ? Colors.orange
                                            : (invitado['asistira'] ? Colors.green : Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                      : _hasSearched
                      ? Center(
                    child: Text(
                      "No se encontraron resultados coincidentes con ${_nombreController.text} ${_apellidoController.text}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                      : Container(),
                )
                /*Expanded(
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _resultados.isNotEmpty
                      ? ListView.builder(
                    itemCount: _resultados.length,
                    itemBuilder: (context, index) {
                      var invitado = _resultados[index];
                      return GestureDetector(
                        onTap: () => _mostrarPopup(invitado),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${invitado['nombre']} ${invitado['apellido']}",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                _obtenerEstado(invitado['asistira'], invitado['pendiente']),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: invitado['pendiente']
                                      ? Colors.orange
                                      : (invitado['asistira'] ? Colors.green : Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : _hasSearched
                      ? Center(
                    child: Text(
                      "No se encontraron resultados coincidentes con ${_nombreController.text} ${_apellidoController.text}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                      : Container(),
                ),*/
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssets.flowersLeft,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AppAssets.flowersRight,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      )
    );
  }
}
