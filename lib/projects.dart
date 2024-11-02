import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'bmi calculator',
        'description': 'Uma calculadora de Índice de Massa Corporal (IMC).',
        'site': 'https://bmi-calculator-tiagors09.vercel.app/',
        'thumb': 'assets/images/bmi_calculator.png',
      },
      {
        'name': 'make your burger',
        'description':
            'Crie seu próprio hambúrguer personalizado com este aplicativo interativo.',
        'site': 'https://make-your-burger-six.vercel.app/',
        'thumb': 'assets/images/make_your_burger.png',
      },
      {
        'name': 'expenses',
        'description':
            'Um aplicativo para gerenciar suas despesas financeiras de maneira eficiente e fácil.',
        'site': 'https://expenses-sooty.vercel.app/',
        'thumb': 'assets/images/expenses.png',
      },
      {
        'name': 'meals',
        'description': 'Aplicativo intuitivo de receitas.',
        'site': 'https://meals-eight-zeta.vercel.app/',
        'thumb': 'assets/images/meals.png',
      },
      {
        'name': 'shop',
        'description':
            'Uma loja virtual com uma variedade de produtos disponíveis para venda online.',
        'site': 'https://tiagors09.github.io/shop/',
        'thumb': 'assets/images/shop.png',
      },
      {
        'name': 'calculator',
        'description': 'Calculadora simples.',
        'site': 'https://calculator-tau-one-62.vercel.app/',
        'thumb': 'assets/images/calculator.png',
      },
      {
        'name': 'great places',
        'description': 'App para guardar locais favoritos.',
        'site': 'https://github.com/tiagors09/great_places',
        'thumb': 'assets/images/maps.jpg',
      },
      {
        'name': 'OlhoVivoSP',
        'description':
            'App para consulta de corredores, paradas e previsão de chegada de ônibus de São Paulo.',
        'site': 'https://github.com/tiagors09/teste-android-estagio-v1',
        'thumb': 'assets/images/sao_paulo.jpg',
      },
      {
        'name': 'Calorie Way',
        'description':
            'Um aplicativo para ajudar os usuários a calcular a ingestão diária recomendada de calorias com base no seu perfil físico e objetivos de peso.',
        'site': 'https://github.com/tiagors09/calorie_way',
        'thumb': 'assets/images/calorie_way.png',
      }
    ];

    bool isSmartphone = MediaQuery.of(context).size.width <= 375 ||
        MediaQuery.of(context).size.width <= 480;

    return GridView.builder(
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
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
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
                  left: 20,
                  right: 20,
                  bottom: 10,
                  child: Container(
                    width: isSmartphone ? 250 : 300,
                    color: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projects[i]['name']!,
                          style: TextStyle(
                            fontSize: isSmartphone ? 12 : 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          projects[i]['description']!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: isSmartphone ? 10 : 15,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isSmartphone ? 1 : 2,
        childAspectRatio: isSmartphone ? 3 / 2 : 5 / 2,
      ),
    );
  }
}
