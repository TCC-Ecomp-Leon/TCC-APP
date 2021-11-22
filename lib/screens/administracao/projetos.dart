import 'package:flutter/material.dart';
import 'package:tcc_app/utils/mock_images.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/list_view.dart';

class Projetos extends StatelessWidget {
  const Projetos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> elements = [];
    for (int i = 0; i < 100; i++) {
      elements.add("Teste");
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GenericListView(
        itens: elements,
        render: (value, index) {
          return IconLabelDescriptionCard(
            value: IconLabelDescriptionCardProps(
              base64Image: imgProjeto,
              label: value,
              description: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      value,
                      textScaleFactor: 0.6,
                    ),
                  ),
                  const Text("Entrou em: 31/12/21", textScaleFactor: 0.6),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
