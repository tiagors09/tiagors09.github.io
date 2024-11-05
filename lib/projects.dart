import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'bmi calculator',
        'description': 'Calculadora prática de IMC.',
        'site': 'https://bmi-calculator-tiagors09.vercel.app/',
        'github': 'https://github.com/tiagors09/bmi-calculator',
        'thumb': 'assets/images/bmi_calculator.png',
      },
      {
        'name': 'make your burger',
        'description': 'Monte seu hambúrguer ideal.',
        'site': 'https://make-your-burger-six.vercel.app/',
        'github': 'https://github.com/tiagors09/make-your-burger',
        'thumb': 'assets/images/make_your_burger.png',
      },
      {
        'name': 'expenses',
        'description': 'Gerencie suas despesas fácil.',
        'site': 'https://expenses-sooty.vercel.app/',
        'github': 'https://github.com/tiagors09/expenses',
        'thumb': 'assets/images/expenses.png',
      },
      {
        'name': 'meals',
        'description': 'Aplicativo simples de receitas.',
        'site': 'https://meals-eight-zeta.vercel.app/',
        'github': 'https://github.com/tiagors09/meals',
        'thumb': 'assets/images/meals.png',
      },
      {
        'name': 'shop',
        'description': 'Loja virtual com produtos.',
        'site': 'https://tiagors09.github.io/shop/',
        'github': 'https://github.com/tiagors09/shop',
        'thumb': 'assets/images/shop.png',
      },
      {
        'name': 'calculator',
        'description': 'Calculadora simples e útil.',
        'site': 'https://calculator-tau-one-62.vercel.app/',
        'github': 'https://github.com/tiagors09/calculator',
        'thumb': 'assets/images/calculator.png',
      },
      {
        'name': 'great places',
        'description': 'Guarde seus locais favoritos.',
        'site': '',
        'github': 'https://github.com/tiagors09/great_places',
        'thumb': 'assets/images/maps.jpg',
      },
      {
        'name': 'OlhoVivoSP',
        'description': 'Consulte ônibus de São Paulo.',
        'site': '',
        'github': 'https://github.com/tiagors09/teste-android-estagio-v1',
        'thumb': 'assets/images/sao_paulo.jpg',
      },
      {
        'name': 'Calorie Way',
        'description': 'Calcule suas calorias diárias.',
        'github': 'https://github.com/tiagors09/calorie_way',
        'site': 'https://calorie-way.vercel.app/',
        'thumb': 'assets/images/calorie_way.png',
      }
    ];

    bool isSmartphone = MediaQuery.of(context).size.width <= 375 ||
        MediaQuery.of(context).size.width <= 480;

    return GridView.builder(
      itemCount: projects.length,
      itemBuilder: (ctx, i) {
        return Container(
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projects[i]['name']!,
                      style: TextStyle(
                        fontSize: isSmartphone ? 15 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      projects[i]['description']!,
                      style: TextStyle(
                        fontSize: isSmartphone ? 13 : 15,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        canLaunchUrlString(projects[i]['site']!).then(
                          (value) {
                            if (value) {
                              launchUrlString(projects[i]['site']!);
                            }
                          },
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.link,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        canLaunchUrlString(projects[i]['github']!).then(
                          (value) {
                            if (value) {
                              launchUrlString(projects[i]['github']!);
                            }
                          },
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                  ],
                ),
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
