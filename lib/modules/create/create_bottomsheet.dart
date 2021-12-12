import 'package:flutter/material.dart';
import 'package:ta_caro/modules/create/repositories/create_repository_impl.dart';
import 'package:ta_caro/shared/services/app_database.dart';
import 'package:ta_caro/widgets/button/button.dart';
import 'package:ta_caro/widgets/input_text/input_text.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:ta_caro/modules/create/create_controller.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  late final CreateController controller;
  final snackBar = SnackBar(content: Text('Compra cadastrada com sucesso'));
  @override
  void initState() {
    controller = CreateController(
        repository: CreateRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (_) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              InputText(
                  label: "Produto",
                  hint: "Digite um nome",
                  onChanged: (value) => controller.onChange(name: value),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Favor digitar um nome."),
              SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço",
                hint: "Digite o valor",
                onChanged: (value) => controller.onChange(price: value),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value.isNotEmpty ? null : "Favor digitar um valor.",
                inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) => controller.onChange(date: value),
                  inputFormatters: [MaskedInputFormatter("00/00/0000")],
                  validator: (value) =>
                      value.isNotEmpty ? null : "Favor digitar uma data.",
                  label: "Data da compra",
                  hint: "Digite dd/mm/aaaa"),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (_, __) => controller.state.when(
                  loading: () => CircularProgressIndicator(),
                  error: (message, _) => Text(message),
                  orElse: () => Button(
                    label: "Adicionar",
                    onTap: () {
                      controller.create();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
