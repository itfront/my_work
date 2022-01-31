import 'package:flutter/material.dart';
import 'package:my_work/models/exercise.dart';

class ExerciseManagementScreen extends StatefulWidget {
  static const String route = '/exercise-management';

  const ExerciseManagementScreen({Key? key}) : super(key: key);

  @override
  _ExerciseManagementScreenState createState() =>
      _ExerciseManagementScreenState();
}

class _ExerciseManagementScreenState extends State<ExerciseManagementScreen> {
  final Exercise _exercise = Exercise();
  final _imageFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _form = GlobalKey<FormState>();

  bool isInit = true;

  void _save() {
    bool valid = _form.currentState!.validate();

    if (valid) {
      //_form.currentState.save();
      // await Provider.of<ExerciseProvider>(context).add(_exercise);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
      _exercise.workoutId = arguments['workoutId'];
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar novo exercício'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg4.jpg'),
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
                    onSaved: (value) => _exercise.name = value,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'O nome deve conter pelo menos 3 caracteres';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_imageFocus),
                  ),
                  TextFormField(
                    onSaved: (value) => _exercise.imageUrl = value,
                    focusNode: _imageFocus,
                    decoration: const InputDecoration(labelText: 'Imagem URL'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (!value!.startsWith('https://') &&
                          !value.startsWith('http://')) {
                        return 'Informe um endereço de imagem válido';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_descriptionFocus),
                  ),
                  TextFormField(
                    onSaved: (value) => _exercise.description = value,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    focusNode: _descriptionFocus,
                    maxLength: 200,
                    minLines: 3,
                    maxLines: 5,
                    buildCounter: (_,
                            {required currentLength,
                            required isFocused,
                            maxLength}) =>
                        Text(
                      '$currentLength/$maxLength',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 5) {
                        return 'A descrição deve conter pelo menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
