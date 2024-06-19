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
        'endDate': 'atualmente',
        'assignments':
            'Contribuí significativamente para o desenvolvimento do aplicativo SementeSuite, criado pelo IFPE Afogados de Ingazeira, ao incorporar o cálculo do índice de velocidade de germinação. Meu papel envolveu a divisão do projeto em escopos bem definidos, a implementação de commits convencionais para uma melhor organização do código-fonte, aprimoramento da interface do usuário para uma experiência mais intuitiva, renomeação de arquivos de acordo com as classes correspondentes para uma estrutura mais coesa, modularização de widgets para facilitar a manutenção e redução significativa do código duplicado.',
      },
      {
        'occupation': 'Estágio em Desenvolvimento Full Stack',
        'company': 'Núcleo de Práticas em Informática',
        'startDate': 'mar/2023',
        'endDate': 'jun/2023',
        'assignments':
            'Desenvolvi um sistema abrangente de gerenciamento de internatos para o curso de medicina na UFC Fortaleza, utilizando Spring para criar REST APIs, VueJS para a interface do usuário, e integração com PostgreSQL. Colaborei ativamente em reuniões de Scrum.',
      },
      {
        'occupation': 'Estágio em Desenvolvimento Desktop',
        'company': 'Otimize Soluções',
        'startDate': 'ago/2018',
        'endDate': 'dez/2018',
        'assignments':
            'Realizei a migração da interface legada do software hospitalar desktop desenvolvido em C# com Windows Forms e integrado ao SQL Server para gestão de dados. Implementei uma nova interface utilizando o Material UI, proporcionando uma experiência mais moderna e intuitiva aos usuários. Durante o processo, adotei o Team Foundation para controle de versão e facilitar o trabalho colaborativo, garantindo uma gestão eficiente do código fonte e promovendo a integração harmoniosa das atualizações.',
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
              margin: const EdgeInsets.only(top: 15, bottom: 10),
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
                'Exeperiência',
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
                      occupation: xp['occupation']!,
                      company: xp['company']!,
                      startDate: xp['startDate']!,
                      endDate: xp['endDate']!,
                      assignments: xp['assignments']!,
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
