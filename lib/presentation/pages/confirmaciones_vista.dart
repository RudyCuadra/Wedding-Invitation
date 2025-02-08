import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmacionesVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmaciones de Invitados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            final totalConfirmados = datos.where((doc) => (doc.data() as Map<String, dynamic>)['asistira'] == true).length;
            final totalPendientes = datos.where((doc) => (doc.data() as Map<String, dynamic>)['pendiente'] == true).length;

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
                                ],
                                rows: List.generate(datos.length, (index) {
                                  final data = datos[index].data() as Map<String, dynamic>;
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
    );
  }
}
