// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:matissa/pages/widgets/Drawer.dart';
import 'package:matissa/pages/widgets/textoInput.dart';
import '../config/helper/sqlhelper.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:google_fonts/google_fonts.dart';

class Citas extends StatefulWidget {
  const Citas({Key? key}) : super(key: key);

  @override
  State<Citas> createState() => _CitasState();
}

class _CitasState extends State<Citas> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  //Servicios

  List<String> opciones = ['Opción 1', 'Opción 2', 'Opción 3'];
  String? opcionesSeleccionadas;


  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _servicioController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _servicioController.text = existingJournal['servicio'];
      _precioController.text = existingJournal['precio'] != null
          ? existingJournal['precio'].toString()
          : '';
      _fechaController.text = existingJournal['fecha'];
      _horaController.text = existingJournal['hora'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        backgroundColor: const Color.fromARGB(221, 44, 44, 44),
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(id == null ? 'Agendar cita' : 'Editar cita', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30, fontFamily: GoogleFonts.quicksand().fontFamily),),
                      ],
                    ),
                  ),
                  const Label(texto: "Servicio"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child:TextField(
                          controller: _servicioController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 7)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                            onPressed: (){
                        
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Label(texto: "Precio"),
                  TextField(
                    controller: _precioController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 7)
                    ),
                  ),
                  const Label(texto: "Fecha"),
                  TextField(
                    controller: _fechaController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 7)
                    ),
                  ),
                  const Label(texto: "Hora"),
                  TextField(
                    controller: _horaController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 7)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 8),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          child: Text("Cancelar", style: TextStyle(color: Colors.black, fontFamily:
                                      GoogleFonts.quicksand().fontFamily),)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 8),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Save new journal
                            if (id == null) {
                              await _addItem();
                            }
                        
                            if (id != null) {
                              await _updateItem(id);
                            }
                        
                            // Clear the text fields
                            _servicioController.text = '';
                            _precioController.text = '';
                            _fechaController.text = '';
                            _horaController.text = '';
                        
                            // Close the bottom sheet
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Text(id == null ? 'Agendar' : 'Editar', style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.quicksand().fontFamily),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

// Insert a new journal to the database
Future<void> _addItem() async {
    // Convertir el precio a double
    double? precio;
    if (_precioController.text.isNotEmpty) {
      precio = double.tryParse(_precioController.text);
    }

    // Convertir la fecha y la hora a los tipos de datos correctos
    DateTime fecha = DateTime.parse(_fechaController.text);
    TimeOfDay hora = TimeOfDay(
      hour: int.parse(_horaController.text.split(':')[0]),
      minute: int.parse(_horaController.text.split(':')[1]),
    );

    await SQLHelper.createItem(
      _servicioController.text,
      precio,
      fecha,
      hora,
    );
    _refreshJournals();
  }


  // Update an existing journal
Future<void> _updateItem(int id) async {
    // Convertir el precio a double
    double? precio;
    if (_precioController.text.isNotEmpty) {
      precio = double.tryParse(_precioController.text);
    }

    // Convertir la fecha y la hora a los tipos de datos correctos
    DateTime fecha = DateTime.parse(_fechaController.text);
    TimeOfDay hora = TimeOfDay(
      hour: int.parse(_horaController.text.split(':')[0]),
      minute: int.parse(_horaController.text.split(':')[1]),
    );

    await SQLHelper.updateItem(
      id,
      _servicioController.text,
      precio,
      fecha,
      hora,
    );

    _refreshJournals();
  }



  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Registro eliminado con exito!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Matissa', style: TextStyle(
          fontSize: 35, 
          fontWeight: FontWeight.bold, 
          color: Colors.white,
          fontFamily: 
              GoogleFonts.merienda().fontFamily
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(60, 195, 189, 1)
      ),
      drawer: const MyDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExpansionTileCard(
                    initialElevation: 2,
                    expandedColor: const Color.fromARGB(255, 216, 216, 216),
                    baseColor: const Color.fromRGBO(226, 212, 255, 1),
                    title: Text('Servicio: ${_journals[index]['servicio']}'),
                    subtitle: Text('Precio: ${_journals[index]['precio']}'),
                    leading: const Icon(Icons.cut),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    children: <Widget>[
                      const Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Servicio'),
                                subtitle: Text(_journals[index]['servicio'],),
                                trailing: const Icon(Icons.room_service),
                              ),
                              ListTile(
                                title: const Text('Precio'),
                                subtitle: Text('${_journals[index]['precio']}'),
                                trailing: const Icon(Icons.monetization_on),
                              ),
                              ListTile(
                                title: const Text('Fecha'),
                                subtitle: Text('${_journals[index]['fecha']}'),
                                trailing: const Icon(Icons.event),
                              ),
                              ListTile(
                                title: const Text('Hora'),
                                subtitle: Text('${_journals[index]['hora']}'),
                                trailing: const Icon(Icons.schedule),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color:  Color(0xFFa7e3e1)
                        ),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.spaceAround,
                          buttonHeight: 52.0,
                          buttonMinWidth: 90.0,
                          children: [
                            TextButton(
                              onPressed: () => _showForm(_journals[index]['id']), 
                              child: const Column(
                                children: [
                                  Icon(Icons.edit, color: Colors.black54,),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                                  Text("Editar", style: TextStyle(color: Colors.black54))
                                ],
                              )
                            ),
                            TextButton(
                              onPressed: () => _deleteItem(_journals[index]['id']),
                              child: const Column(
                                children: [
                                  Icon(Icons.delete, color: Colors.black54,),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                                  Text("Eliminar", style: TextStyle(color: Colors.black54))
                                ],
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                    ),
                );
              }
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
