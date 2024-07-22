import 'package:flutter/material.dart';
import 'package:tiagors09_github_io/experience.dart';
import 'package:tiagors09_github_io/training.dart';

class TrainingAndExperience extends StatelessWidget {
  const TrainingAndExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final formations = [
      {
        'course': 'Ciências da Computação',
        'institute': 'Universidade Federal do Ceará',
        'startDate': '2019',
        'endDate': 'atualmente',
      },
      {
        'course': 'Redes de Computadores',
        'institute': 'EEEP Maria Auday Vasconcelos Nery',
        'startDate': '2016',
        'endDate': '2018',
      },
    ];
    final experiences = [
      {
        'occupation':
            'Trabalho voluntário em desenvolvimento de aplicação móvel',
        'company': 'IFPE Afogados da Ingazeira',
        'startDate': 'fev/2024',
        'endDate': 'jun/2024',
        'assignments': [
          "Contribuição significativa para o desenvolvimento do aplicativo SementeSuite do IFPE Afogados de Ingazeira.",
          "Incorporação do cálculo do Índice de Velocidade de Germinação no aplicativo.",
          "Divisão do projeto em escopos bem definidos para uma melhor gestão.",
          "Implementação de commits convencionais para organizar o código-fonte.",
          "Aprimoração da interface do usuário, proporcionando uma experiência mais intuitiva.",
          "Modularização de widgets, facilitando a manutenção do código.",
          "Redução significativamente o código duplicado, melhorando a eficiência do projeto."
        ],
      },
      {
        'occupation': 'Estágio em Desenvolvimento Full Stack',
        'company': 'Núcleo de Práticas em Informática',
        'startDate': 'mar/2023',
        'endDate': 'jun/2023',
        'assignments': [
          "Desenvolvimento de um sistema de gerenciamento de internatos para o curso de medicina na UFC Fortaleza.",
          "Colaborei ativamente em reuniões de Scrum."
        ],
      },
      {
        'occupation': 'Estágio em Desenvolvimento Desktop',
        'company': 'Otimize Soluções',
        'startDate': 'ago/2018',
        'endDate': 'dez/2018',
        'assignments': [
          "Migração da interface legada do software hospitalar desktop.",
          "Utilização do Team Foundation para controle de versão."
        ],
      },
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Formação',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: formations
                  .map(
                    (formation) => Training(
                      course: formation['course']!,
                      institute: formation['institute']!,
                      startDate: formation['startDate']!,
                      endDate: formation['endDate']!,
                    ),
                  )
                  .toList(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Experiência',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: experiences
                  .map(
                    (xp) => Experience(
                      occupation: xp['occupation']! as String,
                      company: xp['company']! as String,
                      startDate: xp['startDate']! as String,
                      endDate: xp['endDate']! as String,
                      assignments: xp['assignments']! as List<String>,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
