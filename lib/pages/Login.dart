import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matissa/pages/Citas.dart';
import 'package:matissa/pages/Regisger.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late String _nombre;
  late String _password;

  // Declarar controller
  late TextEditingController usuarioController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Inicializarlo
    usuarioController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3CC3BD),
        centerTitle: true,
        title: Text(
          'Matissa',
          style: TextStyle(
            fontFamily: GoogleFonts.merienda().fontFamily,
           
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF3CC3BD),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [ 
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  height: 160.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(height: 60), // Espacio de 10 pixels
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: TextFormField(
                    controller: usuarioController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    enableIMEPersonalizedLearning: false,
                    decoration: InputDecoration(
                      hintText: 'Usuario',
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.quicksand().fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.grey.shade200,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un usuario';
                      } else if (value.length >= 15 || value.length <= 4) {
                        return 'La cantidad de caracter es de 4 a 12';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nombre = value!;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    enableIMEPersonalizedLearning: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.quicksand().fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.grey.shade200,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese una contraseña';
                      } else if (value.length < 6) {
                        return 'Debes ingresar min 6 caracteres';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Cambiar el radio del borde aquí
                    ),
                    foregroundColor: const Color.fromARGB(179, 129, 127, 127),
                    backgroundColor: const Color.fromARGB(255, 255, 252, 252),
                    minimumSize: const Size(
                        140, 35), // Cambiar el tamaño mínimo del botón aquí
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Puedes acceder a los valores del usuario y la contraseña aquí
                      print('El nombre es $_nombre');
                      print('La contraseña es $_password');
                    }else{
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const Citas())
                      );
                    }
                  },
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                      fontSize: 18, 
                      color: const Color.fromARGB(255, 82, 81, 81),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espacio de 10 pixels
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, 'signup'); //El archivo donde se va enviar
                  },
                  child:  Text(
                    '¿No tienes cuenta?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                      fontSize: 20, 
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white, 
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Cambiar el radio del borde aquí
                    ),
                    foregroundColor: const Color.fromARGB(179, 129, 127, 127),
                    backgroundColor: const Color.fromARGB(255, 255, 252, 252),
                    minimumSize: const Size(
                        140, 35), // Cambiar el tamaño mínimo del botón aquí
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const RegisterPage())
                    );
                  },
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 82, 81, 81),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
