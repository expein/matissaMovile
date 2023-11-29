import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum SinginCharacter { femenino, masculino }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> list = <String>["Medellín"];
  String dropdownValue = "Medellín";
  

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Fecha de nacimiento: $_selectedDate'),
        ));
      });
    });
  }


  
  

  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Matissa', style: TextStyle(fontFamily: GoogleFonts.merienda().fontFamily, fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(60, 195, 189, 1)),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  'Registrarse',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, fontFamily: GoogleFonts.quicksand().fontFamily,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('¡Bienvenido a Matissa! Por favor registrese', style: TextStyle(
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                    ),),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Cédula',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 10, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(35)
                            ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite su cédula';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nombres',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                  ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(35)
                            ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                          });
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Apellidos',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily: GoogleFonts.quicksand().fontFamily,),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(35)
                              ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite su apellido';
                          }
                          return null;
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Teléfono',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily: GoogleFonts.quicksand().fontFamily,),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(35)
                              ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite su teléfono';
                          }
                          return null;
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Dirección',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                  ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(35)
                            ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite su dirección';
                          }
                          return null;
                        },
                      )
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Ciudad:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                  ),),
                          const SizedBox(width: 50),
                          DropdownMenu<String>(
                            textStyle: TextStyle(
                              fontFamily: GoogleFonts.quicksand().fontFamily,
                              fontWeight: FontWeight.w600
                            ),
                            initialSelection: list.first,
                            onSelected: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                value: value, 
                                label: value,
                                                   
                                );
                            }).toList(),
                          ),
                        ]
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Fecha de nacimiento:', style: TextStyle(fontSize: 16, fontFamily:
                              GoogleFonts.quicksand().fontFamily,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(width: 5,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(60, 195, 189, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)
                              )
                            ),
                            onPressed: _presentDatePicker, child: const Text('Seleccionar', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Quicksand-SemiBold', color: Colors.white),),
                          ),
                        ],
                      )
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Correo eléctronico',
                          hintStyle:
                            TextStyle(fontWeight: FontWeight.w600, fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                  ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(35)
                              ),
                          filled: true
                        ),
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return "El correo es necesario";
                          } else if (!regExp.hasMatch(value)) {
                            return "Correo invalido";
                          } else {
                            return null;
                          }
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle:
                            const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Quicksand-SemiBold'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(35)
                              ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "La contraseña es necesaria";
                          } else if (value.length < 10 || value.length > 20) {
                            return "La contraseña debe tener al menos 10 caracteres y máximo 20 caracteres.";
                          } else {
                            return null;
                          }
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirmar contraseña',
                          hintStyle:
                            const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Quicksand-SemiBold'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.circular(35)
                              ),
                          filled: true
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirme su contraseña';
                          }
                          if (value != _password) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: 200,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                  content: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.check_circle,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Se ha registrado correctamente",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          fontFamily: 'Quicksand-SemiBold'
                                        ),
                                      )
                                    ],
                                  ),
                                  duration:
                                    const Duration(milliseconds: 2000),
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  backgroundColor:const Color.fromARGB(255, 12, 195, 106),
                                ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor:const Color.fromRGBO(60, 195, 189, 1), // background (button) color
                            foregroundColor:Colors.white, // foreground (text) color
                          ),
                          child: Text('Registrarse', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: GoogleFonts.quicksand().fontFamily, fontSize: 20),)
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 200,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor:const Color.fromRGBO(0, 0, 0, .5), // background (button) color
                            foregroundColor:Colors.white, // foreground (text) color
                          ),
                          child: Text('Cancelar', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: GoogleFonts.quicksand().fontFamily, fontSize: 20),)
                        ),
                      )
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}