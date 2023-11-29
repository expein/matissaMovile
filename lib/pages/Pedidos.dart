import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:matissa/pages/widgets/Drawer.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  alertaEliminar() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deshabilitar pedido'),
          content: const Text('¿Esta seguro que desea deshabilitar el pedido?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Deshabilitar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Matissas',
          style: TextStyle(
            fontFamily: GoogleFonts.merienda().fontFamily,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 60, 195, 188),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Mis pedidos',
              style: TextStyle(
                fontFamily: GoogleFonts.quicksand().fontFamily,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF3CC3BD),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart,
                            color: Colors.black87)),
                  ),
                  title: Text("Pedido #42342",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Fecha : 02/03/2023 Hora : 16:30",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          fontWeight: FontWeight.bold)),
                  trailing: IconButton(
                      onPressed: () {
                        alertaEliminar();
                      },
                      icon: const Icon(Icons.comments_disabled_rounded),
                      color: Colors.grey.shade700),
                ),
                ExpansionTileCard(
                  initiallyExpanded: false,
                  borderRadius: BorderRadius.circular(30),
                  baseColor: Colors.grey[300],
                  initialPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  finalPadding: const EdgeInsets.all(10.0),
                  expandedColor: Colors.grey[300],
                  elevation: 0,
                  title: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Shampoo Nutritivo Dove - 350ml",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          color: Colors.grey.shade800),
                    ),
                    subtitle: Text("\$20.500 x 3 unidades",
                        style: TextStyle(
                            fontFamily: GoogleFonts.quicksand().fontFamily,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.check_circle_sharp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Acondicionador Dove - 350ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$15.400 x 7 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maquillaje Avon - 150ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$132.900 x 64 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gomina Ego - 550ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$16.400 x 7 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Desodorante Rexona - 250ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$22.000 x 5 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          const Icon(
                            Icons.edit_square,
                            color: Color(0xFF3CC3BD),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Editar pedido',
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        // Add functionality for 'Pendiente'
                      },
                      child: Column(
                        children: <Widget>[
                          const Icon(Icons.hourglass_bottom_rounded,
                              color: Color(0xFF3CC3BD)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Pendiente',
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade200,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart,
                            color: Colors.black87)),
                  ),
                  title: Text("Pedido #64332",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Fecha : 02/19/2023 Hora : 13:20",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          fontWeight: FontWeight.bold)),
                  trailing: IconButton(
                      onPressed: () {
                        alertaEliminar();
                      },
                      icon: const Icon(Icons.comments_disabled_rounded),
                      color: Colors.grey.shade700),
                ),
                ExpansionTileCard(
                  initiallyExpanded: false,
                  borderRadius: BorderRadius.circular(30),
                  baseColor: Colors.grey[300],
                  initialPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  finalPadding: const EdgeInsets.all(10.0),
                  expandedColor: Colors.grey[300],
                  elevation: 0,
                  title: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Shampoo Nutritivo Dove - 350ml",
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          color: Colors.grey.shade800),
                    ),
                    subtitle: Text("\$20.500 x 3 unidades",
                        style: TextStyle(
                            fontFamily: GoogleFonts.quicksand().fontFamily,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.check_circle_sharp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Acondicionador Dove - 350ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$15.400 x 7 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maquillaje Avon - 150ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$132.900 x 64 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gomina Ego - 550ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$16.400 x 7 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          // Ícono
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey.shade700,
                          ),

                          const SizedBox(width: 14),

                          // Columna para alinear texto vertical
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Desodorante Rexona - 250ml",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              const SizedBox(height: 5),
                              Text("\$22.000 x 5 unidades",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.quicksand().fontFamily,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.shade700,
                                      fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.edit_square,
                            color: Colors.green.shade200,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Editar pedido',
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        // Add functionality for 'Pendiente'
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.check_box_rounded,
                              color: Colors.green.shade200),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Completado',
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Añadir pedido',
        child: const Icon(Icons.add),
      ),
    );
  }
}
