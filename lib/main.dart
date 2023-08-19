import 'package:flutter/material.dart';
import 'package:projeto_99freelas/entities/transport_type.entity.dart';
import 'package:projeto_99freelas/widgets/appbar.widget.dart';
import 'package:projeto_99freelas/widgets/button.widget.dart';
import 'package:projeto_99freelas/widgets/card.widget.dart';
import 'package:projeto_99freelas/widgets/layout.widget.dart';
import 'package:projeto_99freelas/widgets/text_widget.dart';
import 'package:projeto_99freelas/widgets/textfield.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0XFF14CC60),
          primaryColorLight:const Color(0XFF14CC60),
          primaryColorDark: const Color(0XFF14CC60),
          useMaterial3: true,
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                width: 2,
                color: Color(0XFF14CC60),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(top: 16, bottom: 16)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(top: 16, bottom: 16, left: 22, right: 22)
              ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Colors.orange;
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: const Color(0xff272727),
            iconColor: const Color(0xff272727),
            prefixIconColor: const Color(0xff272727),
            contentPadding: const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
            hintStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
            labelStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              enableFeedback: false,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              selectedIconTheme: IconThemeData(color: Colors.orange),
              unselectedIconTheme: IconThemeData(color: Colors.grey)),
          primarySwatch: Colors.blue,
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _addressTextfieldController = TextEditingController();
  final TextEditingController _addressDestinationTextfieldController = TextEditingController();

  int currentOptionSelected = 1;
  
  List<TransportTypeEntity> transportes= [
    TransportTypeEntity(
      id: 1,
      name: "Reboque",
      sourceImage: "images/reboque.png"
    ),
    TransportTypeEntity(
      id: 2,
      name: "Carreto",
      sourceImage: "images/help.png"
    ),
    TransportTypeEntity(
      id: 3,
      name: "Mudança",
      sourceImage: "images/mudanca.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {

    void handleSelectOption(int selectedOption){
      setState(() {
        currentOptionSelected = selectedOption;  
      });
    }

    return LayoutWidget(
      appBar: AppbarWidget(
        showProfile: true,
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              "Olá, Washigton. O que você gostaria de transportar?",
              margin: EdgeInsets.only(
                top: 32,
                bottom: 32
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemCount: transportes.length,
                itemBuilder: (_, int index) {
                  return CardWidget(
                    width: 130,
                    height: 160,
                    sourceImage: transportes[index].sourceImage,
                    color: Colors.grey[300],
                    onTap: () => handleSelectOption(transportes[index].id),
                    isSelected: currentOptionSelected == transportes[index].id,
                    child: TextWidget(
                      transportes[index].name,
                      margin: const EdgeInsets.only(top: 16),
                      color: Colors.orange,
                    )
                  );
                },
              ),
            ),
      
            TextfieldWidget(
              label: "Seu endereço",
              margin: const EdgeInsets.only(top: 16),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
              controller: _addressTextfieldController,
            ),
            TextfieldWidget(
              label: 'Endereço de destino',
              margin: const EdgeInsets.only(top: 16),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
              controller: _addressDestinationTextfieldController,
            ),
      
            ButtonWidget(
              title: "Fazer cotação",
              margin: const EdgeInsets.only(top: 22),
              onTap: () {
                if(_formKey.currentState!.validate()){
                  // do something...
                }
              }
            )
          ],
        ),
      ),
    );
  }
}