import 'package:flutter/material.dart';

class WorkoutManagementScreen extends StatefulWidget {
  static const String route = '/workout-management';

  const WorkoutManagementScreen({Key? key}) : super(key: key);

  @override
  _WorkoutManagementScreenState createState() =>
      _WorkoutManagementScreenState();
}

class _WorkoutManagementScreenState extends State<WorkoutManagementScreen> {
  //Váriaveis
  final _imageFocus = FocusNode();
  final _dropDownFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _dropDownValid = true;
  int _dropDownValue = 0;

  final List<Map<String, dynamic>> _dropDownOptions = [
    {'id': 0, 'name': 'Escolha o dia da semana'},
    {'id': 1, 'name': 'Segunda-feira'},
    {'id': 2, 'name': 'Terça-feira'},
    {'id': 3, 'name': 'Quarta-feira'},
    {'id': 4, 'name': 'Quinta-feira'},
    {'id': 5, 'name': 'Sexta-feira'},
    {'id': 6, 'name': 'Sábado'},
    {'id': 7, 'name': 'Domingo'}
  ];

  void _save() {
    if (_dropDownValue > 0) {
      setState(() {
        _dropDownValid = true;
      });
    } else {
      setState(() {
        _dropDownValid = false;
      });
    }
    bool valid = _form.currentState!.validate();
    if (valid && _dropDownValid) {
      print('Formulário válido');
    } else {
      print('Formulário inválido');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    //final Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    //final Object? arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_imageFocus),
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'O nome deve conter pelo menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    focusNode: _imageFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_dropDownFocus),
                    decoration: const InputDecoration(labelText: 'Imagem url'),
                    validator: (value) {
                      if (!value!.startsWith('https://') &&
                          !value.startsWith("http://")) {
                        return 'endereço de imagem inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 0.5,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      padding: const EdgeInsets.all(15),
                      child: DropdownButton(
                        value: _dropDownValue,
                        focusNode: _dropDownFocus,
                        items: _dropDownOptions
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e['name']),
                                value: (int.parse(e['id'].toString())),
                              ),
                            )
                            .toList(),
                        onChanged: (int? value) {
                          setState(() {
                            _dropDownValue = value!;
                          });
                        },
                        hint: Text(
                          'Dia da semana',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.subtitle2!.color),
                        ),
                        icon: const Icon(Icons.calendar_today),
                        isExpanded: true,
                        iconEnabledColor:
                            Theme.of(context).colorScheme.secondary,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.subtitle1!.fontSize,
                          color: Theme.of(context).textTheme.headline1!.color,
                        ),
                        dropdownColor: const Color.fromRGBO(48, 56, 62, 0.9),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _dropDownValid ? '' : 'Selecione um dia da semana',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1!.color),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
