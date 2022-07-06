import '../../domain/entities/entities.dart';

class Consts {
  static List<MessageEntity> questions = const [
     MessageEntity(
      index: 0,
      name: 'Bia',
      text:
          'Olá, Tudo bem? Eu me chamo Bia e estou aqui para te ajudar com sua análise de saúde mental. Vamos lá?',
      type: MessageType.received,
    ),
    MessageEntity(
      index: 1,
      name: 'Bia',
      text: 'Teve pouco interesse ou prazer em fazer coisas?',
      type: MessageType.received,
    ),
     MessageEntity(
      index: 2,
      name: 'Bia',
      text: 'Sentiu desânimo, desalento ou falta de esperança?',
      type: MessageType.received,
    ), MessageEntity(
      index: 3,
      name: 'Bia',
      text: 'Teve dificuldade em adormecer ou em dormir sem interrupções, ou dormi demais?',
      type: MessageType.received,
    ), MessageEntity(
      index: 4,
      name: 'Bia',
      text: 'Sentiu cansaço ou falta de energia?',
      type: MessageType.received,
    ), MessageEntity(
      index: 5,
      name: 'Bia',
      text: 'Teve cansaço ou falta de apetite?',
      type: MessageType.received,
    ), MessageEntity(
      index: 6,
      name: 'Bia',
      text: 'Se Sentiu um(a) falhado/a ou que desiludiu a sí próprio/a ou à sua família?',
      type: MessageType.received,
    ), MessageEntity(
      index: 7,
      name: 'Bia',
      text: 'Teve dificuldade em se concentrar, como ao ler o jornal ou ver televisão?',
      type: MessageType.received,
    ),
    MessageEntity(
      index: 8,
      name: 'Bia',
      text: 'Movimentou-se ou falou tão lentamente que outras pessoas notaram. Ou o oposto: esteve agitado/a a ponto de andar de um lado para o outro muito mais do que é habitual?',
      type: MessageType.received,
    ),
    MessageEntity(
      index: 9,
      name: 'Bia',
      text: 'Pensou que seria melhor estar morto/a, ou em magoar-me a sí próprio/a de alguma forma?',
      type: MessageType.received,
    ),
  ];
}