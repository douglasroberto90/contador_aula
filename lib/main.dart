import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MinhaHomePage(),
    );
  }
}

class MinhaHomePage extends StatefulWidget {
  const MinhaHomePage({super.key});

  @override
  State<MinhaHomePage> createState() => _MinhaHomePageState();
}

class _MinhaHomePageState extends State<MinhaHomePage> {
  int contador = 0;

  void decrementar() {
    setState(() {
      contador--;
    });
    print(contador);
  }

  void incrementar() {
    setState(() {
      contador++;
    });
    print(contador);
  }

  bool get estaVazio => contador == 0;

  bool get estaCheio => contador == 10;

  @override
  Widget build(BuildContext context) {
    return (Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/image.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              estaCheio ? "Lotado" : "Pode entrar" ,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "$contador",
                style: TextStyle(
                  fontSize: 100,
                  color: estaCheio ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: estaVazio ? null : decrementar,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Saiu",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: estaCheio ? null : incrementar,
                    style: TextButton.styleFrom(
                      backgroundColor: estaCheio ? Colors.red : Colors.white,
                      fixedSize: Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Entrou",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ],
        )));
  }
}
