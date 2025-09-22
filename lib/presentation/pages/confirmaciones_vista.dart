import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmacionesVista extends StatefulWidget {
  @override
  _ConfirmacionesVistaState createState() => _ConfirmacionesVistaState();
}

class _ConfirmacionesVistaState extends State<ConfirmacionesVista> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Método para eliminar un invitado de Firestore
  void _eliminarInvitado(String docId) {
    FirebaseFirestore.instance.collection('confirmaciones').doc(docId).delete();
  }

  // Método para mostrar el cuadro de confirmación antes de eliminar
  void _mostrarDialogoConfirmacion(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("¿Está seguro?"),
        content: Text("¿Está seguro que desea eliminar al invitado?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cierra el diálogo
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              _eliminarInvitado(docId); // Elimina el invitado
              Navigator.pop(context); // Cierra el diálogo
            },
            child: Text("Sí", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmaciones de Invitados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🏆 Buscador en la parte superior
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Buscar invitado...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('confirmaciones').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Ocurrió un error: ${snapshot.error}'));
                  }

                  final datos = snapshot.data?.docs ?? [];

                  // 📌 Filtrar los datos según el texto de búsqueda
                  final datosFiltrados = datos.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final nombre = (data['nombre'] ?? '').toLowerCase();
                    final apellido = (data['apellido'] ?? '').toLowerCase();
                    return nombre.contains(_searchText) || apellido.contains(_searchText);
                  }).toList();

                  final totalConfirmados = datosFiltrados.where((doc) => (doc.data() as Map<String, dynamic>)['asistira'] == true).length;
                  final totalPendientes = datosFiltrados.where((doc) => (doc.data() as Map<String, dynamic>)['pendiente'] == true).length;
                  final totalNegados = datosFiltrados.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['asistira'] == false && data['pendiente'] == false;
                  }).length;

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                                    child: DataTable(
                                      columnSpacing: 20,
                                      columns: const [
                                        DataColumn(label: Text('N°')),
                                        DataColumn(label: Text('Nombre')),
                                        DataColumn(label: Text('Apellido')),
                                        DataColumn(label: Text('Pendiente')),
                                        DataColumn(label: Text('Asistirá')),
                                        DataColumn(label: Text('Acción')), // Nueva columna
                                      ],
                                      rows: List.generate(datosFiltrados.length, (index) {
                                        final data = datosFiltrados[index].data() as Map<String, dynamic>;
                                        final docId = datosFiltrados[index].id; // ID del documento

                                        return DataRow(cells: [
                                          DataCell(Text('${index + 1}')),
                                          DataCell(Text(data['nombre'] ?? '')),
                                          DataCell(Text(data['apellido'] ?? '')),
                                          DataCell(
                                            data['pendiente'] == true
                                                ? Icon(Icons.check, color: Colors.green)
                                                : Icon(Icons.close, color: Colors.red),
                                          ),
                                          DataCell(
                                            data['asistira'] == true
                                                ? Icon(Icons.check, color: Colors.green)
                                                : Icon(Icons.close, color: Colors.red),
                                          ),
                                          // 📌 Nueva celda con icono de eliminar
                                          DataCell(
                                            IconButton(
                                              icon: Icon(Icons.delete, color: Colors.red),
                                              onPressed: () => _mostrarDialogoConfirmacion(docId), // Muestra el popup
                                            ),
                                          ),
                                        ]);
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 10,
                              children: [
                                Text(
                                  'NO ASISTIRÁN: $totalNegados',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'CONFIRMADOS: $totalConfirmados',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'PENDIENTES POR CONFIRMAR: $totalPendientes',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
