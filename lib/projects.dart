import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'bmi-calculator',
        'site': 'https://bmi-calculator-tiagors09.vercel.app/',
        'thumb': 'assets/images/bmi_calculator.png',
      },
      {
        'name': 'make-your-burger',
        'site': 'https://make-your-burger-six.vercel.app/',
        'thumb': 'assets/images/make_your_burger.png',
      },
      {
        'name': 'expenses',
        'site': 'https://expenses-sooty.vercel.app/',
        'thumb': 'assets/images/expenses.png',
      },
      {
        'name': 'meals',
        'site': 'https://meals-eight-zeta.vercel.app/',
        'thumb': 'assets/images/meals.png',
      },
      {
        'name': 'shop',
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
