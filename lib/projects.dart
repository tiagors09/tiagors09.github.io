import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'bmi-calculator',
        'description':
            'Uma calculadora de Índice de Massa Corporal (IMC) simples para calcular e monitorar seu índice de saúde.',
        'site': 'https://bmi-calculator-tiagors09.vercel.app/',
        'thumb': 'assets/images/bmi_calculator.png',
      },
      {
        'name': 'make-your-burger',
        'description':
            'Crie seu próprio hambúrguer personalizado com este aplicativo interativo, escolhendo ingredientes e montando seu sanduíche dos sonhos.',
        'site': 'https://make-your-burger-six.vercel.app/',
        'thumb': 'assets/images/make_your_burger.png',
      },
      {
        'name': 'expenses',
        'description':
            'Um aplicativo para gerenciar suas despesas financeiras de maneira eficiente e fácil, ajudando a controlar seu orçamento pessoal.',
        'site': 'https://expenses-sooty.vercel.app/',
        'thumb': 'assets/images/expenses.png',
      },
      {
        'name': 'meals',
        'description':
            'Explore uma variedade de receitas deliciosas e planeje suas refeições com este aplicativo intuitivo de receitas.',
        'site': 'https://meals-eight-zeta.vercel.app/',
        'thumb': 'assets/images/meals.png',
      },
      {
        'name': 'shop',
        'description':
            'Uma loja virtual onde você pode explorar e comprar uma variedade de produtos disponíveis para venda online.',
        'site': 'https://tiagors09.github.io/shop/',
        'thumb': 'assets/images/shop.png',
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: const Text(
            'Projetos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            itemCount: projects.length,
            itemBuilder: (ctx, i) {
              return InkWell(
                onTap: () {
                  canLaunchUrlString(projects[i]['site']!).then(
                    (value) {
                      if (value) {
                        launchUrlString(projects[i]['site']!);
                      }
                    },
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          projects[i]['thumb']!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('Failed to load image...'),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 10,
                        child: Container(
                          width: 300,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            projects[i]['name']!,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          width: 300,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            projects[i]['description']!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
