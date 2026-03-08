// lib/core/data/built_in_sets_data.dart
// Автоматически собран из 6 частей
// 20 топиков × 2 языка (RU + UK) × 20 карточек = 800 карточек

// ============================================================
// lib/core/data/built_in_sets_data.dart  —  PART 1/6
// Классы + топики 01–03 (RU + UK)
// ============================================================

class BuiltInCard {
  final String front;
  final String back;
  final String pronunciation;
  final String transcription;
  final String example;
  final String notes;
  final String imageUrl;
  final String videoUrl;

  const BuiltInCard({
    required this.front,
    required this.back,
    required this.pronunciation,
    required this.transcription,
    required this.example,
    required this.notes,
    required this.imageUrl,
    required this.videoUrl,
  });
}

class BuiltInSet {
  final String name;
  final String langCode; // 'ru' или 'uk'
  final List<BuiltInCard> cards;

  const BuiltInSet({
    required this.name,
    required this.langCode,
    required this.cards,
  });
}

// ============================================================
// 01 — About Myself
// ============================================================

const _ruSet01 = BuiltInSet(name: 'About Myself', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'My name is...',
      back: 'Меня зовут...',
      pronunciation: 'май нэйм из',
      transcription: '/maɪ neɪm ɪz/',
      example: 'Hi everyone! My name is Alex.',
      notes: 'Представление',
      imageUrl: 'https://source.unsplash.com/400x300/?person,hello',
      videoUrl: 'https://youglish.com/pronounce/my%20name%20is/english/us'),
  BuiltInCard(
      front: 'I am from Russia',
      back: 'Я из России',
      pronunciation: 'ай эм фром раша',
      transcription: '/aɪ æm frɒm ˈrʌʃə/',
      example: 'Nice to meet you! I am from Russia.',
      notes: 'Страна происхождения',
      imageUrl: 'https://source.unsplash.com/400x300/?russia,map',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20from/english/us'),
  BuiltInCard(
      front: 'I am 25 years old',
      back: 'Мне 25 лет',
      pronunciation: 'ай эм 25 йирз оулд',
      transcription: '/aɪ æm ˈtwenti faɪv jɪrz oʊld/',
      example: 'How old are you? I am 25 years old.',
      notes: 'Возраст',
      imageUrl: 'https://source.unsplash.com/400x300/?birthday,age',
      videoUrl: 'https://youglish.com/pronounce/years%20old/english/us'),
  BuiltInCard(
      front: 'I work as a teacher',
      back: 'Я работаю учителем',
      pronunciation: 'ай уэрк эз э тичэр',
      transcription: '/aɪ wɜːrk æz ə ˈtiːtʃər/',
      example: 'What do you do? I work as a teacher.',
      notes: 'Профессия',
      imageUrl: 'https://source.unsplash.com/400x300/?teacher,school',
      videoUrl:
          'https://youglish.com/pronounce/work%20as%20a%20teacher/english/us'),
  BuiltInCard(
      front: 'I live in Moscow',
      back: 'Я живу в Москве',
      pronunciation: 'ай лив ин москоу',
      transcription: '/aɪ lɪv ɪn ˈmɒskəʊ/',
      example: 'Where do you live? I live in Moscow.',
      notes: 'Место проживания',
      imageUrl: 'https://source.unsplash.com/400x300/?moscow,city',
      videoUrl: 'https://youglish.com/pronounce/I%20live%20in/english/us'),
  BuiltInCard(
      front: 'I have a brother and a sister',
      back: 'У меня есть брат и сестра',
      pronunciation: 'ай хэв э бразэр энд э систэр',
      transcription: '/aɪ hæv ə ˈbrʌðər ænd ə ˈsɪstər/',
      example: 'Tell me about your family. I have a brother and a sister.',
      notes: 'Семья',
      imageUrl: 'https://source.unsplash.com/400x300/?family,siblings',
      videoUrl: 'https://youglish.com/pronounce/have%20a%20brother/english/us'),
  BuiltInCard(
      front: 'Nice to meet you',
      back: 'Приятно познакомиться',
      pronunciation: 'найс ту мит ю',
      transcription: '/naɪs tə miːt juː/',
      example: "Hi, I'm Anna. Nice to meet you!",
      notes: 'Приветствие',
      imageUrl: 'https://source.unsplash.com/400x300/?handshake,meet',
      videoUrl:
          'https://youglish.com/pronounce/nice%20to%20meet%20you/english/us'),
  BuiltInCard(
      front: 'I enjoy reading books',
      back: 'Я люблю читать книги',
      pronunciation: 'ай энджой ридинг букс',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈriːdɪŋ bʊks/',
      example: 'What do you do in your free time? I enjoy reading books.',
      notes: 'Хобби',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,books',
      videoUrl: 'https://youglish.com/pronounce/enjoy%20reading/english/us'),
  BuiltInCard(
      front: 'I speak a little English',
      back: 'Я немного говорю по-английски',
      pronunciation: 'ай спик э литэл инглиш',
      transcription: '/aɪ spiːk ə ˈlɪtl ˈɪŋɡlɪʃ/',
      example: 'Can you speak English? I speak a little English.',
      notes: 'Знание языков',
      imageUrl: 'https://source.unsplash.com/400x300/?english,language',
      videoUrl:
          'https://youglish.com/pronounce/speak%20a%20little%20english/english/us'),
  BuiltInCard(
      front: 'I am married',
      back: 'Я женат / Я замужем',
      pronunciation: 'ай эм мэрид',
      transcription: '/aɪ æm ˈmærɪd/',
      example: 'Are you single? No, I am married.',
      notes: 'Семейное положение',
      imageUrl: 'https://source.unsplash.com/400x300/?wedding,married',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20married/english/us'),
  BuiltInCard(
      front: 'I have a pet dog',
      back: 'У меня есть собака',
      pronunciation: 'ай хэв э пет дог',
      transcription: '/aɪ hæv ə pet dɒɡ/',
      example: 'Do you have any pets? I have a pet dog.',
      notes: 'Животные',
      imageUrl: 'https://source.unsplash.com/400x300/?dog,pet',
      videoUrl: 'https://youglish.com/pronounce/pet%20dog/english/us'),
  BuiltInCard(
      front: 'My favorite color is blue',
      back: 'Мой любимый цвет — синий',
      pronunciation: 'май фэйворит калэр из блу',
      transcription: '/maɪ ˈfeɪvərɪt ˈkʌlər ɪz bluː/',
      example: "What's your favorite color? My favorite color is blue.",
      notes: 'Предпочтения',
      imageUrl: 'https://source.unsplash.com/400x300/?blue,color',
      videoUrl: 'https://youglish.com/pronounce/favorite%20color/english/us'),
  BuiltInCard(
      front: 'I was born in 1995',
      back: 'Я родился в 1995 году',
      pronunciation: 'ай уоз борн ин 1995',
      transcription: '/aɪ wɒz bɔːrn ɪn ˌnaɪntiːn ˈnaɪnti faɪv/',
      example: 'When were you born? I was born in 1995.',
      notes: 'Дата рождения',
      imageUrl: 'https://source.unsplash.com/400x300/?birth,calendar',
      videoUrl: 'https://youglish.com/pronounce/was%20born%20in/english/us'),
  BuiltInCard(
      front: 'I study at university',
      back: 'Я учусь в университете',
      pronunciation: 'ай стади эт юниверсити',
      transcription: '/aɪ ˈstʌdi æt ˌjuːnɪˈvɜːrsɪti/',
      example: 'Are you working or studying? I study at university.',
      notes: 'Учёба',
      imageUrl: 'https://source.unsplash.com/400x300/?university,campus',
      videoUrl:
          'https://youglish.com/pronounce/study%20at%20university/english/us'),
  BuiltInCard(
      front: 'I like to travel',
      back: 'Я люблю путешествовать',
      pronunciation: 'ай лайк ту трэвэл',
      transcription: '/aɪ laɪk tə ˈtrævl/',
      example: 'What are your hobbies? I like to travel.',
      notes: 'Путешествия',
      imageUrl: 'https://source.unsplash.com/400x300/?travel,suitcase',
      videoUrl: 'https://youglish.com/pronounce/like%20to%20travel/english/us'),
  BuiltInCard(
      front: 'Can you repeat that please?',
      back: 'Можете повторить пожалуйста?',
      pronunciation: 'кэн ю рипит дэт плиз',
      transcription: '/kæn juː rɪˈpiːt ðæt pliːz/',
      example: "I didn't understand. Can you repeat that please?",
      notes: 'Просьба',
      imageUrl: 'https://source.unsplash.com/400x300/?listening,repeat',
      videoUrl: 'https://youglish.com/pronounce/can%20you%20repeat/english/us'),
  BuiltInCard(
      front: "I don't understand",
      back: 'Я не понимаю',
      pronunciation: 'ай доунт андэрстэнд',
      transcription: '/aɪ doʊnt ˌʌndərˈstænd/',
      example: "I don't understand. Can you speak slower?",
      notes: 'Непонимание',
      imageUrl: 'https://source.unsplash.com/400x300/?confused,thinking',
      videoUrl:
          'https://youglish.com/pronounce/don%27t%20understand/english/us'),
  BuiltInCard(
      front: 'What do you do for a living?',
      back: 'Кем вы работаете?',
      pronunciation: 'уот ду ю ду фор э ливинг',
      transcription: '/wɒt duː juː duː fər ə ˈlɪvɪŋ/',
      example: "So, what do you do for a living? I'm a designer.",
      notes: 'Профессия',
      imageUrl: 'https://source.unsplash.com/400x300/?work,office',
      videoUrl:
          'https://youglish.com/pronounce/what%20do%20you%20do%20for%20a%20living/english/us'),
  BuiltInCard(
      front: 'I am learning English',
      back: 'Я учу английский',
      pronunciation: 'ай эм лёрнинг инглиш',
      transcription: '/aɪ æm ˈlɜːrnɪŋ ˈɪŋɡlɪʃ/',
      example: 'Why are you here? I am learning English.',
      notes: 'Изучение языка',
      imageUrl: 'https://source.unsplash.com/400x300/?learning,english',
      videoUrl: 'https://youglish.com/pronounce/learning%20english/english/us'),
  BuiltInCard(
      front: "It's nice to meet you too",
      back: 'Мне тоже приятно познакомиться',
      pronunciation: 'итс найс ту мит ю ту',
      transcription: '/ɪts naɪs tə miːt juː tuː/',
      example: "Nice to meet you! It's nice to meet you too!",
      notes: 'Ответ на приветствие',
      imageUrl: 'https://source.unsplash.com/400x300/?smile,greeting',
      videoUrl:
          'https://youglish.com/pronounce/nice%20to%20meet%20you%20too/english/us'),
]);

const _ukSet01 = BuiltInSet(name: 'About Myself', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'My name is...',
      back: 'Мене звати...',
      pronunciation: 'май нэйм из',
      transcription: '/maɪ neɪm ɪz/',
      example: 'Hi everyone! My name is Alex.',
      notes: 'Представлення',
      imageUrl: 'https://source.unsplash.com/400x300/?person,hello',
      videoUrl: 'https://youglish.com/pronounce/my%20name%20is/english/us'),
  BuiltInCard(
      front: 'I am from Ukraine',
      back: 'Я з України',
      pronunciation: 'ай эм фром юкрэйн',
      transcription: '/aɪ æm frɒm juːˈkreɪn/',
      example: 'Nice to meet you! I am from Ukraine.',
      notes: 'Країна походження',
      imageUrl: 'https://source.unsplash.com/400x300/?ukraine,map',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20from/english/us'),
  BuiltInCard(
      front: 'I am 25 years old',
      back: 'Мені 25 років',
      pronunciation: 'ай эм 25 йирз оулд',
      transcription: '/aɪ æm ˈtwenti faɪv jɪrz oʊld/',
      example: 'How old are you? I am 25 years old.',
      notes: 'Вік',
      imageUrl: 'https://source.unsplash.com/400x300/?birthday,age',
      videoUrl: 'https://youglish.com/pronounce/years%20old/english/us'),
  BuiltInCard(
      front: 'I work as a teacher',
      back: 'Я працюю вчителем',
      pronunciation: 'ай уэрк эз э тичэр',
      transcription: '/aɪ wɜːrk æz ə ˈtiːtʃər/',
      example: 'What do you do? I work as a teacher.',
      notes: 'Професія',
      imageUrl: 'https://source.unsplash.com/400x300/?teacher,school',
      videoUrl:
          'https://youglish.com/pronounce/work%20as%20a%20teacher/english/us'),
  BuiltInCard(
      front: 'I live in Kyiv',
      back: 'Я живу в Києві',
      pronunciation: 'ай лив ин киив',
      transcription: '/aɪ lɪv ɪn ˈkiːɪv/',
      example: 'Where do you live? I live in Kyiv.',
      notes: 'Місце проживання',
      imageUrl: 'https://source.unsplash.com/400x300/?kyiv,city',
      videoUrl: 'https://youglish.com/pronounce/I%20live%20in/english/us'),
  BuiltInCard(
      front: 'I have a brother and a sister',
      back: 'У мене є брат і сестра',
      pronunciation: 'ай хэв э бразэр энд э систэр',
      transcription: '/aɪ hæv ə ˈbrʌðər ænd ə ˈsɪstər/',
      example: 'Tell me about your family. I have a brother and a sister.',
      notes: "Сім'я",
      imageUrl: 'https://source.unsplash.com/400x300/?family,siblings',
      videoUrl: 'https://youglish.com/pronounce/have%20a%20brother/english/us'),
  BuiltInCard(
      front: 'Nice to meet you',
      back: 'Приємно познайомитися',
      pronunciation: 'найс ту мит ю',
      transcription: '/naɪs tə miːt juː/',
      example: "Hi, I'm Anna. Nice to meet you!",
      notes: 'Привітання',
      imageUrl: 'https://source.unsplash.com/400x300/?handshake,meet',
      videoUrl:
          'https://youglish.com/pronounce/nice%20to%20meet%20you/english/us'),
  BuiltInCard(
      front: 'I enjoy reading books',
      back: 'Я люблю читати книги',
      pronunciation: 'ай энджой ридинг букс',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈriːdɪŋ bʊks/',
      example: 'What do you do in your free time? I enjoy reading books.',
      notes: 'Хобі',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,books',
      videoUrl: 'https://youglish.com/pronounce/enjoy%20reading/english/us'),
  BuiltInCard(
      front: 'I speak a little English',
      back: 'Я трохи говорю по-англійськи',
      pronunciation: 'ай спик э литэл инглиш',
      transcription: '/aɪ spiːk ə ˈlɪtl ˈɪŋɡlɪʃ/',
      example: 'Can you speak English? I speak a little English.',
      notes: 'Знання мов',
      imageUrl: 'https://source.unsplash.com/400x300/?english,language',
      videoUrl:
          'https://youglish.com/pronounce/speak%20a%20little%20english/english/us'),
  BuiltInCard(
      front: 'I am married',
      back: 'Я одружений / Я заміжня',
      pronunciation: 'ай эм мэрид',
      transcription: '/aɪ æm ˈmærɪd/',
      example: 'Are you single? No, I am married.',
      notes: 'Сімейний стан',
      imageUrl: 'https://source.unsplash.com/400x300/?wedding,married',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20married/english/us'),
  BuiltInCard(
      front: 'I have a pet dog',
      back: 'У мене є собака',
      pronunciation: 'ай хэв э пет дог',
      transcription: '/aɪ hæv ə pet dɒɡ/',
      example: 'Do you have any pets? I have a pet dog.',
      notes: 'Тварини',
      imageUrl: 'https://source.unsplash.com/400x300/?dog,pet',
      videoUrl: 'https://youglish.com/pronounce/pet%20dog/english/us'),
  BuiltInCard(
      front: 'My favorite color is blue',
      back: 'Мій улюблений колір — синій',
      pronunciation: 'май фэйворит калэр из блу',
      transcription: '/maɪ ˈfeɪvərɪt ˈkʌlər ɪz bluː/',
      example: "What's your favorite color? My favorite color is blue.",
      notes: 'Вподобання',
      imageUrl: 'https://source.unsplash.com/400x300/?blue,color',
      videoUrl: 'https://youglish.com/pronounce/favorite%20color/english/us'),
  BuiltInCard(
      front: 'I was born in 1995',
      back: 'Я народився у 1995 році',
      pronunciation: 'ай уоз борн ин 1995',
      transcription: '/aɪ wɒz bɔːrn ɪn ˌnaɪntiːn ˈnaɪnti faɪv/',
      example: 'When were you born? I was born in 1995.',
      notes: 'Дата народження',
      imageUrl: 'https://source.unsplash.com/400x300/?birth,calendar',
      videoUrl: 'https://youglish.com/pronounce/was%20born%20in/english/us'),
  BuiltInCard(
      front: 'I study at university',
      back: 'Я навчаюся в університеті',
      pronunciation: 'ай стади эт юниверсити',
      transcription: '/aɪ ˈstʌdi æt ˌjuːnɪˈvɜːrsɪti/',
      example: 'Are you working or studying? I study at university.',
      notes: 'Навчання',
      imageUrl: 'https://source.unsplash.com/400x300/?university,campus',
      videoUrl:
          'https://youglish.com/pronounce/study%20at%20university/english/us'),
  BuiltInCard(
      front: 'I like to travel',
      back: 'Я люблю подорожувати',
      pronunciation: 'ай лайк ту трэвэл',
      transcription: '/aɪ laɪk tə ˈtrævl/',
      example: 'What are your hobbies? I like to travel.',
      notes: 'Подорожі',
      imageUrl: 'https://source.unsplash.com/400x300/?travel,suitcase',
      videoUrl: 'https://youglish.com/pronounce/like%20to%20travel/english/us'),
  BuiltInCard(
      front: 'Can you repeat that please?',
      back: 'Можете повторити, будь ласка?',
      pronunciation: 'кэн ю рипит дэт плиз',
      transcription: '/kæn juː rɪˈpiːt ðæt pliːz/',
      example: "I didn't understand. Can you repeat that please?",
      notes: 'Прохання',
      imageUrl: 'https://source.unsplash.com/400x300/?listening,repeat',
      videoUrl: 'https://youglish.com/pronounce/can%20you%20repeat/english/us'),
  BuiltInCard(
      front: "I don't understand",
      back: 'Я не розумію',
      pronunciation: 'ай доунт андэрстэнд',
      transcription: '/aɪ doʊnt ˌʌndərˈstænd/',
      example: "I don't understand. Can you speak slower?",
      notes: 'Нерозуміння',
      imageUrl: 'https://source.unsplash.com/400x300/?confused,thinking',
      videoUrl:
          'https://youglish.com/pronounce/don%27t%20understand/english/us'),
  BuiltInCard(
      front: 'What do you do for a living?',
      back: 'Ким ви працюєте?',
      pronunciation: 'уот ду ю ду фор э ливинг',
      transcription: '/wɒt duː juː duː fər ə ˈlɪvɪŋ/',
      example: "So, what do you do for a living? I'm a designer.",
      notes: 'Професія',
      imageUrl: 'https://source.unsplash.com/400x300/?work,office',
      videoUrl:
          'https://youglish.com/pronounce/what%20do%20you%20do%20for%20a%20living/english/us'),
  BuiltInCard(
      front: 'I am learning English',
      back: 'Я вчу англійську',
      pronunciation: 'ай эм лёрнинг инглиш',
      transcription: '/aɪ æm ˈlɜːrnɪŋ ˈɪŋɡlɪʃ/',
      example: 'Why are you here? I am learning English.',
      notes: 'Вивчення мови',
      imageUrl: 'https://source.unsplash.com/400x300/?learning,english',
      videoUrl: 'https://youglish.com/pronounce/learning%20english/english/us'),
  BuiltInCard(
      front: "It's nice to meet you too",
      back: 'Мені теж приємно познайомитися',
      pronunciation: 'итс найс ту мит ю ту',
      transcription: '/ɪts naɪs tə miːt juː tuː/',
      example: "Nice to meet you! It's nice to meet you too!",
      notes: 'Відповідь на привітання',
      imageUrl: 'https://source.unsplash.com/400x300/?smile,greeting',
      videoUrl:
          'https://youglish.com/pronounce/nice%20to%20meet%20you%20too/english/us'),
]);

// ============================================================
// 02 — Daily Routine
// ============================================================

const _ruSet02 = BuiltInSet(name: 'Daily Routine', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I wake up at 7 AM',
      back: 'Я просыпаюсь в 7 утра',
      pronunciation: 'ай уэйк ап эт 7 эй эм',
      transcription: '/aɪ weɪk ʌp æt ˈsevn eɪ em/',
      example: 'Every day I wake up at 7 AM.',
      notes: 'Утренний распорядок',
      imageUrl: 'https://source.unsplash.com/400x300/?morning,alarm',
      videoUrl: 'https://youglish.com/pronounce/wake%20up%20at/english/us'),
  BuiltInCard(
      front: 'I brush my teeth',
      back: 'Я чищу зубы',
      pronunciation: 'ай браш май тис',
      transcription: '/aɪ brʌʃ maɪ tiːθ/',
      example: 'First thing in the morning I brush my teeth.',
      notes: 'Гигиена',
      imageUrl: 'https://source.unsplash.com/400x300/?toothbrush,teeth',
      videoUrl: 'https://youglish.com/pronounce/brush%20my%20teeth/english/us'),
  BuiltInCard(
      front: 'I have breakfast',
      back: 'Я завтракаю',
      pronunciation: 'ай хэв брэкфэст',
      transcription: '/aɪ hæv ˈbrekfəst/',
      example: 'I always have breakfast before work.',
      notes: 'Приём пищи',
      imageUrl: 'https://source.unsplash.com/400x300/?breakfast,coffee',
      videoUrl: 'https://youglish.com/pronounce/have%20breakfast/english/us'),
  BuiltInCard(
      front: 'I take the bus to work',
      back: 'Я езжу на работу на автобусе',
      pronunciation: 'ай тэйк дэ бас ту уэрк',
      transcription: '/aɪ teɪk ðə bʌs tə wɜːrk/',
      example: 'How do you get to work? I take the bus to work.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?bus,commute',
      videoUrl: 'https://youglish.com/pronounce/take%20the%20bus/english/us'),
  BuiltInCard(
      front: 'I start work at 9',
      back: 'Я начинаю работу в 9',
      pronunciation: 'ай старт уэрк эт найн',
      transcription: '/aɪ stɑːrt wɜːrk æt naɪn/',
      example: 'What time do you start? I start work at 9.',
      notes: 'Рабочий день',
      imageUrl: 'https://source.unsplash.com/400x300/?office,clock',
      videoUrl: 'https://youglish.com/pronounce/start%20work%20at/english/us'),
  BuiltInCard(
      front: 'I have a lunch break',
      back: 'У меня обеденный перерыв',
      pronunciation: 'ай хэв э ланч брэйк',
      transcription: '/aɪ hæv ə lʌntʃ breɪk/',
      example: 'At noon I have a lunch break.',
      notes: 'Обед',
      imageUrl: 'https://source.unsplash.com/400x300/?lunch,break',
      videoUrl: 'https://youglish.com/pronounce/lunch%20break/english/us'),
  BuiltInCard(
      front: 'I finish work at 6 PM',
      back: 'Я заканчиваю работу в 18:00',
      pronunciation: 'ай финиш уэрк эт 6 пи эм',
      transcription: '/aɪ ˈfɪnɪʃ wɜːrk æt sɪks piː em/',
      example: 'When do you leave the office? I finish work at 6 PM.',
      notes: 'Конец рабочего дня',
      imageUrl: 'https://source.unsplash.com/400x300/?sunset,work',
      videoUrl: 'https://youglish.com/pronounce/finish%20work/english/us'),
  BuiltInCard(
      front: 'I go to the gym',
      back: 'Я хожу в тренажерный зал',
      pronunciation: 'ай гоу ту дэ джим',
      transcription: '/aɪ ɡoʊ tə ðə dʒɪm/',
      example: 'After work I go to the gym.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?gym,workout',
      videoUrl:
          'https://youglish.com/pronounce/go%20to%20the%20gym/english/us'),
  BuiltInCard(
      front: 'I cook dinner',
      back: 'Я готовлю ужин',
      pronunciation: 'ай кук динэр',
      transcription: '/aɪ kʊk ˈdɪnər/',
      example: 'In the evenings I cook dinner at home.',
      notes: 'Готовка',
      imageUrl: 'https://source.unsplash.com/400x300/?cooking,dinner',
      videoUrl: 'https://youglish.com/pronounce/cook%20dinner/english/us'),
  BuiltInCard(
      front: 'I watch TV',
      back: 'Я смотрю телевизор',
      pronunciation: 'ай уотч ти ви',
      transcription: '/aɪ wɒtʃ tiː viː/',
      example: 'In the evening I watch TV to relax.',
      notes: 'Отдых',
      imageUrl: 'https://source.unsplash.com/400x300/?television,sofa',
      videoUrl: 'https://youglish.com/pronounce/watch%20TV/english/us'),
  BuiltInCard(
      front: 'I read before bed',
      back: 'Я читаю перед сном',
      pronunciation: 'ай рид бифор бэд',
      transcription: '/aɪ riːd bɪˈfɔːr bed/',
      example: 'To relax I read before bed every night.',
      notes: 'Вечерние привычки',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,night',
      videoUrl:
          'https://youglish.com/pronounce/read%20before%20bed/english/us'),
  BuiltInCard(
      front: 'I go to bed at 11',
      back: 'Я ложусь спать в 11',
      pronunciation: 'ай гоу ту бэд эт илевэн',
      transcription: '/aɪ ɡoʊ tə bed æt ɪˈlevn/',
      example: 'What time do you sleep? I go to bed at 11.',
      notes: 'Сон',
      imageUrl: 'https://source.unsplash.com/400x300/?bed,sleep',
      videoUrl: 'https://youglish.com/pronounce/go%20to%20bed/english/us'),
  BuiltInCard(
      front: 'I take a shower',
      back: 'Я принимаю душ',
      pronunciation: 'ай тэйк э шауэр',
      transcription: '/aɪ teɪk ə ˈʃaʊər/',
      example: 'Every morning I take a shower.',
      notes: 'Гигиена',
      imageUrl: 'https://source.unsplash.com/400x300/?shower,bathroom',
      videoUrl: 'https://youglish.com/pronounce/take%20a%20shower/english/us'),
  BuiltInCard(
      front: 'I check my phone',
      back: 'Я проверяю телефон',
      pronunciation: 'ай чек май фоун',
      transcription: '/aɪ tʃek maɪ foʊn/',
      example: 'In the morning I check my phone for messages.',
      notes: 'Цифровые привычки',
      imageUrl: 'https://source.unsplash.com/400x300/?phone,morning',
      videoUrl: 'https://youglish.com/pronounce/check%20my%20phone/english/us'),
  BuiltInCard(
      front: 'I walk the dog',
      back: 'Я выгуливаю собаку',
      pronunciation: 'ай уок дэ дог',
      transcription: '/aɪ wɔːk ðə dɒɡ/',
      example: 'Twice a day I walk the dog in the park.',
      notes: 'Прогулка',
      imageUrl: 'https://source.unsplash.com/400x300/?walking,dog',
      videoUrl: 'https://youglish.com/pronounce/walk%20the%20dog/english/us'),
  BuiltInCard(
      front: 'I drink coffee in the morning',
      back: 'Я пью кофе по утрам',
      pronunciation: 'ай дринк кофи ин дэ морнинг',
      transcription: '/aɪ drɪŋk ˈkɒfi ɪn ðə ˈmɔːrnɪŋ/',
      example: "I can't wake up without it. I drink coffee in the morning.",
      notes: 'Утренние привычки',
      imageUrl: 'https://source.unsplash.com/400x300/?coffee,morning',
      videoUrl: 'https://youglish.com/pronounce/drink%20coffee/english/us'),
  BuiltInCard(
      front: 'I do the laundry',
      back: 'Я стираю бельё',
      pronunciation: 'ай ду дэ лондри',
      transcription: '/aɪ duː ðə ˈlɔːndri/',
      example: 'On Sundays I do the laundry.',
      notes: 'Домашние дела',
      imageUrl: 'https://source.unsplash.com/400x300/?laundry,washing',
      videoUrl: 'https://youglish.com/pronounce/do%20the%20laundry/english/us'),
  BuiltInCard(
      front: 'I pick up my kids from school',
      back: 'Я забираю детей из школы',
      pronunciation: 'ай пик ап май кидз фром скул',
      transcription: '/aɪ pɪk ʌp maɪ kɪdz frɒm skuːl/',
      example: 'At 3 PM I pick up my kids from school.',
      notes: 'Семья',
      imageUrl: 'https://source.unsplash.com/400x300/?school,children',
      videoUrl:
          'https://youglish.com/pronounce/pick%20up%20from%20school/english/us'),
  BuiltInCard(
      front: 'I work from home',
      back: 'Я работаю из дома',
      pronunciation: 'ай уэрк фром хоум',
      transcription: '/aɪ wɜːrk frɒm hoʊm/',
      example: 'Since last year I work from home.',
      notes: 'Формат работы',
      imageUrl: 'https://source.unsplash.com/400x300/?remote,work',
      videoUrl: 'https://youglish.com/pronounce/work%20from%20home/english/us'),
  BuiltInCard(
      front: 'I set my alarm for 6:30',
      back: 'Я ставлю будильник на 6:30',
      pronunciation: 'ай сэт май элarm фор 6:30',
      transcription: '/aɪ set maɪ əˈlɑːrm fər sɪks θɜːrti/',
      example: 'Before sleeping I set my alarm for 6:30.',
      notes: 'Планирование',
      imageUrl: 'https://source.unsplash.com/400x300/?alarm,clock',
      videoUrl: 'https://youglish.com/pronounce/set%20my%20alarm/english/us'),
]);

const _ukSet02 = BuiltInSet(name: 'Daily Routine', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I wake up at 7 AM',
      back: 'Я прокидаюся о 7 ранку',
      pronunciation: 'ай уэйк ап эт 7 эй эм',
      transcription: '/aɪ weɪk ʌp æt ˈsevn eɪ em/',
      example: 'Every day I wake up at 7 AM.',
      notes: 'Ранковий розпорядок',
      imageUrl: 'https://source.unsplash.com/400x300/?morning,alarm',
      videoUrl: 'https://youglish.com/pronounce/wake%20up%20at/english/us'),
  BuiltInCard(
      front: 'I brush my teeth',
      back: 'Я чищу зуби',
      pronunciation: 'ай браш май тис',
      transcription: '/aɪ brʌʃ maɪ tiːθ/',
      example: 'First thing in the morning I brush my teeth.',
      notes: 'Гігієна',
      imageUrl: 'https://source.unsplash.com/400x300/?toothbrush,teeth',
      videoUrl: 'https://youglish.com/pronounce/brush%20my%20teeth/english/us'),
  BuiltInCard(
      front: 'I have breakfast',
      back: 'Я снідаю',
      pronunciation: 'ай хэв брэкфэст',
      transcription: '/aɪ hæv ˈbrekfəst/',
      example: 'I always have breakfast before work.',
      notes: 'Прийом їжі',
      imageUrl: 'https://source.unsplash.com/400x300/?breakfast,coffee',
      videoUrl: 'https://youglish.com/pronounce/have%20breakfast/english/us'),
  BuiltInCard(
      front: 'I take the bus to work',
      back: "Я їжджу на роботу автобусом",
      pronunciation: 'ай тэйк дэ бас ту уэрк',
      transcription: '/aɪ teɪk ðə bʌs tə wɜːrk/',
      example: 'How do you get to work? I take the bus to work.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?bus,commute',
      videoUrl: 'https://youglish.com/pronounce/take%20the%20bus/english/us'),
  BuiltInCard(
      front: 'I start work at 9',
      back: 'Я починаю роботу о 9',
      pronunciation: 'ай старт уэрк эт найн',
      transcription: '/aɪ stɑːrt wɜːrk æt naɪn/',
      example: 'What time do you start? I start work at 9.',
      notes: 'Робочий день',
      imageUrl: 'https://source.unsplash.com/400x300/?office,clock',
      videoUrl: 'https://youglish.com/pronounce/start%20work%20at/english/us'),
  BuiltInCard(
      front: 'I have a lunch break',
      back: 'У мене обідня перерва',
      pronunciation: 'ай хэв э ланч брэйк',
      transcription: '/aɪ hæv ə lʌntʃ breɪk/',
      example: 'At noon I have a lunch break.',
      notes: 'Обід',
      imageUrl: 'https://source.unsplash.com/400x300/?lunch,break',
      videoUrl: 'https://youglish.com/pronounce/lunch%20break/english/us'),
  BuiltInCard(
      front: 'I finish work at 6 PM',
      back: 'Я закінчую роботу о 18:00',
      pronunciation: 'ай финиш уэрк эт 6 пи эм',
      transcription: '/aɪ ˈfɪnɪʃ wɜːrk æt sɪks piː em/',
      example: 'When do you leave the office? I finish work at 6 PM.',
      notes: 'Кінець робочого дня',
      imageUrl: 'https://source.unsplash.com/400x300/?sunset,work',
      videoUrl: 'https://youglish.com/pronounce/finish%20work/english/us'),
  BuiltInCard(
      front: 'I go to the gym',
      back: 'Я ходжу до спортзалу',
      pronunciation: 'ай гоу ту дэ джим',
      transcription: '/aɪ ɡoʊ tə ðə dʒɪm/',
      example: 'After work I go to the gym.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?gym,workout',
      videoUrl:
          'https://youglish.com/pronounce/go%20to%20the%20gym/english/us'),
  BuiltInCard(
      front: 'I cook dinner',
      back: 'Я готую вечерю',
      pronunciation: 'ай кук динэр',
      transcription: '/aɪ kʊk ˈdɪnər/',
      example: 'In the evenings I cook dinner at home.',
      notes: 'Готування',
      imageUrl: 'https://source.unsplash.com/400x300/?cooking,dinner',
      videoUrl: 'https://youglish.com/pronounce/cook%20dinner/english/us'),
  BuiltInCard(
      front: 'I watch TV',
      back: 'Я дивлюся телевізор',
      pronunciation: 'ай уотч ти ви',
      transcription: '/aɪ wɒtʃ tiː viː/',
      example: 'In the evening I watch TV to relax.',
      notes: 'Відпочинок',
      imageUrl: 'https://source.unsplash.com/400x300/?television,sofa',
      videoUrl: 'https://youglish.com/pronounce/watch%20TV/english/us'),
  BuiltInCard(
      front: 'I read before bed',
      back: 'Я читаю перед сном',
      pronunciation: 'ай рид бифор бэд',
      transcription: '/aɪ riːd bɪˈfɔːr bed/',
      example: 'To relax I read before bed every night.',
      notes: 'Вечірні звички',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,night',
      videoUrl:
          'https://youglish.com/pronounce/read%20before%20bed/english/us'),
  BuiltInCard(
      front: 'I go to bed at 11',
      back: 'Я лягаю спати об 11',
      pronunciation: 'ай гоу ту бэд эт илевэн',
      transcription: '/aɪ ɡoʊ tə bed æt ɪˈlevn/',
      example: 'What time do you sleep? I go to bed at 11.',
      notes: 'Сон',
      imageUrl: 'https://source.unsplash.com/400x300/?bed,sleep',
      videoUrl: 'https://youglish.com/pronounce/go%20to%20bed/english/us'),
  BuiltInCard(
      front: 'I take a shower',
      back: 'Я приймаю душ',
      pronunciation: 'ай тэйк э шауэр',
      transcription: '/aɪ teɪk ə ˈʃaʊər/',
      example: 'Every morning I take a shower.',
      notes: 'Гігієна',
      imageUrl: 'https://source.unsplash.com/400x300/?shower,bathroom',
      videoUrl: 'https://youglish.com/pronounce/take%20a%20shower/english/us'),
  BuiltInCard(
      front: 'I check my phone',
      back: 'Я перевіряю телефон',
      pronunciation: 'ай чек май фоун',
      transcription: '/aɪ tʃek maɪ foʊn/',
      example: 'In the morning I check my phone for messages.',
      notes: 'Цифрові звички',
      imageUrl: 'https://source.unsplash.com/400x300/?phone,morning',
      videoUrl: 'https://youglish.com/pronounce/check%20my%20phone/english/us'),
  BuiltInCard(
      front: 'I walk the dog',
      back: 'Я виводжу собаку',
      pronunciation: 'ай уок дэ дог',
      transcription: '/aɪ wɔːk ðə dɒɡ/',
      example: 'Twice a day I walk the dog in the park.',
      notes: 'Прогулянка',
      imageUrl: 'https://source.unsplash.com/400x300/?walking,dog',
      videoUrl: 'https://youglish.com/pronounce/walk%20the%20dog/english/us'),
  BuiltInCard(
      front: 'I drink coffee in the morning',
      back: "Я п'ю каву вранці",
      pronunciation: 'ай дринк кофи ин дэ морнинг',
      transcription: '/aɪ drɪŋk ˈkɒfi ɪn ðə ˈmɔːrnɪŋ/',
      example: "I can't wake up without it. I drink coffee in the morning.",
      notes: 'Ранкові звички',
      imageUrl: 'https://source.unsplash.com/400x300/?coffee,morning',
      videoUrl: 'https://youglish.com/pronounce/drink%20coffee/english/us'),
  BuiltInCard(
      front: 'I do the laundry',
      back: 'Я пращу білизну',
      pronunciation: 'ай ду дэ лондри',
      transcription: '/aɪ duː ðə ˈlɔːndri/',
      example: 'On Sundays I do the laundry.',
      notes: 'Домашні справи',
      imageUrl: 'https://source.unsplash.com/400x300/?laundry,washing',
      videoUrl: 'https://youglish.com/pronounce/do%20the%20laundry/english/us'),
  BuiltInCard(
      front: 'I pick up my kids from school',
      back: 'Я забираю дітей зі школи',
      pronunciation: 'ай пик ап май кидз фром скул',
      transcription: '/aɪ pɪk ʌp maɪ kɪdz frɒm skuːl/',
      example: 'At 3 PM I pick up my kids from school.',
      notes: "Сім'я",
      imageUrl: 'https://source.unsplash.com/400x300/?school,children',
      videoUrl:
          'https://youglish.com/pronounce/pick%20up%20from%20school/english/us'),
  BuiltInCard(
      front: 'I work from home',
      back: 'Я працюю вдома',
      pronunciation: 'ай уэрк фром хоум',
      transcription: '/aɪ wɜːrk frɒm hoʊm/',
      example: 'Since last year I work from home.',
      notes: 'Формат роботи',
      imageUrl: 'https://source.unsplash.com/400x300/?remote,work',
      videoUrl: 'https://youglish.com/pronounce/work%20from%20home/english/us'),
  BuiltInCard(
      front: 'I set my alarm for 6:30',
      back: 'Я ставлю будильник на 6:30',
      pronunciation: 'ай сэт май элarm фор 6:30',
      transcription: '/aɪ set maɪ əˈlɑːrm fər sɪks θɜːrti/',
      example: 'Before sleeping I set my alarm for 6:30.',
      notes: 'Планування',
      imageUrl: 'https://source.unsplash.com/400x300/?alarm,clock',
      videoUrl: 'https://youglish.com/pronounce/set%20my%20alarm/english/us'),
]);

// ============================================================
// 03 — Home & Lifestyle
// ============================================================

const _ruSet03 = BuiltInSet(name: 'Home & Lifestyle', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I share a flat with two roommates',
      back: 'Я делю квартиру с двумя соседями',
      pronunciation: 'ай шэр э флэт уиз ту румэйтс',
      transcription: '/aɪ ʃer ə flæt wɪð tuː ˈruːmmeɪts/',
      example:
          'Living in the city is expensive. I share a flat with two roommates.',
      notes: 'Соседство',
      imageUrl: 'https://source.unsplash.com/400x300/?apartment,roommates',
      videoUrl: 'https://youglish.com/pronounce/share%20a%20flat/english/us'),
  BuiltInCard(
      front: 'My apartment is on the third floor',
      back: 'Моя квартира на третьем этаже',
      pronunciation: 'май апартмэнт из он дэ серд флор',
      transcription: '/maɪ əˈpɑːrtmənt ɪz ɒn ðə θɜːrd flɔːr/',
      example: 'There is no elevator. My apartment is on the third floor.',
      notes: 'Этаж',
      imageUrl: 'https://source.unsplash.com/400x300/?building,floor',
      videoUrl: 'https://youglish.com/pronounce/third%20floor/english/us'),
  BuiltInCard(
      front: 'The rent is quite high',
      back: 'Аренда довольно высокая',
      pronunciation: 'дэ рэнт из куайт хай',
      transcription: '/ðə rent ɪz kwaɪt haɪ/',
      example: 'I want to move but the rent is quite high here.',
      notes: 'Стоимость жилья',
      imageUrl: 'https://source.unsplash.com/400x300/?rent,money',
      videoUrl: 'https://youglish.com/pronounce/rent%20is%20high/english/us'),
  BuiltInCard(
      front: 'I need to do the dishes',
      back: 'Мне нужно помыть посуду',
      pronunciation: 'ай нид ту ду дэ дишэз',
      transcription: '/aɪ niːd tə duː ðə ˈdɪʃɪz/',
      example: 'After dinner I need to do the dishes.',
      notes: 'Домашние дела',
      imageUrl: 'https://source.unsplash.com/400x300/?dishes,kitchen',
      videoUrl: 'https://youglish.com/pronounce/do%20the%20dishes/english/us'),
  BuiltInCard(
      front: 'I vacuum the carpet',
      back: 'Я пылесошу ковёр',
      pronunciation: 'ай вакюм дэ карпэт',
      transcription: '/aɪ ˈvækjuːm ðə ˈkɑːrpɪt/',
      example: 'Every Saturday I vacuum the carpet.',
      notes: 'Уборка',
      imageUrl: 'https://source.unsplash.com/400x300/?vacuum,cleaning',
      videoUrl:
          'https://youglish.com/pronounce/vacuum%20the%20carpet/english/us'),
  BuiltInCard(
      front: 'The heating is broken',
      back: 'Отопление сломалось',
      pronunciation: 'дэ хитинг из броукэн',
      transcription: '/ðə ˈhiːtɪŋ ɪz ˈbroʊkən/',
      example: 'It is freezing inside. The heating is broken.',
      notes: 'Проблемы дома',
      imageUrl: 'https://source.unsplash.com/400x300/?heater,cold',
      videoUrl:
          'https://youglish.com/pronounce/heating%20is%20broken/english/us'),
  BuiltInCard(
      front: 'My flat has a balcony',
      back: 'В моей квартире есть балкон',
      pronunciation: 'май флэт хэз э балкэни',
      transcription: '/maɪ flæt hæz ə ˈbælkəni/',
      example: 'I love having morning coffee there. My flat has a balcony.',
      notes: 'Особенности жилья',
      imageUrl: 'https://source.unsplash.com/400x300/?balcony,view',
      videoUrl: 'https://youglish.com/pronounce/has%20a%20balcony/english/us'),
  BuiltInCard(
      front: 'I need to take out the trash',
      back: 'Мне нужно вынести мусор',
      pronunciation: 'ай нид ту тэйк аут дэ трэш',
      transcription: '/aɪ niːd tə teɪk aʊt ðə træʃ/',
      example: 'The bin is full. I need to take out the trash.',
      notes: 'Домашние обязанности',
      imageUrl: 'https://source.unsplash.com/400x300/?trash,bin',
      videoUrl:
          'https://youglish.com/pronounce/take%20out%20the%20trash/english/us'),
  BuiltInCard(
      front: 'The water bill is too high',
      back: 'Счёт за воду слишком высокий',
      pronunciation: 'дэ уотэр бил из ту хай',
      transcription: '/ðə ˈwɔːtər bɪl ɪz tuː haɪ/',
      example: 'We need to be more careful. The water bill is too high.',
      notes: 'Коммунальные',
      imageUrl: 'https://source.unsplash.com/400x300/?water,bill',
      videoUrl: 'https://youglish.com/pronounce/water%20bill/english/us'),
  BuiltInCard(
      front: 'I decorate my room',
      back: 'Я украшаю свою комнату',
      pronunciation: 'ай дэкорэйт май рум',
      transcription: '/aɪ ˈdekəreɪt maɪ ruːm/',
      example: 'For the holidays I decorate my room with lights.',
      notes: 'Уют',
      imageUrl: 'https://source.unsplash.com/400x300/?decor,room',
      videoUrl:
          'https://youglish.com/pronounce/decorate%20my%20room/english/us'),
  BuiltInCard(
      front: 'The neighbourhood is very quiet',
      back: 'Район очень тихий',
      pronunciation: 'дэ нэйборхуд из вэри куайэт',
      transcription: '/ðə ˈneɪbərˌhʊd ɪz ˈveri ˈkwaɪɪt/',
      example: 'I love living here. The neighbourhood is very quiet.',
      notes: 'Описание района',
      imageUrl: 'https://source.unsplash.com/400x300/?neighbourhood,street',
      videoUrl:
          'https://youglish.com/pronounce/neighbourhood%20quiet/english/us'),
  BuiltInCard(
      front: 'I am looking for a new flat',
      back: 'Я ищу новую квартиру',
      pronunciation: 'ай эм лукинг фор э ню флэт',
      transcription: '/aɪ æm ˈlʊkɪŋ fər ə njuː flæt/',
      example: 'My lease is up soon. I am looking for a new flat.',
      notes: 'Поиск жилья',
      imageUrl: 'https://source.unsplash.com/400x300/?apartment,search',
      videoUrl:
          'https://youglish.com/pronounce/looking%20for%20a%20flat/english/us'),
  BuiltInCard(
      front: 'I prefer a tidy home',
      back: 'Я предпочитаю чистый дом',
      pronunciation: 'ай прифэр э тайди хоум',
      transcription: '/aɪ prɪˈfɜːr ə ˈtaɪdi hoʊm/',
      example: 'I clean every day because I prefer a tidy home.',
      notes: 'Предпочтения',
      imageUrl: 'https://source.unsplash.com/400x300/?clean,home',
      videoUrl: 'https://youglish.com/pronounce/tidy%20home/english/us'),
  BuiltInCard(
      front: 'My bedroom faces the garden',
      back: 'Моя спальня выходит в сад',
      pronunciation: 'май бэдрум фэйсэз дэ гарден',
      transcription: '/maɪ ˈbedrʊm feɪsɪz ðə ˈɡɑːrdən/',
      example: 'In the morning I hear birds. My bedroom faces the garden.',
      notes: 'Расположение',
      imageUrl: 'https://source.unsplash.com/400x300/?bedroom,garden',
      videoUrl:
          'https://youglish.com/pronounce/faces%20the%20garden/english/us'),
  BuiltInCard(
      front: 'We have a spare room',
      back: 'У нас есть свободная комната',
      pronunciation: 'уи хэв э спэр рум',
      transcription: '/wiː hæv ə spɛr ruːm/',
      example: 'You can stay with us. We have a spare room.',
      notes: 'Гости',
      imageUrl: 'https://source.unsplash.com/400x300/?spare,room',
      videoUrl: 'https://youglish.com/pronounce/spare%20room/english/us'),
  BuiltInCard(
      front: 'I have just moved in',
      back: 'Я только что переехал',
      pronunciation: 'ай хэв джаст мувд ин',
      transcription: '/aɪ hæv dʒʌst muːvd ɪn/',
      example: 'The place is a mess. I have just moved in.',
      notes: 'Переезд',
      imageUrl: 'https://source.unsplash.com/400x300/?moving,boxes',
      videoUrl: 'https://youglish.com/pronounce/just%20moved%20in/english/us'),
  BuiltInCard(
      front: 'The kitchen needs a deep clean',
      back: 'Кухне нужна генеральная уборка',
      pronunciation: 'дэ китчэн нидз э дип клин',
      transcription: '/ðə ˈkɪtʃɪn niːdz ə diːp kliːn/',
      example: 'There is grease everywhere. The kitchen needs a deep clean.',
      notes: 'Уборка',
      imageUrl: 'https://source.unsplash.com/400x300/?kitchen,clean',
      videoUrl: 'https://youglish.com/pronounce/deep%20clean/english/us'),
  BuiltInCard(
      front: 'My landlord is very helpful',
      back: 'Мой арендодатель очень отзывчивый',
      pronunciation: 'май лэндлорд из вэри хэлпфул',
      transcription: '/maɪ ˈlændlɔːrd ɪz ˈveri ˈhelpfʊl/',
      example: 'He fixed the boiler quickly. My landlord is very helpful.',
      notes: 'Отношения с арендодателем',
      imageUrl: 'https://source.unsplash.com/400x300/?landlord,house',
      videoUrl: 'https://youglish.com/pronounce/landlord%20helpful/english/us'),
  BuiltInCard(
      front: 'I live in a studio apartment',
      back: 'Я живу в квартире-студии',
      pronunciation: 'ай лив ин э студио апартмэнт',
      transcription: '/aɪ lɪv ɪn ə ˈstjuːdiəʊ əˈpɑːrtmənt/',
      example: 'It is small but cosy. I live in a studio apartment.',
      notes: 'Тип жилья',
      imageUrl: 'https://source.unsplash.com/400x300/?studio,apartment',
      videoUrl: 'https://youglish.com/pronounce/studio%20apartment/english/us'),
  BuiltInCard(
      front: 'There is a lot of natural light',
      back: 'Здесь очень много естественного света',
      pronunciation: 'дэр из э лот эв нэчэрэл лайт',
      transcription: '/ðɛr ɪz ə lɒt əv ˈnætʃərəl laɪt/',
      example: 'I love this room. There is a lot of natural light.',
      notes: 'Описание жилья',
      imageUrl: 'https://source.unsplash.com/400x300/?sunlight,window',
      videoUrl: 'https://youglish.com/pronounce/natural%20light/english/us'),
]);

const _ukSet03 = BuiltInSet(name: 'Home & Lifestyle', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I share a flat with two roommates',
      back: 'Я ділю квартиру з двома сусідами',
      pronunciation: 'ай шэр э флэт уиз ту румэйтс',
      transcription: '/aɪ ʃer ə flæt wɪð tuː ˈruːmmeɪts/',
      example:
          'Living in the city is expensive. I share a flat with two roommates.',
      notes: 'Сусідство',
      imageUrl: 'https://source.unsplash.com/400x300/?apartment,roommates',
      videoUrl: 'https://youglish.com/pronounce/share%20a%20flat/english/us'),
  BuiltInCard(
      front: 'My apartment is on the third floor',
      back: 'Моя квартира на третьому поверсі',
      pronunciation: 'май апартмэнт из он дэ серд флор',
      transcription: '/maɪ əˈpɑːrtmənt ɪz ɒn ðə θɜːrd flɔːr/',
      example: 'There is no elevator. My apartment is on the third floor.',
      notes: 'Поверх',
      imageUrl: 'https://source.unsplash.com/400x300/?building,floor',
      videoUrl: 'https://youglish.com/pronounce/third%20floor/english/us'),
  BuiltInCard(
      front: 'The rent is quite high',
      back: 'Оренда досить висока',
      pronunciation: 'дэ рэнт из куайт хай',
      transcription: '/ðə rent ɪz kwaɪt haɪ/',
      example: 'I want to move but the rent is quite high here.',
      notes: 'Вартість житла',
      imageUrl: 'https://source.unsplash.com/400x300/?rent,money',
      videoUrl: 'https://youglish.com/pronounce/rent%20is%20high/english/us'),
  BuiltInCard(
      front: 'I need to do the dishes',
      back: 'Мені потрібно помити посуд',
      pronunciation: 'ай нид ту ду дэ дишэз',
      transcription: '/aɪ niːd tə duː ðə ˈdɪʃɪz/',
      example: 'After dinner I need to do the dishes.',
      notes: 'Домашні справи',
      imageUrl: 'https://source.unsplash.com/400x300/?dishes,kitchen',
      videoUrl: 'https://youglish.com/pronounce/do%20the%20dishes/english/us'),
  BuiltInCard(
      front: 'I vacuum the carpet',
      back: 'Я пилососю килим',
      pronunciation: 'ай вакюм дэ карпэт',
      transcription: '/aɪ ˈvækjuːm ðə ˈkɑːrpɪt/',
      example: 'Every Saturday I vacuum the carpet.',
      notes: 'Прибирання',
      imageUrl: 'https://source.unsplash.com/400x300/?vacuum,cleaning',
      videoUrl:
          'https://youglish.com/pronounce/vacuum%20the%20carpet/english/us'),
  BuiltInCard(
      front: 'The heating is broken',
      back: 'Опалення зламалось',
      pronunciation: 'дэ хитинг из броукэн',
      transcription: '/ðə ˈhiːtɪŋ ɪz ˈbroʊkən/',
      example: 'It is freezing inside. The heating is broken.',
      notes: 'Проблеми вдома',
      imageUrl: 'https://source.unsplash.com/400x300/?heater,cold',
      videoUrl:
          'https://youglish.com/pronounce/heating%20is%20broken/english/us'),
  BuiltInCard(
      front: 'My flat has a balcony',
      back: 'У моїй квартирі є балкон',
      pronunciation: 'май флэт хэз э балкэни',
      transcription: '/maɪ flæt hæz ə ˈbælkəni/',
      example: 'I love having morning coffee there. My flat has a balcony.',
      notes: 'Особливості житла',
      imageUrl: 'https://source.unsplash.com/400x300/?balcony,view',
      videoUrl: 'https://youglish.com/pronounce/has%20a%20balcony/english/us'),
  BuiltInCard(
      front: 'I need to take out the trash',
      back: 'Мені потрібно винести сміття',
      pronunciation: 'ай нид ту тэйк аут дэ трэш',
      transcription: '/aɪ niːd tə teɪk aʊt ðə træʃ/',
      example: 'The bin is full. I need to take out the trash.',
      notes: "Домашні обов'язки",
      imageUrl: 'https://source.unsplash.com/400x300/?trash,bin',
      videoUrl:
          'https://youglish.com/pronounce/take%20out%20the%20trash/english/us'),
  BuiltInCard(
      front: 'The water bill is too high',
      back: 'Рахунок за воду занадто високий',
      pronunciation: 'дэ уотэр бил из ту хай',
      transcription: '/ðə ˈwɔːtər bɪl ɪz tuː haɪ/',
      example: 'We need to be more careful. The water bill is too high.',
      notes: 'Комунальні',
      imageUrl: 'https://source.unsplash.com/400x300/?water,bill',
      videoUrl: 'https://youglish.com/pronounce/water%20bill/english/us'),
  BuiltInCard(
      front: 'I decorate my room',
      back: 'Я прикрашаю свою кімнату',
      pronunciation: 'ай дэкорэйт май рум',
      transcription: '/aɪ ˈdekəreɪt maɪ ruːm/',
      example: 'For the holidays I decorate my room with lights.',
      notes: 'Затишок',
      imageUrl: 'https://source.unsplash.com/400x300/?decor,room',
      videoUrl:
          'https://youglish.com/pronounce/decorate%20my%20room/english/us'),
  BuiltInCard(
      front: 'The neighbourhood is very quiet',
      back: 'Район дуже тихий',
      pronunciation: 'дэ нэйборхуд из вэри куайэт',
      transcription: '/ðə ˈneɪbərˌhʊd ɪz ˈveri ˈkwaɪɪt/',
      example: 'I love living here. The neighbourhood is very quiet.',
      notes: 'Опис району',
      imageUrl: 'https://source.unsplash.com/400x300/?neighbourhood,street',
      videoUrl:
          'https://youglish.com/pronounce/neighbourhood%20quiet/english/us'),
  BuiltInCard(
      front: 'I am looking for a new flat',
      back: 'Я шукаю нову квартиру',
      pronunciation: 'ай эм лукинг фор э ню флэт',
      transcription: '/aɪ æm ˈlʊkɪŋ fər ə njuː flæt/',
      example: 'My lease is up soon. I am looking for a new flat.',
      notes: 'Пошук житла',
      imageUrl: 'https://source.unsplash.com/400x300/?apartment,search',
      videoUrl:
          'https://youglish.com/pronounce/looking%20for%20a%20flat/english/us'),
  BuiltInCard(
      front: 'I prefer a tidy home',
      back: 'Я надаю перевагу чистому дому',
      pronunciation: 'ай прифэр э тайди хоум',
      transcription: '/aɪ prɪˈfɜːr ə ˈtaɪdi hoʊm/',
      example: 'I clean every day because I prefer a tidy home.',
      notes: 'Вподобання',
      imageUrl: 'https://source.unsplash.com/400x300/?clean,home',
      videoUrl: 'https://youglish.com/pronounce/tidy%20home/english/us'),
  BuiltInCard(
      front: 'My bedroom faces the garden',
      back: 'Моя спальня виходить у сад',
      pronunciation: 'май бэдрум фэйсэз дэ гарден',
      transcription: '/maɪ ˈbedrʊm feɪsɪz ðə ˈɡɑːrdən/',
      example: 'In the morning I hear birds. My bedroom faces the garden.',
      notes: 'Розташування',
      imageUrl: 'https://source.unsplash.com/400x300/?bedroom,garden',
      videoUrl:
          'https://youglish.com/pronounce/faces%20the%20garden/english/us'),
  BuiltInCard(
      front: 'We have a spare room',
      back: 'У нас є вільна кімната',
      pronunciation: 'уи хэв э спэр рум',
      transcription: '/wiː hæv ə spɛr ruːm/',
      example: 'You can stay with us. We have a spare room.',
      notes: 'Гості',
      imageUrl: 'https://source.unsplash.com/400x300/?spare,room',
      videoUrl: 'https://youglish.com/pronounce/spare%20room/english/us'),
  BuiltInCard(
      front: 'I have just moved in',
      back: 'Я щойно переїхав',
      pronunciation: 'ай хэв джаст мувд ин',
      transcription: '/aɪ hæv dʒʌst muːvd ɪn/',
      example: 'The place is a mess. I have just moved in.',
      notes: 'Переїзд',
      imageUrl: 'https://source.unsplash.com/400x300/?moving,boxes',
      videoUrl: 'https://youglish.com/pronounce/just%20moved%20in/english/us'),
  BuiltInCard(
      front: 'The kitchen needs a deep clean',
      back: 'Кухні потрібне генеральне прибирання',
      pronunciation: 'дэ китчэн нидз э дип клин',
      transcription: '/ðə ˈkɪtʃɪn niːdz ə diːp kliːn/',
      example: 'There is grease everywhere. The kitchen needs a deep clean.',
      notes: 'Прибирання',
      imageUrl: 'https://source.unsplash.com/400x300/?kitchen,clean',
      videoUrl: 'https://youglish.com/pronounce/deep%20clean/english/us'),
  BuiltInCard(
      front: 'My landlord is very helpful',
      back: 'Мій орендодавець дуже чуйний',
      pronunciation: 'май лэндлорд из вэри хэлпфул',
      transcription: '/maɪ ˈlændlɔːrd ɪz ˈveri ˈhelpfʊl/',
      example: 'He fixed the boiler quickly. My landlord is very helpful.',
      notes: 'Стосунки з орендодавцем',
      imageUrl: 'https://source.unsplash.com/400x300/?landlord,house',
      videoUrl: 'https://youglish.com/pronounce/landlord%20helpful/english/us'),
  BuiltInCard(
      front: 'I live in a studio apartment',
      back: 'Я живу в квартирі-студії',
      pronunciation: 'ай лив ин э студио апартмэнт',
      transcription: '/aɪ lɪv ɪn ə ˈstjuːdiəʊ əˈpɑːrtmənt/',
      example: 'It is small but cosy. I live in a studio apartment.',
      notes: 'Тип житла',
      imageUrl: 'https://source.unsplash.com/400x300/?studio,apartment',
      videoUrl: 'https://youglish.com/pronounce/studio%20apartment/english/us'),
  BuiltInCard(
      front: 'There is a lot of natural light',
      back: 'Тут дуже багато природного світла',
      pronunciation: 'дэр из э лот эв нэчэрэл лайт',
      transcription: '/ðɛr ɪz ə lɒt əv ˈnætʃərəl laɪt/',
      example: 'I love this room. There is a lot of natural light.',
      notes: 'Опис житла',
      imageUrl: 'https://source.unsplash.com/400x300/?sunlight,window',
      videoUrl: 'https://youglish.com/pronounce/natural%20light/english/us'),
]);
// END OF PART 1

// ============================================================
// 04 — Food & Eating Out
// ============================================================

const _ruSet04 = BuiltInSet(name: 'Food & Eating Out', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'Can I see the menu please?',
      back: 'Могу я посмотреть меню пожалуйста?',
      pronunciation: 'кэн ай си дэ мэню плиз',
      transcription: '/kæn aɪ siː ðə ˈmenjuː pliːz/',
      example: 'We just sat down. Can I see the menu please?',
      notes: 'В ресторане',
      imageUrl: 'https://source.unsplash.com/400x300/?menu,restaurant',
      videoUrl: 'https://youglish.com/pronounce/see%20the%20menu/english/us'),
  BuiltInCard(
      front: 'I would like to order',
      back: 'Я хотел бы сделать заказ',
      pronunciation: 'ай вуд лайк ту ордэр',
      transcription: '/aɪ wʊd laɪk tə ˈɔːrdər/',
      example: 'Excuse me! I would like to order now.',
      notes: 'Заказ',
      imageUrl: 'https://source.unsplash.com/400x300/?order,waiter',
      videoUrl:
          'https://youglish.com/pronounce/would%20like%20to%20order/english/us'),
  BuiltInCard(
      front: 'What do you recommend?',
      back: 'Что вы рекомендуете?',
      pronunciation: 'уот ду ю рэкэмэнд',
      transcription: '/wɒt duː juː ˌrekəˈmend/',
      example: 'It is my first time here. What do you recommend?',
      notes: 'Совет официанта',
      imageUrl: 'https://source.unsplash.com/400x300/?chef,food',
      videoUrl:
          'https://youglish.com/pronounce/what%20do%20you%20recommend/english/us'),
  BuiltInCard(
      front: 'The food is delicious',
      back: 'Еда восхитительна',
      pronunciation: 'дэ фуд из дилишэс',
      transcription: '/ðə fuːd ɪz dɪˈlɪʃəs/',
      example: 'I am so glad we came here. The food is delicious!',
      notes: 'Оценка блюда',
      imageUrl: 'https://source.unsplash.com/400x300/?delicious,food',
      videoUrl:
          'https://youglish.com/pronounce/food%20is%20delicious/english/us'),
  BuiltInCard(
      front: 'I am a vegetarian',
      back: 'Я вегетарианец',
      pronunciation: 'ай эм э вэджитэриэн',
      transcription: '/aɪ æm ə ˌvedʒɪˈteəriən/',
      example: 'Do you have any salads? I am a vegetarian.',
      notes: 'Диета',
      imageUrl: 'https://source.unsplash.com/400x300/?vegetarian,salad',
      videoUrl:
          'https://youglish.com/pronounce/I%20am%20a%20vegetarian/english/us'),
  BuiltInCard(
      front: 'Could we have the bill please?',
      back: 'Не могли бы вы принести счёт пожалуйста?',
      pronunciation: 'куд уи хэв дэ бил плиз',
      transcription: '/kʊd wiː hæv ðə bɪl pliːz/',
      example: 'We are ready to leave. Could we have the bill please?',
      notes: 'Оплата',
      imageUrl: 'https://source.unsplash.com/400x300/?bill,payment',
      videoUrl: 'https://youglish.com/pronounce/have%20the%20bill/english/us'),
  BuiltInCard(
      front: 'I will have the steak',
      back: 'Я возьму стейк',
      pronunciation: 'ай уил хэв дэ стэйк',
      transcription: '/aɪ wɪl hæv ðə steɪk/',
      example: 'Have you decided? Yes, I will have the steak.',
      notes: 'Заказ блюда',
      imageUrl: 'https://source.unsplash.com/400x300/?steak,plate',
      videoUrl:
          'https://youglish.com/pronounce/I%20will%20have%20the%20steak/english/us'),
  BuiltInCard(
      front: 'Is this dish spicy?',
      back: 'Это блюдо острое?',
      pronunciation: 'из дис диш спайси',
      transcription: '/ɪz ðɪs dɪʃ ˈspaɪsi/',
      example: "I can't eat hot food. Is this dish spicy?",
      notes: 'Уточнение',
      imageUrl: 'https://source.unsplash.com/400x300/?spicy,pepper',
      videoUrl: 'https://youglish.com/pronounce/dish%20spicy/english/us'),
  BuiltInCard(
      front: 'I would like a table for two',
      back: 'Мне нужен столик на двоих',
      pronunciation: 'ай вуд лайк э тэйбэл фор ту',
      transcription: '/aɪ wʊd laɪk ə ˈteɪbl fər tuː/',
      example: 'Good evening! I would like a table for two.',
      notes: 'Бронирование',
      imageUrl: 'https://source.unsplash.com/400x300/?table,restaurant',
      videoUrl: 'https://youglish.com/pronounce/table%20for%20two/english/us'),
  BuiltInCard(
      front: 'Can I have some water please?',
      back: 'Можно мне немного воды пожалуйста?',
      pronunciation: 'кэн ай хэв сам уотэр плиз',
      transcription: '/kæn aɪ hæv sʌm ˈwɔːtər pliːz/',
      example: 'I am thirsty. Can I have some water please?',
      notes: 'Напиток',
      imageUrl: 'https://source.unsplash.com/400x300/?water,glass',
      videoUrl:
          'https://youglish.com/pronounce/have%20some%20water/english/us'),
  BuiltInCard(
      front: 'This is overcooked',
      back: 'Это пережарено',
      pronunciation: 'дис из овэркукт',
      transcription: '/ðɪs ɪz ˌoʊvərˈkʊkt/',
      example: 'I asked for medium rare but this is overcooked.',
      notes: 'Жалоба',
      imageUrl: 'https://source.unsplash.com/400x300/?overcooked,steak',
      videoUrl: 'https://youglish.com/pronounce/overcooked/english/us'),
  BuiltInCard(
      front: 'Shall we split the bill?',
      back: 'Поделим счёт?',
      pronunciation: 'шэл уи сплит дэ бил',
      transcription: '/ʃæl wiː splɪt ðə bɪl/',
      example: 'I paid last time. Shall we split the bill?',
      notes: 'Расчёт',
      imageUrl: 'https://source.unsplash.com/400x300/?bill,split',
      videoUrl: 'https://youglish.com/pronounce/split%20the%20bill/english/us'),
  BuiltInCard(
      front: 'I have a food allergy',
      back: 'У меня пищевая аллергия',
      pronunciation: 'ай хэв э фуд элэрджи',
      transcription: '/aɪ hæv ə fuːd ˈælərdʒi/',
      example: 'Before ordering I have a food allergy to nuts.',
      notes: 'Аллергия',
      imageUrl: 'https://source.unsplash.com/400x300/?allergy,food',
      videoUrl: 'https://youglish.com/pronounce/food%20allergy/english/us'),
  BuiltInCard(
      front: 'The service was excellent',
      back: 'Обслуживание было отличным',
      pronunciation: 'дэ сэрвис уоз эксэлэнт',
      transcription: '/ðə ˈsɜːrvɪs wɒz ˈeksələnt/',
      example: 'I will come back here. The service was excellent.',
      notes: 'Отзыв',
      imageUrl: 'https://source.unsplash.com/400x300/?service,waiter',
      videoUrl:
          'https://youglish.com/pronounce/service%20excellent/english/us'),
  BuiltInCard(
      front: 'We eat out every Friday',
      back: 'Мы ходим в ресторан каждую пятницу',
      pronunciation: 'уи ит аут эври фрайдэй',
      transcription: '/wiː iːt aʊt ˈevri ˈfraɪdeɪ/',
      example: 'It is our tradition. We eat out every Friday.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?restaurant,friday',
      videoUrl: 'https://youglish.com/pronounce/eat%20out/english/us'),
  BuiltInCard(
      front: 'I prefer homemade food',
      back: 'Я предпочитаю домашнюю еду',
      pronunciation: 'ай прифэр хоуммэйд фуд',
      transcription: '/aɪ prɪˈfɜːr ˈhoʊmmeɪd fuːd/',
      example: 'Restaurants are too expensive. I prefer homemade food.',
      notes: 'Предпочтения',
      imageUrl: 'https://source.unsplash.com/400x300/?homemade,cooking',
      videoUrl: 'https://youglish.com/pronounce/homemade%20food/english/us'),
  BuiltInCard(
      front: 'Could you bring some more bread?',
      back: 'Не могли бы вы принести ещё хлеба?',
      pronunciation: 'куд ю бринг сам мор брэд',
      transcription: '/kʊd juː brɪŋ sʌm mɔːr bred/',
      example: 'This soup is great. Could you bring some more bread?',
      notes: 'Просьба',
      imageUrl: 'https://source.unsplash.com/400x300/?bread,basket',
      videoUrl:
          'https://youglish.com/pronounce/bring%20more%20bread/english/us'),
  BuiltInCard(
      front: 'I am full',
      back: 'Я наелся',
      pronunciation: 'ай эм фул',
      transcription: '/aɪ æm fʊl/',
      example: 'No dessert for me thanks. I am full.',
      notes: 'Насыщение',
      imageUrl: 'https://source.unsplash.com/400x300/?full,satisfied',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20full/english/us'),
  BuiltInCard(
      front: 'This restaurant has great reviews',
      back: 'У этого ресторана отличные отзывы',
      pronunciation: 'дис рэсторэнт хэз грэйт ривюз',
      transcription: '/ðɪs ˈrestərɑːnt hæz ɡreɪt rɪˈvjuːz/',
      example: "Let's try it. This restaurant has great reviews.",
      notes: 'Выбор места',
      imageUrl: 'https://source.unsplash.com/400x300/?review,restaurant',
      videoUrl: 'https://youglish.com/pronounce/great%20reviews/english/us'),
  BuiltInCard(
      front: 'I love trying new cuisines',
      back: 'Я люблю пробовать новые кухни мира',
      pronunciation: 'ай лав трайинг ню куизинз',
      transcription: '/aɪ lʌv ˈtraɪɪŋ njuː kwɪˈziːnz/',
      example: 'Japanese, Thai, Mexican — I love trying new cuisines.',
      notes: 'Гастрономия',
      imageUrl: 'https://source.unsplash.com/400x300/?cuisine,world',
      videoUrl:
          'https://youglish.com/pronounce/trying%20new%20cuisines/english/us'),
]);

const _ukSet04 = BuiltInSet(name: 'Food & Eating Out', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'Can I see the menu please?',
      back: 'Можу я подивитися меню будь ласка?',
      pronunciation: 'кэн ай си дэ мэню плиз',
      transcription: '/kæn aɪ siː ðə ˈmenjuː pliːz/',
      example: 'We just sat down. Can I see the menu please?',
      notes: 'У ресторані',
      imageUrl: 'https://source.unsplash.com/400x300/?menu,restaurant',
      videoUrl: 'https://youglish.com/pronounce/see%20the%20menu/english/us'),
  BuiltInCard(
      front: 'I would like to order',
      back: 'Я хотів би зробити замовлення',
      pronunciation: 'ай вуд лайк ту ордэр',
      transcription: '/aɪ wʊd laɪk tə ˈɔːrdər/',
      example: 'Excuse me! I would like to order now.',
      notes: 'Замовлення',
      imageUrl: 'https://source.unsplash.com/400x300/?order,waiter',
      videoUrl:
          'https://youglish.com/pronounce/would%20like%20to%20order/english/us'),
  BuiltInCard(
      front: 'What do you recommend?',
      back: 'Що ви рекомендуєте?',
      pronunciation: 'уот ду ю рэкэмэнд',
      transcription: '/wɒt duː juː ˌrekəˈmend/',
      example: 'It is my first time here. What do you recommend?',
      notes: 'Порада офіціанта',
      imageUrl: 'https://source.unsplash.com/400x300/?chef,food',
      videoUrl:
          'https://youglish.com/pronounce/what%20do%20you%20recommend/english/us'),
  BuiltInCard(
      front: 'The food is delicious',
      back: 'Їжа дуже смачна',
      pronunciation: 'дэ фуд из дилишэс',
      transcription: '/ðə fuːd ɪz dɪˈlɪʃəs/',
      example: 'I am so glad we came here. The food is delicious!',
      notes: 'Оцінка страви',
      imageUrl: 'https://source.unsplash.com/400x300/?delicious,food',
      videoUrl:
          'https://youglish.com/pronounce/food%20is%20delicious/english/us'),
  BuiltInCard(
      front: 'I am a vegetarian',
      back: 'Я вегетаріанець',
      pronunciation: 'ай эм э вэджитэриэн',
      transcription: '/aɪ æm ə ˌvedʒɪˈteəriən/',
      example: 'Do you have any salads? I am a vegetarian.',
      notes: 'Дієта',
      imageUrl: 'https://source.unsplash.com/400x300/?vegetarian,salad',
      videoUrl:
          'https://youglish.com/pronounce/I%20am%20a%20vegetarian/english/us'),
  BuiltInCard(
      front: 'Could we have the bill please?',
      back: 'Чи не могли б ви принести рахунок будь ласка?',
      pronunciation: 'куд уи хэв дэ бил плиз',
      transcription: '/kʊd wiː hæv ðə bɪl pliːz/',
      example: 'We are ready to leave. Could we have the bill please?',
      notes: 'Оплата',
      imageUrl: 'https://source.unsplash.com/400x300/?bill,payment',
      videoUrl: 'https://youglish.com/pronounce/have%20the%20bill/english/us'),
  BuiltInCard(
      front: 'I will have the steak',
      back: 'Я візьму стейк',
      pronunciation: 'ай уил хэв дэ стэйк',
      transcription: '/aɪ wɪl hæv ðə steɪk/',
      example: 'Have you decided? Yes, I will have the steak.',
      notes: 'Замовлення страви',
      imageUrl: 'https://source.unsplash.com/400x300/?steak,plate',
      videoUrl:
          'https://youglish.com/pronounce/I%20will%20have%20the%20steak/english/us'),
  BuiltInCard(
      front: 'Is this dish spicy?',
      back: 'Ця страва гостра?',
      pronunciation: 'из дис диш спайси',
      transcription: '/ɪz ðɪs dɪʃ ˈspaɪsi/',
      example: "I can't eat hot food. Is this dish spicy?",
      notes: 'Уточнення',
      imageUrl: 'https://source.unsplash.com/400x300/?spicy,pepper',
      videoUrl: 'https://youglish.com/pronounce/dish%20spicy/english/us'),
  BuiltInCard(
      front: 'I would like a table for two',
      back: 'Мені потрібен столик на двох',
      pronunciation: 'ай вуд лайк э тэйбэл фор ту',
      transcription: '/aɪ wʊd laɪk ə ˈteɪbl fər tuː/',
      example: 'Good evening! I would like a table for two.',
      notes: 'Бронювання',
      imageUrl: 'https://source.unsplash.com/400x300/?table,restaurant',
      videoUrl: 'https://youglish.com/pronounce/table%20for%20two/english/us'),
  BuiltInCard(
      front: 'Can I have some water please?',
      back: 'Можна мені трохи води будь ласка?',
      pronunciation: 'кэн ай хэв сам уотэр плиз',
      transcription: '/kæn aɪ hæv sʌm ˈwɔːtər pliːz/',
      example: 'I am thirsty. Can I have some water please?',
      notes: 'Напій',
      imageUrl: 'https://source.unsplash.com/400x300/?water,glass',
      videoUrl:
          'https://youglish.com/pronounce/have%20some%20water/english/us'),
  BuiltInCard(
      front: 'This is overcooked',
      back: 'Це пересмажене',
      pronunciation: 'дис из овэркукт',
      transcription: '/ðɪs ɪz ˌoʊvərˈkʊkt/',
      example: 'I asked for medium rare but this is overcooked.',
      notes: 'Скарга',
      imageUrl: 'https://source.unsplash.com/400x300/?overcooked,steak',
      videoUrl: 'https://youglish.com/pronounce/overcooked/english/us'),
  BuiltInCard(
      front: 'Shall we split the bill?',
      back: 'Розділимо рахунок?',
      pronunciation: 'шэл уи сплит дэ бил',
      transcription: '/ʃæl wiː splɪt ðə bɪl/',
      example: 'I paid last time. Shall we split the bill?',
      notes: 'Розрахунок',
      imageUrl: 'https://source.unsplash.com/400x300/?bill,split',
      videoUrl: 'https://youglish.com/pronounce/split%20the%20bill/english/us'),
  BuiltInCard(
      front: 'I have a food allergy',
      back: 'У мене харчова алергія',
      pronunciation: 'ай хэв э фуд элэрджи',
      transcription: '/aɪ hæv ə fuːd ˈælərdʒi/',
      example: 'Before ordering I have a food allergy to nuts.',
      notes: 'Алергія',
      imageUrl: 'https://source.unsplash.com/400x300/?allergy,food',
      videoUrl: 'https://youglish.com/pronounce/food%20allergy/english/us'),
  BuiltInCard(
      front: 'The service was excellent',
      back: 'Обслуговування було відмінним',
      pronunciation: 'дэ сэрвис уоз эксэлэнт',
      transcription: '/ðə ˈsɜːrvɪs wɒz ˈeksələnt/',
      example: 'I will come back here. The service was excellent.',
      notes: 'Відгук',
      imageUrl: 'https://source.unsplash.com/400x300/?service,waiter',
      videoUrl:
          'https://youglish.com/pronounce/service%20excellent/english/us'),
  BuiltInCard(
      front: 'We eat out every Friday',
      back: "Ми ходимо до ресторану щоп'ятниці",
      pronunciation: 'уи ит аут эври фрайдэй',
      transcription: '/wiː iːt aʊt ˈevri ˈfraɪdeɪ/',
      example: 'It is our tradition. We eat out every Friday.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?restaurant,friday',
      videoUrl: 'https://youglish.com/pronounce/eat%20out/english/us'),
  BuiltInCard(
      front: 'I prefer homemade food',
      back: 'Я надаю перевагу домашній їжі',
      pronunciation: 'ай прифэр хоуммэйд фуд',
      transcription: '/aɪ prɪˈfɜːr ˈhoʊmmeɪd fuːd/',
      example: 'Restaurants are too expensive. I prefer homemade food.',
      notes: 'Вподобання',
      imageUrl: 'https://source.unsplash.com/400x300/?homemade,cooking',
      videoUrl: 'https://youglish.com/pronounce/homemade%20food/english/us'),
  BuiltInCard(
      front: 'Could you bring some more bread?',
      back: 'Чи не могли б ви принести ще хліба?',
      pronunciation: 'куд ю бринг сам мор брэд',
      transcription: '/kʊd juː brɪŋ sʌm mɔːr bred/',
      example: 'This soup is great. Could you bring some more bread?',
      notes: 'Прохання',
      imageUrl: 'https://source.unsplash.com/400x300/?bread,basket',
      videoUrl:
          'https://youglish.com/pronounce/bring%20more%20bread/english/us'),
  BuiltInCard(
      front: 'I am full',
      back: 'Я наївся',
      pronunciation: 'ай эм фул',
      transcription: '/aɪ æm fʊl/',
      example: 'No dessert for me thanks. I am full.',
      notes: 'Насичення',
      imageUrl: 'https://source.unsplash.com/400x300/?full,satisfied',
      videoUrl: 'https://youglish.com/pronounce/I%20am%20full/english/us'),
  BuiltInCard(
      front: 'This restaurant has great reviews',
      back: 'Цей ресторан має відмінні відгуки',
      pronunciation: 'дис рэсторэнт хэз грэйт ривюз',
      transcription: '/ðɪs ˈrestərɑːnt hæz ɡreɪt rɪˈvjuːz/',
      example: "Let's try it. This restaurant has great reviews.",
      notes: 'Вибір місця',
      imageUrl: 'https://source.unsplash.com/400x300/?review,restaurant',
      videoUrl: 'https://youglish.com/pronounce/great%20reviews/english/us'),
  BuiltInCard(
      front: 'I love trying new cuisines',
      back: 'Я люблю пробувати нові кухні світу',
      pronunciation: 'ай лав трайинг ню куизинз',
      transcription: '/aɪ lʌv ˈtraɪɪŋ njuː kwɪˈziːnz/',
      example: 'Japanese, Thai, Mexican — I love trying new cuisines.',
      notes: 'Гастрономія',
      imageUrl: 'https://source.unsplash.com/400x300/?cuisine,world',
      videoUrl:
          'https://youglish.com/pronounce/trying%20new%20cuisines/english/us'),
]);

// ============================================================
// 05 — Shopping
// ============================================================

const _ruSet05 = BuiltInSet(name: 'Shopping', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'How much does this cost?',
      back: 'Сколько это стоит?',
      pronunciation: 'хау мач дэз дис кост',
      transcription: '/haʊ mʌtʃ dʌz ðɪs kɒst/',
      example: 'I love this jacket. How much does this cost?',
      notes: 'Цена',
      imageUrl: 'https://source.unsplash.com/400x300/?shopping,price',
      videoUrl:
          'https://youglish.com/pronounce/how%20much%20does%20this%20cost/english/us'),
  BuiltInCard(
      front: 'Do you have this in a larger size?',
      back: 'У вас есть это в большем размере?',
      pronunciation: 'ду ю хэв дис ин э ларджэр сайз',
      transcription: '/duː juː hæv ðɪs ɪn ə ˈlɑːrdʒər saɪz/',
      example: 'This shirt fits well. Do you have this in a larger size?',
      notes: 'Размер',
      imageUrl: 'https://source.unsplash.com/400x300/?clothing,size',
      videoUrl: 'https://youglish.com/pronounce/larger%20size/english/us'),
  BuiltInCard(
      front: 'Can I try this on?',
      back: 'Можно мне это примерить?',
      pronunciation: 'кэн ай трай дис он',
      transcription: '/kæn aɪ traɪ ðɪs ɒn/',
      example: 'I am not sure about the fit. Can I try this on?',
      notes: 'Примерка',
      imageUrl: 'https://source.unsplash.com/400x300/?fitting,room',
      videoUrl: 'https://youglish.com/pronounce/try%20this%20on/english/us'),
  BuiltInCard(
      front: 'Is there a discount?',
      back: 'Есть ли скидка?',
      pronunciation: 'из дэр э дискаунт',
      transcription: '/ɪz ðɛr ə ˈdɪskaʊnt/',
      example: 'I saw an ad. Is there a discount today?',
      notes: 'Скидки',
      imageUrl: 'https://source.unsplash.com/400x300/?sale,discount',
      videoUrl:
          'https://youglish.com/pronounce/is%20there%20a%20discount/english/us'),
  BuiltInCard(
      front: 'I will pay by card',
      back: 'Я заплачу картой',
      pronunciation: 'ай уил пэй бай кард',
      transcription: '/aɪ wɪl peɪ baɪ kɑːrd/',
      example: 'Do you accept cash? No, I will pay by card.',
      notes: 'Оплата',
      imageUrl: 'https://source.unsplash.com/400x300/?card,payment',
      videoUrl: 'https://youglish.com/pronounce/pay%20by%20card/english/us'),
  BuiltInCard(
      front: 'I am just browsing',
      back: 'Я просто смотрю',
      pronunciation: 'ай эм джаст браузинг',
      transcription: '/aɪ æm dʒʌst ˈbraʊzɪŋ/',
      example: 'Can I help you? No thanks, I am just browsing.',
      notes: 'Без покупки',
      imageUrl: 'https://source.unsplash.com/400x300/?shopping,browse',
      videoUrl: 'https://youglish.com/pronounce/just%20browsing/english/us'),
  BuiltInCard(
      front: 'This is on sale',
      back: 'Это продаётся со скидкой',
      pronunciation: 'дис из он сэйл',
      transcription: '/ðɪs ɪz ɒn seɪl/',
      example: 'Grab it now! This is on sale today only.',
      notes: 'Распродажа',
      imageUrl: 'https://source.unsplash.com/400x300/?sale,tag',
      videoUrl: 'https://youglish.com/pronounce/on%20sale/english/us'),
  BuiltInCard(
      front: 'Can I get a refund?',
      back: 'Могу я получить возврат денег?',
      pronunciation: 'кэн ай гет э рифанд',
      transcription: '/kæn aɪ ɡet ə ˈriːfʌnd/',
      example: 'The item is broken. Can I get a refund?',
      notes: 'Возврат',
      imageUrl: 'https://source.unsplash.com/400x300/?refund,receipt',
      videoUrl: 'https://youglish.com/pronounce/get%20a%20refund/english/us'),
  BuiltInCard(
      front: 'I need a bag please',
      back: 'Мне нужен пакет пожалуйста',
      pronunciation: 'ай нид э бэг плиз',
      transcription: '/aɪ niːd ə bæɡ pliːz/',
      example: 'I bought a lot today. I need a bag please.',
      notes: 'Упаковка',
      imageUrl: 'https://source.unsplash.com/400x300/?bag,shopping',
      videoUrl: 'https://youglish.com/pronounce/need%20a%20bag/english/us'),
  BuiltInCard(
      front: 'The queue is really long',
      back: 'Очередь очень длинная',
      pronunciation: 'дэ кью из риэли лонг',
      transcription: '/ðə kjuː ɪz ˈrɪəli lɒŋ/',
      example: 'I do not have time for this. The queue is really long.',
      notes: 'Ожидание',
      imageUrl: 'https://source.unsplash.com/400x300/?queue,waiting',
      videoUrl: 'https://youglish.com/pronounce/queue%20is%20long/english/us'),
  BuiltInCard(
      front: 'I am looking for a gift',
      back: 'Я ищу подарок',
      pronunciation: 'ай эм лукинг фор э гифт',
      transcription: '/aɪ æm ˈlʊkɪŋ fər ə ɡɪft/',
      example: "It is my friend's birthday. I am looking for a gift.",
      notes: 'Подарок',
      imageUrl: 'https://source.unsplash.com/400x300/?gift,shopping',
      videoUrl:
          'https://youglish.com/pronounce/looking%20for%20a%20gift/english/us'),
  BuiltInCard(
      front: 'Do you have a loyalty card?',
      back: 'У вас есть карта постоянного покупателя?',
      pronunciation: 'ду ю хэв э лойэлти кард',
      transcription: '/duː juː hæv ə ˈlɔɪəlti kɑːrd/',
      example: 'You can earn points. Do you have a loyalty card?',
      notes: 'Бонусы',
      imageUrl: 'https://source.unsplash.com/400x300/?loyalty,card',
      videoUrl: 'https://youglish.com/pronounce/loyalty%20card/english/us'),
  BuiltInCard(
      front: 'This does not fit me',
      back: 'Это мне не подходит',
      pronunciation: 'дис дэз нот фит ми',
      transcription: '/ðɪs dʌz nɒt fɪt miː/',
      example: 'I tried it on but this does not fit me.',
      notes: 'Размер',
      imageUrl: 'https://source.unsplash.com/400x300/?fitting,clothes',
      videoUrl:
          'https://youglish.com/pronounce/does%20not%20fit%20me/english/us'),
  BuiltInCard(
      front: 'Where is the changing room?',
      back: 'Где примерочная?',
      pronunciation: 'уэр из дэ чэйнджинг рум',
      transcription: '/wɛr ɪz ðə ˈtʃeɪndʒɪŋ ruːm/',
      example: 'I want to try this on. Where is the changing room?',
      notes: 'Навигация',
      imageUrl: 'https://source.unsplash.com/400x300/?changing,room',
      videoUrl: 'https://youglish.com/pronounce/changing%20room/english/us'),
  BuiltInCard(
      front: 'I prefer online shopping',
      back: 'Я предпочитаю онлайн покупки',
      pronunciation: 'ай прифэр онлайн шопинг',
      transcription: '/aɪ prɪˈfɜːr ˈɒnlaɪn ˈʃɒpɪŋ/',
      example: 'It is more convenient. I prefer online shopping.',
      notes: 'Интернет шопинг',
      imageUrl: 'https://source.unsplash.com/400x300/?online,shopping',
      videoUrl: 'https://youglish.com/pronounce/online%20shopping/english/us'),
  BuiltInCard(
      front: 'Can I exchange this?',
      back: 'Можно это обменять?',
      pronunciation: 'кэн ай иксчэйндж дис',
      transcription: '/kæn aɪ ɪksˈtʃeɪndʒ ðɪs/',
      example: 'I bought the wrong size. Can I exchange this?',
      notes: 'Обмен',
      imageUrl: 'https://source.unsplash.com/400x300/?exchange,store',
      videoUrl: 'https://youglish.com/pronounce/can%20I%20exchange/english/us'),
  BuiltInCard(
      front: 'The total comes to twenty pounds',
      back: 'Итого выходит двадцать фунтов',
      pronunciation: 'дэ тоутэл камз ту туэнти паундз',
      transcription: '/ðə ˈtoʊtl kʌmz tə ˈtwenti paʊndz/',
      example: 'Here is your receipt. The total comes to twenty pounds.',
      notes: 'Итог',
      imageUrl: 'https://source.unsplash.com/400x300/?receipt,total',
      videoUrl: 'https://youglish.com/pronounce/total%20comes%20to/english/us'),
  BuiltInCard(
      front: 'I spent too much money',
      back: 'Я потратил слишком много денег',
      pronunciation: 'ай спэнт ту мач мани',
      transcription: '/aɪ spent tuː mʌtʃ ˈmʌni/',
      example: 'The sales are dangerous. I spent too much money today.',
      notes: 'Расходы',
      imageUrl: 'https://source.unsplash.com/400x300/?money,spending',
      videoUrl:
          'https://youglish.com/pronounce/spent%20too%20much%20money/english/us'),
  BuiltInCard(
      front: 'I need to stick to a budget',
      back: 'Мне нужно придерживаться бюджета',
      pronunciation: 'ай нид ту стик ту э баджит',
      transcription: '/aɪ niːd tə stɪk tə ə ˈbʌdʒɪt/',
      example:
          'I keep buying things I do not need. I need to stick to a budget.',
      notes: 'Экономия',
      imageUrl: 'https://source.unsplash.com/400x300/?budget,savings',
      videoUrl:
          'https://youglish.com/pronounce/stick%20to%20a%20budget/english/us'),
  BuiltInCard(
      front: 'This shop has a great selection',
      back: 'В этом магазине большой выбор',
      pronunciation: 'дис шоп хэз э грэйт сэлэкшэн',
      transcription: '/ðɪs ʃɒp hæz ə ɡreɪt sɪˈlekʃən/',
      example: 'I could spend hours here. This shop has a great selection.',
      notes: 'Ассортимент',
      imageUrl: 'https://source.unsplash.com/400x300/?store,selection',
      videoUrl: 'https://youglish.com/pronounce/great%20selection/english/us'),
]);

const _ukSet05 = BuiltInSet(name: 'Shopping', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'How much does this cost?',
      back: 'Скільки це коштує?',
      pronunciation: 'хау мач дэз дис кост',
      transcription: '/haʊ mʌtʃ dʌz ðɪs kɒst/',
      example: 'I love this jacket. How much does this cost?',
      notes: 'Ціна',
      imageUrl: 'https://source.unsplash.com/400x300/?shopping,price',
      videoUrl:
          'https://youglish.com/pronounce/how%20much%20does%20this%20cost/english/us'),
  BuiltInCard(
      front: 'Do you have this in a larger size?',
      back: 'Чи є це у більшому розмірі?',
      pronunciation: 'ду ю хэв дис ин э ларджэр сайз',
      transcription: '/duː juː hæv ðɪs ɪn ə ˈlɑːrdʒər saɪz/',
      example: 'This shirt fits well. Do you have this in a larger size?',
      notes: 'Розмір',
      imageUrl: 'https://source.unsplash.com/400x300/?clothing,size',
      videoUrl: 'https://youglish.com/pronounce/larger%20size/english/us'),
  BuiltInCard(
      front: 'Can I try this on?',
      back: 'Можна мені це приміряти?',
      pronunciation: 'кэн ай трай дис он',
      transcription: '/kæn aɪ traɪ ðɪs ɒn/',
      example: 'I am not sure about the fit. Can I try this on?',
      notes: 'Примірка',
      imageUrl: 'https://source.unsplash.com/400x300/?fitting,room',
      videoUrl: 'https://youglish.com/pronounce/try%20this%20on/english/us'),
  BuiltInCard(
      front: 'Is there a discount?',
      back: 'Чи є знижка?',
      pronunciation: 'из дэр э дискаунт',
      transcription: '/ɪz ðɛr ə ˈdɪskaʊnt/',
      example: 'I saw an ad. Is there a discount today?',
      notes: 'Знижки',
      imageUrl: 'https://source.unsplash.com/400x300/?sale,discount',
      videoUrl:
          'https://youglish.com/pronounce/is%20there%20a%20discount/english/us'),
  BuiltInCard(
      front: 'I will pay by card',
      back: 'Я заплачу карткою',
      pronunciation: 'ай уил пэй бай кард',
      transcription: '/aɪ wɪl peɪ baɪ kɑːrd/',
      example: 'Do you accept cash? No, I will pay by card.',
      notes: 'Оплата',
      imageUrl: 'https://source.unsplash.com/400x300/?card,payment',
      videoUrl: 'https://youglish.com/pronounce/pay%20by%20card/english/us'),
  BuiltInCard(
      front: 'I am just browsing',
      back: 'Я просто дивлюся',
      pronunciation: 'ай эм джаст браузинг',
      transcription: '/aɪ æm dʒʌst ˈbraʊzɪŋ/',
      example: 'Can I help you? No thanks, I am just browsing.',
      notes: 'Без покупки',
      imageUrl: 'https://source.unsplash.com/400x300/?shopping,browse',
      videoUrl: 'https://youglish.com/pronounce/just%20browsing/english/us'),
  BuiltInCard(
      front: 'This is on sale',
      back: 'Це продається зі знижкою',
      pronunciation: 'дис из он сэйл',
      transcription: '/ðɪs ɪz ɒn seɪl/',
      example: 'Grab it now! This is on sale today only.',
      notes: 'Розпродаж',
      imageUrl: 'https://source.unsplash.com/400x300/?sale,tag',
      videoUrl: 'https://youglish.com/pronounce/on%20sale/english/us'),
  BuiltInCard(
      front: 'Can I get a refund?',
      back: 'Чи можу я отримати повернення грошей?',
      pronunciation: 'кэн ай гет э рифанд',
      transcription: '/kæn aɪ ɡet ə ˈriːfʌnd/',
      example: 'The item is broken. Can I get a refund?',
      notes: 'Повернення',
      imageUrl: 'https://source.unsplash.com/400x300/?refund,receipt',
      videoUrl: 'https://youglish.com/pronounce/get%20a%20refund/english/us'),
  BuiltInCard(
      front: 'I need a bag please',
      back: 'Мені потрібен пакет будь ласка',
      pronunciation: 'ай нид э бэг плиз',
      transcription: '/aɪ niːd ə bæɡ pliːz/',
      example: 'I bought a lot today. I need a bag please.',
      notes: 'Упаковка',
      imageUrl: 'https://source.unsplash.com/400x300/?bag,shopping',
      videoUrl: 'https://youglish.com/pronounce/need%20a%20bag/english/us'),
  BuiltInCard(
      front: 'The queue is really long',
      back: 'Черга дуже довга',
      pronunciation: 'дэ кью из риэли лонг',
      transcription: '/ðə kjuː ɪz ˈrɪəli lɒŋ/',
      example: 'I do not have time for this. The queue is really long.',
      notes: 'Очікування',
      imageUrl: 'https://source.unsplash.com/400x300/?queue,waiting',
      videoUrl: 'https://youglish.com/pronounce/queue%20is%20long/english/us'),
  BuiltInCard(
      front: 'I am looking for a gift',
      back: 'Я шукаю подарунок',
      pronunciation: 'ай эм лукинг фор э гифт',
      transcription: '/aɪ æm ˈlʊkɪŋ fər ə ɡɪft/',
      example: "It is my friend's birthday. I am looking for a gift.",
      notes: 'Подарунок',
      imageUrl: 'https://source.unsplash.com/400x300/?gift,shopping',
      videoUrl:
          'https://youglish.com/pronounce/looking%20for%20a%20gift/english/us'),
  BuiltInCard(
      front: 'Do you have a loyalty card?',
      back: 'Чи є у вас карта постійного покупця?',
      pronunciation: 'ду ю хэв э лойэлти кард',
      transcription: '/duː juː hæv ə ˈlɔɪəlti kɑːrd/',
      example: 'You can earn points. Do you have a loyalty card?',
      notes: 'Бонуси',
      imageUrl: 'https://source.unsplash.com/400x300/?loyalty,card',
      videoUrl: 'https://youglish.com/pronounce/loyalty%20card/english/us'),
  BuiltInCard(
      front: 'This does not fit me',
      back: 'Це мені не підходить',
      pronunciation: 'дис дэз нот фит ми',
      transcription: '/ðɪs dʌz nɒt fɪt miː/',
      example: 'I tried it on but this does not fit me.',
      notes: 'Розмір',
      imageUrl: 'https://source.unsplash.com/400x300/?fitting,clothes',
      videoUrl:
          'https://youglish.com/pronounce/does%20not%20fit%20me/english/us'),
  BuiltInCard(
      front: 'Where is the changing room?',
      back: 'Де примірювальна?',
      pronunciation: 'уэр из дэ чэйнджинг рум',
      transcription: '/wɛr ɪz ðə ˈtʃeɪndʒɪŋ ruːm/',
      example: 'I want to try this on. Where is the changing room?',
      notes: 'Навігація',
      imageUrl: 'https://source.unsplash.com/400x300/?changing,room',
      videoUrl: 'https://youglish.com/pronounce/changing%20room/english/us'),
  BuiltInCard(
      front: 'I prefer online shopping',
      back: 'Я надаю перевагу онлайн покупкам',
      pronunciation: 'ай прифэр онлайн шопинг',
      transcription: '/aɪ prɪˈfɜːr ˈɒnlaɪn ˈʃɒpɪŋ/',
      example: 'It is more convenient. I prefer online shopping.',
      notes: 'Інтернет шопінг',
      imageUrl: 'https://source.unsplash.com/400x300/?online,shopping',
      videoUrl: 'https://youglish.com/pronounce/online%20shopping/english/us'),
  BuiltInCard(
      front: 'Can I exchange this?',
      back: 'Чи можна це обміняти?',
      pronunciation: 'кэн ай иксчэйндж дис',
      transcription: '/kæn aɪ ɪksˈtʃeɪndʒ ðɪs/',
      example: 'I bought the wrong size. Can I exchange this?',
      notes: 'Обмін',
      imageUrl: 'https://source.unsplash.com/400x300/?exchange,store',
      videoUrl: 'https://youglish.com/pronounce/can%20I%20exchange/english/us'),
  BuiltInCard(
      front: 'The total comes to twenty pounds',
      back: 'Разом виходить двадцять фунтів',
      pronunciation: 'дэ тоутэл камз ту туэнти паундз',
      transcription: '/ðə ˈtoʊtl kʌmz tə ˈtwenti paʊndz/',
      example: 'Here is your receipt. The total comes to twenty pounds.',
      notes: 'Підсумок',
      imageUrl: 'https://source.unsplash.com/400x300/?receipt,total',
      videoUrl: 'https://youglish.com/pronounce/total%20comes%20to/english/us'),
  BuiltInCard(
      front: 'I spent too much money',
      back: 'Я витратив занадто багато грошей',
      pronunciation: 'ай спэнт ту мач мани',
      transcription: '/aɪ spent tuː mʌtʃ ˈmʌni/',
      example: 'The sales are dangerous. I spent too much money today.',
      notes: 'Витрати',
      imageUrl: 'https://source.unsplash.com/400x300/?money,spending',
      videoUrl:
          'https://youglish.com/pronounce/spent%20too%20much%20money/english/us'),
  BuiltInCard(
      front: 'I need to stick to a budget',
      back: 'Мені потрібно дотримуватися бюджету',
      pronunciation: 'ай нид ту стик ту э баджит',
      transcription: '/aɪ niːd tə stɪk tə ə ˈbʌdʒɪt/',
      example:
          'I keep buying things I do not need. I need to stick to a budget.',
      notes: 'Економія',
      imageUrl: 'https://source.unsplash.com/400x300/?budget,savings',
      videoUrl:
          'https://youglish.com/pronounce/stick%20to%20a%20budget/english/us'),
  BuiltInCard(
      front: 'This shop has a great selection',
      back: 'У цьому магазині великий вибір',
      pronunciation: 'дис шоп хэз э грэйт сэлэкшэн',
      transcription: '/ðɪs ʃɒp hæz ə ɡreɪt sɪˈlekʃən/',
      example: 'I could spend hours here. This shop has a great selection.',
      notes: 'Асортимент',
      imageUrl: 'https://source.unsplash.com/400x300/?store,selection',
      videoUrl: 'https://youglish.com/pronounce/great%20selection/english/us'),
]);

// ============================================================
// 06 — Travel & Transport
// ============================================================

const _ruSet06 = BuiltInSet(name: 'Travel & Transport', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'Which platform does the train leave from?',
      back: 'С какой платформы отходит поезд?',
      pronunciation: 'уич плэтформ дэз дэ трэйн лив фром',
      transcription: '/wɪtʃ ˈplætfɔːrm dʌz ðə treɪn liːv frɒm/',
      example:
          'I need to catch my train. Which platform does the train leave from?',
      notes: 'На вокзале',
      imageUrl: 'https://source.unsplash.com/400x300/?train,platform',
      videoUrl: 'https://youglish.com/pronounce/which%20platform/english/us'),
  BuiltInCard(
      front: 'My flight has been delayed',
      back: 'Мой рейс задержали',
      pronunciation: 'май флайт хэз бин дилэйд',
      transcription: '/maɪ flaɪt hæz bɪn dɪˈleɪd/',
      example: 'We will have to wait. My flight has been delayed.',
      notes: 'Задержка',
      imageUrl: 'https://source.unsplash.com/400x300/?airport,delay',
      videoUrl: 'https://youglish.com/pronounce/flight%20delayed/english/us'),
  BuiltInCard(
      front: 'Where can I buy a ticket?',
      back: 'Где я могу купить билет?',
      pronunciation: 'уэр кэн ай бай э тикэт',
      transcription: '/wɛr kæn aɪ baɪ ə ˈtɪkɪt/',
      example: 'I just arrived. Where can I buy a ticket?',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?ticket,bus',
      videoUrl: 'https://youglish.com/pronounce/buy%20a%20ticket/english/us'),
  BuiltInCard(
      front: 'Is this seat taken?',
      back: 'Это место занято?',
      pronunciation: 'из дис сит тэйкэн',
      transcription: '/ɪz ðɪs siːt ˈteɪkən/',
      example: 'The bus is full. Is this seat taken?',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?seat,bus',
      videoUrl: 'https://youglish.com/pronounce/seat%20taken/english/us'),
  BuiltInCard(
      front: 'I need to check in my luggage',
      back: 'Мне нужно сдать багаж',
      pronunciation: 'ай нид ту чек ин май лагидж',
      transcription: '/aɪ niːd tə tʃek ɪn maɪ ˈlʌɡɪdʒ/',
      example: 'Before boarding I need to check in my luggage.',
      notes: 'Аэропорт',
      imageUrl: 'https://source.unsplash.com/400x300/?luggage,airport',
      videoUrl:
          'https://youglish.com/pronounce/check%20in%20luggage/english/us'),
  BuiltInCard(
      front: 'How long is the journey?',
      back: 'Как долго длится поездка?',
      pronunciation: 'хау лонг из дэ джэрни',
      transcription: '/haʊ lɒŋ ɪz ðə ˈdʒɜːrni/',
      example: 'I want to plan my day. How long is the journey?',
      notes: 'Время в пути',
      imageUrl: 'https://source.unsplash.com/400x300/?journey,train',
      videoUrl:
          'https://youglish.com/pronounce/how%20long%20is%20the%20journey/english/us'),
  BuiltInCard(
      front: 'Can you call me a taxi?',
      back: 'Не могли бы вы вызвать мне такси?',
      pronunciation: 'кэн ю кол ми э такси',
      transcription: '/kæn juː kɔːl miː ə ˈtæksi/',
      example: 'I missed my bus. Can you call me a taxi?',
      notes: 'Такси',
      imageUrl: 'https://source.unsplash.com/400x300/?taxi,call',
      videoUrl: 'https://youglish.com/pronounce/call%20a%20taxi/english/us'),
  BuiltInCard(
      front: 'I get travel sick',
      back: 'Меня укачивает в дороге',
      pronunciation: 'ай гет трэвэл сик',
      transcription: '/aɪ ɡet ˈtrævl sɪk/',
      example: 'Do not sit in the back. I get travel sick.',
      notes: 'Здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?carsick,travel',
      videoUrl: 'https://youglish.com/pronounce/travel%20sick/english/us'),
  BuiltInCard(
      front: 'I prefer window seats',
      back: 'Я предпочитаю места у окна',
      pronunciation: 'ай прифэр уиндоу ситс',
      transcription: '/aɪ prɪˈfɜːr ˈwɪndoʊ siːts/',
      example: 'When booking flights I prefer window seats.',
      notes: 'Предпочтения',
      imageUrl: 'https://source.unsplash.com/400x300/?window,seat',
      videoUrl: 'https://youglish.com/pronounce/window%20seats/english/us'),
  BuiltInCard(
      front: 'My passport expires next year',
      back: 'Мой паспорт истекает в следующем году',
      pronunciation: 'май паспорт экспайрз нэкст йир',
      transcription: '/maɪ ˈpæspɔːrt ɪkˈspaɪərz nekst jɪr/',
      example: 'I need to renew it. My passport expires next year.',
      notes: 'Документы',
      imageUrl: 'https://source.unsplash.com/400x300/?passport,expire',
      videoUrl: 'https://youglish.com/pronounce/passport%20expires/english/us'),
  BuiltInCard(
      front: 'We missed our connection',
      back: 'Мы опоздали на пересадку',
      pronunciation: 'уи мисст ауэр конэкшэн',
      transcription: '/wiː mɪst aʊər kəˈnekʃən/',
      example: 'The first flight was late. We missed our connection.',
      notes: 'Проблемы',
      imageUrl: 'https://source.unsplash.com/400x300/?connection,airport',
      videoUrl:
          'https://youglish.com/pronounce/missed%20our%20connection/english/us'),
  BuiltInCard(
      front: 'I am travelling light',
      back: 'Я путешествую налегке',
      pronunciation: 'ай эм трэвэлинг лайт',
      transcription: '/aɪ æm ˈtrævlɪŋ laɪt/',
      example: 'Just a backpack for me. I am travelling light.',
      notes: 'Сборы',
      imageUrl: 'https://source.unsplash.com/400x300/?backpack,light',
      videoUrl: 'https://youglish.com/pronounce/travelling%20light/english/us'),
  BuiltInCard(
      front: 'Do I need a visa?',
      back: 'Мне нужна виза?',
      pronunciation: 'ду ай нид э виза',
      transcription: '/duː aɪ niːd ə ˈviːzə/',
      example: 'I want to visit the USA. Do I need a visa?',
      notes: 'Документы',
      imageUrl: 'https://source.unsplash.com/400x300/?visa,travel',
      videoUrl: 'https://youglish.com/pronounce/need%20a%20visa/english/us'),
  BuiltInCard(
      front: 'Fasten your seatbelt',
      back: 'Пристегните ремень безопасности',
      pronunciation: 'фасэн йор ситбэлт',
      transcription: '/ˈfæsn jɔːr ˈsiːtbelt/',
      example: 'We are about to land. Fasten your seatbelt.',
      notes: 'Безопасность',
      imageUrl: 'https://source.unsplash.com/400x300/?seatbelt,plane',
      videoUrl:
          'https://youglish.com/pronounce/fasten%20your%20seatbelt/english/us'),
  BuiltInCard(
      front: 'I have lost my luggage',
      back: 'Я потерял свой багаж',
      pronunciation: 'ай хэв лост май лагидж',
      transcription: '/aɪ hæv lɒst maɪ ˈlʌɡɪdʒ/',
      example: 'It is not on the conveyor. I have lost my luggage.',
      notes: 'Проблемы',
      imageUrl: 'https://source.unsplash.com/400x300/?lost,luggage',
      videoUrl:
          'https://youglish.com/pronounce/lost%20my%20luggage/english/us'),
  BuiltInCard(
      front: 'The traffic is terrible today',
      back: 'Пробки сегодня ужасные',
      pronunciation: 'дэ трафик из тэрибэл тудэй',
      transcription: '/ðə ˈtræfɪk ɪz ˈterəbl təˈdeɪ/',
      example: 'We will be late. The traffic is terrible today.',
      notes: 'Движение',
      imageUrl: 'https://source.unsplash.com/400x300/?traffic,jam',
      videoUrl: 'https://youglish.com/pronounce/traffic%20terrible/english/us'),
  BuiltInCard(
      front: 'I booked a round trip ticket',
      back: 'Я купил билет туда и обратно',
      pronunciation: 'ай букт э раунд трип тикэт',
      transcription: '/aɪ bʊkt ə raʊnd trɪp ˈtɪkɪt/',
      example: 'It was cheaper. I booked a round trip ticket.',
      notes: 'Билет',
      imageUrl: 'https://source.unsplash.com/400x300/?roundtrip,ticket',
      videoUrl:
          'https://youglish.com/pronounce/round%20trip%20ticket/english/us'),
  BuiltInCard(
      front: 'What time does the next bus come?',
      back: 'Когда приходит следующий автобус?',
      pronunciation: 'уот тайм дэз дэ нэкст бас кам',
      transcription: '/wɒt taɪm dʌz ðə nekst bʌs kʌm/',
      example: 'I just missed one. What time does the next bus come?',
      notes: 'Расписание',
      imageUrl: 'https://source.unsplash.com/400x300/?bus,schedule',
      videoUrl: 'https://youglish.com/pronounce/next%20bus%20come/english/us'),
  BuiltInCard(
      front: 'Turn left at the roundabout',
      back: 'Поверните налево на кольцевой развязке',
      pronunciation: 'тэрн лэфт эт дэ раундэбаут',
      transcription: '/tɜːrn left æt ðə ˈraʊndəbaʊt/',
      example: 'Follow the GPS. Turn left at the roundabout.',
      notes: 'Маршрут',
      imageUrl: 'https://source.unsplash.com/400x300/?roundabout,road',
      videoUrl:
          'https://youglish.com/pronounce/turn%20left%20at%20the%20roundabout/english/us'),
  BuiltInCard(
      front: 'The border control was strict',
      back: 'Пограничный контроль был строгим',
      pronunciation: 'дэ бордэр контроул уоз стрикт',
      transcription: '/ðə ˈbɔːrdər kənˈtroʊl wɒz strɪkt/',
      example: 'It took us two hours. The border control was strict.',
      notes: 'Граница',
      imageUrl: 'https://source.unsplash.com/400x300/?border,passport',
      videoUrl: 'https://youglish.com/pronounce/border%20control/english/us'),
]);

const _ukSet06 = BuiltInSet(name: 'Travel & Transport', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'Which platform does the train leave from?',
      back: 'З якої платформи відходить потяг?',
      pronunciation: 'уич плэтформ дэз дэ трэйн лив фром',
      transcription: '/wɪtʃ ˈplætfɔːrm dʌz ðə treɪn liːv frɒm/',
      example:
          'I need to catch my train. Which platform does the train leave from?',
      notes: 'На вокзалі',
      imageUrl: 'https://source.unsplash.com/400x300/?train,platform',
      videoUrl: 'https://youglish.com/pronounce/which%20platform/english/us'),
  BuiltInCard(
      front: 'My flight has been delayed',
      back: 'Мій рейс затримали',
      pronunciation: 'май флайт хэз бин дилэйд',
      transcription: '/maɪ flaɪt hæz bɪn dɪˈleɪd/',
      example: 'We will have to wait. My flight has been delayed.',
      notes: 'Затримка',
      imageUrl: 'https://source.unsplash.com/400x300/?airport,delay',
      videoUrl: 'https://youglish.com/pronounce/flight%20delayed/english/us'),
  BuiltInCard(
      front: 'Where can I buy a ticket?',
      back: 'Де я можу купити квиток?',
      pronunciation: 'уэр кэн ай бай э тикэт',
      transcription: '/wɛr kæn aɪ baɪ ə ˈtɪkɪt/',
      example: 'I just arrived. Where can I buy a ticket?',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?ticket,bus',
      videoUrl: 'https://youglish.com/pronounce/buy%20a%20ticket/english/us'),
  BuiltInCard(
      front: 'Is this seat taken?',
      back: 'Це місце зайнято?',
      pronunciation: 'из дис сит тэйкэн',
      transcription: '/ɪz ðɪs siːt ˈteɪkən/',
      example: 'The bus is full. Is this seat taken?',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?seat,bus',
      videoUrl: 'https://youglish.com/pronounce/seat%20taken/english/us'),
  BuiltInCard(
      front: 'I need to check in my luggage',
      back: 'Мені потрібно здати багаж',
      pronunciation: 'ай нид ту чек ин май лагидж',
      transcription: '/aɪ niːd tə tʃek ɪn maɪ ˈlʌɡɪdʒ/',
      example: 'Before boarding I need to check in my luggage.',
      notes: 'Аеропорт',
      imageUrl: 'https://source.unsplash.com/400x300/?luggage,airport',
      videoUrl:
          'https://youglish.com/pronounce/check%20in%20luggage/english/us'),
  BuiltInCard(
      front: 'How long is the journey?',
      back: 'Як довго триває поїздка?',
      pronunciation: 'хау лонг из дэ джэрни',
      transcription: '/haʊ lɒŋ ɪz ðə ˈdʒɜːrni/',
      example: 'I want to plan my day. How long is the journey?',
      notes: 'Час у дорозі',
      imageUrl: 'https://source.unsplash.com/400x300/?journey,train',
      videoUrl:
          'https://youglish.com/pronounce/how%20long%20is%20the%20journey/english/us'),
  BuiltInCard(
      front: 'Can you call me a taxi?',
      back: 'Чи не могли б ви викликати мені таксі?',
      pronunciation: 'кэн ю кол ми э такси',
      transcription: '/kæn juː kɔːl miː ə ˈtæksi/',
      example: 'I missed my bus. Can you call me a taxi?',
      notes: 'Таксі',
      imageUrl: 'https://source.unsplash.com/400x300/?taxi,call',
      videoUrl: 'https://youglish.com/pronounce/call%20a%20taxi/english/us'),
  BuiltInCard(
      front: 'I get travel sick',
      back: 'Мене хитає в дорозі',
      pronunciation: 'ай гет трэвэл сик',
      transcription: '/aɪ ɡet ˈtrævl sɪk/',
      example: 'Do not sit in the back. I get travel sick.',
      notes: "Здоров'я",
      imageUrl: 'https://source.unsplash.com/400x300/?carsick,travel',
      videoUrl: 'https://youglish.com/pronounce/travel%20sick/english/us'),
  BuiltInCard(
      front: 'I prefer window seats',
      back: 'Я надаю перевагу місцям біля вікна',
      pronunciation: 'ай прифэр уиндоу ситс',
      transcription: '/aɪ prɪˈfɜːr ˈwɪndoʊ siːts/',
      example: 'When booking flights I prefer window seats.',
      notes: 'Вподобання',
      imageUrl: 'https://source.unsplash.com/400x300/?window,seat',
      videoUrl: 'https://youglish.com/pronounce/window%20seats/english/us'),
  BuiltInCard(
      front: 'My passport expires next year',
      back: 'Мій паспорт закінчується наступного року',
      pronunciation: 'май паспорт экспайрз нэкст йир',
      transcription: '/maɪ ˈpæspɔːrt ɪkˈspaɪərz nekst jɪr/',
      example: 'I need to renew it. My passport expires next year.',
      notes: 'Документи',
      imageUrl: 'https://source.unsplash.com/400x300/?passport,expire',
      videoUrl: 'https://youglish.com/pronounce/passport%20expires/english/us'),
  BuiltInCard(
      front: 'We missed our connection',
      back: 'Ми запізнилися на пересадку',
      pronunciation: 'уи мисст ауэр конэкшэн',
      transcription: '/wiː mɪst aʊər kəˈnekʃən/',
      example: 'The first flight was late. We missed our connection.',
      notes: 'Проблеми',
      imageUrl: 'https://source.unsplash.com/400x300/?connection,airport',
      videoUrl:
          'https://youglish.com/pronounce/missed%20our%20connection/english/us'),
  BuiltInCard(
      front: 'I am travelling light',
      back: "Я подорожую наліг'ці",
      pronunciation: 'ай эм трэвэлинг лайт',
      transcription: '/aɪ æm ˈtrævlɪŋ laɪt/',
      example: 'Just a backpack for me. I am travelling light.',
      notes: 'Збори',
      imageUrl: 'https://source.unsplash.com/400x300/?backpack,light',
      videoUrl: 'https://youglish.com/pronounce/travelling%20light/english/us'),
  BuiltInCard(
      front: 'Do I need a visa?',
      back: 'Мені потрібна віза?',
      pronunciation: 'ду ай нид э виза',
      transcription: '/duː aɪ niːd ə ˈviːzə/',
      example: 'I want to visit the USA. Do I need a visa?',
      notes: 'Документи',
      imageUrl: 'https://source.unsplash.com/400x300/?visa,travel',
      videoUrl: 'https://youglish.com/pronounce/need%20a%20visa/english/us'),
  BuiltInCard(
      front: 'Fasten your seatbelt',
      back: 'Застебніть ремінь безпеки',
      pronunciation: 'фасэн йор ситбэлт',
      transcription: '/ˈfæsn jɔːr ˈsiːtbelt/',
      example: 'We are about to land. Fasten your seatbelt.',
      notes: 'Безпека',
      imageUrl: 'https://source.unsplash.com/400x300/?seatbelt,plane',
      videoUrl:
          'https://youglish.com/pronounce/fasten%20your%20seatbelt/english/us'),
  BuiltInCard(
      front: 'I have lost my luggage',
      back: 'Я загубив свій багаж',
      pronunciation: 'ай хэв лост май лагидж',
      transcription: '/aɪ hæv lɒst maɪ ˈlʌɡɪdʒ/',
      example: 'It is not on the conveyor. I have lost my luggage.',
      notes: 'Проблеми',
      imageUrl: 'https://source.unsplash.com/400x300/?lost,luggage',
      videoUrl:
          'https://youglish.com/pronounce/lost%20my%20luggage/english/us'),
  BuiltInCard(
      front: 'The traffic is terrible today',
      back: 'Пробки сьогодні жахливі',
      pronunciation: 'дэ трафик из тэрибэл тудэй',
      transcription: '/ðə ˈtræfɪk ɪz ˈterəbl təˈdeɪ/',
      example: 'We will be late. The traffic is terrible today.',
      notes: 'Рух',
      imageUrl: 'https://source.unsplash.com/400x300/?traffic,jam',
      videoUrl: 'https://youglish.com/pronounce/traffic%20terrible/english/us'),
  BuiltInCard(
      front: 'I booked a round trip ticket',
      back: 'Я купив квиток туди і назад',
      pronunciation: 'ай букт э раунд трип тикэт',
      transcription: '/aɪ bʊkt ə raʊnd trɪp ˈtɪkɪt/',
      example: 'It was cheaper. I booked a round trip ticket.',
      notes: 'Квиток',
      imageUrl: 'https://source.unsplash.com/400x300/?roundtrip,ticket',
      videoUrl:
          'https://youglish.com/pronounce/round%20trip%20ticket/english/us'),
  BuiltInCard(
      front: 'What time does the next bus come?',
      back: 'Коли приходить наступний автобус?',
      pronunciation: 'уот тайм дэз дэ нэкст бас кам',
      transcription: '/wɒt taɪm dʌz ðə nekst bʌs kʌm/',
      example: 'I just missed one. What time does the next bus come?',
      notes: 'Розклад',
      imageUrl: 'https://source.unsplash.com/400x300/?bus,schedule',
      videoUrl: 'https://youglish.com/pronounce/next%20bus%20come/english/us'),
  BuiltInCard(
      front: 'Turn left at the roundabout',
      back: "Поверніть ліворуч на кільцевій розв'язці",
      pronunciation: 'тэрн лэфт эт дэ раундэбаут',
      transcription: '/tɜːrn left æt ðə ˈraʊndəbaʊt/',
      example: 'Follow the GPS. Turn left at the roundabout.',
      notes: 'Маршрут',
      imageUrl: 'https://source.unsplash.com/400x300/?roundabout,road',
      videoUrl:
          'https://youglish.com/pronounce/turn%20left%20at%20the%20roundabout/english/us'),
  BuiltInCard(
      front: 'The border control was strict',
      back: 'Прикордонний контроль був суворим',
      pronunciation: 'дэ бордэр контроул уоз стрикт',
      transcription: '/ðə ˈbɔːrdər kənˈtroʊl wɒz strɪkt/',
      example: 'It took us two hours. The border control was strict.',
      notes: 'Кордон',
      imageUrl: 'https://source.unsplash.com/400x300/?border,passport',
      videoUrl: 'https://youglish.com/pronounce/border%20control/english/us'),
]);

// ============================================================
// 07 — Weather
// ============================================================

const _ruSet07 = BuiltInSet(name: 'Weather', langCode: 'ru', cards: [
  BuiltInCard(
      front: "What's the weather like today?",
      back: 'Какая сегодня погода?',
      pronunciation: 'уотс дэ уэзэр лайк тудэй',
      transcription: "/wɒts ðə ˈweðər laɪk təˈdeɪ/",
      example: "I want to plan my outfit. What's the weather like today?",
      notes: 'Погода',
      imageUrl: 'https://source.unsplash.com/400x300/?weather,sky',
      videoUrl:
          'https://youglish.com/pronounce/weather%20like%20today/english/us'),
  BuiltInCard(
      front: "It's raining cats and dogs",
      back: 'Льёт как из ведра',
      pronunciation: 'итс рэйнинг кэтс энд догз',
      transcription: "/ɪts ˈreɪnɪŋ kæts ænd dɒɡz/",
      example: "Don't forget your umbrella. It's raining cats and dogs!",
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?rain,umbrella',
      videoUrl:
          'https://youglish.com/pronounce/raining%20cats%20and%20dogs/english/us'),
  BuiltInCard(
      front: "It's freezing outside",
      back: 'На улице мороз',
      pronunciation: 'итс фризинг аутсайд',
      transcription: "/ɪts ˈfriːzɪŋ aʊtˈsaɪd/",
      example: "Wear your warmest coat. It's freezing outside today.",
      notes: 'Холодная погода',
      imageUrl: 'https://source.unsplash.com/400x300/?winter,cold',
      videoUrl: 'https://youglish.com/pronounce/freezing%20outside/english/us'),
  BuiltInCard(
      front: "There's a heatwave this week",
      back: 'На этой неделе аномальная жара',
      pronunciation: 'дэрз э хитуэйв дис уик',
      transcription: "/ðɛrz ə ˈhiːtweɪv ðɪs wiːk/",
      example: "Stay hydrated because there's a heatwave this week.",
      notes: 'Жара',
      imageUrl: 'https://source.unsplash.com/400x300/?heatwave,sun',
      videoUrl:
          'https://youglish.com/pronounce/heatwave%20this%20week/english/us'),
  BuiltInCard(
      front: 'The forecast says it will snow',
      back: 'По прогнозу будет снег',
      pronunciation: 'дэ форкаст сэз ит уил сноу',
      transcription: '/ðə ˈfɔːrkæst sez ɪt wɪl snoʊ/',
      example: 'Bring your boots. The forecast says it will snow tomorrow.',
      notes: 'Прогноз',
      imageUrl: 'https://source.unsplash.com/400x300/?snow,forecast',
      videoUrl: 'https://youglish.com/pronounce/forecast%20snow/english/us'),
  BuiltInCard(
      front: "It's a bit cloudy",
      back: 'Немного облачно',
      pronunciation: 'итс э бит клауди',
      transcription: "/ɪts ə bɪt ˈklaʊdi/",
      example: "We can still go out. It's a bit cloudy but no rain.",
      notes: 'Пасмурно',
      imageUrl: 'https://source.unsplash.com/400x300/?clouds,overcast',
      videoUrl: 'https://youglish.com/pronounce/a%20bit%20cloudy/english/us'),
  BuiltInCard(
      front: 'Bring an umbrella just in case',
      back: 'Возьми зонт на всякий случай',
      pronunciation: 'бринг эн амбрэла джаст ин кэйс',
      transcription: '/brɪŋ ən ʌmˈbrelə dʒʌst ɪn keɪs/',
      example: 'The sky looks grey. Bring an umbrella just in case.',
      notes: 'Совет',
      imageUrl: 'https://source.unsplash.com/400x300/?umbrella,rain',
      videoUrl:
          'https://youglish.com/pronounce/umbrella%20just%20in%20case/english/us'),
  BuiltInCard(
      front: 'The sun is shining brightly',
      back: 'Ярко светит солнце',
      pronunciation: 'дэ сан из шайнинг брайтли',
      transcription: '/ðə sʌn ɪz ˈʃaɪnɪŋ ˈbraɪtli/',
      example: 'What a beautiful day! The sun is shining brightly.',
      notes: 'Солнечно',
      imageUrl: 'https://source.unsplash.com/400x300/?sunshine,bright',
      videoUrl: 'https://youglish.com/pronounce/sun%20is%20shining/english/us'),
  BuiltInCard(
      front: "There's a thunderstorm coming",
      back: 'Надвигается гроза',
      pronunciation: 'дэрз э сандэрсторм каминг',
      transcription: "/ðɛrz ə ˈθʌndərˌstɔːrm ˈkʌmɪŋ/",
      example: "Close all the windows. There's a thunderstorm coming.",
      notes: 'Гроза',
      imageUrl: 'https://source.unsplash.com/400x300/?storm,thunder',
      videoUrl:
          'https://youglish.com/pronounce/thunderstorm%20coming/english/us'),
  BuiltInCard(
      front: 'The temperature has dropped',
      back: 'Температура упала',
      pronunciation: 'дэ тэмпэрэчэр хэз дропт',
      transcription: '/ðə ˈtempərətʃər hæz drɒpt/',
      example: 'Wear extra layers because the temperature has dropped.',
      notes: 'Изменение',
      imageUrl: 'https://source.unsplash.com/400x300/?temperature,thermometer',
      videoUrl:
          'https://youglish.com/pronounce/temperature%20has%20dropped/english/us'),
  BuiltInCard(
      front: "It's humid today",
      back: 'Сегодня влажно',
      pronunciation: 'итс хьюмид тудэй',
      transcription: "/ɪts ˈhjuːmɪd təˈdeɪ/",
      example: "My hair goes crazy. It's humid today.",
      notes: 'Влажность',
      imageUrl: 'https://source.unsplash.com/400x300/?humid,summer',
      videoUrl: 'https://youglish.com/pronounce/humid%20today/english/us'),
  BuiltInCard(
      front: 'The wind is picking up',
      back: 'Ветер усиливается',
      pronunciation: 'дэ уинд из пикинг ап',
      transcription: '/ðə wɪnd ɪz ˈpɪkɪŋ ʌp/',
      example: 'Hold on to your hat. The wind is picking up.',
      notes: 'Ветер',
      imageUrl: 'https://source.unsplash.com/400x300/?wind,leaves',
      videoUrl:
          'https://youglish.com/pronounce/wind%20picking%20up/english/us'),
  BuiltInCard(
      front: 'The roads are icy',
      back: 'Дороги обледенелые',
      pronunciation: 'дэ роудз ар айси',
      transcription: '/ðə roʊdz ɑːr ˈaɪsi/',
      example: 'Be careful driving today. The roads are icy.',
      notes: 'Опасность',
      imageUrl: 'https://source.unsplash.com/400x300/?ice,road',
      videoUrl: 'https://youglish.com/pronounce/roads%20are%20icy/english/us'),
  BuiltInCard(
      front: "It's scorching hot",
      back: 'Жара невыносимая',
      pronunciation: 'итс скорчинг хот',
      transcription: "/ɪts ˈskɔːrtʃɪŋ hɒt/",
      example: "Stay in the shade. It's scorching hot today.",
      notes: 'Сильная жара',
      imageUrl: 'https://source.unsplash.com/400x300/?hot,desert',
      videoUrl: 'https://youglish.com/pronounce/scorching%20hot/english/us'),
  BuiltInCard(
      front: 'The weather is unpredictable',
      back: 'Погода непредсказуема',
      pronunciation: 'дэ уэзэр из анпридиктэбэл',
      transcription: '/ðə ˈweðər ɪz ˌʌnprɪˈdɪktəbl/',
      example: 'Always carry a jacket. The weather is unpredictable here.',
      notes: 'Изменчивость',
      imageUrl: 'https://source.unsplash.com/400x300/?weather,change',
      videoUrl:
          'https://youglish.com/pronounce/weather%20unpredictable/english/us'),
  BuiltInCard(
      front: 'Spring is just around the corner',
      back: 'Весна не за горами',
      pronunciation: 'спринг из джаст эраунд дэ корнэр',
      transcription: "/sprɪŋ ɪz dʒʌst əˈraʊnd ðə ˈkɔːrnər/",
      example: 'The days are getting longer. Spring is just around the corner.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?spring,flowers',
      videoUrl:
          'https://youglish.com/pronounce/spring%20around%20the%20corner/english/us'),
  BuiltInCard(
      front: 'We had a white Christmas',
      back: 'У нас было белое Рождество',
      pronunciation: 'уи хэд э уайт крисмэс',
      transcription: '/wiː hæd ə waɪt ˈkrɪsməs/',
      example: 'It was magical this year. We had a white Christmas.',
      notes: 'Зима',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,snow',
      videoUrl: 'https://youglish.com/pronounce/white%20Christmas/english/us'),
  BuiltInCard(
      front: "It's foggy on the motorway",
      back: 'На трассе туман',
      pronunciation: 'итс фоги он дэ моутэруэй',
      transcription: "/ɪts ˈfɒɡi ɒn ðə ˈmoʊtərweɪ/",
      example: "Drive carefully. It's foggy on the motorway today.",
      notes: 'Туман',
      imageUrl: 'https://source.unsplash.com/400x300/?fog,road',
      videoUrl: 'https://youglish.com/pronounce/foggy%20motorway/english/us'),
  BuiltInCard(
      front: 'I love autumn colours',
      back: 'Я люблю осенние краски',
      pronunciation: 'ай лав отэм калэрз',
      transcription: '/aɪ lʌv ˈɔːtəm ˈkʌlərz/',
      example: 'The park looks amazing. I love autumn colours.',
      notes: 'Осень',
      imageUrl: 'https://source.unsplash.com/400x300/?autumn,leaves',
      videoUrl: 'https://youglish.com/pronounce/autumn%20colours/english/us'),
  BuiltInCard(
      front: "There's a rainbow after the rain",
      back: 'После дождя появилась радуга',
      pronunciation: 'дэрз э рэйнбоу афтэр дэ рэйн',
      transcription: "/ðɛrz ə ˈreɪnboʊ ˈæftər ðə reɪn/",
      example: "Look at the sky! There's a rainbow after the rain.",
      notes: 'Природа',
      imageUrl: 'https://source.unsplash.com/400x300/?rainbow,sky',
      videoUrl:
          'https://youglish.com/pronounce/rainbow%20after%20rain/english/us'),
]);

const _ukSet07 = BuiltInSet(name: 'Weather', langCode: 'uk', cards: [
  BuiltInCard(
      front: "What's the weather like today?",
      back: 'Яка сьогодні погода?',
      pronunciation: 'уотс дэ уэзэр лайк тудэй',
      transcription: "/wɒts ðə ˈweðər laɪk təˈdeɪ/",
      example: "I want to plan my outfit. What's the weather like today?",
      notes: 'Погода',
      imageUrl: 'https://source.unsplash.com/400x300/?weather,sky',
      videoUrl:
          'https://youglish.com/pronounce/weather%20like%20today/english/us'),
  BuiltInCard(
      front: "It's raining cats and dogs",
      back: 'Ллє як з відра',
      pronunciation: 'итс рэйнинг кэтс энд догз',
      transcription: "/ɪts ˈreɪnɪŋ kæts ænd dɒɡz/",
      example: "Don't forget your umbrella. It's raining cats and dogs!",
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?rain,umbrella',
      videoUrl:
          'https://youglish.com/pronounce/raining%20cats%20and%20dogs/english/us'),
  BuiltInCard(
      front: "It's freezing outside",
      back: 'На вулиці мороз',
      pronunciation: 'итс фризинг аутсайд',
      transcription: "/ɪts ˈfriːzɪŋ aʊtˈsaɪd/",
      example: "Wear your warmest coat. It's freezing outside today.",
      notes: 'Холодна погода',
      imageUrl: 'https://source.unsplash.com/400x300/?winter,cold',
      videoUrl: 'https://youglish.com/pronounce/freezing%20outside/english/us'),
  BuiltInCard(
      front: "There's a heatwave this week",
      back: 'Цього тижня аномальна спека',
      pronunciation: 'дэрз э хитуэйв дис уик',
      transcription: "/ðɛrz ə ˈhiːtweɪv ðɪs wiːk/",
      example: "Stay hydrated because there's a heatwave this week.",
      notes: 'Спека',
      imageUrl: 'https://source.unsplash.com/400x300/?heatwave,sun',
      videoUrl:
          'https://youglish.com/pronounce/heatwave%20this%20week/english/us'),
  BuiltInCard(
      front: 'The forecast says it will snow',
      back: 'За прогнозом буде сніг',
      pronunciation: 'дэ форкаст сэз ит уил сноу',
      transcription: '/ðə ˈfɔːrkæst sez ɪt wɪl snoʊ/',
      example: 'Bring your boots. The forecast says it will snow tomorrow.',
      notes: 'Прогноз',
      imageUrl: 'https://source.unsplash.com/400x300/?snow,forecast',
      videoUrl: 'https://youglish.com/pronounce/forecast%20snow/english/us'),
  BuiltInCard(
      front: "It's a bit cloudy",
      back: 'Трохи хмарно',
      pronunciation: 'итс э бит клауди',
      transcription: "/ɪts ə bɪt ˈklaʊdi/",
      example: "We can still go out. It's a bit cloudy but no rain.",
      notes: 'Похмуро',
      imageUrl: 'https://source.unsplash.com/400x300/?clouds,overcast',
      videoUrl: 'https://youglish.com/pronounce/a%20bit%20cloudy/english/us'),
  BuiltInCard(
      front: 'Bring an umbrella just in case',
      back: 'Візьми парасольку про всяк випадок',
      pronunciation: 'бринг эн амбрэла джаст ин кэйс',
      transcription: '/brɪŋ ən ʌmˈbrelə dʒʌst ɪn keɪs/',
      example: 'The sky looks grey. Bring an umbrella just in case.',
      notes: 'Порада',
      imageUrl: 'https://source.unsplash.com/400x300/?umbrella,rain',
      videoUrl:
          'https://youglish.com/pronounce/umbrella%20just%20in%20case/english/us'),
  BuiltInCard(
      front: 'The sun is shining brightly',
      back: 'Яскраво світить сонце',
      pronunciation: 'дэ сан из шайнинг брайтли',
      transcription: '/ðə sʌn ɪz ˈʃaɪnɪŋ ˈbraɪtli/',
      example: 'What a beautiful day! The sun is shining brightly.',
      notes: 'Сонячно',
      imageUrl: 'https://source.unsplash.com/400x300/?sunshine,bright',
      videoUrl: 'https://youglish.com/pronounce/sun%20is%20shining/english/us'),
  BuiltInCard(
      front: "There's a thunderstorm coming",
      back: 'Насувається гроза',
      pronunciation: 'дэрз э сандэрсторм каминг',
      transcription: "/ðɛrz ə ˈθʌndərˌstɔːrm ˈkʌmɪŋ/",
      example: "Close all the windows. There's a thunderstorm coming.",
      notes: 'Гроза',
      imageUrl: 'https://source.unsplash.com/400x300/?storm,thunder',
      videoUrl:
          'https://youglish.com/pronounce/thunderstorm%20coming/english/us'),
  BuiltInCard(
      front: 'The temperature has dropped',
      back: 'Температура впала',
      pronunciation: 'дэ тэмпэрэчэр хэз дропт',
      transcription: '/ðə ˈtempərətʃər hæz drɒpt/',
      example: 'Wear extra layers because the temperature has dropped.',
      notes: 'Зміна',
      imageUrl: 'https://source.unsplash.com/400x300/?temperature,thermometer',
      videoUrl:
          'https://youglish.com/pronounce/temperature%20has%20dropped/english/us'),
  BuiltInCard(
      front: "It's humid today",
      back: 'Сьогодні волого',
      pronunciation: 'итс хьюмид тудэй',
      transcription: "/ɪts ˈhjuːmɪd təˈdeɪ/",
      example: "My hair goes crazy. It's humid today.",
      notes: 'Вологість',
      imageUrl: 'https://source.unsplash.com/400x300/?humid,summer',
      videoUrl: 'https://youglish.com/pronounce/humid%20today/english/us'),
  BuiltInCard(
      front: 'The wind is picking up',
      back: 'Вітер посилюється',
      pronunciation: 'дэ уинд из пикинг ап',
      transcription: '/ðə wɪnd ɪz ˈpɪkɪŋ ʌp/',
      example: 'Hold on to your hat. The wind is picking up.',
      notes: 'Вітер',
      imageUrl: 'https://source.unsplash.com/400x300/?wind,leaves',
      videoUrl:
          'https://youglish.com/pronounce/wind%20picking%20up/english/us'),
  BuiltInCard(
      front: 'The roads are icy',
      back: 'Дороги вкриті льодом',
      pronunciation: 'дэ роудз ар айси',
      transcription: '/ðə roʊdz ɑːr ˈaɪsi/',
      example: 'Be careful driving today. The roads are icy.',
      notes: 'Небезпека',
      imageUrl: 'https://source.unsplash.com/400x300/?ice,road',
      videoUrl: 'https://youglish.com/pronounce/roads%20are%20icy/english/us'),
  BuiltInCard(
      front: "It's scorching hot",
      back: 'Нестерпна спека',
      pronunciation: 'итс скорчинг хот',
      transcription: "/ɪts ˈskɔːrtʃɪŋ hɒt/",
      example: "Stay in the shade. It's scorching hot today.",
      notes: 'Сильна спека',
      imageUrl: 'https://source.unsplash.com/400x300/?hot,desert',
      videoUrl: 'https://youglish.com/pronounce/scorching%20hot/english/us'),
  BuiltInCard(
      front: 'The weather is unpredictable',
      back: 'Погода непередбачувана',
      pronunciation: 'дэ уэзэр из анпридиктэбэл',
      transcription: '/ðə ˈweðər ɪz ˌʌnprɪˈdɪktəbl/',
      example: 'Always carry a jacket. The weather is unpredictable here.',
      notes: 'Мінливість',
      imageUrl: 'https://source.unsplash.com/400x300/?weather,change',
      videoUrl:
          'https://youglish.com/pronounce/weather%20unpredictable/english/us'),
  BuiltInCard(
      front: 'Spring is just around the corner',
      back: 'Весна не за горами',
      pronunciation: 'спринг из джаст эраунд дэ корнэр',
      transcription: "/sprɪŋ ɪz dʒʌst əˈraʊnd ðə ˈkɔːrnər/",
      example: 'The days are getting longer. Spring is just around the corner.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?spring,flowers',
      videoUrl:
          'https://youglish.com/pronounce/spring%20around%20the%20corner/english/us'),
  BuiltInCard(
      front: 'We had a white Christmas',
      back: 'У нас було біле Різдво',
      pronunciation: 'уи хэд э уайт крисмэс',
      transcription: '/wiː hæd ə waɪt ˈkrɪsməs/',
      example: 'It was magical this year. We had a white Christmas.',
      notes: 'Зима',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,snow',
      videoUrl: 'https://youglish.com/pronounce/white%20Christmas/english/us'),
  BuiltInCard(
      front: "It's foggy on the motorway",
      back: 'На трасі туман',
      pronunciation: 'итс фоги он дэ моутэруэй',
      transcription: "/ɪts ˈfɒɡi ɒn ðə ˈmoʊtərweɪ/",
      example: "Drive carefully. It's foggy on the motorway today.",
      notes: 'Туман',
      imageUrl: 'https://source.unsplash.com/400x300/?fog,road',
      videoUrl: 'https://youglish.com/pronounce/foggy%20motorway/english/us'),
  BuiltInCard(
      front: 'I love autumn colours',
      back: 'Я люблю осінні фарби',
      pronunciation: 'ай лав отэм калэрз',
      transcription: '/aɪ lʌv ˈɔːtəm ˈkʌlərz/',
      example: 'The park looks amazing. I love autumn colours.',
      notes: 'Осінь',
      imageUrl: 'https://source.unsplash.com/400x300/?autumn,leaves',
      videoUrl: 'https://youglish.com/pronounce/autumn%20colours/english/us'),
  BuiltInCard(
      front: "There's a rainbow after the rain",
      back: "Після дощу з'явилася веселка",
      pronunciation: 'дэрз э рэйнбоу афтэр дэ рэйн',
      transcription: "/ðɛrz ə ˈreɪnboʊ ˈæftər ðə reɪn/",
      example: "Look at the sky! There's a rainbow after the rain.",
      notes: 'Природа',
      imageUrl: 'https://source.unsplash.com/400x300/?rainbow,sky',
      videoUrl:
          'https://youglish.com/pronounce/rainbow%20after%20rain/english/us'),
]);
// END OF PART 2

// ============================================================
// 08 — Cities & Countries
// ============================================================

const _ruSet08 = BuiltInSet(name: 'Cities & Countries', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'What is the capital of France?',
      back: 'Какова столица Франции?',
      pronunciation: 'уот из дэ капитэл эв франс',
      transcription: '/wɒt ɪz ðə ˈkæpɪtl əv fræns/',
      example: 'Do you know your geography? What is the capital of France?',
      notes: 'География',
      imageUrl: 'https://source.unsplash.com/400x300/?paris,eiffel',
      videoUrl:
          'https://youglish.com/pronounce/capital%20of%20France/english/us'),
  BuiltInCard(
      front: 'London is a multicultural city',
      back: 'Лондон — мультикультурный город',
      pronunciation: 'ландэн из э малтикалчэрэл сити',
      transcription: '/ˈlʌndən ɪz ə ˌmʌltiˈkʌltʃərəl ˈsɪti/',
      example:
          'You can hear every language there. London is a multicultural city.',
      notes: 'Описание города',
      imageUrl: 'https://source.unsplash.com/400x300/?london,city',
      videoUrl:
          'https://youglish.com/pronounce/multicultural%20city/english/us'),
  BuiltInCard(
      front: 'I have always wanted to visit Japan',
      back: 'Я всегда хотел посетить Японию',
      pronunciation: 'ай хэв олуэйз уонтид ту визит джэпэн',
      transcription: '/aɪ hæv ˈɔːlweɪz ˈwɒntɪd tə ˈvɪzɪt dʒəˈpæn/',
      example: 'The culture is so unique. I have always wanted to visit Japan.',
      notes: 'Мечты',
      imageUrl: 'https://source.unsplash.com/400x300/?japan,tokyo',
      videoUrl: 'https://youglish.com/pronounce/visit%20Japan/english/us'),
  BuiltInCard(
      front: 'The population of China is huge',
      back: 'Население Китая огромное',
      pronunciation: 'дэ попюлэйшэн эв чайнэ из хьюдж',
      transcription: '/ðə ˌpɒpjʊˈleɪʃən əv ˈtʃaɪnə ɪz hjuːdʒ/',
      example: 'Over a billion people. The population of China is huge.',
      notes: 'Факт',
      imageUrl: 'https://source.unsplash.com/400x300/?china,beijing',
      videoUrl:
          'https://youglish.com/pronounce/population%20of%20China/english/us'),
  BuiltInCard(
      front: 'New York is known as the Big Apple',
      back: 'Нью-Йорк известен как Большое Яблоко',
      pronunciation: 'ню йорк из ноун эз дэ биг эпэл',
      transcription: '/njuː jɔːrk ɪz noʊn æz ðə bɪɡ ˈæpl/',
      example:
          'Every tourist wants to go there. New York is known as the Big Apple.',
      notes: 'Никнейм',
      imageUrl: 'https://source.unsplash.com/400x300/?newyork,manhattan',
      videoUrl:
          'https://youglish.com/pronounce/New%20York%20Big%20Apple/english/us'),
  BuiltInCard(
      front: 'Australia is in the Southern Hemisphere',
      back: 'Австралия находится в Южном полушарии',
      pronunciation: 'острэйлиэ из ин дэ садэрн хэмисфир',
      transcription: '/ɒˈstreɪliə ɪz ɪn ðə ˈsʌðərn ˈhemɪsfɪr/',
      example:
          'Christmas is in summer there. Australia is in the Southern Hemisphere.',
      notes: 'География',
      imageUrl: 'https://source.unsplash.com/400x300/?australia,sydney',
      videoUrl:
          'https://youglish.com/pronounce/Southern%20Hemisphere/english/us'),
  BuiltInCard(
      front: 'Rome was not built in a day',
      back: 'Рим не за один день строился',
      pronunciation: 'роум уоз нот билт ин э дэй',
      transcription: '/roʊm wɒz nɒt bɪlt ɪn ə deɪ/',
      example: 'Be patient with your progress. Rome was not built in a day.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?rome,colosseum',
      videoUrl:
          'https://youglish.com/pronounce/Rome%20was%20not%20built%20in%20a%20day/english/us'),
  BuiltInCard(
      front: 'Brazil is famous for its carnival',
      back: 'Бразилия знаменита своим карнавалом',
      pronunciation: 'брэзил из фэймэс фор итс карнивэл',
      transcription: '/brəˈzɪl ɪz ˈfeɪməs fər ɪts ˈkɑːrnɪvl/',
      example: 'Millions attend each year. Brazil is famous for its carnival.',
      notes: 'Традиции',
      imageUrl: 'https://source.unsplash.com/400x300/?brazil,carnival',
      videoUrl: 'https://youglish.com/pronounce/Brazil%20carnival/english/us'),
  BuiltInCard(
      front: 'I come from a small town',
      back: 'Я из маленького города',
      pronunciation: 'ай кам фром э смол таун',
      transcription: '/aɪ kʌm frɒm ə smɔːl taʊn/',
      example: 'Not many people know it. I come from a small town.',
      notes: 'Происхождение',
      imageUrl: 'https://source.unsplash.com/400x300/?smalltown,village',
      videoUrl:
          'https://youglish.com/pronounce/come%20from%20a%20small%20town/english/us'),
  BuiltInCard(
      front: 'Spain has a warm Mediterranean climate',
      back: 'В Испании тёплый средиземноморский климат',
      pronunciation: 'спэйн хэз э уорм мэдитэрэйниэн клаймэт',
      transcription: '/speɪn hæz ə wɔːrm ˌmedɪtəˈreɪniən ˈklaɪmɪt/',
      example: 'Perfect for holidays. Spain has a warm Mediterranean climate.',
      notes: 'Климат',
      imageUrl: 'https://source.unsplash.com/400x300/?spain,beach',
      videoUrl:
          'https://youglish.com/pronounce/Mediterranean%20climate/english/us'),
  BuiltInCard(
      front: 'The Amazon river is in South America',
      back: 'Река Амазонка находится в Южной Америке',
      pronunciation: 'дэ амэзон ривэр из ин саут эмэрикэ',
      transcription: '/ðə ˈæməzɒn ˈrɪvər ɪz ɪn saʊθ əˈmerɪkə/',
      example: 'It is the largest river. The Amazon river is in South America.',
      notes: 'География',
      imageUrl: 'https://source.unsplash.com/400x300/?amazon,river',
      videoUrl: 'https://youglish.com/pronounce/Amazon%20river/english/us'),
  BuiltInCard(
      front: 'Germany is known for its engineering',
      back: 'Германия известна своей инженерией',
      pronunciation: 'джэрмэни из ноун фор итс энджиниэринг',
      transcription: '/ˈdʒɜːrməni ɪz noʊn fər ɪts ˌendʒɪˈnɪərɪŋ/',
      example: 'BMW, Mercedes, Porsche. Germany is known for its engineering.',
      notes: 'Индустрия',
      imageUrl: 'https://source.unsplash.com/400x300/?germany,engineering',
      videoUrl:
          'https://youglish.com/pronounce/Germany%20engineering/english/us'),
  BuiltInCard(
      front: 'Canada is bilingual',
      back: 'Канада двуязычная страна',
      pronunciation: 'кэнэдэ из байлингуэл',
      transcription: '/ˈkænədə ɪz baɪˈlɪŋɡwəl/',
      example: 'English and French are both official. Canada is bilingual.',
      notes: 'Языки',
      imageUrl: 'https://source.unsplash.com/400x300/?canada,maple',
      videoUrl: 'https://youglish.com/pronounce/Canada%20bilingual/english/us'),
  BuiltInCard(
      front: 'Egypt is home to the pyramids',
      back: 'В Египте находятся пирамиды',
      pronunciation: 'иджипт из хоум ту дэ пирэмидз',
      transcription: '/ˈiːdʒɪpt ɪz hoʊm tə ðə ˈpɪrəmɪdz/',
      example: 'One of the seven wonders. Egypt is home to the pyramids.',
      notes: 'Достопримечательности',
      imageUrl: 'https://source.unsplash.com/400x300/?egypt,pyramids',
      videoUrl: 'https://youglish.com/pronounce/Egypt%20pyramids/english/us'),
  BuiltInCard(
      front: 'India has a rich cultural heritage',
      back: 'Индия обладает богатым культурным наследием',
      pronunciation: 'индиэ хэз э рич калчэрэл хэритидж',
      transcription: '/ˈɪndiə hæz ə rɪtʃ ˈkʌltʃərəl ˈherɪtɪdʒ/',
      example: 'From yoga to Bollywood. India has a rich cultural heritage.',
      notes: 'Культура',
      imageUrl: 'https://source.unsplash.com/400x300/?india,culture',
      videoUrl:
          'https://youglish.com/pronounce/cultural%20heritage/english/us'),
  BuiltInCard(
      front: 'Scandinavia is known for its high quality of life',
      back: 'Скандинавия известна высоким качеством жизни',
      pronunciation: 'скэндинэйвиэ из ноун фор итс хай куолити эв лайф',
      transcription: '/ˌskændɪˈneɪviə ɪz noʊn fər ɪts haɪ ˈkwɒlɪti əv laɪf/',
      example:
          'Happy people, great welfare. Scandinavia is known for its high quality of life.',
      notes: 'Рейтинги',
      imageUrl: 'https://source.unsplash.com/400x300/?scandinavia,nordic',
      videoUrl:
          'https://youglish.com/pronounce/Scandinavia%20quality%20of%20life/english/us'),
  BuiltInCard(
      front: 'I live in the suburbs',
      back: 'Я живу в пригороде',
      pronunciation: 'ай лив ин дэ сабэрбз',
      transcription: '/aɪ lɪv ɪn ðə ˈsʌbɜːrbz/',
      example: 'It is quieter than the city centre. I live in the suburbs.',
      notes: 'Место жительства',
      imageUrl: 'https://source.unsplash.com/400x300/?suburb,house',
      videoUrl:
          'https://youglish.com/pronounce/live%20in%20the%20suburbs/english/us'),
  BuiltInCard(
      front: 'The city centre is very busy',
      back: 'Центр города очень оживлённый',
      pronunciation: 'дэ сити сэнтэр из вэри бизи',
      transcription: '/ðə ˈsɪti ˈsentər ɪz ˈveri ˈbɪzi/',
      example: 'Avoid rush hour. The city centre is very busy at that time.',
      notes: 'Городская жизнь',
      imageUrl: 'https://source.unsplash.com/400x300/?city,busy',
      videoUrl:
          'https://youglish.com/pronounce/city%20centre%20busy/english/us'),
  BuiltInCard(
      front: 'Greece is famous for its ancient history',
      back: 'Греция знаменита своей древней историей',
      pronunciation: 'грис из фэймэс фор итс эйншэнт хистори',
      transcription: '/ɡriːs ɪz ˈfeɪməs fər ɪts ˈeɪnʃənt ˈhɪstri/',
      example:
          'Athens, Sparta, Olympics. Greece is famous for its ancient history.',
      notes: 'История',
      imageUrl: 'https://source.unsplash.com/400x300/?greece,athens',
      videoUrl:
          'https://youglish.com/pronounce/Greece%20ancient%20history/english/us'),
  BuiltInCard(
      front: 'I would love to live abroad',
      back: 'Я бы с удовольствием пожил за границей',
      pronunciation: 'ай вуд лав ту лив эброд',
      transcription: '/aɪ wʊd lʌv tə lɪv əˈbrɔːd/',
      example:
          'Experience a new culture. I would love to live abroad for a year.',
      notes: 'Мечты',
      imageUrl: 'https://source.unsplash.com/400x300/?abroad,expat',
      videoUrl: 'https://youglish.com/pronounce/live%20abroad/english/us'),
]);

const _ukSet08 = BuiltInSet(name: 'Cities & Countries', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'What is the capital of France?',
      back: 'Яка столиця Франції?',
      pronunciation: 'уот из дэ капитэл эв франс',
      transcription: '/wɒt ɪz ðə ˈkæpɪtl əv fræns/',
      example: 'Do you know your geography? What is the capital of France?',
      notes: 'Географія',
      imageUrl: 'https://source.unsplash.com/400x300/?paris,eiffel',
      videoUrl:
          'https://youglish.com/pronounce/capital%20of%20France/english/us'),
  BuiltInCard(
      front: 'London is a multicultural city',
      back: 'Лондон — мультикультурне місто',
      pronunciation: 'ландэн из э малтикалчэрэл сити',
      transcription: '/ˈlʌndən ɪz ə ˌmʌltiˈkʌltʃərəl ˈsɪti/',
      example:
          'You can hear every language there. London is a multicultural city.',
      notes: 'Опис міста',
      imageUrl: 'https://source.unsplash.com/400x300/?london,city',
      videoUrl:
          'https://youglish.com/pronounce/multicultural%20city/english/us'),
  BuiltInCard(
      front: 'I have always wanted to visit Japan',
      back: 'Я завжди хотів відвідати Японію',
      pronunciation: 'ай хэв олуэйз уонтид ту визит джэпэн',
      transcription: '/aɪ hæv ˈɔːlweɪz ˈwɒntɪd tə ˈvɪzɪt dʒəˈpæn/',
      example: 'The culture is so unique. I have always wanted to visit Japan.',
      notes: 'Мрії',
      imageUrl: 'https://source.unsplash.com/400x300/?japan,tokyo',
      videoUrl: 'https://youglish.com/pronounce/visit%20Japan/english/us'),
  BuiltInCard(
      front: 'The population of China is huge',
      back: 'Населення Китаю величезне',
      pronunciation: 'дэ попюлэйшэн эв чайнэ из хьюдж',
      transcription: '/ðə ˌpɒpjʊˈleɪʃən əv ˈtʃaɪnə ɪz hjuːdʒ/',
      example: 'Over a billion people. The population of China is huge.',
      notes: 'Факт',
      imageUrl: 'https://source.unsplash.com/400x300/?china,beijing',
      videoUrl:
          'https://youglish.com/pronounce/population%20of%20China/english/us'),
  BuiltInCard(
      front: 'New York is known as the Big Apple',
      back: "Нью-Йорк відомий як Велике Яблуко",
      pronunciation: 'ню йорк из ноун эз дэ биг эпэл',
      transcription: '/njuː jɔːrk ɪz noʊn æz ðə bɪɡ ˈæpl/',
      example:
          'Every tourist wants to go there. New York is known as the Big Apple.',
      notes: 'Прізвисько',
      imageUrl: 'https://source.unsplash.com/400x300/?newyork,manhattan',
      videoUrl:
          'https://youglish.com/pronounce/New%20York%20Big%20Apple/english/us'),
  BuiltInCard(
      front: 'Australia is in the Southern Hemisphere',
      back: 'Австралія знаходиться в Південній півкулі',
      pronunciation: 'острэйлиэ из ин дэ садэрн хэмисфир',
      transcription: '/ɒˈstreɪliə ɪz ɪn ðə ˈsʌðərn ˈhemɪsfɪr/',
      example:
          'Christmas is in summer there. Australia is in the Southern Hemisphere.',
      notes: 'Географія',
      imageUrl: 'https://source.unsplash.com/400x300/?australia,sydney',
      videoUrl:
          'https://youglish.com/pronounce/Southern%20Hemisphere/english/us'),
  BuiltInCard(
      front: 'Rome was not built in a day',
      back: 'Рим не за один день будувався',
      pronunciation: 'роум уоз нот билт ин э дэй',
      transcription: '/roʊm wɒz nɒt bɪlt ɪn ə deɪ/',
      example: 'Be patient with your progress. Rome was not built in a day.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?rome,colosseum',
      videoUrl:
          'https://youglish.com/pronounce/Rome%20was%20not%20built%20in%20a%20day/english/us'),
  BuiltInCard(
      front: 'Brazil is famous for its carnival',
      back: 'Бразилія відома своїм карнавалом',
      pronunciation: 'брэзил из фэймэс фор итс карнивэл',
      transcription: '/brəˈzɪl ɪz ˈfeɪməs fər ɪts ˈkɑːrnɪvl/',
      example: 'Millions attend each year. Brazil is famous for its carnival.',
      notes: 'Традиції',
      imageUrl: 'https://source.unsplash.com/400x300/?brazil,carnival',
      videoUrl: 'https://youglish.com/pronounce/Brazil%20carnival/english/us'),
  BuiltInCard(
      front: 'I come from a small town',
      back: 'Я з маленького міста',
      pronunciation: 'ай кам фром э смол таун',
      transcription: '/aɪ kʌm frɒm ə smɔːl taʊn/',
      example: 'Not many people know it. I come from a small town.',
      notes: 'Походження',
      imageUrl: 'https://source.unsplash.com/400x300/?smalltown,village',
      videoUrl:
          'https://youglish.com/pronounce/come%20from%20a%20small%20town/english/us'),
  BuiltInCard(
      front: 'Spain has a warm Mediterranean climate',
      back: 'В Іспанії теплий середземноморський клімат',
      pronunciation: 'спэйн хэз э уорм мэдитэрэйниэн клаймэт',
      transcription: '/speɪn hæz ə wɔːrm ˌmedɪtəˈreɪniən ˈklaɪmɪt/',
      example: 'Perfect for holidays. Spain has a warm Mediterranean climate.',
      notes: 'Клімат',
      imageUrl: 'https://source.unsplash.com/400x300/?spain,beach',
      videoUrl:
          'https://youglish.com/pronounce/Mediterranean%20climate/english/us'),
  BuiltInCard(
      front: 'The Amazon river is in South America',
      back: 'Річка Амазонка знаходиться в Південній Америці',
      pronunciation: 'дэ амэзон ривэр из ин саут эмэрикэ',
      transcription: '/ðə ˈæməzɒn ˈrɪvər ɪz ɪn saʊθ əˈmerɪkə/',
      example: 'It is the largest river. The Amazon river is in South America.',
      notes: 'Географія',
      imageUrl: 'https://source.unsplash.com/400x300/?amazon,river',
      videoUrl: 'https://youglish.com/pronounce/Amazon%20river/english/us'),
  BuiltInCard(
      front: 'Germany is known for its engineering',
      back: 'Німеччина відома своєю інженерією',
      pronunciation: 'джэрмэни из ноун фор итс энджиниэринг',
      transcription: '/ˈdʒɜːrməni ɪz noʊn fər ɪts ˌendʒɪˈnɪərɪŋ/',
      example: 'BMW, Mercedes, Porsche. Germany is known for its engineering.',
      notes: 'Промисловість',
      imageUrl: 'https://source.unsplash.com/400x300/?germany,engineering',
      videoUrl:
          'https://youglish.com/pronounce/Germany%20engineering/english/us'),
  BuiltInCard(
      front: 'Canada is bilingual',
      back: 'Канада двомовна країна',
      pronunciation: 'кэнэдэ из байлингуэл',
      transcription: '/ˈkænədə ɪz baɪˈlɪŋɡwəl/',
      example: 'English and French are both official. Canada is bilingual.',
      notes: 'Мови',
      imageUrl: 'https://source.unsplash.com/400x300/?canada,maple',
      videoUrl: 'https://youglish.com/pronounce/Canada%20bilingual/english/us'),
  BuiltInCard(
      front: 'Egypt is home to the pyramids',
      back: 'В Єгипті знаходяться піраміди',
      pronunciation: 'иджипт из хоум ту дэ пирэмидз',
      transcription: '/ˈiːdʒɪpt ɪz hoʊm tə ðə ˈpɪrəmɪdz/',
      example: 'One of the seven wonders. Egypt is home to the pyramids.',
      notes: 'Пам\'ятки',
      imageUrl: 'https://source.unsplash.com/400x300/?egypt,pyramids',
      videoUrl: 'https://youglish.com/pronounce/Egypt%20pyramids/english/us'),
  BuiltInCard(
      front: 'India has a rich cultural heritage',
      back: 'Індія має багату культурну спадщину',
      pronunciation: 'индиэ хэз э рич калчэрэл хэритидж',
      transcription: '/ˈɪndiə hæz ə rɪtʃ ˈkʌltʃərəl ˈherɪtɪdʒ/',
      example: 'From yoga to Bollywood. India has a rich cultural heritage.',
      notes: 'Культура',
      imageUrl: 'https://source.unsplash.com/400x300/?india,culture',
      videoUrl:
          'https://youglish.com/pronounce/cultural%20heritage/english/us'),
  BuiltInCard(
      front: 'Scandinavia is known for its high quality of life',
      back: 'Скандинавія відома високою якістю життя',
      pronunciation: 'скэндинэйвиэ из ноун фор итс хай куолити эв лайф',
      transcription: '/ˌskændɪˈneɪviə ɪz noʊn fər ɪts haɪ ˈkwɒlɪti əv laɪf/',
      example:
          'Happy people, great welfare. Scandinavia is known for its high quality of life.',
      notes: 'Рейтинги',
      imageUrl: 'https://source.unsplash.com/400x300/?scandinavia,nordic',
      videoUrl:
          'https://youglish.com/pronounce/Scandinavia%20quality%20of%20life/english/us'),
  BuiltInCard(
      front: 'I live in the suburbs',
      back: 'Я живу в передмісті',
      pronunciation: 'ай лив ин дэ сабэрбз',
      transcription: '/aɪ lɪv ɪn ðə ˈsʌbɜːrbz/',
      example: 'It is quieter than the city centre. I live in the suburbs.',
      notes: 'Місце проживання',
      imageUrl: 'https://source.unsplash.com/400x300/?suburb,house',
      videoUrl:
          'https://youglish.com/pronounce/live%20in%20the%20suburbs/english/us'),
  BuiltInCard(
      front: 'The city centre is very busy',
      back: 'Центр міста дуже жвавий',
      pronunciation: 'дэ сити сэнтэр из вэри бизи',
      transcription: '/ðə ˈsɪti ˈsentər ɪz ˈveri ˈbɪzi/',
      example: 'Avoid rush hour. The city centre is very busy at that time.',
      notes: 'Міське життя',
      imageUrl: 'https://source.unsplash.com/400x300/?city,busy',
      videoUrl:
          'https://youglish.com/pronounce/city%20centre%20busy/english/us'),
  BuiltInCard(
      front: 'Greece is famous for its ancient history',
      back: 'Греція відома своєю стародавньою історією',
      pronunciation: 'грис из фэймэс фор итс эйншэнт хистори',
      transcription: '/ɡriːs ɪz ˈfeɪməs fər ɪts ˈeɪnʃənt ˈhɪstri/',
      example:
          'Athens, Sparta, Olympics. Greece is famous for its ancient history.',
      notes: 'Історія',
      imageUrl: 'https://source.unsplash.com/400x300/?greece,athens',
      videoUrl:
          'https://youglish.com/pronounce/Greece%20ancient%20history/english/us'),
  BuiltInCard(
      front: 'I would love to live abroad',
      back: 'Я б із задоволенням пожив за кордоном',
      pronunciation: 'ай вуд лав ту лив эброд',
      transcription: '/aɪ wʊd lʌv tə lɪv əˈbrɔːd/',
      example:
          'Experience a new culture. I would love to live abroad for a year.',
      notes: 'Мрії',
      imageUrl: 'https://source.unsplash.com/400x300/?abroad,expat',
      videoUrl: 'https://youglish.com/pronounce/live%20abroad/english/us'),
]);

// ============================================================
// 09 — Holidays & Traditions
// ============================================================

const _ruSet09 =
    BuiltInSet(name: 'Holidays & Traditions', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'Happy New Year!',
      back: 'С Новым годом!',
      pronunciation: 'хэпи ню йир',
      transcription: '/ˈhæpi njuː jɪr/',
      example: 'The clock struck midnight. Happy New Year everyone!',
      notes: 'Праздник',
      imageUrl: 'https://source.unsplash.com/400x300/?newyear,fireworks',
      videoUrl: 'https://youglish.com/pronounce/Happy%20New%20Year/english/us'),
  BuiltInCard(
      front: 'Merry Christmas!',
      back: 'Счастливого Рождества!',
      pronunciation: 'мэри крисмэс',
      transcription: '/ˈmeri ˈkrɪsməs/',
      example: 'We opened all the presents. Merry Christmas everyone!',
      notes: 'Праздник',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,tree',
      videoUrl: 'https://youglish.com/pronounce/Merry%20Christmas/english/us'),
  BuiltInCard(
      front: 'We decorate the Christmas tree',
      back: 'Мы украшаем ёлку',
      pronunciation: 'уи дэкорэйт дэ крисмэс три',
      transcription: '/wiː ˈdekəreɪt ðə ˈkrɪsməs triː/',
      example: 'Every year on Christmas Eve we decorate the Christmas tree.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,decorate',
      videoUrl:
          'https://youglish.com/pronounce/decorate%20Christmas%20tree/english/us'),
  BuiltInCard(
      front: 'We have a big family dinner',
      back: 'У нас большой семейный ужин',
      pronunciation: 'уи хэв э биг фэмили динэр',
      transcription: '/wiː hæv ə bɪɡ ˈfæmɪli ˈdɪnər/',
      example: 'Every Thanksgiving we have a big family dinner.',
      notes: 'Семья',
      imageUrl: 'https://source.unsplash.com/400x300/?family,dinner',
      videoUrl: 'https://youglish.com/pronounce/family%20dinner/english/us'),
  BuiltInCard(
      front: 'Trick or treat!',
      back: 'Сладость или гадость!',
      pronunciation: 'трик ор трит',
      transcription: '/trɪk ɔːr triːt/',
      example: 'The kids knocked on our door. Trick or treat!',
      notes: 'Хэллоуин',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,candy',
      videoUrl: 'https://youglish.com/pronounce/trick%20or%20treat/english/us'),
  BuiltInCard(
      front: 'We exchange gifts on Christmas Day',
      back: 'Мы обмениваемся подарками на Рождество',
      pronunciation: 'уи иксчэйндж гифтс он крисмэс дэй',
      transcription: '/wiː ɪksˈtʃeɪndʒ ɡɪfts ɒn ˈkrɪsməs deɪ/',
      example:
          'It is our family tradition. We exchange gifts on Christmas Day.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?gifts,christmas',
      videoUrl: 'https://youglish.com/pronounce/exchange%20gifts/english/us'),
  BuiltInCard(
      front: 'Easter is a religious holiday',
      back: 'Пасха — религиозный праздник',
      pronunciation: 'истэр из э рилиджэс холидэй',
      transcription: '/ˈiːstər ɪz ə rɪˈlɪdʒəs ˈhɒlɪdeɪ/',
      example: 'Many families go to church. Easter is a religious holiday.',
      notes: 'Религия',
      imageUrl: 'https://source.unsplash.com/400x300/?easter,church',
      videoUrl:
          'https://youglish.com/pronounce/Easter%20religious%20holiday/english/us'),
  BuiltInCard(
      front: 'We watch fireworks on New Year',
      back: 'Мы смотрим фейерверки на Новый год',
      pronunciation: 'уи уотч файрвэркс он ню йир',
      transcription: '/wiː wɒtʃ ˈfaɪərwɜːrks ɒn njuː jɪr/',
      example: 'We always go to the park. We watch fireworks on New Year.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?fireworks,night',
      videoUrl: 'https://youglish.com/pronounce/watch%20fireworks/english/us'),
  BuiltInCard(
      front: 'Valentine\'s Day is on February 14th',
      back: 'День Святого Валентина — 14 февраля',
      pronunciation: 'вэлэнтайнз дэй из он фэбрюэри фортинс',
      transcription: '/ˈvæləntaɪnz deɪ ɪz ɒn ˈfebruəri ˈfɔːrtiːnθ/',
      example:
          'Send a card to someone you love. Valentine\'s Day is on February 14th.',
      notes: 'Праздник',
      imageUrl: 'https://source.unsplash.com/400x300/?valentines,hearts',
      videoUrl: 'https://youglish.com/pronounce/Valentine\'s%20Day/english/us'),
  BuiltInCard(
      front: 'We go trick-or-treating',
      back: 'Мы ходим за угощениями на Хэллоуин',
      pronunciation: 'уи гоу трик-ор-тритинг',
      transcription: '/wiː ɡoʊ ˌtrɪk ɔːr ˈtriːtɪŋ/',
      example:
          'The kids dress up in costumes. We go trick-or-treating every Halloween.',
      notes: 'Хэллоуин',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,costume',
      videoUrl: 'https://youglish.com/pronounce/trick-or-treating/english/us'),
  BuiltInCard(
      front: 'Thanksgiving is a harvest festival',
      back: 'День благодарения — праздник урожая',
      pronunciation: 'сэнксгивинг из э харвэст фэстивэл',
      transcription: '/ˈθæŋksˌɡɪvɪŋ ɪz ə ˈhɑːrvɪst ˈfestɪvl/',
      example: 'Turkey and pumpkin pie. Thanksgiving is a harvest festival.',
      notes: 'История',
      imageUrl: 'https://source.unsplash.com/400x300/?thanksgiving,turkey',
      videoUrl:
          'https://youglish.com/pronounce/Thanksgiving%20harvest/english/us'),
  BuiltInCard(
      front: 'We sing carols at Christmas',
      back: 'Мы поём рождественские гимны',
      pronunciation: 'уи синг кэролз эт крисмэс',
      transcription: '/wiː sɪŋ ˈkærəlz æt ˈkrɪsməs/',
      example: 'The children go door to door. We sing carols at Christmas.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?carols,singing',
      videoUrl: 'https://youglish.com/pronounce/sing%20carols/english/us'),
  BuiltInCard(
      front: 'There is a bank holiday on Monday',
      back: 'В понедельник государственный выходной',
      pronunciation: 'дэр из э бэнк холидэй он мандэй',
      transcription: '/ðɛr ɪz ə bæŋk ˈhɒlɪdeɪ ɒn ˈmʌndeɪ/',
      example: 'No work this Monday. There is a bank holiday on Monday.',
      notes: 'Выходной',
      imageUrl: 'https://source.unsplash.com/400x300/?holiday,calendar',
      videoUrl: 'https://youglish.com/pronounce/bank%20holiday/english/us'),
  BuiltInCard(
      front: 'Diwali is the festival of lights',
      back: 'Дивали — праздник огней',
      pronunciation: 'дивали из дэ фэстивэл эв лайтс',
      transcription: '/dɪˈwɑːli ɪz ðə ˈfestɪvl əv laɪts/',
      example:
          'It is celebrated by Hindus worldwide. Diwali is the festival of lights.',
      notes: 'Мировые праздники',
      imageUrl: 'https://source.unsplash.com/400x300/?diwali,lights',
      videoUrl: 'https://youglish.com/pronounce/Diwali%20festival/english/us'),
  BuiltInCard(
      front: 'We have a barbecue on Independence Day',
      back: 'На День независимости мы устраиваем барбекю',
      pronunciation: 'уи хэв э барбикью он индипэндэнс дэй',
      transcription: '/wiː hæv ə ˈbɑːrbɪkjuː ɒn ˌɪndɪˈpendəns deɪ/',
      example: 'An American tradition. We have a barbecue on Independence Day.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?bbq,4thjuly',
      videoUrl:
          'https://youglish.com/pronounce/barbecue%20Independence%20Day/english/us'),
  BuiltInCard(
      front: 'Hanukkah lasts eight days',
      back: 'Ханука длится восемь дней',
      pronunciation: 'ханэкэ ластс эйт дэйз',
      transcription: '/ˈhɑːnəkə lɑːsts eɪt deɪz/',
      example: 'Candles are lit each night. Hanukkah lasts eight days.',
      notes: 'Мировые праздники',
      imageUrl: 'https://source.unsplash.com/400x300/?hanukkah,menorah',
      videoUrl:
          'https://youglish.com/pronounce/Hanukkah%20eight%20days/english/us'),
  BuiltInCard(
      front: 'We wear costumes on Halloween',
      back: 'На Хэллоуин мы надеваем костюмы',
      pronunciation: 'уи уэр костюмз он хэлоуин',
      transcription: '/wiː wɛr kɒsˈtjuːmz ɒn ˈhæloʊiːn/',
      example: 'I dressed as a vampire. We wear costumes on Halloween.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,costume',
      videoUrl:
          'https://youglish.com/pronounce/costumes%20Halloween/english/us'),
  BuiltInCard(
      front: 'Mother\'s Day is in May',
      back: 'День матери в мае',
      pronunciation: 'мазэрз дэй из ин мэй',
      transcription: "/ˈmʌðərz deɪ ɪz ɪn meɪ/",
      example:
          'Buy flowers for your mum. Mother\'s Day is in May in many countries.',
      notes: 'Праздник',
      imageUrl: 'https://source.unsplash.com/400x300/?mothers,flowers',
      videoUrl: 'https://youglish.com/pronounce/Mother\'s%20Day/english/us'),
  BuiltInCard(
      front: 'We toast to the New Year',
      back: 'Мы поднимаем тост за Новый год',
      pronunciation: 'уи тоуст ту дэ ню йир',
      transcription: '/wiː toʊst tə ðə njuː jɪr/',
      example: 'Glasses raised at midnight. We toast to the New Year.',
      notes: 'Традиция',
      imageUrl: 'https://source.unsplash.com/400x300/?toast,champagne',
      videoUrl: 'https://youglish.com/pronounce/toast%20New%20Year/english/us'),
  BuiltInCard(
      front: 'The carnival parade goes through the streets',
      back: 'Карнавальное шествие идёт по улицам',
      pronunciation: 'дэ карнивэл пэрэйд гоуз сру дэ стритс',
      transcription: '/ðə ˈkɑːrnɪvl pəˈreɪd ɡoʊz θruː ðə striːts/',
      example:
          'Thousands of spectators watch. The carnival parade goes through the streets.',
      notes: 'Событие',
      imageUrl: 'https://source.unsplash.com/400x300/?carnival,parade',
      videoUrl: 'https://youglish.com/pronounce/carnival%20parade/english/us'),
]);

const _ukSet09 =
    BuiltInSet(name: 'Holidays & Traditions', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'Happy New Year!',
      back: 'З Новим роком!',
      pronunciation: 'хэпи ню йир',
      transcription: '/ˈhæpi njuː jɪr/',
      example: 'The clock struck midnight. Happy New Year everyone!',
      notes: 'Свято',
      imageUrl: 'https://source.unsplash.com/400x300/?newyear,fireworks',
      videoUrl: 'https://youglish.com/pronounce/Happy%20New%20Year/english/us'),
  BuiltInCard(
      front: 'Merry Christmas!',
      back: 'Веселого Різдва!',
      pronunciation: 'мэри крисмэс',
      transcription: '/ˈmeri ˈkrɪsməs/',
      example: 'We opened all the presents. Merry Christmas everyone!',
      notes: 'Свято',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,tree',
      videoUrl: 'https://youglish.com/pronounce/Merry%20Christmas/english/us'),
  BuiltInCard(
      front: 'We decorate the Christmas tree',
      back: 'Ми прикрашаємо ялинку',
      pronunciation: 'уи дэкорэйт дэ крисмэс три',
      transcription: '/wiː ˈdekəreɪt ðə ˈkrɪsməs triː/',
      example: 'Every year on Christmas Eve we decorate the Christmas tree.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?christmas,decorate',
      videoUrl:
          'https://youglish.com/pronounce/decorate%20Christmas%20tree/english/us'),
  BuiltInCard(
      front: 'We have a big family dinner',
      back: 'У нас великий сімейний обід',
      pronunciation: 'уи хэв э биг фэмили динэр',
      transcription: '/wiː hæv ə bɪɡ ˈfæmɪli ˈdɪnər/',
      example: 'Every Thanksgiving we have a big family dinner.',
      notes: "Сім'я",
      imageUrl: 'https://source.unsplash.com/400x300/?family,dinner',
      videoUrl: 'https://youglish.com/pronounce/family%20dinner/english/us'),
  BuiltInCard(
      front: 'Trick or treat!',
      back: 'Частування або витівка!',
      pronunciation: 'трик ор трит',
      transcription: '/trɪk ɔːr triːt/',
      example: 'The kids knocked on our door. Trick or treat!',
      notes: 'Геловін',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,candy',
      videoUrl: 'https://youglish.com/pronounce/trick%20or%20treat/english/us'),
  BuiltInCard(
      front: 'We exchange gifts on Christmas Day',
      back: 'Ми обмінюємося подарунками на Різдво',
      pronunciation: 'уи иксчэйндж гифтс он крисмэс дэй',
      transcription: '/wiː ɪksˈtʃeɪndʒ ɡɪfts ɒn ˈkrɪsməs deɪ/',
      example:
          'It is our family tradition. We exchange gifts on Christmas Day.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?gifts,christmas',
      videoUrl: 'https://youglish.com/pronounce/exchange%20gifts/english/us'),
  BuiltInCard(
      front: 'Easter is a religious holiday',
      back: 'Великдень — релігійне свято',
      pronunciation: 'истэр из э рилиджэс холидэй',
      transcription: '/ˈiːstər ɪz ə rɪˈlɪdʒəs ˈhɒlɪdeɪ/',
      example: 'Many families go to church. Easter is a religious holiday.',
      notes: 'Релігія',
      imageUrl: 'https://source.unsplash.com/400x300/?easter,church',
      videoUrl:
          'https://youglish.com/pronounce/Easter%20religious%20holiday/english/us'),
  BuiltInCard(
      front: 'We watch fireworks on New Year',
      back: 'Ми дивимося феєрверки на Новий рік',
      pronunciation: 'уи уотч файрвэркс он ню йир',
      transcription: '/wiː wɒtʃ ˈfaɪərwɜːrks ɒn njuː jɪr/',
      example: 'We always go to the park. We watch fireworks on New Year.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?fireworks,night',
      videoUrl: 'https://youglish.com/pronounce/watch%20fireworks/english/us'),
  BuiltInCard(
      front: "Valentine's Day is on February 14th",
      back: 'День святого Валентина — 14 лютого',
      pronunciation: 'вэлэнтайнз дэй из он фэбрюэри фортинс',
      transcription: '/ˈvæləntaɪnz deɪ ɪz ɒn ˈfebruəri ˈfɔːrtiːnθ/',
      example:
          "Send a card to someone you love. Valentine's Day is on February 14th.",
      notes: 'Свято',
      imageUrl: 'https://source.unsplash.com/400x300/?valentines,hearts',
      videoUrl:
          'https://youglish.com/pronounce/Valentine%27s%20Day/english/us'),
  BuiltInCard(
      front: 'We go trick-or-treating',
      back: 'Ми ходимо за ласощами на Геловін',
      pronunciation: 'уи гоу трик-ор-тритинг',
      transcription: '/wiː ɡoʊ ˌtrɪk ɔːr ˈtriːtɪŋ/',
      example:
          'The kids dress up in costumes. We go trick-or-treating every Halloween.',
      notes: 'Геловін',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,costume',
      videoUrl: 'https://youglish.com/pronounce/trick-or-treating/english/us'),
  BuiltInCard(
      front: 'Thanksgiving is a harvest festival',
      back: 'День подяки — свято врожаю',
      pronunciation: 'сэнксгивинг из э харвэст фэстивэл',
      transcription: '/ˈθæŋksˌɡɪvɪŋ ɪz ə ˈhɑːrvɪst ˈfestɪvl/',
      example: 'Turkey and pumpkin pie. Thanksgiving is a harvest festival.',
      notes: 'Історія',
      imageUrl: 'https://source.unsplash.com/400x300/?thanksgiving,turkey',
      videoUrl:
          'https://youglish.com/pronounce/Thanksgiving%20harvest/english/us'),
  BuiltInCard(
      front: 'We sing carols at Christmas',
      back: 'Ми співаємо колядки на Різдво',
      pronunciation: 'уи синг кэролз эт крисмэс',
      transcription: '/wiː sɪŋ ˈkærəlz æt ˈkrɪsməs/',
      example: 'The children go door to door. We sing carols at Christmas.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?carols,singing',
      videoUrl: 'https://youglish.com/pronounce/sing%20carols/english/us'),
  BuiltInCard(
      front: 'There is a bank holiday on Monday',
      back: 'У понеділок державне свято',
      pronunciation: 'дэр из э бэнк холидэй он мандэй',
      transcription: '/ðɛr ɪz ə bæŋk ˈhɒlɪdeɪ ɒn ˈmʌndeɪ/',
      example: 'No work this Monday. There is a bank holiday on Monday.',
      notes: 'Вихідний',
      imageUrl: 'https://source.unsplash.com/400x300/?holiday,calendar',
      videoUrl: 'https://youglish.com/pronounce/bank%20holiday/english/us'),
  BuiltInCard(
      front: 'Diwali is the festival of lights',
      back: 'Дівалі — свято вогнів',
      pronunciation: 'дивали из дэ фэстивэл эв лайтс',
      transcription: '/dɪˈwɑːli ɪz ðə ˈfestɪvl əv laɪts/',
      example:
          'It is celebrated by Hindus worldwide. Diwali is the festival of lights.',
      notes: 'Світові свята',
      imageUrl: 'https://source.unsplash.com/400x300/?diwali,lights',
      videoUrl: 'https://youglish.com/pronounce/Diwali%20festival/english/us'),
  BuiltInCard(
      front: 'We have a barbecue on Independence Day',
      back: 'На День незалежності ми влаштовуємо барбекю',
      pronunciation: 'уи хэв э барбикью он индипэндэнс дэй',
      transcription: '/wiː hæv ə ˈbɑːrbɪkjuː ɒn ˌɪndɪˈpendəns deɪ/',
      example: 'An American tradition. We have a barbecue on Independence Day.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?bbq,4thjuly',
      videoUrl:
          'https://youglish.com/pronounce/barbecue%20Independence%20Day/english/us'),
  BuiltInCard(
      front: 'Hanukkah lasts eight days',
      back: 'Ханука триває вісім днів',
      pronunciation: 'ханэкэ ластс эйт дэйз',
      transcription: '/ˈhɑːnəkə lɑːsts eɪt deɪz/',
      example: 'Candles are lit each night. Hanukkah lasts eight days.',
      notes: 'Світові свята',
      imageUrl: 'https://source.unsplash.com/400x300/?hanukkah,menorah',
      videoUrl:
          'https://youglish.com/pronounce/Hanukkah%20eight%20days/english/us'),
  BuiltInCard(
      front: 'We wear costumes on Halloween',
      back: 'На Геловін ми одягаємо костюми',
      pronunciation: 'уи уэр костюмз он хэлоуин',
      transcription: '/wiː wɛr kɒsˈtjuːmz ɒn ˈhæloʊiːn/',
      example: 'I dressed as a vampire. We wear costumes on Halloween.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?halloween,costume',
      videoUrl:
          'https://youglish.com/pronounce/costumes%20Halloween/english/us'),
  BuiltInCard(
      front: "Mother's Day is in May",
      back: 'День матері у травні',
      pronunciation: 'мазэрз дэй из ин мэй',
      transcription: "/ˈmʌðərz deɪ ɪz ɪn meɪ/",
      example:
          "Buy flowers for your mum. Mother's Day is in May in many countries.",
      notes: 'Свято',
      imageUrl: 'https://source.unsplash.com/400x300/?mothers,flowers',
      videoUrl: 'https://youglish.com/pronounce/Mother%27s%20Day/english/us'),
  BuiltInCard(
      front: 'We toast to the New Year',
      back: 'Ми піднімаємо тост за Новий рік',
      pronunciation: 'уи тоуст ту дэ ню йир',
      transcription: '/wiː toʊst tə ðə njuː jɪr/',
      example: 'Glasses raised at midnight. We toast to the New Year.',
      notes: 'Традиція',
      imageUrl: 'https://source.unsplash.com/400x300/?toast,champagne',
      videoUrl: 'https://youglish.com/pronounce/toast%20New%20Year/english/us'),
  BuiltInCard(
      front: 'The carnival parade goes through the streets',
      back: 'Карнавальна хода йде вулицями',
      pronunciation: 'дэ карнивэл пэрэйд гоуз сру дэ стритс',
      transcription: '/ðə ˈkɑːrnɪvl pəˈreɪd ɡoʊz θruː ðə striːts/',
      example:
          'Thousands of spectators watch. The carnival parade goes through the streets.',
      notes: 'Подія',
      imageUrl: 'https://source.unsplash.com/400x300/?carnival,parade',
      videoUrl: 'https://youglish.com/pronounce/carnival%20parade/english/us'),
]);

// ============================================================
// 10 — Hobbies & Interests
// ============================================================

const _ruSet10 =
    BuiltInSet(name: 'Hobbies & Interests', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'What do you do in your free time?',
      back: 'Чем вы занимаетесь в свободное время?',
      pronunciation: 'уот ду ю ду ин йор фри тайм',
      transcription: '/wɒt duː juː duː ɪn jɔːr friː taɪm/',
      example: 'Tell me about yourself. What do you do in your free time?',
      notes: 'Хобби',
      imageUrl: 'https://source.unsplash.com/400x300/?hobby,leisure',
      videoUrl: 'https://youglish.com/pronounce/free%20time/english/us'),
  BuiltInCard(
      front: 'I am into photography',
      back: 'Я увлекаюсь фотографией',
      pronunciation: 'ай эм инту фотографи',
      transcription: '/aɪ æm ˈɪntə fəˈtɒɡrəfi/',
      example: 'I take my camera everywhere. I am into photography.',
      notes: 'Хобби',
      imageUrl: 'https://source.unsplash.com/400x300/?photography,camera',
      videoUrl: 'https://youglish.com/pronounce/into%20photography/english/us'),
  BuiltInCard(
      front: 'I enjoy playing the guitar',
      back: 'Я люблю играть на гитаре',
      pronunciation: 'ай энджой плэйинг дэ гитар',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈpleɪɪŋ ðə ɡɪˈtɑːr/',
      example:
          'I have been playing for five years. I enjoy playing the guitar.',
      notes: 'Музыка',
      imageUrl: 'https://source.unsplash.com/400x300/?guitar,music',
      videoUrl:
          'https://youglish.com/pronounce/playing%20the%20guitar/english/us'),
  BuiltInCard(
      front: 'I go hiking at weekends',
      back: 'По выходным я хожу в походы',
      pronunciation: 'ай гоу хайкинг эт уикэндз',
      transcription: '/aɪ ɡoʊ ˈhaɪkɪŋ æt ˈwiːkendz/',
      example: 'I love nature. I go hiking at weekends.',
      notes: 'Активность',
      imageUrl: 'https://source.unsplash.com/400x300/?hiking,nature',
      videoUrl: 'https://youglish.com/pronounce/go%20hiking/english/us'),
  BuiltInCard(
      front: 'I collect vintage stamps',
      back: 'Я коллекционирую старинные марки',
      pronunciation: 'ай колект винтидж стэмпс',
      transcription: '/aɪ kəˈlekt ˈvɪntɪdʒ stæmps/',
      example: 'I have over five hundred. I collect vintage stamps.',
      notes: 'Коллекционирование',
      imageUrl: 'https://source.unsplash.com/400x300/?stamps,collection',
      videoUrl: 'https://youglish.com/pronounce/collect%20stamps/english/us'),
  BuiltInCard(
      front: 'I love baking at home',
      back: 'Я обожаю печь дома',
      pronunciation: 'ай лав бэйкинг эт хоум',
      transcription: '/aɪ lʌv ˈbeɪkɪŋ æt hoʊm/',
      example: 'I made sourdough bread this week. I love baking at home.',
      notes: 'Кулинария',
      imageUrl: 'https://source.unsplash.com/400x300/?baking,bread',
      videoUrl: 'https://youglish.com/pronounce/love%20baking/english/us'),
  BuiltInCard(
      front: 'I paint as a hobby',
      back: 'Я рисую как хобби',
      pronunciation: 'ай пэйнт эз э хоби',
      transcription: '/aɪ peɪnt æz ə ˈhɒbi/',
      example: 'Mostly watercolours. I paint as a hobby on weekends.',
      notes: 'Творчество',
      imageUrl: 'https://source.unsplash.com/400x300/?painting,art',
      videoUrl:
          'https://youglish.com/pronounce/paint%20as%20a%20hobby/english/us'),
  BuiltInCard(
      front: 'I am a keen gardener',
      back: 'Я заядлый садовод',
      pronunciation: 'ай эм э кин гарднэр',
      transcription: '/aɪ æm ə kiːn ˈɡɑːrdnər/',
      example: 'My garden is my pride. I am a keen gardener.',
      notes: 'Садоводство',
      imageUrl: 'https://source.unsplash.com/400x300/?garden,plants',
      videoUrl: 'https://youglish.com/pronounce/keen%20gardener/english/us'),
  BuiltInCard(
      front: 'I do yoga every morning',
      back: 'Я занимаюсь йогой каждое утро',
      pronunciation: 'ай ду йогэ эври морнинг',
      transcription: '/aɪ duː ˈjoʊɡə ˈevri ˈmɔːrnɪŋ/',
      example: 'It keeps me calm. I do yoga every morning.',
      notes: 'Здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?yoga,morning',
      videoUrl: 'https://youglish.com/pronounce/do%20yoga/english/us'),
  BuiltInCard(
      front: 'I am learning to play chess',
      back: 'Я учусь играть в шахматы',
      pronunciation: 'ай эм лёрнинг ту плэй чэс',
      transcription: '/aɪ æm ˈlɜːrnɪŋ tə pleɪ tʃes/',
      example: 'It is harder than I thought. I am learning to play chess.',
      notes: 'Логика',
      imageUrl: 'https://source.unsplash.com/400x300/?chess,board',
      videoUrl: 'https://youglish.com/pronounce/play%20chess/english/us'),
  BuiltInCard(
      front: 'I follow football avidly',
      back: 'Я страстно слежу за футболом',
      pronunciation: 'ай фолоу футбол эвидли',
      transcription: '/aɪ ˈfɒloʊ ˈfʊtbɔːl ˈævɪdli/',
      example: 'I never miss a game. I follow football avidly.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?football,fan',
      videoUrl: 'https://youglish.com/pronounce/follow%20football/english/us'),
  BuiltInCard(
      front: 'I enjoy reading crime novels',
      back: 'Я люблю читать детективы',
      pronunciation: 'ай энджой ридинг крайм новэлз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈriːdɪŋ kraɪm ˈnɒvlz/',
      example: 'Agatha Christie is my favourite. I enjoy reading crime novels.',
      notes: 'Чтение',
      imageUrl: 'https://source.unsplash.com/400x300/?crime,novel',
      videoUrl:
          'https://youglish.com/pronounce/reading%20crime%20novels/english/us'),
  BuiltInCard(
      front: 'I have taken up running recently',
      back: 'Я недавно начал бегать',
      pronunciation: 'ай хэв тэйкэн ап ранинг рисэнтли',
      transcription: '/aɪ hæv ˈteɪkən ʌp ˈrʌnɪŋ ˈriːsəntli/',
      example: 'Three times a week. I have taken up running recently.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?running,park',
      videoUrl:
          'https://youglish.com/pronounce/taken%20up%20running/english/us'),
  BuiltInCard(
      front: 'I enjoy knitting in the evenings',
      back: 'По вечерам я люблю вязать',
      pronunciation: 'ай энджой нитинг ин дэ ивнингз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈnɪtɪŋ ɪn ðə ˈiːvnɪŋz/',
      example: 'It is very relaxing. I enjoy knitting in the evenings.',
      notes: 'Хобби',
      imageUrl: 'https://source.unsplash.com/400x300/?knitting,wool',
      videoUrl: 'https://youglish.com/pronounce/enjoy%20knitting/english/us'),
  BuiltInCard(
      front: 'I am passionate about cooking',
      back: 'Я страстно увлечён кулинарией',
      pronunciation: 'ай эм пэшэнэт эбаут кукинг',
      transcription: '/aɪ æm ˈpæʃənɪt əˈbaʊt ˈkʊkɪŋ/',
      example: 'I try new recipes every week. I am passionate about cooking.',
      notes: 'Кулинария',
      imageUrl: 'https://source.unsplash.com/400x300/?cooking,chef',
      videoUrl:
          'https://youglish.com/pronounce/passionate%20about%20cooking/english/us'),
  BuiltInCard(
      front: 'I go swimming twice a week',
      back: 'Я хожу плавать дважды в неделю',
      pronunciation: 'ай гоу суиминг туайс э уик',
      transcription: '/aɪ ɡoʊ ˈswɪmɪŋ twaɪs ə wiːk/',
      example: 'It keeps me fit. I go swimming twice a week.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?swimming,pool',
      videoUrl: 'https://youglish.com/pronounce/go%20swimming/english/us'),
  BuiltInCard(
      front: 'My hobby is making jewellery',
      back: 'Моё хобби — изготовление украшений',
      pronunciation: 'май хоби из мэйкинг джуэлри',
      transcription: '/maɪ ˈhɒbi ɪz ˈmeɪkɪŋ ˈdʒuːəlri/',
      example: 'I sell them online too. My hobby is making jewellery.',
      notes: 'Творчество',
      imageUrl: 'https://source.unsplash.com/400x300/?jewellery,craft',
      videoUrl: 'https://youglish.com/pronounce/making%20jewellery/english/us'),
  BuiltInCard(
      front: 'I enjoy watching documentaries',
      back: 'Я люблю смотреть документальные фильмы',
      pronunciation: 'ай энджой уотчинг докюмэнтэриз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈwɒtʃɪŋ ˌdɒkjʊˈmentəriz/',
      example: 'Especially about nature. I enjoy watching documentaries.',
      notes: 'Кино',
      imageUrl: 'https://source.unsplash.com/400x300/?documentary,watching',
      videoUrl:
          'https://youglish.com/pronounce/watching%20documentaries/english/us'),
  BuiltInCard(
      front: 'I spend hours on my computer',
      back: 'Я часами сижу за компьютером',
      pronunciation: 'ай спэнд ауэрз он май компьютэр',
      transcription: '/aɪ spend ˈaʊərz ɒn maɪ kəmˈpjuːtər/',
      example: 'Gaming mainly. I spend hours on my computer at weekends.',
      notes: 'Технологии',
      imageUrl: 'https://source.unsplash.com/400x300/?computer,gaming',
      videoUrl:
          'https://youglish.com/pronounce/spend%20hours%20on%20computer/english/us'),
  BuiltInCard(
      front: 'I volunteer at a local shelter',
      back: 'Я волонтёрствую в местном приюте',
      pronunciation: 'ай волэнтир эт э локэл шэлтэр',
      transcription: '/aɪ ˌvɒlənˈtɪr æt ə ˈloʊkl ˈʃeltər/',
      example: 'Every Saturday morning. I volunteer at a local shelter.',
      notes: 'Волонтёрство',
      imageUrl: 'https://source.unsplash.com/400x300/?volunteer,charity',
      videoUrl:
          'https://youglish.com/pronounce/volunteer%20shelter/english/us'),
]);

const _ukSet10 =
    BuiltInSet(name: 'Hobbies & Interests', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'What do you do in your free time?',
      back: 'Чим ви займаєтеся у вільний час?',
      pronunciation: 'уот ду ю ду ин йор фри тайм',
      transcription: '/wɒt duː juː duː ɪn jɔːr friː taɪm/',
      example: 'Tell me about yourself. What do you do in your free time?',
      notes: 'Хобі',
      imageUrl: 'https://source.unsplash.com/400x300/?hobby,leisure',
      videoUrl: 'https://youglish.com/pronounce/free%20time/english/us'),
  BuiltInCard(
      front: 'I am into photography',
      back: 'Я захоплююся фотографією',
      pronunciation: 'ай эм инту фотографи',
      transcription: '/aɪ æm ˈɪntə fəˈtɒɡrəfi/',
      example: 'I take my camera everywhere. I am into photography.',
      notes: 'Хобі',
      imageUrl: 'https://source.unsplash.com/400x300/?photography,camera',
      videoUrl: 'https://youglish.com/pronounce/into%20photography/english/us'),
  BuiltInCard(
      front: 'I enjoy playing the guitar',
      back: 'Я люблю грати на гітарі',
      pronunciation: 'ай энджой плэйинг дэ гитар',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈpleɪɪŋ ðə ɡɪˈtɑːr/',
      example:
          'I have been playing for five years. I enjoy playing the guitar.',
      notes: 'Музика',
      imageUrl: 'https://source.unsplash.com/400x300/?guitar,music',
      videoUrl:
          'https://youglish.com/pronounce/playing%20the%20guitar/english/us'),
  BuiltInCard(
      front: 'I go hiking at weekends',
      back: 'На вихідних я ходжу в походи',
      pronunciation: 'ай гоу хайкинг эт уикэндз',
      transcription: '/aɪ ɡoʊ ˈhaɪkɪŋ æt ˈwiːkendz/',
      example: 'I love nature. I go hiking at weekends.',
      notes: 'Активність',
      imageUrl: 'https://source.unsplash.com/400x300/?hiking,nature',
      videoUrl: 'https://youglish.com/pronounce/go%20hiking/english/us'),
  BuiltInCard(
      front: 'I collect vintage stamps',
      back: 'Я колекціоную старовинні марки',
      pronunciation: 'ай колект винтидж стэмпс',
      transcription: '/aɪ kəˈlekt ˈvɪntɪdʒ stæmps/',
      example: 'I have over five hundred. I collect vintage stamps.',
      notes: 'Колекціонування',
      imageUrl: 'https://source.unsplash.com/400x300/?stamps,collection',
      videoUrl: 'https://youglish.com/pronounce/collect%20stamps/english/us'),
  BuiltInCard(
      front: 'I love baking at home',
      back: 'Я обожнюю пекти вдома',
      pronunciation: 'ай лав бэйкинг эт хоум',
      transcription: '/aɪ lʌv ˈbeɪkɪŋ æt hoʊm/',
      example: 'I made sourdough bread this week. I love baking at home.',
      notes: 'Кулінарія',
      imageUrl: 'https://source.unsplash.com/400x300/?baking,bread',
      videoUrl: 'https://youglish.com/pronounce/love%20baking/english/us'),
  BuiltInCard(
      front: 'I paint as a hobby',
      back: 'Я малюю як хобі',
      pronunciation: 'ай пэйнт эз э хоби',
      transcription: '/aɪ peɪnt æz ə ˈhɒbi/',
      example: 'Mostly watercolours. I paint as a hobby on weekends.',
      notes: 'Творчість',
      imageUrl: 'https://source.unsplash.com/400x300/?painting,art',
      videoUrl:
          'https://youglish.com/pronounce/paint%20as%20a%20hobby/english/us'),
  BuiltInCard(
      front: 'I am a keen gardener',
      back: 'Я запеклий садівник',
      pronunciation: 'ай эм э кин гарднэр',
      transcription: '/aɪ æm ə kiːn ˈɡɑːrdnər/',
      example: 'My garden is my pride. I am a keen gardener.',
      notes: 'Садівництво',
      imageUrl: 'https://source.unsplash.com/400x300/?garden,plants',
      videoUrl: 'https://youglish.com/pronounce/keen%20gardener/english/us'),
  BuiltInCard(
      front: 'I do yoga every morning',
      back: 'Я займаюся йогою щоранку',
      pronunciation: 'ай ду йогэ эври морнинг',
      transcription: '/aɪ duː ˈjoʊɡə ˈevri ˈmɔːrnɪŋ/',
      example: 'It keeps me calm. I do yoga every morning.',
      notes: "Здоров'я",
      imageUrl: 'https://source.unsplash.com/400x300/?yoga,morning',
      videoUrl: 'https://youglish.com/pronounce/do%20yoga/english/us'),
  BuiltInCard(
      front: 'I am learning to play chess',
      back: 'Я вчуся грати в шахи',
      pronunciation: 'ай эм лёрнинг ту плэй чэс',
      transcription: '/aɪ æm ˈlɜːrnɪŋ tə pleɪ tʃes/',
      example: 'It is harder than I thought. I am learning to play chess.',
      notes: 'Логіка',
      imageUrl: 'https://source.unsplash.com/400x300/?chess,board',
      videoUrl: 'https://youglish.com/pronounce/play%20chess/english/us'),
  BuiltInCard(
      front: 'I follow football avidly',
      back: 'Я пристрасно стежу за футболом',
      pronunciation: 'ай фолоу футбол эвидли',
      transcription: '/aɪ ˈfɒloʊ ˈfʊtbɔːl ˈævɪdli/',
      example: 'I never miss a game. I follow football avidly.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?football,fan',
      videoUrl: 'https://youglish.com/pronounce/follow%20football/english/us'),
  BuiltInCard(
      front: 'I enjoy reading crime novels',
      back: 'Я люблю читати детективи',
      pronunciation: 'ай энджой ридинг крайм новэлз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈriːdɪŋ kraɪm ˈnɒvlz/',
      example: 'Agatha Christie is my favourite. I enjoy reading crime novels.',
      notes: 'Читання',
      imageUrl: 'https://source.unsplash.com/400x300/?crime,novel',
      videoUrl:
          'https://youglish.com/pronounce/reading%20crime%20novels/english/us'),
  BuiltInCard(
      front: 'I have taken up running recently',
      back: 'Я нещодавно почав бігати',
      pronunciation: 'ай хэв тэйкэн ап ранинг рисэнтли',
      transcription: '/aɪ hæv ˈteɪkən ʌp ˈrʌnɪŋ ˈriːsəntli/',
      example: 'Three times a week. I have taken up running recently.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?running,park',
      videoUrl:
          'https://youglish.com/pronounce/taken%20up%20running/english/us'),
  BuiltInCard(
      front: 'I enjoy knitting in the evenings',
      back: 'Увечері я люблю в\'язати',
      pronunciation: 'ай энджой нитинг ин дэ ивнингз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈnɪtɪŋ ɪn ðə ˈiːvnɪŋz/',
      example: 'It is very relaxing. I enjoy knitting in the evenings.',
      notes: 'Хобі',
      imageUrl: 'https://source.unsplash.com/400x300/?knitting,wool',
      videoUrl: 'https://youglish.com/pronounce/enjoy%20knitting/english/us'),
  BuiltInCard(
      front: 'I am passionate about cooking',
      back: 'Я пристрасно захоплений кулінарією',
      pronunciation: 'ай эм пэшэнэт эбаут кукинг',
      transcription: '/aɪ æm ˈpæʃənɪt əˈbaʊt ˈkʊkɪŋ/',
      example: 'I try new recipes every week. I am passionate about cooking.',
      notes: 'Кулінарія',
      imageUrl: 'https://source.unsplash.com/400x300/?cooking,chef',
      videoUrl:
          'https://youglish.com/pronounce/passionate%20about%20cooking/english/us'),
  BuiltInCard(
      front: 'I go swimming twice a week',
      back: 'Я ходжу плавати двічі на тиждень',
      pronunciation: 'ай гоу суиминг туайс э уик',
      transcription: '/aɪ ɡoʊ ˈswɪmɪŋ twaɪs ə wiːk/',
      example: 'It keeps me fit. I go swimming twice a week.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?swimming,pool',
      videoUrl: 'https://youglish.com/pronounce/go%20swimming/english/us'),
  BuiltInCard(
      front: 'My hobby is making jewellery',
      back: 'Моє хобі — виготовлення прикрас',
      pronunciation: 'май хоби из мэйкинг джуэлри',
      transcription: '/maɪ ˈhɒbi ɪz ˈmeɪkɪŋ ˈdʒuːəlri/',
      example: 'I sell them online too. My hobby is making jewellery.',
      notes: 'Творчість',
      imageUrl: 'https://source.unsplash.com/400x300/?jewellery,craft',
      videoUrl: 'https://youglish.com/pronounce/making%20jewellery/english/us'),
  BuiltInCard(
      front: 'I enjoy watching documentaries',
      back: 'Я люблю дивитися документальні фільми',
      pronunciation: 'ай энджой уотчинг докюмэнтэриз',
      transcription: '/aɪ ɪnˈdʒɔɪ ˈwɒtʃɪŋ ˌdɒkjʊˈmentəriz/',
      example: 'Especially about nature. I enjoy watching documentaries.',
      notes: 'Кіно',
      imageUrl: 'https://source.unsplash.com/400x300/?documentary,watching',
      videoUrl:
          'https://youglish.com/pronounce/watching%20documentaries/english/us'),
  BuiltInCard(
      front: 'I spend hours on my computer',
      back: 'Я годинами сиджу за комп\'ютером',
      pronunciation: 'ай спэнд ауэрз он май компьютэр',
      transcription: '/aɪ spend ˈaʊərz ɒn maɪ kəmˈpjuːtər/',
      example: 'Gaming mainly. I spend hours on my computer at weekends.',
      notes: 'Технології',
      imageUrl: 'https://source.unsplash.com/400x300/?computer,gaming',
      videoUrl:
          'https://youglish.com/pronounce/spend%20hours%20on%20computer/english/us'),
  BuiltInCard(
      front: 'I volunteer at a local shelter',
      back: 'Я волонтерю в місцевому притулку',
      pronunciation: 'ай волэнтир эт э локэл шэлтэр',
      transcription: '/aɪ ˌvɒlənˈtɪr æt ə ˈloʊkl ˈʃeltər/',
      example: 'Every Saturday morning. I volunteer at a local shelter.',
      notes: 'Волонтерство',
      imageUrl: 'https://source.unsplash.com/400x300/?volunteer,charity',
      videoUrl:
          'https://youglish.com/pronounce/volunteer%20shelter/english/us'),
]);

// ============================================================
// 11 — Movies & Music
// ============================================================

const _ruSet11 = BuiltInSet(name: 'Movies & Music', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'What kind of music do you like?',
      back: 'Какую музыку вы слушаете?',
      pronunciation: 'уот кайнд эв мьюзик ду ю лайк',
      transcription: '/wɒt kaɪnd əv ˈmjuːzɪk duː juː laɪk/',
      example:
          'I am making a playlist for you. What kind of music do you like?',
      notes: 'Музыка',
      imageUrl: 'https://source.unsplash.com/400x300/?music,headphones',
      videoUrl:
          'https://youglish.com/pronounce/what%20kind%20of%20music/english/us'),
  BuiltInCard(
      front: 'I am a huge fan of jazz',
      back: 'Я большой поклонник джаза',
      pronunciation: 'ай эм э хьюдж фэн эв джэз',
      transcription: '/aɪ æm ə hjuːdʒ fæn əv dʒæz/',
      example: 'Miles Davis is my favourite. I am a huge fan of jazz.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?jazz,saxophone',
      videoUrl: 'https://youglish.com/pronounce/fan%20of%20jazz/english/us'),
  BuiltInCard(
      front: 'Have you seen the latest Marvel film?',
      back: 'Вы видели последний фильм Marvel?',
      pronunciation: 'хэв ю син дэ лэйтэст марвэл филм',
      transcription: '/hæv juː siːn ðə ˈleɪtɪst ˈmɑːrvl fɪlm/',
      example: 'It just came out. Have you seen the latest Marvel film?',
      notes: 'Кино',
      imageUrl: 'https://source.unsplash.com/400x300/?cinema,superhero',
      videoUrl:
          'https://youglish.com/pronounce/latest%20Marvel%20film/english/us'),
  BuiltInCard(
      front: 'The soundtrack is amazing',
      back: 'Саундтрек потрясающий',
      pronunciation: 'дэ саундтрэк из эмэйзинг',
      transcription: '/ðə ˈsaʊndtræk ɪz əˈmeɪzɪŋ/',
      example: 'I keep listening to it. The soundtrack is amazing.',
      notes: 'Музыка к фильму',
      imageUrl: 'https://source.unsplash.com/400x300/?soundtrack,music',
      videoUrl:
          'https://youglish.com/pronounce/soundtrack%20amazing/english/us'),
  BuiltInCard(
      front: 'I prefer indie music',
      back: 'Я предпочитаю инди-музыку',
      pronunciation: 'ай прифэр инди мьюзик',
      transcription: '/aɪ prɪˈfɜːr ˈɪndi ˈmjuːzɪk/',
      example: 'Mainstream is too commercial. I prefer indie music.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?indie,concert',
      videoUrl:
          'https://youglish.com/pronounce/prefer%20indie%20music/english/us'),
  BuiltInCard(
      front: 'I went to a live concert last night',
      back: 'Вчера я ходил на живой концерт',
      pronunciation: 'ай уэнт ту э лайв консэрт ласт найт',
      transcription: '/aɪ went tə ə laɪv ˈkɒnsət lɑːst naɪt/',
      example: 'It was incredible. I went to a live concert last night.',
      notes: 'Концерт',
      imageUrl: 'https://source.unsplash.com/400x300/?concert,crowd',
      videoUrl: 'https://youglish.com/pronounce/live%20concert/english/us'),
  BuiltInCard(
      front: 'The plot twist was unexpected',
      back: 'Неожиданный поворот сюжета',
      pronunciation: 'дэ плот твист уоз анэкспэктид',
      transcription: '/ðə plɒt twɪst wɒz ˌʌnɪkˈspektɪd/',
      example: 'Nobody saw it coming. The plot twist was unexpected.',
      notes: 'Кино',
      imageUrl: 'https://source.unsplash.com/400x300/?film,plot',
      videoUrl: 'https://youglish.com/pronounce/plot%20twist/english/us'),
  BuiltInCard(
      front: 'I stream music on Spotify',
      back: 'Я слушаю музыку в Spotify',
      pronunciation: 'ай стрим мьюзик он спотифай',
      transcription: '/aɪ striːm ˈmjuːzɪk ɒn ˈspɒtɪfaɪ/',
      example: 'I have a premium subscription. I stream music on Spotify.',
      notes: 'Стриминг',
      imageUrl: 'https://source.unsplash.com/400x300/?spotify,streaming',
      videoUrl:
          'https://youglish.com/pronounce/stream%20music%20Spotify/english/us'),
  BuiltInCard(
      front: 'I watch films with subtitles',
      back: 'Я смотрю фильмы с субтитрами',
      pronunciation: 'ай уотч филмз уид сабтитэлз',
      transcription: '/aɪ wɒtʃ fɪlmz wɪð ˈsʌbtaɪtlz/',
      example: 'To improve my language. I watch films with subtitles.',
      notes: 'Изучение языка',
      imageUrl: 'https://source.unsplash.com/400x300/?subtitles,film',
      videoUrl:
          'https://youglish.com/pronounce/watch%20films%20subtitles/english/us'),
  BuiltInCard(
      front: 'The lead actor was brilliant',
      back: 'Главный актёр был великолепен',
      pronunciation: 'дэ лид акэтор уоз брилиэнт',
      transcription: '/ðə liːd ˈæktər wɒz ˈbrɪliənt/',
      example: 'He deserved the Oscar. The lead actor was brilliant.',
      notes: 'Актёр',
      imageUrl: 'https://source.unsplash.com/400x300/?actor,award',
      videoUrl:
          'https://youglish.com/pronounce/lead%20actor%20brilliant/english/us'),
  BuiltInCard(
      front: 'I have been to many gigs',
      back: 'Я был на многих концертах',
      pronunciation: 'ай хэв бин ту мэни гигз',
      transcription: '/aɪ hæv bɪn tə ˈmeni ɡɪɡz/',
      example: 'Music is my passion. I have been to many gigs.',
      notes: 'Концерт',
      imageUrl: 'https://source.unsplash.com/400x300/?gig,music',
      videoUrl: 'https://youglish.com/pronounce/been%20to%20gigs/english/us'),
  BuiltInCard(
      front: 'The film won several awards',
      back: 'Фильм получил несколько наград',
      pronunciation: 'дэ филм уон сэвэрэл эуордз',
      transcription: '/ðə fɪlm wɒn ˈsevərəl əˈwɔːrdz/',
      example: 'Including Best Picture. The film won several awards.',
      notes: 'Награды',
      imageUrl: 'https://source.unsplash.com/400x300/?oscar,awards',
      videoUrl:
          'https://youglish.com/pronounce/film%20won%20awards/english/us'),
  BuiltInCard(
      front: 'I play the piano by ear',
      back: 'Я играю на пианино на слух',
      pronunciation: 'ай плэй дэ пиэно бай ир',
      transcription: '/aɪ pleɪ ðə piˈænoʊ baɪ ɪr/',
      example: 'No sheet music needed. I play the piano by ear.',
      notes: 'Музыкальный талант',
      imageUrl: 'https://source.unsplash.com/400x300/?piano,music',
      videoUrl:
          'https://youglish.com/pronounce/play%20piano%20by%20ear/english/us'),
  BuiltInCard(
      front: 'Horror films scare me',
      back: 'Я боюсь фильмов ужасов',
      pronunciation: 'хорор филмз скэр ми',
      transcription: '/ˈhɒrər fɪlmz skɛr miː/',
      example: 'I cannot sleep after them. Horror films scare me.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?horror,scary',
      videoUrl:
          'https://youglish.com/pronounce/horror%20films%20scare/english/us'),
  BuiltInCard(
      front: 'I love the atmosphere of a cinema',
      back: 'Я люблю атмосферу кинотеатра',
      pronunciation: 'ай лав дэ атмосфир эв э синэмэ',
      transcription: '/aɪ lʌv ðə ˈætməsfɪr əv ə ˈsɪnɪmə/',
      example:
          'Big screen, popcorn, darkness. I love the atmosphere of a cinema.',
      notes: 'Кинотеатр',
      imageUrl: 'https://source.unsplash.com/400x300/?cinema,popcorn',
      videoUrl:
          'https://youglish.com/pronounce/atmosphere%20cinema/english/us'),
  BuiltInCard(
      front: 'The bass line is really catchy',
      back: 'Басовая партия очень запоминающаяся',
      pronunciation: 'дэ бэйс лайн из риэли кэчи',
      transcription: '/ðə beɪs laɪn ɪz ˈrɪəli ˈkætʃi/',
      example:
          'I cannot get it out of my head. The bass line is really catchy.',
      notes: 'Музыка',
      imageUrl: 'https://source.unsplash.com/400x300/?bass,guitar',
      videoUrl:
          'https://youglish.com/pronounce/bass%20line%20catchy/english/us'),
  BuiltInCard(
      front: 'I prefer comedies to dramas',
      back: 'Я предпочитаю комедии драмам',
      pronunciation: 'ай прифэр комэдиз ту драмэз',
      transcription: '/aɪ prɪˈfɜːr ˈkɒmɪdiz tə ˈdrɑːməz/',
      example: 'Life is serious enough. I prefer comedies to dramas.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?comedy,film',
      videoUrl: 'https://youglish.com/pronounce/prefer%20comedies/english/us'),
  BuiltInCard(
      front: 'I have all their albums',
      back: 'У меня есть все их альбомы',
      pronunciation: 'ай хэв ол дэр элбэмз',
      transcription: '/aɪ hæv ɔːl ðɛr ˈælbəmz/',
      example: 'I am their biggest fan. I have all their albums.',
      notes: 'Фанат',
      imageUrl: 'https://source.unsplash.com/400x300/?albums,music',
      videoUrl:
          'https://youglish.com/pronounce/have%20all%20their%20albums/english/us'),
  BuiltInCard(
      front: 'The special effects were stunning',
      back: 'Спецэффекты были потрясающими',
      pronunciation: 'дэ спэшэл ифэктс уэр станинг',
      transcription: '/ðə ˈspeʃl ɪˈfekts wɜːr ˈstʌnɪŋ/',
      example: 'Best CGI I have seen. The special effects were stunning.',
      notes: 'Кино',
      imageUrl: 'https://source.unsplash.com/400x300/?special,effects',
      videoUrl:
          'https://youglish.com/pronounce/special%20effects%20stunning/english/us'),
  BuiltInCard(
      front: 'I listen to podcasts on my commute',
      back: 'Я слушаю подкасты по дороге на работу',
      pronunciation: 'ай лисэн ту подкастс он май комьют',
      transcription: '/aɪ ˈlɪsən tə ˈpɒdkɑːsts ɒn maɪ kəˈmjuːt/',
      example: 'True crime mostly. I listen to podcasts on my commute.',
      notes: 'Подкасты',
      imageUrl: 'https://source.unsplash.com/400x300/?podcast,commute',
      videoUrl:
          'https://youglish.com/pronounce/listen%20to%20podcasts/english/us'),
]);

const _ukSet11 = BuiltInSet(name: 'Movies & Music', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'What kind of music do you like?',
      back: 'Яку музику ви слухаєте?',
      pronunciation: 'уот кайнд эв мьюзик ду ю лайк',
      transcription: '/wɒt kaɪnd əv ˈmjuːzɪk duː juː laɪk/',
      example:
          'I am making a playlist for you. What kind of music do you like?',
      notes: 'Музика',
      imageUrl: 'https://source.unsplash.com/400x300/?music,headphones',
      videoUrl:
          'https://youglish.com/pronounce/what%20kind%20of%20music/english/us'),
  BuiltInCard(
      front: 'I am a huge fan of jazz',
      back: 'Я великий шанувальник джазу',
      pronunciation: 'ай эм э хьюдж фэн эв джэз',
      transcription: '/aɪ æm ə hjuːdʒ fæn əv dʒæz/',
      example: 'Miles Davis is my favourite. I am a huge fan of jazz.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?jazz,saxophone',
      videoUrl: 'https://youglish.com/pronounce/fan%20of%20jazz/english/us'),
  BuiltInCard(
      front: 'Have you seen the latest Marvel film?',
      back: 'Ви бачили останній фільм Marvel?',
      pronunciation: 'хэв ю син дэ лэйтэст марвэл филм',
      transcription: '/hæv juː siːn ðə ˈleɪtɪst ˈmɑːrvl fɪlm/',
      example: 'It just came out. Have you seen the latest Marvel film?',
      notes: 'Кіно',
      imageUrl: 'https://source.unsplash.com/400x300/?cinema,superhero',
      videoUrl:
          'https://youglish.com/pronounce/latest%20Marvel%20film/english/us'),
  BuiltInCard(
      front: 'The soundtrack is amazing',
      back: 'Саундтрек приголомшливий',
      pronunciation: 'дэ саундтрэк из эмэйзинг',
      transcription: '/ðə ˈsaʊndtræk ɪz əˈmeɪzɪŋ/',
      example: 'I keep listening to it. The soundtrack is amazing.',
      notes: 'Музика до фільму',
      imageUrl: 'https://source.unsplash.com/400x300/?soundtrack,music',
      videoUrl:
          'https://youglish.com/pronounce/soundtrack%20amazing/english/us'),
  BuiltInCard(
      front: 'I prefer indie music',
      back: 'Я надаю перевагу інді-музиці',
      pronunciation: 'ай прифэр инди мьюзик',
      transcription: '/aɪ prɪˈfɜːr ˈɪndi ˈmjuːzɪk/',
      example: 'Mainstream is too commercial. I prefer indie music.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?indie,concert',
      videoUrl:
          'https://youglish.com/pronounce/prefer%20indie%20music/english/us'),
  BuiltInCard(
      front: 'I went to a live concert last night',
      back: 'Вчора я ходив на живий концерт',
      pronunciation: 'ай уэнт ту э лайв консэрт ласт найт',
      transcription: '/aɪ went tə ə laɪv ˈkɒnsət lɑːst naɪt/',
      example: 'It was incredible. I went to a live concert last night.',
      notes: 'Концерт',
      imageUrl: 'https://source.unsplash.com/400x300/?concert,crowd',
      videoUrl: 'https://youglish.com/pronounce/live%20concert/english/us'),
  BuiltInCard(
      front: 'The plot twist was unexpected',
      back: 'Несподіваний поворот сюжету',
      pronunciation: 'дэ плот твист уоз анэкспэктид',
      transcription: '/ðə plɒt twɪst wɒz ˌʌnɪkˈspektɪd/',
      example: 'Nobody saw it coming. The plot twist was unexpected.',
      notes: 'Кіно',
      imageUrl: 'https://source.unsplash.com/400x300/?film,plot',
      videoUrl: 'https://youglish.com/pronounce/plot%20twist/english/us'),
  BuiltInCard(
      front: 'I stream music on Spotify',
      back: 'Я слухаю музику в Spotify',
      pronunciation: 'ай стрим мьюзик он спотифай',
      transcription: '/aɪ striːm ˈmjuːzɪk ɒn ˈspɒtɪfaɪ/',
      example: 'I have a premium subscription. I stream music on Spotify.',
      notes: 'Стримінг',
      imageUrl: 'https://source.unsplash.com/400x300/?spotify,streaming',
      videoUrl:
          'https://youglish.com/pronounce/stream%20music%20Spotify/english/us'),
  BuiltInCard(
      front: 'I watch films with subtitles',
      back: 'Я дивлюся фільми з субтитрами',
      pronunciation: 'ай уотч филмз уид сабтитэлз',
      transcription: '/aɪ wɒtʃ fɪlmz wɪð ˈsʌbtaɪtlz/',
      example: 'To improve my language. I watch films with subtitles.',
      notes: 'Вивчення мови',
      imageUrl: 'https://source.unsplash.com/400x300/?subtitles,film',
      videoUrl:
          'https://youglish.com/pronounce/watch%20films%20subtitles/english/us'),
  BuiltInCard(
      front: 'The lead actor was brilliant',
      back: 'Головний актор був блискучим',
      pronunciation: 'дэ лид акэтор уоз брилиэнт',
      transcription: '/ðə liːd ˈæktər wɒz ˈbrɪliənt/',
      example: 'He deserved the Oscar. The lead actor was brilliant.',
      notes: 'Актор',
      imageUrl: 'https://source.unsplash.com/400x300/?actor,award',
      videoUrl:
          'https://youglish.com/pronounce/lead%20actor%20brilliant/english/us'),
  BuiltInCard(
      front: 'I have been to many gigs',
      back: 'Я побував на багатьох концертах',
      pronunciation: 'ай хэв бин ту мэни гигз',
      transcription: '/aɪ hæv bɪn tə ˈmeni ɡɪɡz/',
      example: 'Music is my passion. I have been to many gigs.',
      notes: 'Концерт',
      imageUrl: 'https://source.unsplash.com/400x300/?gig,music',
      videoUrl: 'https://youglish.com/pronounce/been%20to%20gigs/english/us'),
  BuiltInCard(
      front: 'The film won several awards',
      back: 'Фільм отримав кілька нагород',
      pronunciation: 'дэ филм уон сэвэрэл эуордз',
      transcription: '/ðə fɪlm wɒn ˈsevərəl əˈwɔːrdz/',
      example: 'Including Best Picture. The film won several awards.',
      notes: 'Нагороди',
      imageUrl: 'https://source.unsplash.com/400x300/?oscar,awards',
      videoUrl:
          'https://youglish.com/pronounce/film%20won%20awards/english/us'),
  BuiltInCard(
      front: 'I play the piano by ear',
      back: 'Я граю на піаніно на слух',
      pronunciation: 'ай плэй дэ пиэно бай ир',
      transcription: '/aɪ pleɪ ðə piˈænoʊ baɪ ɪr/',
      example: 'No sheet music needed. I play the piano by ear.',
      notes: 'Музичний талант',
      imageUrl: 'https://source.unsplash.com/400x300/?piano,music',
      videoUrl:
          'https://youglish.com/pronounce/play%20piano%20by%20ear/english/us'),
  BuiltInCard(
      front: 'Horror films scare me',
      back: 'Я боюся фільмів жаху',
      pronunciation: 'хорор филмз скэр ми',
      transcription: '/ˈhɒrər fɪlmz skɛr miː/',
      example: 'I cannot sleep after them. Horror films scare me.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?horror,scary',
      videoUrl:
          'https://youglish.com/pronounce/horror%20films%20scare/english/us'),
  BuiltInCard(
      front: 'I love the atmosphere of a cinema',
      back: 'Я люблю атмосферу кінотеатру',
      pronunciation: 'ай лав дэ атмосфир эв э синэмэ',
      transcription: '/aɪ lʌv ðə ˈætməsfɪr əv ə ˈsɪnɪmə/',
      example:
          'Big screen, popcorn, darkness. I love the atmosphere of a cinema.',
      notes: 'Кінотеатр',
      imageUrl: 'https://source.unsplash.com/400x300/?cinema,popcorn',
      videoUrl:
          'https://youglish.com/pronounce/atmosphere%20cinema/english/us'),
  BuiltInCard(
      front: 'The bass line is really catchy',
      back: 'Басова партія дуже запам\'ятовується',
      pronunciation: 'дэ бэйс лайн из риэли кэчи',
      transcription: '/ðə beɪs laɪn ɪz ˈrɪəli ˈkætʃi/',
      example:
          'I cannot get it out of my head. The bass line is really catchy.',
      notes: 'Музика',
      imageUrl: 'https://source.unsplash.com/400x300/?bass,guitar',
      videoUrl:
          'https://youglish.com/pronounce/bass%20line%20catchy/english/us'),
  BuiltInCard(
      front: 'I prefer comedies to dramas',
      back: 'Я надаю перевагу комедіям над драмами',
      pronunciation: 'ай прифэр комэдиз ту драмэз',
      transcription: '/aɪ prɪˈfɜːr ˈkɒmɪdiz tə ˈdrɑːməz/',
      example: 'Life is serious enough. I prefer comedies to dramas.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?comedy,film',
      videoUrl: 'https://youglish.com/pronounce/prefer%20comedies/english/us'),
  BuiltInCard(
      front: 'I have all their albums',
      back: 'У мене є всі їхні альбоми',
      pronunciation: 'ай хэв ол дэр элбэмз',
      transcription: '/aɪ hæv ɔːl ðɛr ˈælbəmz/',
      example: 'I am their biggest fan. I have all their albums.',
      notes: 'Фанат',
      imageUrl: 'https://source.unsplash.com/400x300/?albums,music',
      videoUrl:
          'https://youglish.com/pronounce/have%20all%20their%20albums/english/us'),
  BuiltInCard(
      front: 'The special effects were stunning',
      back: 'Спецефекти були приголомшливими',
      pronunciation: 'дэ спэшэл ифэктс уэр станинг',
      transcription: '/ðə ˈspeʃl ɪˈfekts wɜːr ˈstʌnɪŋ/',
      example: 'Best CGI I have seen. The special effects were stunning.',
      notes: 'Кіно',
      imageUrl: 'https://source.unsplash.com/400x300/?special,effects',
      videoUrl:
          'https://youglish.com/pronounce/special%20effects%20stunning/english/us'),
  BuiltInCard(
      front: 'I listen to podcasts on my commute',
      back: 'Я слухаю подкасти по дорозі на роботу',
      pronunciation: 'ай лисэн ту подкастс он май комьют',
      transcription: '/aɪ ˈlɪsən tə ˈpɒdkɑːsts ɒn maɪ kəˈmjuːt/',
      example: 'True crime mostly. I listen to podcasts on my commute.',
      notes: 'Подкасти',
      imageUrl: 'https://source.unsplash.com/400x300/?podcast,commute',
      videoUrl:
          'https://youglish.com/pronounce/listen%20to%20podcasts/english/us'),
]);
// END OF PART 3

// ============================================================
// 12 — Books & Education
// ============================================================

const _ruSet12 = BuiltInSet(name: 'Books & Education', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I am currently reading a novel',
      back: 'Сейчас я читаю роман',
      pronunciation: 'ай эм карэнтли ридинг э новэл',
      transcription: '/aɪ æm ˈkʌrəntli ˈriːdɪŋ ə ˈnɒvl/',
      example: 'I cannot put it down. I am currently reading a novel.',
      notes: 'Чтение',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,novel',
      videoUrl:
          'https://youglish.com/pronounce/currently%20reading/english/us'),
  BuiltInCard(
      front: 'I studied at university for four years',
      back: 'Я учился в университете четыре года',
      pronunciation: 'ай стадид эт юниверсити фор фор йирз',
      transcription: '/aɪ ˈstʌdid æt ˌjuːnɪˈvɜːrsɪti fər fɔːr jɪrz/',
      example:
          'It was tough but worth it. I studied at university for four years.',
      notes: 'Образование',
      imageUrl: 'https://source.unsplash.com/400x300/?university,graduation',
      videoUrl:
          'https://youglish.com/pronounce/studied%20at%20university/english/us'),
  BuiltInCard(
      front: 'She has a degree in economics',
      back: 'У неё степень по экономике',
      pronunciation: 'ши хэз э дигри ин икономикс',
      transcription: '/ʃiː hæz ə dɪˈɡriː ɪn ˌiːkəˈnɒmɪks/',
      example: 'She graduated last year. She has a degree in economics.',
      notes: 'Специальность',
      imageUrl: 'https://source.unsplash.com/400x300/?degree,economics',
      videoUrl:
          'https://youglish.com/pronounce/degree%20in%20economics/english/us'),
  BuiltInCard(
      front: 'I prefer non-fiction books',
      back: 'Я предпочитаю документальную литературу',
      pronunciation: 'ай прифэр нон-фикшэн букс',
      transcription: '/aɪ prɪˈfɜːr nɒn ˈfɪkʃən bʊks/',
      example: 'I like to learn from books. I prefer non-fiction books.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?nonfiction,books',
      videoUrl:
          'https://youglish.com/pronounce/non-fiction%20books/english/us'),
  BuiltInCard(
      front: 'The library opens at nine',
      back: 'Библиотека открывается в девять',
      pronunciation: 'дэ лайбрэри оупэнз эт найн',
      transcription: '/ðə ˈlaɪbrəri ˈoʊpənz æt naɪn/',
      example: 'We can go in the morning. The library opens at nine.',
      notes: 'Библиотека',
      imageUrl: 'https://source.unsplash.com/400x300/?library,books',
      videoUrl: 'https://youglish.com/pronounce/library%20opens/english/us'),
  BuiltInCard(
      front: 'He failed his exam',
      back: 'Он провалил экзамен',
      pronunciation: 'хи фэйлд хиз игзам',
      transcription: '/hiː feɪld hɪz ɪɡˈzæm/',
      example: 'He did not study enough. He failed his exam.',
      notes: 'Учёба',
      imageUrl: 'https://source.unsplash.com/400x300/?exam,fail',
      videoUrl:
          'https://youglish.com/pronounce/failed%20his%20exam/english/us'),
  BuiltInCard(
      front: 'She passed with flying colours',
      back: 'Она сдала на отлично',
      pronunciation: 'ши паст уид флайинг калэрз',
      transcription: '/ʃiː pɑːst wɪð ˈflaɪɪŋ ˈkʌlərz/',
      example: 'Top marks in every subject. She passed with flying colours.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?exam,success',
      videoUrl:
          'https://youglish.com/pronounce/passed%20with%20flying%20colours/english/us'),
  BuiltInCard(
      front: 'I take notes in class',
      back: 'Я делаю заметки на занятиях',
      pronunciation: 'ай тэйк ноутс ин клас',
      transcription: '/aɪ teɪk noʊts ɪn klɑːs/',
      example: 'It helps me remember. I take notes in class.',
      notes: 'Учёба',
      imageUrl: 'https://source.unsplash.com/400x300/?notes,class',
      videoUrl:
          'https://youglish.com/pronounce/take%20notes%20in%20class/english/us'),
  BuiltInCard(
      front: 'This book is a page-turner',
      back: 'Эту книгу невозможно оторваться',
      pronunciation: 'дис бук из э пэйдж-тёрнэр',
      transcription: '/ðɪs bʊk ɪz ə ˈpeɪdʒtɜːrnər/',
      example: 'I read it in one sitting. This book is a page-turner.',
      notes: 'Отзыв',
      imageUrl: 'https://source.unsplash.com/400x300/?book,reading',
      videoUrl: 'https://youglish.com/pronounce/page-turner/english/us'),
  BuiltInCard(
      front: 'I am doing an online course',
      back: 'Я прохожу онлайн курс',
      pronunciation: 'ай эм дуинг эн онлайн корс',
      transcription: '/aɪ æm ˈduːɪŋ ən ˈɒnlaɪn kɔːrs/',
      example: 'In data science. I am doing an online course.',
      notes: 'Онлайн образование',
      imageUrl: 'https://source.unsplash.com/400x300/?online,course',
      videoUrl: 'https://youglish.com/pronounce/online%20course/english/us'),
  BuiltInCard(
      front: 'The teacher explained it clearly',
      back: 'Учитель объяснил это чётко',
      pronunciation: 'дэ тичэр икспрэйнд ит клиэрли',
      transcription: '/ðə ˈtiːtʃər ɪkˈspleɪnd ɪt ˈklɪrli/',
      example: 'Now I understand. The teacher explained it clearly.',
      notes: 'Преподавание',
      imageUrl: 'https://source.unsplash.com/400x300/?teacher,explain',
      videoUrl:
          'https://youglish.com/pronounce/explained%20clearly/english/us'),
  BuiltInCard(
      front: 'I have a lot of homework tonight',
      back: 'У меня сегодня много домашней работы',
      pronunciation: 'ай хэв э лот эв хоумуэрк тунайт',
      transcription: '/aɪ hæv ə lɒt əv ˈhoʊmwɜːrk təˈnaɪt/',
      example: 'I cannot go out. I have a lot of homework tonight.',
      notes: 'Школа',
      imageUrl: 'https://source.unsplash.com/400x300/?homework,study',
      videoUrl:
          'https://youglish.com/pronounce/lot%20of%20homework/english/us'),
  BuiltInCard(
      front: 'He is writing his dissertation',
      back: 'Он пишет диссертацию',
      pronunciation: 'хи из райтинг хиз дисэртэйшэн',
      transcription: '/hiː ɪz ˈraɪtɪŋ hɪz ˌdɪsəˈteɪʃən/',
      example: 'It is due next month. He is writing his dissertation.',
      notes: 'Академическое письмо',
      imageUrl: 'https://source.unsplash.com/400x300/?dissertation,writing',
      videoUrl:
          'https://youglish.com/pronounce/writing%20dissertation/english/us'),
  BuiltInCard(
      front: 'I learn best by doing',
      back: 'Я лучше всего учусь на практике',
      pronunciation: 'ай лёрн бэст бай дуинг',
      transcription: '/aɪ lɜːrn best baɪ ˈduːɪŋ/',
      example: 'Theory is not enough for me. I learn best by doing.',
      notes: 'Стиль обучения',
      imageUrl: 'https://source.unsplash.com/400x300/?hands-on,learning',
      videoUrl:
          'https://youglish.com/pronounce/learn%20best%20by%20doing/english/us'),
  BuiltInCard(
      front: 'She got a scholarship',
      back: 'Она получила стипендию',
      pronunciation: 'ши гот э сколэршип',
      transcription: '/ʃiː ɡɒt ə ˈskɒlərʃɪp/',
      example: 'It covers all her tuition. She got a scholarship.',
      notes: 'Финансирование',
      imageUrl: 'https://source.unsplash.com/400x300/?scholarship,award',
      videoUrl:
          'https://youglish.com/pronounce/got%20a%20scholarship/english/us'),
  BuiltInCard(
      front: 'Reading expands your vocabulary',
      back: 'Чтение расширяет словарный запас',
      pronunciation: 'ридинг икспэндз йор вокабюлэри',
      transcription: '/ˈriːdɪŋ ɪkˈspændz jɔːr vəˈkæbjʊlɛri/',
      example: 'Read every day. Reading expands your vocabulary.',
      notes: 'Совет',
      imageUrl: 'https://source.unsplash.com/400x300/?vocabulary,reading',
      videoUrl:
          'https://youglish.com/pronounce/expands%20vocabulary/english/us'),
  BuiltInCard(
      front: 'The author won the Booker Prize',
      back: 'Автор получил премию Букера',
      pronunciation: 'дэ отэр уон дэ букэр прайз',
      transcription: '/ðə ˈɔːθər wɒn ðə ˈbʊkər praɪz/',
      example: 'It was a well-deserved award. The author won the Booker Prize.',
      notes: 'Литература',
      imageUrl: 'https://source.unsplash.com/400x300/?booker,prize',
      videoUrl: 'https://youglish.com/pronounce/Booker%20Prize/english/us'),
  BuiltInCard(
      front: 'I struggle with maths',
      back: 'Мне трудно даётся математика',
      pronunciation: 'ай страгэл уид мэсс',
      transcription: '/aɪ ˈstrʌɡl wɪð mæθs/',
      example: 'Numbers are not my thing. I struggle with maths.',
      notes: 'Трудности',
      imageUrl: 'https://source.unsplash.com/400x300/?math,struggle',
      videoUrl:
          'https://youglish.com/pronounce/struggle%20with%20maths/english/us'),
  BuiltInCard(
      front: 'This chapter is really interesting',
      back: 'Эта глава очень интересная',
      pronunciation: 'дис чэптэр из риэли интэрэстинг',
      transcription: '/ðɪs ˈtʃæptər ɪz ˈrɪəli ˈɪntrɪstɪŋ/',
      example: 'I cannot stop reading. This chapter is really interesting.',
      notes: 'Чтение',
      imageUrl: 'https://source.unsplash.com/400x300/?chapter,book',
      videoUrl:
          'https://youglish.com/pronounce/chapter%20interesting/english/us'),
  BuiltInCard(
      front: 'Knowledge is power',
      back: 'Знание — сила',
      pronunciation: 'нолидж из пауэр',
      transcription: '/ˈnɒlɪdʒ ɪz ˈpaʊər/',
      example: 'Never stop learning. Knowledge is power.',
      notes: 'Пословица',
      imageUrl: 'https://source.unsplash.com/400x300/?knowledge,wisdom',
      videoUrl:
          'https://youglish.com/pronounce/knowledge%20is%20power/english/us'),
]);

const _ukSet12 = BuiltInSet(name: 'Books & Education', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I am currently reading a novel',
      back: 'Зараз я читаю роман',
      pronunciation: 'ай эм карэнтли ридинг э новэл',
      transcription: '/aɪ æm ˈkʌrəntli ˈriːdɪŋ ə ˈnɒvl/',
      example: 'I cannot put it down. I am currently reading a novel.',
      notes: 'Читання',
      imageUrl: 'https://source.unsplash.com/400x300/?reading,novel',
      videoUrl:
          'https://youglish.com/pronounce/currently%20reading/english/us'),
  BuiltInCard(
      front: 'I studied at university for four years',
      back: 'Я навчався в університеті чотири роки',
      pronunciation: 'ай стадид эт юниверсити фор фор йирз',
      transcription: '/aɪ ˈstʌdid æt ˌjuːnɪˈvɜːrsɪti fər fɔːr jɪrz/',
      example:
          'It was tough but worth it. I studied at university for four years.',
      notes: 'Освіта',
      imageUrl: 'https://source.unsplash.com/400x300/?university,graduation',
      videoUrl:
          'https://youglish.com/pronounce/studied%20at%20university/english/us'),
  BuiltInCard(
      front: 'She has a degree in economics',
      back: 'У неї ступінь з економіки',
      pronunciation: 'ши хэз э дигри ин икономикс',
      transcription: '/ʃiː hæz ə dɪˈɡriː ɪn ˌiːkəˈnɒmɪks/',
      example: 'She graduated last year. She has a degree in economics.',
      notes: 'Спеціальність',
      imageUrl: 'https://source.unsplash.com/400x300/?degree,economics',
      videoUrl:
          'https://youglish.com/pronounce/degree%20in%20economics/english/us'),
  BuiltInCard(
      front: 'I prefer non-fiction books',
      back: 'Я надаю перевагу документальній літературі',
      pronunciation: 'ай прифэр нон-фикшэн букс',
      transcription: '/aɪ prɪˈfɜːr nɒn ˈfɪkʃən bʊks/',
      example: 'I like to learn from books. I prefer non-fiction books.',
      notes: 'Жанр',
      imageUrl: 'https://source.unsplash.com/400x300/?nonfiction,books',
      videoUrl:
          'https://youglish.com/pronounce/non-fiction%20books/english/us'),
  BuiltInCard(
      front: 'The library opens at nine',
      back: 'Бібліотека відкривається о дев\'ятій',
      pronunciation: 'дэ лайбрэри оупэнз эт найн',
      transcription: '/ðə ˈlaɪbrəri ˈoʊpənz æt naɪn/',
      example: 'We can go in the morning. The library opens at nine.',
      notes: 'Бібліотека',
      imageUrl: 'https://source.unsplash.com/400x300/?library,books',
      videoUrl: 'https://youglish.com/pronounce/library%20opens/english/us'),
  BuiltInCard(
      front: 'He failed his exam',
      back: 'Він провалив іспит',
      pronunciation: 'хи фэйлд хиз игзам',
      transcription: '/hiː feɪld hɪz ɪɡˈzæm/',
      example: 'He did not study enough. He failed his exam.',
      notes: 'Навчання',
      imageUrl: 'https://source.unsplash.com/400x300/?exam,fail',
      videoUrl:
          'https://youglish.com/pronounce/failed%20his%20exam/english/us'),
  BuiltInCard(
      front: 'She passed with flying colours',
      back: 'Вона склала на відмінно',
      pronunciation: 'ши паст уид флайинг калэрз',
      transcription: '/ʃiː pɑːst wɪð ˈflaɪɪŋ ˈkʌlərz/',
      example: 'Top marks in every subject. She passed with flying colours.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?exam,success',
      videoUrl:
          'https://youglish.com/pronounce/passed%20with%20flying%20colours/english/us'),
  BuiltInCard(
      front: 'I take notes in class',
      back: 'Я роблю нотатки на заняттях',
      pronunciation: 'ай тэйк ноутс ин клас',
      transcription: '/aɪ teɪk noʊts ɪn klɑːs/',
      example: 'It helps me remember. I take notes in class.',
      notes: 'Навчання',
      imageUrl: 'https://source.unsplash.com/400x300/?notes,class',
      videoUrl:
          'https://youglish.com/pronounce/take%20notes%20in%20class/english/us'),
  BuiltInCard(
      front: 'This book is a page-turner',
      back: 'Цю книгу неможливо відкласти',
      pronunciation: 'дис бук из э пэйдж-тёрнэр',
      transcription: '/ðɪs bʊk ɪz ə ˈpeɪdʒtɜːrnər/',
      example: 'I read it in one sitting. This book is a page-turner.',
      notes: 'Відгук',
      imageUrl: 'https://source.unsplash.com/400x300/?book,reading',
      videoUrl: 'https://youglish.com/pronounce/page-turner/english/us'),
  BuiltInCard(
      front: 'I am doing an online course',
      back: 'Я проходжу онлайн курс',
      pronunciation: 'ай эм дуинг эн онлайн корс',
      transcription: '/aɪ æm ˈduːɪŋ ən ˈɒnlaɪn kɔːrs/',
      example: 'In data science. I am doing an online course.',
      notes: 'Онлайн освіта',
      imageUrl: 'https://source.unsplash.com/400x300/?online,course',
      videoUrl: 'https://youglish.com/pronounce/online%20course/english/us'),
  BuiltInCard(
      front: 'The teacher explained it clearly',
      back: 'Вчитель пояснив це чітко',
      pronunciation: 'дэ тичэр икспрэйнд ит клиэрли',
      transcription: '/ðə ˈtiːtʃər ɪkˈspleɪnd ɪt ˈklɪrli/',
      example: 'Now I understand. The teacher explained it clearly.',
      notes: 'Викладання',
      imageUrl: 'https://source.unsplash.com/400x300/?teacher,explain',
      videoUrl:
          'https://youglish.com/pronounce/explained%20clearly/english/us'),
  BuiltInCard(
      front: 'I have a lot of homework tonight',
      back: 'У мене сьогодні багато домашньої роботи',
      pronunciation: 'ай хэв э лот эв хоумуэрк тунайт',
      transcription: '/aɪ hæv ə lɒt əv ˈhoʊmwɜːrk təˈnaɪt/',
      example: 'I cannot go out. I have a lot of homework tonight.',
      notes: 'Школа',
      imageUrl: 'https://source.unsplash.com/400x300/?homework,study',
      videoUrl:
          'https://youglish.com/pronounce/lot%20of%20homework/english/us'),
  BuiltInCard(
      front: 'He is writing his dissertation',
      back: 'Він пише дисертацію',
      pronunciation: 'хи из райтинг хиз дисэртэйшэн',
      transcription: '/hiː ɪz ˈraɪtɪŋ hɪz ˌdɪsəˈteɪʃən/',
      example: 'It is due next month. He is writing his dissertation.',
      notes: 'Академічне письмо',
      imageUrl: 'https://source.unsplash.com/400x300/?dissertation,writing',
      videoUrl:
          'https://youglish.com/pronounce/writing%20dissertation/english/us'),
  BuiltInCard(
      front: 'I learn best by doing',
      back: 'Я найкраще навчаюся на практиці',
      pronunciation: 'ай лёрн бэст бай дуинг',
      transcription: '/aɪ lɜːrn best baɪ ˈduːɪŋ/',
      example: 'Theory is not enough for me. I learn best by doing.',
      notes: 'Стиль навчання',
      imageUrl: 'https://source.unsplash.com/400x300/?hands-on,learning',
      videoUrl:
          'https://youglish.com/pronounce/learn%20best%20by%20doing/english/us'),
  BuiltInCard(
      front: 'She got a scholarship',
      back: 'Вона отримала стипендію',
      pronunciation: 'ши гот э сколэршип',
      transcription: '/ʃiː ɡɒt ə ˈskɒlərʃɪp/',
      example: 'It covers all her tuition. She got a scholarship.',
      notes: 'Фінансування',
      imageUrl: 'https://source.unsplash.com/400x300/?scholarship,award',
      videoUrl:
          'https://youglish.com/pronounce/got%20a%20scholarship/english/us'),
  BuiltInCard(
      front: 'Reading expands your vocabulary',
      back: 'Читання розширює словниковий запас',
      pronunciation: 'ридинг икспэндз йор вокабюлэри',
      transcription: '/ˈriːdɪŋ ɪkˈspændz jɔːr vəˈkæbjʊlɛri/',
      example: 'Read every day. Reading expands your vocabulary.',
      notes: 'Порада',
      imageUrl: 'https://source.unsplash.com/400x300/?vocabulary,reading',
      videoUrl:
          'https://youglish.com/pronounce/expands%20vocabulary/english/us'),
  BuiltInCard(
      front: 'The author won the Booker Prize',
      back: 'Автор отримав премію Букера',
      pronunciation: 'дэ отэр уон дэ букэр прайз',
      transcription: '/ðə ˈɔːθər wɒn ðə ˈbʊkər praɪz/',
      example: 'It was a well-deserved award. The author won the Booker Prize.',
      notes: 'Література',
      imageUrl: 'https://source.unsplash.com/400x300/?booker,prize',
      videoUrl: 'https://youglish.com/pronounce/Booker%20Prize/english/us'),
  BuiltInCard(
      front: 'I struggle with maths',
      back: 'Мені важко дається математика',
      pronunciation: 'ай страгэл уид мэсс',
      transcription: '/aɪ ˈstrʌɡl wɪð mæθs/',
      example: 'Numbers are not my thing. I struggle with maths.',
      notes: 'Труднощі',
      imageUrl: 'https://source.unsplash.com/400x300/?math,struggle',
      videoUrl:
          'https://youglish.com/pronounce/struggle%20with%20maths/english/us'),
  BuiltInCard(
      front: 'This chapter is really interesting',
      back: 'Цей розділ дуже цікавий',
      pronunciation: 'дис чэптэр из риэли интэрэстинг',
      transcription: '/ðɪs ˈtʃæptər ɪz ˈrɪəli ˈɪntrɪstɪŋ/',
      example: 'I cannot stop reading. This chapter is really interesting.',
      notes: 'Читання',
      imageUrl: 'https://source.unsplash.com/400x300/?chapter,book',
      videoUrl:
          'https://youglish.com/pronounce/chapter%20interesting/english/us'),
  BuiltInCard(
      front: 'Knowledge is power',
      back: 'Знання — сила',
      pronunciation: 'нолидж из пауэр',
      transcription: '/ˈnɒlɪdʒ ɪz ˈpaʊər/',
      example: 'Never stop learning. Knowledge is power.',
      notes: 'Прислів\'я',
      imageUrl: 'https://source.unsplash.com/400x300/?knowledge,wisdom',
      videoUrl:
          'https://youglish.com/pronounce/knowledge%20is%20power/english/us'),
]);

// ============================================================
// 13 — Sport & Healthy Living
// ============================================================

const _ruSet13 =
    BuiltInSet(name: 'Sport & Healthy Living', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I try to eat a balanced diet',
      back: 'Я стараюсь питаться сбалансированно',
      pronunciation: 'ай трай ту ит э бэлэнст дайэт',
      transcription: '/aɪ traɪ tə iːt ə ˈbælənst ˈdaɪɪt/',
      example: 'Lots of fruit and vegetables. I try to eat a balanced diet.',
      notes: 'Питание',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,food',
      videoUrl: 'https://youglish.com/pronounce/balanced%20diet/english/us'),
  BuiltInCard(
      front: 'He plays football every Saturday',
      back: 'По субботам он играет в футбол',
      pronunciation: 'хи плэйз футбол эври сатэрдэй',
      transcription: '/hiː pleɪz ˈfʊtbɔːl ˈevri ˈsætərdeɪ/',
      example: 'He is on a local team. He plays football every Saturday.',
      notes: 'Командный спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?football,team',
      videoUrl: 'https://youglish.com/pronounce/plays%20football/english/us'),
  BuiltInCard(
      front: 'I am training for a marathon',
      back: 'Я тренируюсь к марафону',
      pronunciation: 'ай эм трэйнинг фор э марэсон',
      transcription: '/aɪ æm ˈtreɪnɪŋ fər ə ˈmærəθɒn/',
      example: 'Running twenty miles a week. I am training for a marathon.',
      notes: 'Бег',
      imageUrl: 'https://source.unsplash.com/400x300/?marathon,running',
      videoUrl:
          'https://youglish.com/pronounce/training%20for%20a%20marathon/english/us'),
  BuiltInCard(
      front: 'I drink two litres of water a day',
      back: 'Я пью два литра воды в день',
      pronunciation: 'ай дринк ту литэрз эв уотэр э дэй',
      transcription: '/aɪ drɪŋk tuː ˈliːtərz əv ˈwɔːtər ə deɪ/',
      example: 'Hydration is key. I drink two litres of water a day.',
      notes: 'Гидрация',
      imageUrl: 'https://source.unsplash.com/400x300/?water,hydration',
      videoUrl:
          'https://youglish.com/pronounce/litres%20of%20water/english/us'),
  BuiltInCard(
      front: 'She is a professional tennis player',
      back: 'Она профессиональная теннисистка',
      pronunciation: 'ши из э профэшэнэл тэнис плэйэр',
      transcription: '/ʃiː ɪz ə prəˈfeʃənl ˈtenɪs ˈpleɪər/',
      example: 'She has won three titles. She is a professional tennis player.',
      notes: 'Теннис',
      imageUrl: 'https://source.unsplash.com/400x300/?tennis,player',
      videoUrl:
          'https://youglish.com/pronounce/professional%20tennis%20player/english/us'),
  BuiltInCard(
      front: 'I gave up smoking last year',
      back: 'В прошлом году я бросил курить',
      pronunciation: 'ай гэйв ап смоукинг ласт йир',
      transcription: '/aɪ ɡeɪv ʌp ˈsmoʊkɪŋ lɑːst jɪr/',
      example: 'Best decision ever. I gave up smoking last year.',
      notes: 'Здоровый образ жизни',
      imageUrl: 'https://source.unsplash.com/400x300/?quit,smoking',
      videoUrl:
          'https://youglish.com/pronounce/gave%20up%20smoking/english/us'),
  BuiltInCard(
      front: 'I get eight hours of sleep',
      back: 'Я сплю восемь часов',
      pronunciation: 'ай гет эйт ауэрз эв слип',
      transcription: '/aɪ ɡet eɪt ˈaʊərz əv sliːp/',
      example:
          'Sleep is crucial for health. I get eight hours of sleep every night.',
      notes: 'Сон',
      imageUrl: 'https://source.unsplash.com/400x300/?sleep,rest',
      videoUrl:
          'https://youglish.com/pronounce/eight%20hours%20of%20sleep/english/us'),
  BuiltInCard(
      front: 'The team won the championship',
      back: 'Команда выиграла чемпионат',
      pronunciation: 'дэ тим уон дэ чэмпиэншип',
      transcription: '/ðə tiːm wɒn ðə ˈtʃæmpiənʃɪp/',
      example: 'After years of hard work. The team won the championship.',
      notes: 'Победа',
      imageUrl: 'https://source.unsplash.com/400x300/?championship,trophy',
      videoUrl:
          'https://youglish.com/pronounce/won%20the%20championship/english/us'),
  BuiltInCard(
      front: 'I do stretching every morning',
      back: 'Каждое утро я делаю растяжку',
      pronunciation: 'ай ду стрэчинг эври морнинг',
      transcription: '/aɪ duː ˈstretʃɪŋ ˈevri ˈmɔːrnɪŋ/',
      example: 'It prevents injury. I do stretching every morning.',
      notes: 'Разминка',
      imageUrl: 'https://source.unsplash.com/400x300/?stretching,morning',
      videoUrl: 'https://youglish.com/pronounce/do%20stretching/english/us'),
  BuiltInCard(
      front: 'He injured his knee during the match',
      back: 'Во время матча он травмировал колено',
      pronunciation: 'хи инджэрд хиз ни дьюринг дэ мэч',
      transcription: '/hiː ˈɪndʒərd hɪz niː ˈdjʊərɪŋ ðə mætʃ/',
      example:
          'He had to leave the field. He injured his knee during the match.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?injury,knee',
      videoUrl:
          'https://youglish.com/pronounce/injured%20his%20knee/english/us'),
  BuiltInCard(
      front: 'I avoid junk food',
      back: 'Я избегаю фастфуда',
      pronunciation: 'ай эвойд джанк фуд',
      transcription: '/aɪ əˈvɔɪd dʒʌŋk fuːd/',
      example: 'It is bad for you. I avoid junk food as much as possible.',
      notes: 'Питание',
      imageUrl: 'https://source.unsplash.com/400x300/?junk,food',
      videoUrl:
          'https://youglish.com/pronounce/avoid%20junk%20food/english/us'),
  BuiltInCard(
      front: 'She cycles to work every day',
      back: 'Каждый день она едет на работу на велосипеде',
      pronunciation: 'ши сайклз ту уэрк эври дэй',
      transcription: '/ʃiː ˈsaɪklz tə wɜːrk ˈevri deɪ/',
      example: 'It keeps her fit. She cycles to work every day.',
      notes: 'Активность',
      imageUrl: 'https://source.unsplash.com/400x300/?cycling,commute',
      videoUrl: 'https://youglish.com/pronounce/cycles%20to%20work/english/us'),
  BuiltInCard(
      front: 'Mental health is just as important',
      back: 'Психическое здоровье не менее важно',
      pronunciation: 'мэнтэл хэлс из джаст эз импортэнт',
      transcription: '/ˈmentl helθ ɪz dʒʌst æz ɪmˈpɔːrtənt/',
      example:
          'Do not neglect your mind. Mental health is just as important as physical.',
      notes: 'Психическое здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?mental,health',
      videoUrl:
          'https://youglish.com/pronounce/mental%20health%20important/english/us'),
  BuiltInCard(
      front: 'I take vitamins every day',
      back: 'Я принимаю витамины каждый день',
      pronunciation: 'ай тэйк витэминз эври дэй',
      transcription: '/aɪ teɪk ˈvaɪtəmɪnz ˈevri deɪ/',
      example: 'To stay healthy in winter. I take vitamins every day.',
      notes: 'Здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?vitamins,supplements',
      videoUrl: 'https://youglish.com/pronounce/take%20vitamins/english/us'),
  BuiltInCard(
      front: 'I prefer outdoor exercise',
      back: 'Я предпочитаю тренировки на свежем воздухе',
      pronunciation: 'ай прифэр аутдор эксэрсайз',
      transcription: '/aɪ prɪˈfɜːr ˈaʊtdɔːr ˈeksərsaɪz/',
      example: 'The gym feels too closed in. I prefer outdoor exercise.',
      notes: 'Тренировки',
      imageUrl: 'https://source.unsplash.com/400x300/?outdoor,exercise',
      videoUrl: 'https://youglish.com/pronounce/outdoor%20exercise/english/us'),
  BuiltInCard(
      front: 'He broke the world record',
      back: 'Он побил мировой рекорд',
      pronunciation: 'хи броук дэ уэрлд рэкорд',
      transcription: '/hiː broʊk ðə wɜːrld ˈrekərd/',
      example: 'By two full seconds. He broke the world record.',
      notes: 'Достижение',
      imageUrl: 'https://source.unsplash.com/400x300/?world,record',
      videoUrl:
          'https://youglish.com/pronounce/broke%20the%20world%20record/english/us'),
  BuiltInCard(
      front: 'I warm up before exercising',
      back: 'Я разминаюсь перед тренировкой',
      pronunciation: 'ай уорм ап бифор эксэрсайзинг',
      transcription: '/aɪ wɔːrm ʌp bɪˈfɔːr ˈeksərsaɪzɪŋ/',
      example: 'It prevents injury. I always warm up before exercising.',
      notes: 'Разминка',
      imageUrl: 'https://source.unsplash.com/400x300/?warmup,exercise',
      videoUrl:
          'https://youglish.com/pronounce/warm%20up%20before%20exercising/english/us'),
  BuiltInCard(
      front: 'The Olympic Games inspire millions',
      back: 'Олимпийские игры вдохновляют миллионы',
      pronunciation: 'дэ олимпик гэймз инспайр милионз',
      transcription: '/ðə əˈlɪmpɪk ɡeɪmz ɪnˈspaɪər ˈmɪliənz/',
      example:
          'Every four years the world watches. The Olympic Games inspire millions.',
      notes: 'Олимпиада',
      imageUrl: 'https://source.unsplash.com/400x300/?olympic,games',
      videoUrl:
          'https://youglish.com/pronounce/Olympic%20Games%20inspire/english/us'),
  BuiltInCard(
      front: 'I meditate to reduce stress',
      back: 'Я медитирую чтобы снизить стресс',
      pronunciation: 'ай мэдитэйт ту ридьюс стрэс',
      transcription: '/aɪ ˈmedɪteɪt tə rɪˈdjuːs stres/',
      example: 'Just ten minutes a day helps. I meditate to reduce stress.',
      notes: 'Стресс',
      imageUrl: 'https://source.unsplash.com/400x300/?meditation,calm',
      videoUrl:
          'https://youglish.com/pronounce/meditate%20reduce%20stress/english/us'),
  BuiltInCard(
      front: 'A healthy body needs regular exercise',
      back: 'Здоровому телу нужны регулярные тренировки',
      pronunciation: 'э хэлси боди нидз рэгюлэр эксэрсайз',
      transcription: '/ə ˈhelθi ˈbɒdi niːdz ˈreɡjʊlər ˈeksərsaɪz/',
      example:
          'Three times a week is ideal. A healthy body needs regular exercise.',
      notes: 'Совет',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,body',
      videoUrl: 'https://youglish.com/pronounce/regular%20exercise/english/us'),
]);

const _ukSet13 =
    BuiltInSet(name: 'Sport & Healthy Living', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I try to eat a balanced diet',
      back: 'Я намагаюся харчуватися збалансовано',
      pronunciation: 'ай трай ту ит э бэлэнст дайэт',
      transcription: '/aɪ traɪ tə iːt ə ˈbælənst ˈdaɪɪt/',
      example: 'Lots of fruit and vegetables. I try to eat a balanced diet.',
      notes: 'Харчування',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,food',
      videoUrl: 'https://youglish.com/pronounce/balanced%20diet/english/us'),
  BuiltInCard(
      front: 'He plays football every Saturday',
      back: 'По суботах він грає у футбол',
      pronunciation: 'хи плэйз футбол эври сатэрдэй',
      transcription: '/hiː pleɪz ˈfʊtbɔːl ˈevri ˈsætərdeɪ/',
      example: 'He is on a local team. He plays football every Saturday.',
      notes: 'Командний спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?football,team',
      videoUrl: 'https://youglish.com/pronounce/plays%20football/english/us'),
  BuiltInCard(
      front: 'I am training for a marathon',
      back: 'Я тренуюся до марафону',
      pronunciation: 'ай эм трэйнинг фор э марэсон',
      transcription: '/aɪ æm ˈtreɪnɪŋ fər ə ˈmærəθɒn/',
      example: 'Running twenty miles a week. I am training for a marathon.',
      notes: 'Біг',
      imageUrl: 'https://source.unsplash.com/400x300/?marathon,running',
      videoUrl:
          'https://youglish.com/pronounce/training%20for%20a%20marathon/english/us'),
  BuiltInCard(
      front: 'I drink two litres of water a day',
      back: 'Я п\'ю два літри води на день',
      pronunciation: 'ай дринк ту литэрз эв уотэр э дэй',
      transcription: '/aɪ drɪŋk tuː ˈliːtərz əv ˈwɔːtər ə deɪ/',
      example: 'Hydration is key. I drink two litres of water a day.',
      notes: 'Гідратація',
      imageUrl: 'https://source.unsplash.com/400x300/?water,hydration',
      videoUrl:
          'https://youglish.com/pronounce/litres%20of%20water/english/us'),
  BuiltInCard(
      front: 'She is a professional tennis player',
      back: 'Вона професійна тенісистка',
      pronunciation: 'ши из э профэшэнэл тэнис плэйэр',
      transcription: '/ʃiː ɪz ə prəˈfeʃənl ˈtenɪs ˈpleɪər/',
      example: 'She has won three titles. She is a professional tennis player.',
      notes: 'Теніс',
      imageUrl: 'https://source.unsplash.com/400x300/?tennis,player',
      videoUrl:
          'https://youglish.com/pronounce/professional%20tennis%20player/english/us'),
  BuiltInCard(
      front: 'I gave up smoking last year',
      back: 'Минулого року я кинув курити',
      pronunciation: 'ай гэйв ап смоукинг ласт йир',
      transcription: '/aɪ ɡeɪv ʌp ˈsmoʊkɪŋ lɑːst jɪr/',
      example: 'Best decision ever. I gave up smoking last year.',
      notes: 'Здоровий спосіб життя',
      imageUrl: 'https://source.unsplash.com/400x300/?quit,smoking',
      videoUrl:
          'https://youglish.com/pronounce/gave%20up%20smoking/english/us'),
  BuiltInCard(
      front: 'I get eight hours of sleep',
      back: 'Я сплю вісім годин',
      pronunciation: 'ай гет эйт ауэрз эв слип',
      transcription: '/aɪ ɡet eɪt ˈaʊərz əv sliːp/',
      example:
          'Sleep is crucial for health. I get eight hours of sleep every night.',
      notes: 'Сон',
      imageUrl: 'https://source.unsplash.com/400x300/?sleep,rest',
      videoUrl:
          'https://youglish.com/pronounce/eight%20hours%20of%20sleep/english/us'),
  BuiltInCard(
      front: 'The team won the championship',
      back: 'Команда виграла чемпіонат',
      pronunciation: 'дэ тим уон дэ чэмпиэншип',
      transcription: '/ðə tiːm wɒn ðə ˈtʃæmpiənʃɪp/',
      example: 'After years of hard work. The team won the championship.',
      notes: 'Перемога',
      imageUrl: 'https://source.unsplash.com/400x300/?championship,trophy',
      videoUrl:
          'https://youglish.com/pronounce/won%20the%20championship/english/us'),
  BuiltInCard(
      front: 'I do stretching every morning',
      back: 'Щоранку я роблю розтяжку',
      pronunciation: 'ай ду стрэчинг эври морнинг',
      transcription: '/aɪ duː ˈstretʃɪŋ ˈevri ˈmɔːrnɪŋ/',
      example: 'It prevents injury. I do stretching every morning.',
      notes: 'Розминка',
      imageUrl: 'https://source.unsplash.com/400x300/?stretching,morning',
      videoUrl: 'https://youglish.com/pronounce/do%20stretching/english/us'),
  BuiltInCard(
      front: 'He injured his knee during the match',
      back: 'Під час матчу він травмував коліно',
      pronunciation: 'хи инджэрд хиз ни дьюринг дэ мэч',
      transcription: '/hiː ˈɪndʒərd hɪz niː ˈdjʊərɪŋ ðə mætʃ/',
      example:
          'He had to leave the field. He injured his knee during the match.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?injury,knee',
      videoUrl:
          'https://youglish.com/pronounce/injured%20his%20knee/english/us'),
  BuiltInCard(
      front: 'I avoid junk food',
      back: 'Я уникаю фастфуду',
      pronunciation: 'ай эвойд джанк фуд',
      transcription: '/aɪ əˈvɔɪd dʒʌŋk fuːd/',
      example: 'It is bad for you. I avoid junk food as much as possible.',
      notes: 'Харчування',
      imageUrl: 'https://source.unsplash.com/400x300/?junk,food',
      videoUrl:
          'https://youglish.com/pronounce/avoid%20junk%20food/english/us'),
  BuiltInCard(
      front: 'She cycles to work every day',
      back: 'Щодня вона їде на роботу на велосипеді',
      pronunciation: 'ши сайклз ту уэрк эври дэй',
      transcription: '/ʃiː ˈsaɪklz tə wɜːrk ˈevri deɪ/',
      example: 'It keeps her fit. She cycles to work every day.',
      notes: 'Активність',
      imageUrl: 'https://source.unsplash.com/400x300/?cycling,commute',
      videoUrl: 'https://youglish.com/pronounce/cycles%20to%20work/english/us'),
  BuiltInCard(
      front: 'Mental health is just as important',
      back: 'Психічне здоров\'я не менш важливе',
      pronunciation: 'мэнтэл хэлс из джаст эз импортэнт',
      transcription: '/ˈmentl helθ ɪz dʒʌst æz ɪmˈpɔːrtənt/',
      example:
          'Do not neglect your mind. Mental health is just as important as physical.',
      notes: 'Психічне здоров\'я',
      imageUrl: 'https://source.unsplash.com/400x300/?mental,health',
      videoUrl:
          'https://youglish.com/pronounce/mental%20health%20important/english/us'),
  BuiltInCard(
      front: 'I take vitamins every day',
      back: 'Я приймаю вітаміни щодня',
      pronunciation: 'ай тэйк витэминз эври дэй',
      transcription: '/aɪ teɪk ˈvaɪtəmɪnz ˈevri deɪ/',
      example: 'To stay healthy in winter. I take vitamins every day.',
      notes: 'Здоров\'я',
      imageUrl: 'https://source.unsplash.com/400x300/?vitamins,supplements',
      videoUrl: 'https://youglish.com/pronounce/take%20vitamins/english/us'),
  BuiltInCard(
      front: 'I prefer outdoor exercise',
      back: 'Я надаю перевагу тренуванням на свіжому повітрі',
      pronunciation: 'ай прифэр аутдор эксэрсайз',
      transcription: '/aɪ prɪˈfɜːr ˈaʊtdɔːr ˈeksərsaɪz/',
      example: 'The gym feels too closed in. I prefer outdoor exercise.',
      notes: 'Тренування',
      imageUrl: 'https://source.unsplash.com/400x300/?outdoor,exercise',
      videoUrl: 'https://youglish.com/pronounce/outdoor%20exercise/english/us'),
  BuiltInCard(
      front: 'He broke the world record',
      back: 'Він побив світовий рекорд',
      pronunciation: 'хи броук дэ уэрлд рэкорд',
      transcription: '/hiː broʊk ðə wɜːrld ˈrekərd/',
      example: 'By two full seconds. He broke the world record.',
      notes: 'Досягнення',
      imageUrl: 'https://source.unsplash.com/400x300/?world,record',
      videoUrl:
          'https://youglish.com/pronounce/broke%20the%20world%20record/english/us'),
  BuiltInCard(
      front: 'I warm up before exercising',
      back: 'Я розминаюся перед тренуванням',
      pronunciation: 'ай уорм ап бифор эксэрсайзинг',
      transcription: '/aɪ wɔːrm ʌp bɪˈfɔːr ˈeksərsaɪzɪŋ/',
      example: 'It prevents injury. I always warm up before exercising.',
      notes: 'Розминка',
      imageUrl: 'https://source.unsplash.com/400x300/?warmup,exercise',
      videoUrl:
          'https://youglish.com/pronounce/warm%20up%20before%20exercising/english/us'),
  BuiltInCard(
      front: 'The Olympic Games inspire millions',
      back: 'Олімпійські ігри надихають мільйони',
      pronunciation: 'дэ олимпик гэймз инспайр милионз',
      transcription: '/ðə əˈlɪmpɪk ɡeɪmz ɪnˈspaɪər ˈmɪliənz/',
      example:
          'Every four years the world watches. The Olympic Games inspire millions.',
      notes: 'Олімпіада',
      imageUrl: 'https://source.unsplash.com/400x300/?olympic,games',
      videoUrl:
          'https://youglish.com/pronounce/Olympic%20Games%20inspire/english/us'),
  BuiltInCard(
      front: 'I meditate to reduce stress',
      back: 'Я медитую щоб знизити стрес',
      pronunciation: 'ай мэдитэйт ту ридьюс стрэс',
      transcription: '/aɪ ˈmedɪteɪt tə rɪˈdjuːs stres/',
      example: 'Just ten minutes a day helps. I meditate to reduce stress.',
      notes: 'Стрес',
      imageUrl: 'https://source.unsplash.com/400x300/?meditation,calm',
      videoUrl:
          'https://youglish.com/pronounce/meditate%20reduce%20stress/english/us'),
  BuiltInCard(
      front: 'A healthy body needs regular exercise',
      back: 'Здоровому тілу потрібні регулярні тренування',
      pronunciation: 'э хэлси боди нидз рэгюлэр эксэрсайз',
      transcription: '/ə ˈhelθi ˈbɒdi niːdz ˈreɡjʊlər ˈeksərsaɪz/',
      example:
          'Three times a week is ideal. A healthy body needs regular exercise.',
      notes: 'Порада',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,body',
      videoUrl: 'https://youglish.com/pronounce/regular%20exercise/english/us'),
]);

// ============================================================
// 14 — Work & Career
// ============================================================

const _ruSet14 = BuiltInSet(name: 'Work & Career', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I applied for a new job',
      back: 'Я подал заявку на новую работу',
      pronunciation: 'ай эплайд фор э ню джоб',
      transcription: '/aɪ əˈplaɪd fər ə njuː dʒɒb/',
      example: 'I sent my CV yesterday. I applied for a new job.',
      notes: 'Поиск работы',
      imageUrl: 'https://source.unsplash.com/400x300/?job,apply',
      videoUrl:
          'https://youglish.com/pronounce/applied%20for%20a%20job/english/us'),
  BuiltInCard(
      front: 'I had a job interview today',
      back: 'Сегодня у меня было собеседование',
      pronunciation: 'ай хэд э джоб интэрвью тудэй',
      transcription: '/aɪ hæd ə dʒɒb ˈɪntərvjuː təˈdeɪ/',
      example: 'I think it went well. I had a job interview today.',
      notes: 'Собеседование',
      imageUrl: 'https://source.unsplash.com/400x300/?interview,office',
      videoUrl: 'https://youglish.com/pronounce/job%20interview/english/us'),
  BuiltInCard(
      front: 'She got promoted last month',
      back: 'В прошлом месяце её повысили',
      pronunciation: 'ши гот промоутид ласт мансс',
      transcription: '/ʃiː ɡɒt prəˈmoʊtɪd lɑːst mʌnθ/',
      example: 'All her hard work paid off. She got promoted last month.',
      notes: 'Карьера',
      imageUrl: 'https://source.unsplash.com/400x300/?promotion,career',
      videoUrl: 'https://youglish.com/pronounce/got%20promoted/english/us'),
  BuiltInCard(
      front: 'I work overtime sometimes',
      back: 'Иногда я работаю сверхурочно',
      pronunciation: 'ай уэрк оувэртайм самтаймз',
      transcription: '/aɪ wɜːrk ˈoʊvərtaɪm ˈsʌmtaɪmz/',
      example: 'The deadlines are tight. I work overtime sometimes.',
      notes: 'Переработка',
      imageUrl: 'https://source.unsplash.com/400x300/?overtime,work',
      videoUrl: 'https://youglish.com/pronounce/work%20overtime/english/us'),
  BuiltInCard(
      front: 'I am self-employed',
      back: 'Я самозанятый',
      pronunciation: 'ай эм сэлф-эмплойд',
      transcription: '/aɪ æm ˌself ɪmˈplɔɪd/',
      example: 'I run my own business. I am self-employed.',
      notes: 'Занятость',
      imageUrl: 'https://source.unsplash.com/400x300/?freelance,work',
      videoUrl: 'https://youglish.com/pronounce/self-employed/english/us'),
  BuiltInCard(
      front: 'We have a team meeting every Monday',
      back: 'У нас совещание каждый понедельник',
      pronunciation: 'уи хэв э тим митинг эври мандэй',
      transcription: '/wiː hæv ə tiːm ˈmiːtɪŋ ˈevri ˈmʌndeɪ/',
      example: 'We review the week ahead. We have a team meeting every Monday.',
      notes: 'Офис',
      imageUrl: 'https://source.unsplash.com/400x300/?meeting,team',
      videoUrl: 'https://youglish.com/pronounce/team%20meeting/english/us'),
  BuiltInCard(
      front: 'I handed in my resignation',
      back: 'Я подал заявление об увольнении',
      pronunciation: 'ай хэндид ин май рэзигнэйшэн',
      transcription: '/aɪ ˈhændɪd ɪn maɪ ˌrezɪɡˈneɪʃən/',
      example: 'I need a new challenge. I handed in my resignation.',
      notes: 'Увольнение',
      imageUrl: 'https://source.unsplash.com/400x300/?resignation,letter',
      videoUrl:
          'https://youglish.com/pronounce/handed%20in%20resignation/english/us'),
  BuiltInCard(
      front: 'My boss is very demanding',
      back: 'Мой начальник очень требовательный',
      pronunciation: 'май бос из вэри димандинг',
      transcription: '/maɪ bɒs ɪz ˈveri dɪˈmɑːndɪŋ/',
      example: 'He expects perfection. My boss is very demanding.',
      notes: 'Руководство',
      imageUrl: 'https://source.unsplash.com/400x300/?boss,office',
      videoUrl: 'https://youglish.com/pronounce/boss%20demanding/english/us'),
  BuiltInCard(
      front: 'I am on a tight deadline',
      back: 'У меня жёсткий дедлайн',
      pronunciation: 'ай эм он э тайт дэдлайн',
      transcription: '/aɪ æm ɒn ə taɪt ˈdedlaɪn/',
      example: 'I cannot talk right now. I am on a tight deadline.',
      notes: 'Давление',
      imageUrl: 'https://source.unsplash.com/400x300/?deadline,stress',
      videoUrl: 'https://youglish.com/pronounce/tight%20deadline/english/us'),
  BuiltInCard(
      front: 'She runs her own company',
      back: 'Она управляет собственной компанией',
      pronunciation: 'ши ранз хэр оун камэни',
      transcription: '/ʃiː rʌnz hɜːr oʊn ˈkʌmpəni/',
      example: 'She started it five years ago. She runs her own company.',
      notes: 'Предпринимательство',
      imageUrl: 'https://source.unsplash.com/400x300/?entrepreneur,company',
      videoUrl:
          'https://youglish.com/pronounce/runs%20her%20own%20company/english/us'),
  BuiltInCard(
      front: 'I work in the IT sector',
      back: 'Я работаю в сфере IT',
      pronunciation: 'ай уэрк ин дэ ай ти сэктор',
      transcription: '/aɪ wɜːrk ɪn ðə aɪ tiː ˈsektər/',
      example: 'Software development mainly. I work in the IT sector.',
      notes: 'Сфера',
      imageUrl: 'https://source.unsplash.com/400x300/?IT,technology',
      videoUrl: 'https://youglish.com/pronounce/IT%20sector/english/us'),
  BuiltInCard(
      front: 'I need to update my CV',
      back: 'Мне нужно обновить резюме',
      pronunciation: 'ай нид ту апдэйт май си ви',
      transcription: '/aɪ niːd tə ʌpˈdeɪt maɪ siː viː/',
      example: 'Before sending applications. I need to update my CV.',
      notes: 'Поиск работы',
      imageUrl: 'https://source.unsplash.com/400x300/?cv,resume',
      videoUrl: 'https://youglish.com/pronounce/update%20my%20CV/english/us'),
  BuiltInCard(
      front: 'The company offers flexible hours',
      back: 'Компания предлагает гибкий график',
      pronunciation: 'дэ камэни офэрз флэксибэл ауэрз',
      transcription: '/ðə ˈkʌmpəni ˈɒfərz ˈfleksɪbl ˈaʊərz/',
      example:
          'A great work-life balance perk. The company offers flexible hours.',
      notes: 'Условия',
      imageUrl: 'https://source.unsplash.com/400x300/?flexible,work',
      videoUrl: 'https://youglish.com/pronounce/flexible%20hours/english/us'),
  BuiltInCard(
      front: 'I got a pay rise',
      back: 'Мне повысили зарплату',
      pronunciation: 'ай гот э пэй райз',
      transcription: '/aɪ ɡɒt ə peɪ raɪz/',
      example: 'After my annual review. I got a pay rise.',
      notes: 'Зарплата',
      imageUrl: 'https://source.unsplash.com/400x300/?salary,raise',
      videoUrl: 'https://youglish.com/pronounce/pay%20rise/english/us'),
  BuiltInCard(
      front: 'I am between jobs at the moment',
      back: 'Сейчас я в поиске работы',
      pronunciation: 'ай эм битуин джобз эт дэ моумэнт',
      transcription: '/aɪ æm bɪˈtwiːn dʒɒbz æt ðə ˈmoʊmənt/',
      example:
          'I left my last position in March. I am between jobs at the moment.',
      notes: 'Безработица',
      imageUrl: 'https://source.unsplash.com/400x300/?unemployed,search',
      videoUrl: 'https://youglish.com/pronounce/between%20jobs/english/us'),
  BuiltInCard(
      front: 'Networking is key in this industry',
      back: 'Нетворкинг важен в этой отрасли',
      pronunciation: 'нэтуэркинг из ки ин дис индастри',
      transcription: '/ˈnetwɜːrkɪŋ ɪz kiː ɪn ðɪs ˈɪndəstri/',
      example: 'Know the right people. Networking is key in this industry.',
      notes: 'Связи',
      imageUrl: 'https://source.unsplash.com/400x300/?networking,business',
      videoUrl:
          'https://youglish.com/pronounce/networking%20industry/english/us'),
  BuiltInCard(
      front: 'I work in a open-plan office',
      back: 'Я работаю в офисе открытой планировки',
      pronunciation: 'ай уэрк ин эн оупэн-плэн офис',
      transcription: '/aɪ wɜːrk ɪn ən ˈoʊpən plæn ˈɒfɪs/',
      example:
          'No private desks, very collaborative. I work in an open-plan office.',
      notes: 'Офис',
      imageUrl: 'https://source.unsplash.com/400x300/?openplan,office',
      videoUrl: 'https://youglish.com/pronounce/open-plan%20office/english/us'),
  BuiltInCard(
      front: 'I have good time management skills',
      back: 'У меня хорошие навыки тайм-менеджмента',
      pronunciation: 'ай хэв гуд тайм мэнэджмэнт скилз',
      transcription: '/aɪ hæv ɡʊd taɪm ˈmænɪdʒmənt skɪlz/',
      example:
          'I always meet my deadlines. I have good time management skills.',
      notes: 'Навыки',
      imageUrl: 'https://source.unsplash.com/400x300/?time,management',
      videoUrl:
          'https://youglish.com/pronounce/time%20management%20skills/english/us'),
  BuiltInCard(
      front: 'She is climbing the career ladder',
      back: 'Она поднимается по карьерной лестнице',
      pronunciation: 'ши из клаймбинг дэ кариэр лэдэр',
      transcription: '/ʃiː ɪz ˈklaɪmɪŋ ðə kəˈrɪər ˈlædər/',
      example:
          'A new promotion every two years. She is climbing the career ladder.',
      notes: 'Карьерный рост',
      imageUrl: 'https://source.unsplash.com/400x300/?career,ladder',
      videoUrl: 'https://youglish.com/pronounce/career%20ladder/english/us'),
  BuiltInCard(
      front: 'I took a career break to travel',
      back: 'Я взял перерыв в карьере чтобы путешествовать',
      pronunciation: 'ай тук э кариэр брэйк ту трэвэл',
      transcription: '/aɪ tʊk ə kəˈrɪər breɪk tə ˈtrævl/',
      example: 'Best decision of my life. I took a career break to travel.',
      notes: 'Пауза',
      imageUrl: 'https://source.unsplash.com/400x300/?career,break',
      videoUrl: 'https://youglish.com/pronounce/career%20break/english/us'),
]);

const _ukSet14 = BuiltInSet(name: 'Work & Career', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I applied for a new job',
      back: 'Я подав заявку на нову роботу',
      pronunciation: 'ай эплайд фор э ню джоб',
      transcription: '/aɪ əˈplaɪd fər ə njuː dʒɒb/',
      example: 'I sent my CV yesterday. I applied for a new job.',
      notes: 'Пошук роботи',
      imageUrl: 'https://source.unsplash.com/400x300/?job,apply',
      videoUrl:
          'https://youglish.com/pronounce/applied%20for%20a%20job/english/us'),
  BuiltInCard(
      front: 'I had a job interview today',
      back: 'Сьогодні у мене була співбесіда',
      pronunciation: 'ай хэд э джоб интэрвью тудэй',
      transcription: '/aɪ hæd ə dʒɒb ˈɪntərvjuː təˈdeɪ/',
      example: 'I think it went well. I had a job interview today.',
      notes: 'Співбесіда',
      imageUrl: 'https://source.unsplash.com/400x300/?interview,office',
      videoUrl: 'https://youglish.com/pronounce/job%20interview/english/us'),
  BuiltInCard(
      front: 'She got promoted last month',
      back: 'Минулого місяця її підвищили',
      pronunciation: 'ши гот промоутид ласт мансс',
      transcription: '/ʃiː ɡɒt prəˈmoʊtɪd lɑːst mʌnθ/',
      example: 'All her hard work paid off. She got promoted last month.',
      notes: 'Кар\'єра',
      imageUrl: 'https://source.unsplash.com/400x300/?promotion,career',
      videoUrl: 'https://youglish.com/pronounce/got%20promoted/english/us'),
  BuiltInCard(
      front: 'I work overtime sometimes',
      back: 'Іноді я працюю понаднормово',
      pronunciation: 'ай уэрк оувэртайм самтаймз',
      transcription: '/aɪ wɜːrk ˈoʊvərtaɪm ˈsʌmtaɪmz/',
      example: 'The deadlines are tight. I work overtime sometimes.',
      notes: 'Переробка',
      imageUrl: 'https://source.unsplash.com/400x300/?overtime,work',
      videoUrl: 'https://youglish.com/pronounce/work%20overtime/english/us'),
  BuiltInCard(
      front: 'I am self-employed',
      back: 'Я самозайнятий',
      pronunciation: 'ай эм сэлф-эмплойд',
      transcription: '/aɪ æm ˌself ɪmˈplɔɪd/',
      example: 'I run my own business. I am self-employed.',
      notes: 'Зайнятість',
      imageUrl: 'https://source.unsplash.com/400x300/?freelance,work',
      videoUrl: 'https://youglish.com/pronounce/self-employed/english/us'),
  BuiltInCard(
      front: 'We have a team meeting every Monday',
      back: 'У нас нарада щопонеділка',
      pronunciation: 'уи хэв э тим митинг эври мандэй',
      transcription: '/wiː hæv ə tiːm ˈmiːtɪŋ ˈevri ˈmʌndeɪ/',
      example: 'We review the week ahead. We have a team meeting every Monday.',
      notes: 'Офіс',
      imageUrl: 'https://source.unsplash.com/400x300/?meeting,team',
      videoUrl: 'https://youglish.com/pronounce/team%20meeting/english/us'),
  BuiltInCard(
      front: 'I handed in my resignation',
      back: 'Я подав заяву про звільнення',
      pronunciation: 'ай хэндид ин май рэзигнэйшэн',
      transcription: '/aɪ ˈhændɪd ɪn maɪ ˌrezɪɡˈneɪʃən/',
      example: 'I need a new challenge. I handed in my resignation.',
      notes: 'Звільнення',
      imageUrl: 'https://source.unsplash.com/400x300/?resignation,letter',
      videoUrl:
          'https://youglish.com/pronounce/handed%20in%20resignation/english/us'),
  BuiltInCard(
      front: 'My boss is very demanding',
      back: 'Мій начальник дуже вимогливий',
      pronunciation: 'май бос из вэри димандинг',
      transcription: '/maɪ bɒs ɪz ˈveri dɪˈmɑːndɪŋ/',
      example: 'He expects perfection. My boss is very demanding.',
      notes: 'Керівництво',
      imageUrl: 'https://source.unsplash.com/400x300/?boss,office',
      videoUrl: 'https://youglish.com/pronounce/boss%20demanding/english/us'),
  BuiltInCard(
      front: 'I am on a tight deadline',
      back: 'У мене жорсткий дедлайн',
      pronunciation: 'ай эм он э тайт дэдлайн',
      transcription: '/aɪ æm ɒn ə taɪt ˈdedlaɪn/',
      example: 'I cannot talk right now. I am on a tight deadline.',
      notes: 'Тиск',
      imageUrl: 'https://source.unsplash.com/400x300/?deadline,stress',
      videoUrl: 'https://youglish.com/pronounce/tight%20deadline/english/us'),
  BuiltInCard(
      front: 'She runs her own company',
      back: 'Вона керує власною компанією',
      pronunciation: 'ши ранз хэр оун камэни',
      transcription: '/ʃiː rʌnz hɜːr oʊn ˈkʌmpəni/',
      example: 'She started it five years ago. She runs her own company.',
      notes: 'Підприємництво',
      imageUrl: 'https://source.unsplash.com/400x300/?entrepreneur,company',
      videoUrl:
          'https://youglish.com/pronounce/runs%20her%20own%20company/english/us'),
  BuiltInCard(
      front: 'I work in the IT sector',
      back: 'Я працюю у сфері IT',
      pronunciation: 'ай уэрк ин дэ ай ти сэктор',
      transcription: '/aɪ wɜːrk ɪn ðə aɪ tiː ˈsektər/',
      example: 'Software development mainly. I work in the IT sector.',
      notes: 'Сфера',
      imageUrl: 'https://source.unsplash.com/400x300/?IT,technology',
      videoUrl: 'https://youglish.com/pronounce/IT%20sector/english/us'),
  BuiltInCard(
      front: 'I need to update my CV',
      back: 'Мені потрібно оновити резюме',
      pronunciation: 'ай нид ту апдэйт май си ви',
      transcription: '/aɪ niːd tə ʌpˈdeɪt maɪ siː viː/',
      example: 'Before sending applications. I need to update my CV.',
      notes: 'Пошук роботи',
      imageUrl: 'https://source.unsplash.com/400x300/?cv,resume',
      videoUrl: 'https://youglish.com/pronounce/update%20my%20CV/english/us'),
  BuiltInCard(
      front: 'The company offers flexible hours',
      back: 'Компанія пропонує гнучкий графік',
      pronunciation: 'дэ камэни офэрз флэксибэл ауэрз',
      transcription: '/ðə ˈkʌmpəni ˈɒfərz ˈfleksɪbl ˈaʊərz/',
      example:
          'A great work-life balance perk. The company offers flexible hours.',
      notes: 'Умови',
      imageUrl: 'https://source.unsplash.com/400x300/?flexible,work',
      videoUrl: 'https://youglish.com/pronounce/flexible%20hours/english/us'),
  BuiltInCard(
      front: 'I got a pay rise',
      back: 'Мені підвищили зарплату',
      pronunciation: 'ай гот э пэй райз',
      transcription: '/aɪ ɡɒt ə peɪ raɪz/',
      example: 'After my annual review. I got a pay rise.',
      notes: 'Зарплата',
      imageUrl: 'https://source.unsplash.com/400x300/?salary,raise',
      videoUrl: 'https://youglish.com/pronounce/pay%20rise/english/us'),
  BuiltInCard(
      front: 'I am between jobs at the moment',
      back: 'Зараз я в пошуку роботи',
      pronunciation: 'ай эм битуин джобз эт дэ моумэнт',
      transcription: '/aɪ æm bɪˈtwiːn dʒɒbz æt ðə ˈmoʊmənt/',
      example:
          'I left my last position in March. I am between jobs at the moment.',
      notes: 'Безробіття',
      imageUrl: 'https://source.unsplash.com/400x300/?unemployed,search',
      videoUrl: 'https://youglish.com/pronounce/between%20jobs/english/us'),
  BuiltInCard(
      front: 'Networking is key in this industry',
      back: 'Нетворкінг важливий у цій галузі',
      pronunciation: 'нэтуэркинг из ки ин дис индастри',
      transcription: '/ˈnetwɜːrkɪŋ ɪz kiː ɪn ðɪs ˈɪndəstri/',
      example: 'Know the right people. Networking is key in this industry.',
      notes: 'Зв\'язки',
      imageUrl: 'https://source.unsplash.com/400x300/?networking,business',
      videoUrl:
          'https://youglish.com/pronounce/networking%20industry/english/us'),
  BuiltInCard(
      front: 'I work in a open-plan office',
      back: 'Я працюю в офісі відкритого планування',
      pronunciation: 'ай уэрк ин эн оупэн-плэн офис',
      transcription: '/aɪ wɜːrk ɪn ən ˈoʊpən plæn ˈɒfɪs/',
      example:
          'No private desks, very collaborative. I work in an open-plan office.',
      notes: 'Офіс',
      imageUrl: 'https://source.unsplash.com/400x300/?openplan,office',
      videoUrl: 'https://youglish.com/pronounce/open-plan%20office/english/us'),
  BuiltInCard(
      front: 'I have good time management skills',
      back: 'У мене гарні навички тайм-менеджменту',
      pronunciation: 'ай хэв гуд тайм мэнэджмэнт скилз',
      transcription: '/aɪ hæv ɡʊd taɪm ˈmænɪdʒmənt skɪlz/',
      example:
          'I always meet my deadlines. I have good time management skills.',
      notes: 'Навички',
      imageUrl: 'https://source.unsplash.com/400x300/?time,management',
      videoUrl:
          'https://youglish.com/pronounce/time%20management%20skills/english/us'),
  BuiltInCard(
      front: 'She is climbing the career ladder',
      back: 'Вона піднімається кар\'єрними сходами',
      pronunciation: 'ши из клаймбинг дэ кариэр лэдэр',
      transcription: '/ʃiː ɪz ˈklaɪmɪŋ ðə kəˈrɪər ˈlædər/',
      example:
          'A new promotion every two years. She is climbing the career ladder.',
      notes: 'Кар\'єрне зростання',
      imageUrl: 'https://source.unsplash.com/400x300/?career,ladder',
      videoUrl: 'https://youglish.com/pronounce/career%20ladder/english/us'),
  BuiltInCard(
      front: 'I took a career break to travel',
      back: 'Я взяв перерву в кар\'єрі щоб подорожувати',
      pronunciation: 'ай тук э кариэр брэйк ту трэвэл',
      transcription: '/aɪ tʊk ə kəˈrɪər breɪk tə ˈtrævl/',
      example: 'Best decision of my life. I took a career break to travel.',
      notes: 'Пауза',
      imageUrl: 'https://source.unsplash.com/400x300/?career,break',
      videoUrl: 'https://youglish.com/pronounce/career%20break/english/us'),
]);

// ============================================================
// 15 — Technology & The Internet (B1)
// ============================================================

const _ruSet15 =
    BuiltInSet(name: 'Technology & The Internet', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I use social media every day',
      back: 'Я пользуюсь социальными сетями каждый день',
      pronunciation: 'ай юз соушэл мэдиэ эври дэй',
      transcription: '/aɪ juːz ˈsoʊʃl ˈmiːdiə ˈevri deɪ/',
      example: 'Mostly Instagram and Twitter. I use social media every day.',
      notes: 'Соцсети',
      imageUrl: 'https://source.unsplash.com/400x300/?social,media',
      videoUrl:
          'https://youglish.com/pronounce/social%20media%20every%20day/english/us'),
  BuiltInCard(
      front: 'My phone battery is dead',
      back: 'Батарея моего телефона разряжена',
      pronunciation: 'май фоун бэтэри из дэд',
      transcription: '/maɪ foʊn ˈbætəri ɪz ded/',
      example: 'I cannot call you. My phone battery is dead.',
      notes: 'Телефон',
      imageUrl: 'https://source.unsplash.com/400x300/?phone,battery',
      videoUrl:
          'https://youglish.com/pronounce/phone%20battery%20dead/english/us'),
  BuiltInCard(
      front: 'The WiFi is really slow today',
      back: 'Сегодня WiFi очень медленный',
      pronunciation: 'дэ уайфай из риэли слоу тудэй',
      transcription: '/ðə ˈwaɪfaɪ ɪz ˈrɪəli sloʊ təˈdeɪ/',
      example: 'I cannot stream anything. The WiFi is really slow today.',
      notes: 'Интернет',
      imageUrl: 'https://source.unsplash.com/400x300/?wifi,slow',
      videoUrl: 'https://youglish.com/pronounce/wifi%20slow/english/us'),
  BuiltInCard(
      front: 'I need to update my software',
      back: 'Мне нужно обновить программное обеспечение',
      pronunciation: 'ай нид ту апдэйт май софтуэр',
      transcription: '/aɪ niːd tə ʌpˈdeɪt maɪ ˈsɒftweər/',
      example:
          'There is a new version available. I need to update my software.',
      notes: 'Программы',
      imageUrl: 'https://source.unsplash.com/400x300/?software,update',
      videoUrl:
          'https://youglish.com/pronounce/update%20my%20software/english/us'),
  BuiltInCard(
      front: 'I got a spam email',
      back: 'Я получил спам на почту',
      pronunciation: 'ай гот э спэм имэйл',
      transcription: '/aɪ ɡɒt ə spæm ˈiːmeɪl/',
      example: 'Do not click that link. I got a spam email again.',
      notes: 'Безопасность',
      imageUrl: 'https://source.unsplash.com/400x300/?spam,email',
      videoUrl: 'https://youglish.com/pronounce/spam%20email/english/us'),
  BuiltInCard(
      front: 'I back up my files regularly',
      back: 'Я регулярно делаю резервные копии файлов',
      pronunciation: 'ай бэк ап май файлз рэгюлэрли',
      transcription: '/aɪ bæk ʌp maɪ faɪlz ˈreɡjʊlərli/',
      example:
          'Just in case the hard drive fails. I back up my files regularly.',
      notes: 'Безопасность данных',
      imageUrl: 'https://source.unsplash.com/400x300/?backup,cloud',
      videoUrl: 'https://youglish.com/pronounce/back%20up%20files/english/us'),
  BuiltInCard(
      front: 'I shop online a lot',
      back: 'Я часто делаю покупки в интернете',
      pronunciation: 'ай шоп онлайн э лот',
      transcription: '/aɪ ʃɒp ˈɒnlaɪn ə lɒt/',
      example: 'It is so convenient. I shop online a lot.',
      notes: 'Интернет',
      imageUrl: 'https://source.unsplash.com/400x300/?online,shopping',
      videoUrl: 'https://youglish.com/pronounce/shop%20online/english/us'),
  BuiltInCard(
      front: 'My password was hacked',
      back: 'Мой пароль взломали',
      pronunciation: 'май пасуэрд уоз хэкт',
      transcription: '/maɪ ˈpæswɜːrd wɒz hækt/',
      example: 'I had to change everything. My password was hacked.',
      notes: 'Безопасность',
      imageUrl: 'https://source.unsplash.com/400x300/?hacked,password',
      videoUrl: 'https://youglish.com/pronounce/password%20hacked/english/us'),
  BuiltInCard(
      front: 'I cannot find that file',
      back: 'Я не могу найти этот файл',
      pronunciation: 'ай кэннот файнд дэт файл',
      transcription: '/aɪ ˈkænɒt faɪnd ðæt faɪl/',
      example: 'Did you save it? I cannot find that file anywhere.',
      notes: 'Компьютер',
      imageUrl: 'https://source.unsplash.com/400x300/?file,computer',
      videoUrl:
          'https://youglish.com/pronounce/cannot%20find%20the%20file/english/us'),
  BuiltInCard(
      front: 'My laptop keeps crashing',
      back: 'Мой ноутбук постоянно зависает',
      pronunciation: 'май лэптоп кипс крэшинг',
      transcription: '/maɪ ˈlæptɒp kiːps ˈkræʃɪŋ/',
      example: 'I need a new one. My laptop keeps crashing.',
      notes: 'Проблемы с ПК',
      imageUrl: 'https://source.unsplash.com/400x300/?laptop,crash',
      videoUrl: 'https://youglish.com/pronounce/laptop%20crashing/english/us'),
  BuiltInCard(
      front: 'I use a VPN for privacy',
      back: 'Я использую VPN для защиты конфиденциальности',
      pronunciation: 'ай юз э ви пи эн фор прайвэси',
      transcription: '/aɪ juːz ə viː piː en fər ˈpraɪvəsi/',
      example: 'Especially on public WiFi. I use a VPN for privacy.',
      notes: 'Конфиденциальность',
      imageUrl: 'https://source.unsplash.com/400x300/?vpn,privacy',
      videoUrl: 'https://youglish.com/pronounce/use%20a%20VPN/english/us'),
  BuiltInCard(
      front: 'Artificial intelligence is changing everything',
      back: 'Искусственный интеллект меняет всё',
      pronunciation: 'артифишэл интэлиджэнс из чэйнджинг эврисинг',
      transcription: '/ˌɑːrtɪˈfɪʃl ɪnˈtelɪdʒəns ɪz ˈtʃeɪndʒɪŋ ˈevriθɪŋ/',
      example:
          'From medicine to art. Artificial intelligence is changing everything.',
      notes: 'Будущее',
      imageUrl: 'https://source.unsplash.com/400x300/?AI,technology',
      videoUrl:
          'https://youglish.com/pronounce/artificial%20intelligence/english/us'),
  BuiltInCard(
      front: 'I have two-factor authentication on',
      back: 'У меня включена двухфакторная аутентификация',
      pronunciation: 'ай хэв ту-фэктор осэнтикэйшэн он',
      transcription: '/aɪ hæv tuː ˈfæktər ɔːˌθentɪˈkeɪʃən ɒn/',
      example: 'It protects my accounts. I have two-factor authentication on.',
      notes: 'Безопасность',
      imageUrl: 'https://source.unsplash.com/400x300/?security,authentication',
      videoUrl:
          'https://youglish.com/pronounce/two-factor%20authentication/english/us'),
  BuiltInCard(
      front: 'I stream films on Netflix',
      back: 'Я смотрю фильмы на Netflix',
      pronunciation: 'ай стрим филмз он нэтфликс',
      transcription: '/aɪ striːm fɪlmz ɒn ˈnetflɪks/',
      example: 'Every evening after dinner. I stream films on Netflix.',
      notes: 'Развлечения',
      imageUrl: 'https://source.unsplash.com/400x300/?netflix,streaming',
      videoUrl:
          'https://youglish.com/pronounce/stream%20on%20Netflix/english/us'),
  BuiltInCard(
      front: 'I deleted the app by mistake',
      back: 'Я случайно удалил приложение',
      pronunciation: 'ай дэлитид дэ эп бай мистэйк',
      transcription: '/aɪ dɪˈliːtɪd ðə æp baɪ mɪˈsteɪk/',
      example: 'Now I have to reinstall it. I deleted the app by mistake.',
      notes: 'Ошибки',
      imageUrl: 'https://source.unsplash.com/400x300/?delete,app',
      videoUrl:
          'https://youglish.com/pronounce/deleted%20the%20app/english/us'),
  BuiltInCard(
      front: 'The internet connection is unstable',
      back: 'Интернет соединение нестабильное',
      pronunciation: 'дэ интэрнэт конэкшэн из анстэйбэл',
      transcription: '/ðə ˈɪntənet kəˈnekʃən ɪz ʌnˈsteɪbl/',
      example: 'The call keeps dropping. The internet connection is unstable.',
      notes: 'Интернет',
      imageUrl: 'https://source.unsplash.com/400x300/?internet,unstable',
      videoUrl:
          'https://youglish.com/pronounce/internet%20connection%20unstable/english/us'),
  BuiltInCard(
      front: 'I do video calls for work',
      back: 'Я провожу видеозвонки по работе',
      pronunciation: 'ай ду видио колз фор уэрк',
      transcription: '/aɪ duː ˈvɪdiəʊ kɔːlz fər wɜːrk/',
      example: 'Mostly on Zoom. I do video calls for work every day.',
      notes: 'Работа',
      imageUrl: 'https://source.unsplash.com/400x300/?video,call',
      videoUrl:
          'https://youglish.com/pronounce/video%20calls%20for%20work/english/us'),
  BuiltInCard(
      front: 'Technology moves faster than ever',
      back: 'Технологии развиваются быстрее, чем когда-либо',
      pronunciation: 'тэкнолэджи мувз фастэр дэн эвэр',
      transcription: '/tekˈnɒlədʒi muːvz ˈfɑːstər ðæn ˈevər/',
      example: 'Hard to keep up. Technology moves faster than ever.',
      notes: 'Тренды',
      imageUrl: 'https://source.unsplash.com/400x300/?technology,future',
      videoUrl:
          'https://youglish.com/pronounce/technology%20moves%20fast/english/us'),
  BuiltInCard(
      front: 'I use cloud storage for my documents',
      back: 'Я использую облачное хранилище для документов',
      pronunciation: 'ай юз клауд сторидж фор май докюмэнтс',
      transcription: '/aɪ juːz klaʊd ˈstɔːrɪdʒ fər maɪ ˈdɒkjʊmənts/',
      example: 'Google Drive mainly. I use cloud storage for my documents.',
      notes: 'Хранилище',
      imageUrl: 'https://source.unsplash.com/400x300/?cloud,storage',
      videoUrl: 'https://youglish.com/pronounce/cloud%20storage/english/us'),
  BuiltInCard(
      front: 'I am addicted to my smartphone',
      back: 'Я завишу от смартфона',
      pronunciation: 'ай эм эдиктид ту май смартфоун',
      transcription: '/aɪ æm əˈdɪktɪd tə maɪ ˈsmɑːrtfoʊn/',
      example: 'I check it every five minutes. I am addicted to my smartphone.',
      notes: 'Зависимость',
      imageUrl: 'https://source.unsplash.com/400x300/?smartphone,addiction',
      videoUrl:
          'https://youglish.com/pronounce/addicted%20to%20smartphone/english/us'),
]);

const _ukSet15 =
    BuiltInSet(name: 'Technology & The Internet', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I use social media every day',
      back: 'Я користуюся соціальними мережами щодня',
      pronunciation: 'ай юз соушэл мэдиэ эври дэй',
      transcription: '/aɪ juːz ˈsoʊʃl ˈmiːdiə ˈevri deɪ/',
      example: 'Mostly Instagram and Twitter. I use social media every day.',
      notes: 'Соцмережі',
      imageUrl: 'https://source.unsplash.com/400x300/?social,media',
      videoUrl:
          'https://youglish.com/pronounce/social%20media%20every%20day/english/us'),
  BuiltInCard(
      front: 'My phone battery is dead',
      back: 'Батарея мого телефону розряджена',
      pronunciation: 'май фоун бэтэри из дэд',
      transcription: '/maɪ foʊn ˈbætəri ɪz ded/',
      example: 'I cannot call you. My phone battery is dead.',
      notes: 'Телефон',
      imageUrl: 'https://source.unsplash.com/400x300/?phone,battery',
      videoUrl:
          'https://youglish.com/pronounce/phone%20battery%20dead/english/us'),
  BuiltInCard(
      front: 'The WiFi is really slow today',
      back: 'Сьогодні WiFi дуже повільний',
      pronunciation: 'дэ уайфай из риэли слоу тудэй',
      transcription: '/ðə ˈwaɪfaɪ ɪz ˈrɪəli sloʊ təˈdeɪ/',
      example: 'I cannot stream anything. The WiFi is really slow today.',
      notes: 'Інтернет',
      imageUrl: 'https://source.unsplash.com/400x300/?wifi,slow',
      videoUrl: 'https://youglish.com/pronounce/wifi%20slow/english/us'),
  BuiltInCard(
      front: 'I need to update my software',
      back: 'Мені потрібно оновити програмне забезпечення',
      pronunciation: 'ай нид ту апдэйт май софтуэр',
      transcription: '/aɪ niːd tə ʌpˈdeɪt maɪ ˈsɒftweər/',
      example:
          'There is a new version available. I need to update my software.',
      notes: 'Програми',
      imageUrl: 'https://source.unsplash.com/400x300/?software,update',
      videoUrl:
          'https://youglish.com/pronounce/update%20my%20software/english/us'),
  BuiltInCard(
      front: 'I got a spam email',
      back: 'Я отримав спам на пошту',
      pronunciation: 'ай гот э спэм имэйл',
      transcription: '/aɪ ɡɒt ə spæm ˈiːmeɪl/',
      example: 'Do not click that link. I got a spam email again.',
      notes: 'Безпека',
      imageUrl: 'https://source.unsplash.com/400x300/?spam,email',
      videoUrl: 'https://youglish.com/pronounce/spam%20email/english/us'),
  BuiltInCard(
      front: 'I back up my files regularly',
      back: 'Я регулярно роблю резервні копії файлів',
      pronunciation: 'ай бэк ап май файлз рэгюлэрли',
      transcription: '/aɪ bæk ʌp maɪ faɪlz ˈreɡjʊlərli/',
      example:
          'Just in case the hard drive fails. I back up my files regularly.',
      notes: 'Безпека даних',
      imageUrl: 'https://source.unsplash.com/400x300/?backup,cloud',
      videoUrl: 'https://youglish.com/pronounce/back%20up%20files/english/us'),
  BuiltInCard(
      front: 'I shop online a lot',
      back: 'Я часто роблю покупки в інтернеті',
      pronunciation: 'ай шоп онлайн э лот',
      transcription: '/aɪ ʃɒp ˈɒnlaɪn ə lɒt/',
      example: 'It is so convenient. I shop online a lot.',
      notes: 'Інтернет',
      imageUrl: 'https://source.unsplash.com/400x300/?online,shopping',
      videoUrl: 'https://youglish.com/pronounce/shop%20online/english/us'),
  BuiltInCard(
      front: 'My password was hacked',
      back: 'Мій пароль зламали',
      pronunciation: 'май пасуэрд уоз хэкт',
      transcription: '/maɪ ˈpæswɜːrd wɒz hækt/',
      example: 'I had to change everything. My password was hacked.',
      notes: 'Безпека',
      imageUrl: 'https://source.unsplash.com/400x300/?hacked,password',
      videoUrl: 'https://youglish.com/pronounce/password%20hacked/english/us'),
  BuiltInCard(
      front: 'I cannot find that file',
      back: 'Я не можу знайти цей файл',
      pronunciation: 'ай кэннот файнд дэт файл',
      transcription: '/aɪ ˈkænɒt faɪnd ðæt faɪl/',
      example: 'Did you save it? I cannot find that file anywhere.',
      notes: 'Комп\'ютер',
      imageUrl: 'https://source.unsplash.com/400x300/?file,computer',
      videoUrl:
          'https://youglish.com/pronounce/cannot%20find%20the%20file/english/us'),
  BuiltInCard(
      front: 'My laptop keeps crashing',
      back: 'Мій ноутбук постійно зависає',
      pronunciation: 'май лэптоп кипс крэшинг',
      transcription: '/maɪ ˈlæptɒp kiːps ˈkræʃɪŋ/',
      example: 'I need a new one. My laptop keeps crashing.',
      notes: 'Проблеми з ПК',
      imageUrl: 'https://source.unsplash.com/400x300/?laptop,crash',
      videoUrl: 'https://youglish.com/pronounce/laptop%20crashing/english/us'),
  BuiltInCard(
      front: 'I use a VPN for privacy',
      back: 'Я використовую VPN для конфіденційності',
      pronunciation: 'ай юз э ви пи эн фор прайвэси',
      transcription: '/aɪ juːz ə viː piː en fər ˈpraɪvəsi/',
      example: 'Especially on public WiFi. I use a VPN for privacy.',
      notes: 'Конфіденційність',
      imageUrl: 'https://source.unsplash.com/400x300/?vpn,privacy',
      videoUrl: 'https://youglish.com/pronounce/use%20a%20VPN/english/us'),
  BuiltInCard(
      front: 'Artificial intelligence is changing everything',
      back: 'Штучний інтелект змінює все',
      pronunciation: 'артифишэл интэлиджэнс из чэйнджинг эврисинг',
      transcription: '/ˌɑːrtɪˈfɪʃl ɪnˈtelɪdʒəns ɪz ˈtʃeɪndʒɪŋ ˈevriθɪŋ/',
      example:
          'From medicine to art. Artificial intelligence is changing everything.',
      notes: 'Майбутнє',
      imageUrl: 'https://source.unsplash.com/400x300/?AI,technology',
      videoUrl:
          'https://youglish.com/pronounce/artificial%20intelligence/english/us'),
  BuiltInCard(
      front: 'I have two-factor authentication on',
      back: 'У мене увімкнена двофакторна автентифікація',
      pronunciation: 'ай хэв ту-фэктор осэнтикэйшэн он',
      transcription: '/aɪ hæv tuː ˈfæktər ɔːˌθentɪˈkeɪʃən ɒn/',
      example: 'It protects my accounts. I have two-factor authentication on.',
      notes: 'Безпека',
      imageUrl: 'https://source.unsplash.com/400x300/?security,authentication',
      videoUrl:
          'https://youglish.com/pronounce/two-factor%20authentication/english/us'),
  BuiltInCard(
      front: 'I stream films on Netflix',
      back: 'Я дивлюся фільми на Netflix',
      pronunciation: 'ай стрим филмз он нэтфликс',
      transcription: '/aɪ striːm fɪlmz ɒn ˈnetflɪks/',
      example: 'Every evening after dinner. I stream films on Netflix.',
      notes: 'Розваги',
      imageUrl: 'https://source.unsplash.com/400x300/?netflix,streaming',
      videoUrl:
          'https://youglish.com/pronounce/stream%20on%20Netflix/english/us'),
  BuiltInCard(
      front: 'I deleted the app by mistake',
      back: 'Я випадково видалив додаток',
      pronunciation: 'ай дэлитид дэ эп бай мистэйк',
      transcription: '/aɪ dɪˈliːtɪd ðə æp baɪ mɪˈsteɪk/',
      example: 'Now I have to reinstall it. I deleted the app by mistake.',
      notes: 'Помилки',
      imageUrl: 'https://source.unsplash.com/400x300/?delete,app',
      videoUrl:
          'https://youglish.com/pronounce/deleted%20the%20app/english/us'),
  BuiltInCard(
      front: 'The internet connection is unstable',
      back: 'Інтернет з\'єднання нестабільне',
      pronunciation: 'дэ интэрнэт конэкшэн из анстэйбэл',
      transcription: '/ðə ˈɪntənet kəˈnekʃən ɪz ʌnˈsteɪbl/',
      example: 'The call keeps dropping. The internet connection is unstable.',
      notes: 'Інтернет',
      imageUrl: 'https://source.unsplash.com/400x300/?internet,unstable',
      videoUrl:
          'https://youglish.com/pronounce/internet%20connection%20unstable/english/us'),
  BuiltInCard(
      front: 'I do video calls for work',
      back: 'Я проводжу відеодзвінки по роботі',
      pronunciation: 'ай ду видио колз фор уэрк',
      transcription: '/aɪ duː ˈvɪdiəʊ kɔːlz fər wɜːrk/',
      example: 'Mostly on Zoom. I do video calls for work every day.',
      notes: 'Робота',
      imageUrl: 'https://source.unsplash.com/400x300/?video,call',
      videoUrl:
          'https://youglish.com/pronounce/video%20calls%20for%20work/english/us'),
  BuiltInCard(
      front: 'Technology moves faster than ever',
      back: 'Технології розвиваються швидше ніж будь-коли',
      pronunciation: 'тэкнолэджи мувз фастэр дэн эвэр',
      transcription: '/tekˈnɒlədʒi muːvz ˈfɑːstər ðæn ˈevər/',
      example: 'Hard to keep up. Technology moves faster than ever.',
      notes: 'Тренди',
      imageUrl: 'https://source.unsplash.com/400x300/?technology,future',
      videoUrl:
          'https://youglish.com/pronounce/technology%20moves%20fast/english/us'),
  BuiltInCard(
      front: 'I use cloud storage for my documents',
      back: 'Я використовую хмарне сховище для документів',
      pronunciation: 'ай юз клауд сторидж фор май докюмэнтс',
      transcription: '/aɪ juːz klaʊd ˈstɔːrɪdʒ fər maɪ ˈdɒkjʊmənts/',
      example: 'Google Drive mainly. I use cloud storage for my documents.',
      notes: 'Сховище',
      imageUrl: 'https://source.unsplash.com/400x300/?cloud,storage',
      videoUrl: 'https://youglish.com/pronounce/cloud%20storage/english/us'),
  BuiltInCard(
      front: 'I am addicted to my smartphone',
      back: 'Я залежний від смартфона',
      pronunciation: 'ай эм эдиктид ту май смартфоун',
      transcription: '/aɪ æm əˈdɪktɪd tə maɪ ˈsmɑːrtfoʊn/',
      example: 'I check it every five minutes. I am addicted to my smartphone.',
      notes: 'Залежність',
      imageUrl: 'https://source.unsplash.com/400x300/?smartphone,addiction',
      videoUrl:
          'https://youglish.com/pronounce/addicted%20to%20smartphone/english/us'),
]);
// END OF PART 4

// ============================================================
// 16 — Business English (B2)
// ============================================================

const _ruSet16 = BuiltInSet(name: 'Business English', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'Let us schedule a meeting',
      back: 'Давайте назначим встречу',
      pronunciation: 'лэт ас скэджул э митинг',
      transcription: '/let ʌs ˈskedʒuːl ə ˈmiːtɪŋ/',
      example:
          'We need to discuss the proposal. Let us schedule a meeting for Thursday.',
      notes: 'Деловая речь',
      imageUrl: 'https://source.unsplash.com/400x300/?business,meeting',
      videoUrl:
          'https://youglish.com/pronounce/schedule%20a%20meeting/english/us'),
  BuiltInCard(
      front: 'I would like to propose a solution',
      back: 'Я хотел бы предложить решение',
      pronunciation: 'ай вуд лайк ту пропоуз э солюшэн',
      transcription: '/aɪ wʊd laɪk tə prəˈpoʊz ə səˈluːʃən/',
      example: 'After reviewing the data I would like to propose a solution.',
      notes: 'Переговоры',
      imageUrl: 'https://source.unsplash.com/400x300/?proposal,business',
      videoUrl:
          'https://youglish.com/pronounce/propose%20a%20solution/english/us'),
  BuiltInCard(
      front: 'Could you clarify that point?',
      back: 'Не могли бы вы уточнить этот момент?',
      pronunciation: 'куд ю клэрифай дэт пойнт',
      transcription: '/kʊd juː ˈklærɪfaɪ ðæt pɔɪnt/',
      example: 'I did not quite follow. Could you clarify that point please?',
      notes: 'Переговоры',
      imageUrl: 'https://source.unsplash.com/400x300/?clarify,meeting',
      videoUrl:
          'https://youglish.com/pronounce/clarify%20that%20point/english/us'),
  BuiltInCard(
      front: 'We need to cut costs',
      back: 'Нам нужно сократить расходы',
      pronunciation: 'уи нид ту кат костс',
      transcription: '/wiː niːd tə kʌt kɒsts/',
      example: 'Revenue is down this quarter. We need to cut costs urgently.',
      notes: 'Финансы',
      imageUrl: 'https://source.unsplash.com/400x300/?costs,budget',
      videoUrl: 'https://youglish.com/pronounce/cut%20costs/english/us'),
  BuiltInCard(
      front: 'The quarterly results are promising',
      back: 'Квартальные результаты обнадёживают',
      pronunciation: 'дэ куортэрли ризалтс ар промисинг',
      transcription: '/ðə ˈkwɔːrtərli rɪˈzʌlts ɑːr ˈprɒmɪsɪŋ/',
      example:
          'Sales are up by twelve percent. The quarterly results are promising.',
      notes: 'Отчётность',
      imageUrl: 'https://source.unsplash.com/400x300/?quarterly,results',
      videoUrl:
          'https://youglish.com/pronounce/quarterly%20results/english/us'),
  BuiltInCard(
      front: 'I will follow up by email',
      back: 'Я напишу дополнительно по электронной почте',
      pronunciation: 'ай уил фолоу ап бай имэйл',
      transcription: '/aɪ wɪl ˈfɒloʊ ʌp baɪ ˈiːmeɪl/',
      example:
          'Great discussion today. I will follow up by email with the details.',
      notes: 'Коммуникация',
      imageUrl: 'https://source.unsplash.com/400x300/?email,followup',
      videoUrl:
          'https://youglish.com/pronounce/follow%20up%20by%20email/english/us'),
  BuiltInCard(
      front: 'We are on the same page',
      back: 'Мы понимаем друг друга',
      pronunciation: 'уи ар он дэ сэйм пэйдж',
      transcription: '/wiː ɑːr ɒn ðə seɪm peɪdʒ/',
      example: 'Good. I am glad we are on the same page about the strategy.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?agreement,team',
      videoUrl:
          'https://youglish.com/pronounce/on%20the%20same%20page/english/us'),
  BuiltInCard(
      front: 'Let us touch base next week',
      back: 'Давайте свяжемся на следующей неделе',
      pronunciation: 'лэт ас тач бэйс нэкст уик',
      transcription: '/let ʌs tʌtʃ beɪs nekst wiːk/',
      example: 'I need more time to review. Let us touch base next week.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?touch,base',
      videoUrl: 'https://youglish.com/pronounce/touch%20base/english/us'),
  BuiltInCard(
      front: 'The deadline is non-negotiable',
      back: 'Дедлайн не обсуждается',
      pronunciation: 'дэ дэдлайн из нон-нэгоушиэбэл',
      transcription: '/ðə ˈdedlaɪn ɪz nɒn nɪˈɡoʊʃiəbl/',
      example:
          'The client expects delivery on Friday. The deadline is non-negotiable.',
      notes: 'Дедлайн',
      imageUrl: 'https://source.unsplash.com/400x300/?deadline,firm',
      videoUrl:
          'https://youglish.com/pronounce/non-negotiable%20deadline/english/us'),
  BuiltInCard(
      front: 'We need to think outside the box',
      back: 'Нам нужно мыслить нестандартно',
      pronunciation: 'уи нид ту синк аутсайд дэ бокс',
      transcription: '/wiː niːd tə θɪŋk ˌaʊtˈsaɪd ðə bɒks/',
      example:
          'The usual approach is not working. We need to think outside the box.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?creative,thinking',
      videoUrl:
          'https://youglish.com/pronounce/think%20outside%20the%20box/english/us'),
  BuiltInCard(
      front: 'Could we revisit that issue?',
      back: 'Могли бы мы вернуться к этому вопросу?',
      pronunciation: 'куд уи ривизит дэт ишью',
      transcription: '/kʊd wiː ˌriːˈvɪzɪt ðæt ˈɪʃuː/',
      example:
          'Something came up since last time. Could we revisit that issue?',
      notes: 'Совещание',
      imageUrl: 'https://source.unsplash.com/400x300/?revisit,meeting',
      videoUrl:
          'https://youglish.com/pronounce/revisit%20the%20issue/english/us'),
  BuiltInCard(
      front: 'I would like to table this for now',
      back: 'Я хотел бы пока отложить это',
      pronunciation: 'ай вуд лайк ту тэйбэл дис фор нау',
      transcription: '/aɪ wʊd laɪk tə ˈteɪbl ðɪs fər naʊ/',
      example:
          'We are running out of time. I would like to table this for now.',
      notes: 'Совещание',
      imageUrl: 'https://source.unsplash.com/400x300/?table,agenda',
      videoUrl:
          'https://youglish.com/pronounce/table%20this%20for%20now/english/us'),
  BuiltInCard(
      front: 'Our revenue has increased by twenty percent',
      back: 'Наша выручка выросла на двадцать процентов',
      pronunciation: 'ауэр рэвэню хэз инкрист бай туэнти пэрсэнт',
      transcription: '/aʊər ˈrevənjuː hæz ɪnˈkriːst baɪ ˈtwenti pəˈsent/',
      example:
          'Compared to last year. Our revenue has increased by twenty percent.',
      notes: 'Финансы',
      imageUrl: 'https://source.unsplash.com/400x300/?revenue,growth',
      videoUrl:
          'https://youglish.com/pronounce/revenue%20increased/english/us'),
  BuiltInCard(
      front: 'Please action this as soon as possible',
      back: 'Пожалуйста выполните это как можно скорее',
      pronunciation: 'плиз экшэн дис эз сун эз посибэл',
      transcription: '/pliːz ˈækʃən ðɪs æz suːn æz ˈpɒsɪbl/',
      example:
          'This is a priority item. Please action this as soon as possible.',
      notes: 'Задача',
      imageUrl: 'https://source.unsplash.com/400x300/?action,task',
      videoUrl:
          'https://youglish.com/pronounce/action%20as%20soon%20as%20possible/english/us'),
  BuiltInCard(
      front: 'I will take that on board',
      back: 'Я приму это к сведению',
      pronunciation: 'ай уил тэйк дэт он борд',
      transcription: '/aɪ wɪl teɪk ðæt ɒn bɔːrd/',
      example: 'Thank you for the feedback. I will take that on board.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?feedback,board',
      videoUrl:
          'https://youglish.com/pronounce/take%20that%20on%20board/english/us'),
  BuiltInCard(
      front: 'We need to align on the strategy',
      back: 'Нам нужно согласовать стратегию',
      pronunciation: 'уи нид ту элайн он дэ стрэтэджи',
      transcription: '/wiː niːd tə əˈlaɪn ɒn ðə ˈstrætədʒi/',
      example: 'Before we proceed. We need to align on the strategy.',
      notes: 'Стратегия',
      imageUrl: 'https://source.unsplash.com/400x300/?strategy,align',
      videoUrl:
          'https://youglish.com/pronounce/align%20on%20strategy/english/us'),
  BuiltInCard(
      front: 'The client signed the contract',
      back: 'Клиент подписал контракт',
      pronunciation: 'дэ клайэнт сайнд дэ контракт',
      transcription: '/ðə ˈklaɪənt saɪnd ðə ˈkɒntrækt/',
      example: 'After months of negotiations. The client signed the contract.',
      notes: 'Контракт',
      imageUrl: 'https://source.unsplash.com/400x300/?contract,sign',
      videoUrl:
          'https://youglish.com/pronounce/signed%20the%20contract/english/us'),
  BuiltInCard(
      front: 'We are ahead of schedule',
      back: 'Мы опережаем график',
      pronunciation: 'уи ар эхэд эв скэджул',
      transcription: '/wiː ɑːr əˈhed əv ˈskedʒuːl/',
      example: 'The team worked incredibly hard. We are ahead of schedule.',
      notes: 'Прогресс',
      imageUrl: 'https://source.unsplash.com/400x300/?schedule,ahead',
      videoUrl:
          'https://youglish.com/pronounce/ahead%20of%20schedule/english/us'),
  BuiltInCard(
      front: 'Let us move on to the next agenda item',
      back: 'Давайте перейдём к следующему пункту повестки',
      pronunciation: 'лэт ас мув он ту дэ нэкст эджэндэ айтэм',
      transcription: '/let ʌs muːv ɒn tə ðə nekst əˈdʒendə ˈaɪtəm/',
      example:
          'We have covered that topic well. Let us move on to the next agenda item.',
      notes: 'Совещание',
      imageUrl: 'https://source.unsplash.com/400x300/?agenda,meeting',
      videoUrl:
          'https://youglish.com/pronounce/next%20agenda%20item/english/us'),
  BuiltInCard(
      front: 'I will circulate the minutes after the meeting',
      back: 'Я разошлю протокол после совещания',
      pronunciation: 'ай уил сёркюлэйт дэ минитс афтэр дэ митинг',
      transcription: '/aɪ wɪl ˈsɜːrkjʊleɪt ðə ˈmɪnɪts ˈɑːftər ðə ˈmiːtɪŋ/',
      example:
          'So everyone has a record. I will circulate the minutes after the meeting.',
      notes: 'Протокол',
      imageUrl: 'https://source.unsplash.com/400x300/?minutes,notes',
      videoUrl:
          'https://youglish.com/pronounce/circulate%20the%20minutes/english/us'),
]);

const _ukSet16 = BuiltInSet(name: 'Business English', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'Let us schedule a meeting',
      back: 'Давайте призначимо зустріч',
      pronunciation: 'лэт ас скэджул э митинг',
      transcription: '/let ʌs ˈskedʒuːl ə ˈmiːtɪŋ/',
      example:
          'We need to discuss the proposal. Let us schedule a meeting for Thursday.',
      notes: 'Ділова мова',
      imageUrl: 'https://source.unsplash.com/400x300/?business,meeting',
      videoUrl:
          'https://youglish.com/pronounce/schedule%20a%20meeting/english/us'),
  BuiltInCard(
      front: 'I would like to propose a solution',
      back: 'Я хотів би запропонувати рішення',
      pronunciation: 'ай вуд лайк ту пропоуз э солюшэн',
      transcription: '/aɪ wʊd laɪk tə prəˈpoʊz ə səˈluːʃən/',
      example: 'After reviewing the data I would like to propose a solution.',
      notes: 'Переговори',
      imageUrl: 'https://source.unsplash.com/400x300/?proposal,business',
      videoUrl:
          'https://youglish.com/pronounce/propose%20a%20solution/english/us'),
  BuiltInCard(
      front: 'Could you clarify that point?',
      back: 'Чи не могли б ви уточнити цей момент?',
      pronunciation: 'куд ю клэрифай дэт пойнт',
      transcription: '/kʊd juː ˈklærɪfaɪ ðæt pɔɪnt/',
      example: 'I did not quite follow. Could you clarify that point please?',
      notes: 'Переговори',
      imageUrl: 'https://source.unsplash.com/400x300/?clarify,meeting',
      videoUrl:
          'https://youglish.com/pronounce/clarify%20that%20point/english/us'),
  BuiltInCard(
      front: 'We need to cut costs',
      back: 'Нам потрібно скоротити витрати',
      pronunciation: 'уи нид ту кат костс',
      transcription: '/wiː niːd tə kʌt kɒsts/',
      example: 'Revenue is down this quarter. We need to cut costs urgently.',
      notes: 'Фінанси',
      imageUrl: 'https://source.unsplash.com/400x300/?costs,budget',
      videoUrl: 'https://youglish.com/pronounce/cut%20costs/english/us'),
  BuiltInCard(
      front: 'The quarterly results are promising',
      back: 'Квартальні результати є обнадійливими',
      pronunciation: 'дэ куортэрли ризалтс ар промисинг',
      transcription: '/ðə ˈkwɔːrtərli rɪˈzʌlts ɑːr ˈprɒmɪsɪŋ/',
      example:
          'Sales are up by twelve percent. The quarterly results are promising.',
      notes: 'Звітність',
      imageUrl: 'https://source.unsplash.com/400x300/?quarterly,results',
      videoUrl:
          'https://youglish.com/pronounce/quarterly%20results/english/us'),
  BuiltInCard(
      front: 'I will follow up by email',
      back: 'Я напишу додатково електронною поштою',
      pronunciation: 'ай уил фолоу ап бай имэйл',
      transcription: '/aɪ wɪl ˈfɒloʊ ʌp baɪ ˈiːmeɪl/',
      example:
          'Great discussion today. I will follow up by email with the details.',
      notes: 'Комунікація',
      imageUrl: 'https://source.unsplash.com/400x300/?email,followup',
      videoUrl:
          'https://youglish.com/pronounce/follow%20up%20by%20email/english/us'),
  BuiltInCard(
      front: 'We are on the same page',
      back: 'Ми розуміємо одне одного',
      pronunciation: 'уи ар он дэ сэйм пэйдж',
      transcription: '/wiː ɑːr ɒn ðə seɪm peɪdʒ/',
      example: 'Good. I am glad we are on the same page about the strategy.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?agreement,team',
      videoUrl:
          'https://youglish.com/pronounce/on%20the%20same%20page/english/us'),
  BuiltInCard(
      front: 'Let us touch base next week',
      back: "Давайте зв'яжемося наступного тижня",
      pronunciation: 'лэт ас тач бэйс нэкст уик',
      transcription: '/let ʌs tʌtʃ beɪs nekst wiːk/',
      example: 'I need more time to review. Let us touch base next week.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?touch,base',
      videoUrl: 'https://youglish.com/pronounce/touch%20base/english/us'),
  BuiltInCard(
      front: 'The deadline is non-negotiable',
      back: 'Дедлайн не обговорюється',
      pronunciation: 'дэ дэдлайн из нон-нэгоушиэбэл',
      transcription: '/ðə ˈdedlaɪn ɪz nɒn nɪˈɡoʊʃiəbl/',
      example:
          'The client expects delivery on Friday. The deadline is non-negotiable.',
      notes: 'Дедлайн',
      imageUrl: 'https://source.unsplash.com/400x300/?deadline,firm',
      videoUrl:
          'https://youglish.com/pronounce/non-negotiable%20deadline/english/us'),
  BuiltInCard(
      front: 'We need to think outside the box',
      back: 'Нам потрібно мислити нестандартно',
      pronunciation: 'уи нид ту синк аутсайд дэ бокс',
      transcription: '/wiː niːd tə θɪŋk ˌaʊtˈsaɪd ðə bɒks/',
      example:
          'The usual approach is not working. We need to think outside the box.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?creative,thinking',
      videoUrl:
          'https://youglish.com/pronounce/think%20outside%20the%20box/english/us'),
  BuiltInCard(
      front: 'Could we revisit that issue?',
      back: 'Чи могли б ми повернутися до цього питання?',
      pronunciation: 'куд уи ривизит дэт ишью',
      transcription: '/kʊd wiː ˌriːˈvɪzɪt ðæt ˈɪʃuː/',
      example:
          'Something came up since last time. Could we revisit that issue?',
      notes: 'Нарада',
      imageUrl: 'https://source.unsplash.com/400x300/?revisit,meeting',
      videoUrl:
          'https://youglish.com/pronounce/revisit%20the%20issue/english/us'),
  BuiltInCard(
      front: 'I would like to table this for now',
      back: 'Я хотів би поки відкласти це',
      pronunciation: 'ай вуд лайк ту тэйбэл дис фор нау',
      transcription: '/aɪ wʊd laɪk tə ˈteɪbl ðɪs fər naʊ/',
      example:
          'We are running out of time. I would like to table this for now.',
      notes: 'Нарада',
      imageUrl: 'https://source.unsplash.com/400x300/?table,agenda',
      videoUrl:
          'https://youglish.com/pronounce/table%20this%20for%20now/english/us'),
  BuiltInCard(
      front: 'Our revenue has increased by twenty percent',
      back: 'Наш дохід зріс на двадцять відсотків',
      pronunciation: 'ауэр рэвэню хэз инкрист бай туэнти пэрсэнт',
      transcription: '/aʊər ˈrevənjuː hæz ɪnˈkriːst baɪ ˈtwenti pəˈsent/',
      example:
          'Compared to last year. Our revenue has increased by twenty percent.',
      notes: 'Фінанси',
      imageUrl: 'https://source.unsplash.com/400x300/?revenue,growth',
      videoUrl:
          'https://youglish.com/pronounce/revenue%20increased/english/us'),
  BuiltInCard(
      front: 'Please action this as soon as possible',
      back: 'Будь ласка виконайте це якомога швидше',
      pronunciation: 'плиз экшэн дис эз сун эз посибэл',
      transcription: '/pliːz ˈækʃən ðɪs æz suːn æz ˈpɒsɪbl/',
      example:
          'This is a priority item. Please action this as soon as possible.',
      notes: 'Завдання',
      imageUrl: 'https://source.unsplash.com/400x300/?action,task',
      videoUrl:
          'https://youglish.com/pronounce/action%20as%20soon%20as%20possible/english/us'),
  BuiltInCard(
      front: 'I will take that on board',
      back: 'Я візьму це до уваги',
      pronunciation: 'ай уил тэйк дэт он борд',
      transcription: '/aɪ wɪl teɪk ðæt ɒn bɔːrd/',
      example: 'Thank you for the feedback. I will take that on board.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?feedback,board',
      videoUrl:
          'https://youglish.com/pronounce/take%20that%20on%20board/english/us'),
  BuiltInCard(
      front: 'We need to align on the strategy',
      back: 'Нам потрібно узгодити стратегію',
      pronunciation: 'уи нид ту элайн он дэ стрэтэджи',
      transcription: '/wiː niːd tə əˈlaɪn ɒn ðə ˈstrætədʒi/',
      example: 'Before we proceed. We need to align on the strategy.',
      notes: 'Стратегія',
      imageUrl: 'https://source.unsplash.com/400x300/?strategy,align',
      videoUrl:
          'https://youglish.com/pronounce/align%20on%20strategy/english/us'),
  BuiltInCard(
      front: 'The client signed the contract',
      back: 'Клієнт підписав контракт',
      pronunciation: 'дэ клайэнт сайнд дэ контракт',
      transcription: '/ðə ˈklaɪənt saɪnd ðə ˈkɒntrækt/',
      example: 'After months of negotiations. The client signed the contract.',
      notes: 'Контракт',
      imageUrl: 'https://source.unsplash.com/400x300/?contract,sign',
      videoUrl:
          'https://youglish.com/pronounce/signed%20the%20contract/english/us'),
  BuiltInCard(
      front: 'We are ahead of schedule',
      back: 'Ми випереджаємо графік',
      pronunciation: 'уи ар эхэд эв скэджул',
      transcription: '/wiː ɑːr əˈhed əv ˈskedʒuːl/',
      example: 'The team worked incredibly hard. We are ahead of schedule.',
      notes: 'Прогрес',
      imageUrl: 'https://source.unsplash.com/400x300/?schedule,ahead',
      videoUrl:
          'https://youglish.com/pronounce/ahead%20of%20schedule/english/us'),
  BuiltInCard(
      front: 'Let us move on to the next agenda item',
      back: 'Давайте перейдемо до наступного пункту порядку денного',
      pronunciation: 'лэт ас мув он ту дэ нэкст эджэндэ айтэм',
      transcription: '/let ʌs muːv ɒn tə ðə nekst əˈdʒendə ˈaɪtəm/',
      example:
          'We have covered that topic well. Let us move on to the next agenda item.',
      notes: 'Нарада',
      imageUrl: 'https://source.unsplash.com/400x300/?agenda,meeting',
      videoUrl:
          'https://youglish.com/pronounce/next%20agenda%20item/english/us'),
  BuiltInCard(
      front: 'I will circulate the minutes after the meeting',
      back: 'Я розішлю протокол після наради',
      pronunciation: 'ай уил сёркюлэйт дэ минитс афтэр дэ митинг',
      transcription: '/aɪ wɪl ˈsɜːrkjʊleɪt ðə ˈmɪnɪts ˈɑːftər ðə ˈmiːtɪŋ/',
      example:
          'So everyone has a record. I will circulate the minutes after the meeting.',
      notes: 'Протокол',
      imageUrl: 'https://source.unsplash.com/400x300/?minutes,notes',
      videoUrl:
          'https://youglish.com/pronounce/circulate%20the%20minutes/english/us'),
]);

// ============================================================
// 17 — Environment (B2)
// ============================================================

const _ruSet17 = BuiltInSet(name: 'Environment', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'Climate change is a global crisis',
      back: 'Изменение климата — глобальный кризис',
      pronunciation: 'клаймэт чэйндж из э глоубэл крайсис',
      transcription: '/ˈklaɪmɪt tʃeɪndʒ ɪz ə ˈɡloʊbl ˈkraɪsɪs/',
      example: 'We must act now. Climate change is a global crisis.',
      notes: 'Экология',
      imageUrl: 'https://source.unsplash.com/400x300/?climate,change',
      videoUrl:
          'https://youglish.com/pronounce/climate%20change%20global%20crisis/english/us'),
  BuiltInCard(
      front: 'I try to reduce my carbon footprint',
      back: 'Я стараюсь уменьшить свой углеродный след',
      pronunciation: 'ай трай ту ридьюс май карбэн футпринт',
      transcription: '/aɪ traɪ tə rɪˈdjuːs maɪ ˈkɑːrbən ˈfʊtprɪnt/',
      example:
          'By cycling and eating less meat. I try to reduce my carbon footprint.',
      notes: 'Экология',
      imageUrl: 'https://source.unsplash.com/400x300/?carbon,footprint',
      videoUrl: 'https://youglish.com/pronounce/carbon%20footprint/english/us'),
  BuiltInCard(
      front: 'We should use renewable energy',
      back: 'Мы должны использовать возобновляемую энергию',
      pronunciation: 'уи шуд юз ринюэбэл энэрджи',
      transcription: '/wiː ʃʊd juːz rɪˈnjuːəbl ˈenərdʒi/',
      example:
          'Solar and wind power are the future. We should use renewable energy.',
      notes: 'Энергетика',
      imageUrl: 'https://source.unsplash.com/400x300/?renewable,solar',
      videoUrl: 'https://youglish.com/pronounce/renewable%20energy/english/us'),
  BuiltInCard(
      front: 'Plastic pollution is destroying oceans',
      back: 'Пластиковое загрязнение уничтожает океаны',
      pronunciation: 'пластик полюшэн из дистройинг оушэнз',
      transcription: '/ˈplæstɪk pəˈluːʃən ɪz dɪˈstrɔɪɪŋ ˈoʊʃənz/',
      example:
          'Millions of animals die each year. Plastic pollution is destroying oceans.',
      notes: 'Загрязнение',
      imageUrl: 'https://source.unsplash.com/400x300/?plastic,ocean',
      videoUrl:
          'https://youglish.com/pronounce/plastic%20pollution%20oceans/english/us'),
  BuiltInCard(
      front: 'I recycle my waste',
      back: 'Я сортирую мусор',
      pronunciation: 'ай рисайкэл май уэйст',
      transcription: '/aɪ rɪˈsaɪkl maɪ weɪst/',
      example:
          'Glass, paper, and plastic separately. I recycle my waste every week.',
      notes: 'Переработка',
      imageUrl: 'https://source.unsplash.com/400x300/?recycling,bins',
      videoUrl: 'https://youglish.com/pronounce/recycle%20waste/english/us'),
  BuiltInCard(
      front: 'Deforestation is threatening biodiversity',
      back: 'Вырубка лесов угрожает биоразнообразию',
      pronunciation: 'дифорэстэйшэн из срэтэнинг байоудайвёрсити',
      transcription: '/ˌdiːˌfɒrɪˈsteɪʃən ɪz ˈθretnɪŋ ˌbaɪoʊdaɪˈvɜːrsɪti/',
      example:
          'Thousands of species are at risk. Deforestation is threatening biodiversity.',
      notes: 'Леса',
      imageUrl: 'https://source.unsplash.com/400x300/?deforestation,forest',
      videoUrl:
          'https://youglish.com/pronounce/deforestation%20biodiversity/english/us'),
  BuiltInCard(
      front: 'I bring my own shopping bags',
      back: 'Я приношу собственные сумки для покупок',
      pronunciation: 'ай бринг май оун шопинг бэгз',
      transcription: '/aɪ brɪŋ maɪ oʊn ˈʃɒpɪŋ bæɡz/',
      example: 'To avoid plastic waste. I bring my own shopping bags.',
      notes: 'Экопривычки',
      imageUrl: 'https://source.unsplash.com/400x300/?reusable,bag',
      videoUrl:
          'https://youglish.com/pronounce/own%20shopping%20bags/english/us'),
  BuiltInCard(
      front: 'The polar ice caps are melting',
      back: 'Полярные ледяные шапки тают',
      pronunciation: 'дэ поулэр айс кэпс ар мэлтинг',
      transcription: '/ðə ˈpoʊlər aɪs kæps ɑːr ˈmeltɪŋ/',
      example:
          'Sea levels are rising as a result. The polar ice caps are melting.',
      notes: 'Потепление',
      imageUrl: 'https://source.unsplash.com/400x300/?polar,ice',
      videoUrl:
          'https://youglish.com/pronounce/polar%20ice%20caps%20melting/english/us'),
  BuiltInCard(
      front: 'We need to protect endangered species',
      back: 'Нам необходимо защищать исчезающие виды',
      pronunciation: 'уи нид ту протэкт индэйнджэрд спишиз',
      transcription: '/wiː niːd tə prəˈtekt ɪnˈdeɪndʒərd ˈspiːʃiːz/',
      example:
          'Tigers and elephants are at risk. We need to protect endangered species.',
      notes: 'Животные',
      imageUrl: 'https://source.unsplash.com/400x300/?endangered,species',
      videoUrl:
          'https://youglish.com/pronounce/protect%20endangered%20species/english/us'),
  BuiltInCard(
      front: 'Air pollution causes health problems',
      back: 'Загрязнение воздуха вызывает проблемы со здоровьем',
      pronunciation: 'эр полюшэн козэз хэлс проблэмз',
      transcription: '/ɛr pəˈluːʃən kɔːzɪz helθ ˈprɒbləmz/',
      example:
          'Especially in big cities. Air pollution causes health problems.',
      notes: 'Загрязнение',
      imageUrl: 'https://source.unsplash.com/400x300/?air,pollution',
      videoUrl:
          'https://youglish.com/pronounce/air%20pollution%20health/english/us'),
  BuiltInCard(
      front: 'I eat less meat to help the planet',
      back: 'Я ем меньше мяса ради планеты',
      pronunciation: 'ай ит лэс мит ту хэлп дэ плэнэт',
      transcription: '/aɪ iːt les miːt tə help ðə ˈplænɪt/',
      example:
          'Livestock farming is a major emitter. I eat less meat to help the planet.',
      notes: 'Питание',
      imageUrl: 'https://source.unsplash.com/400x300/?vegan,plant',
      videoUrl:
          'https://youglish.com/pronounce/eat%20less%20meat%20planet/english/us'),
  BuiltInCard(
      front: 'Electric cars are better for the environment',
      back: 'Электрические автомобили лучше для окружающей среды',
      pronunciation: 'илэктрик карз ар бэтэр фор дэ инвайрэнмэнт',
      transcription: '/ɪˈlektrɪk kɑːrz ɑːr ˈbetər fər ðə ɪnˈvaɪrənmənt/',
      example:
          'Zero direct emissions. Electric cars are better for the environment.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?electric,car',
      videoUrl:
          'https://youglish.com/pronounce/electric%20cars%20environment/english/us'),
  BuiltInCard(
      front: 'Water scarcity affects millions',
      back: 'Нехватка воды затрагивает миллионы людей',
      pronunciation: 'уотэр скэрсити эфэктс милионз',
      transcription: '/ˈwɔːtər ˈskɛrsɪti əˈfekts ˈmɪliənz/',
      example:
          'Especially in Africa and Asia. Water scarcity affects millions.',
      notes: 'Вода',
      imageUrl: 'https://source.unsplash.com/400x300/?water,scarcity',
      videoUrl: 'https://youglish.com/pronounce/water%20scarcity/english/us'),
  BuiltInCard(
      front: 'I use a reusable water bottle',
      back: 'Я использую многоразовую бутылку для воды',
      pronunciation: 'ай юз э риюзэбэл уотэр ботэл',
      transcription: '/aɪ juːz ə ˌriːˈjuːzəbl ˈwɔːtər ˈbɒtl/',
      example: 'To avoid single-use plastic. I use a reusable water bottle.',
      notes: 'Экопривычки',
      imageUrl: 'https://source.unsplash.com/400x300/?reusable,bottle',
      videoUrl:
          'https://youglish.com/pronounce/reusable%20water%20bottle/english/us'),
  BuiltInCard(
      front: 'Governments must invest in green technology',
      back: 'Правительства должны инвестировать в зелёные технологии',
      pronunciation: 'гавэрнмэнтс маст инвэст ин грин тэкнолэджи',
      transcription: '/ˈɡʌvərnmənts mʌst ɪnˈvest ɪn ɡriːn tekˈnɒlədʒi/',
      example:
          'It is the only way forward. Governments must invest in green technology.',
      notes: 'Политика',
      imageUrl: 'https://source.unsplash.com/400x300/?green,technology',
      videoUrl: 'https://youglish.com/pronounce/green%20technology/english/us'),
  BuiltInCard(
      front: 'I walk or cycle instead of driving',
      back: 'Вместо машины я хожу пешком или езжу на велосипеде',
      pronunciation: 'ай уок ор сайкэл инстэд эв драйвинг',
      transcription: '/aɪ wɔːk ɔːr ˈsaɪkl ɪnˈsted əv ˈdraɪvɪŋ/',
      example: 'For short distances. I walk or cycle instead of driving.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?walk,cycle',
      videoUrl: 'https://youglish.com/pronounce/walk%20or%20cycle/english/us'),
  BuiltInCard(
      front: 'The rainforest is the lungs of the Earth',
      back: 'Тропический лес — лёгкие Земли',
      pronunciation: 'дэ рэйнфорэст из дэ лангз эв дэ ёрс',
      transcription: '/ðə ˈreɪnfɒrɪst ɪz ðə lʌŋz əv ðə ɜːrθ/',
      example: 'We must preserve it. The rainforest is the lungs of the Earth.',
      notes: 'Метафора',
      imageUrl: 'https://source.unsplash.com/400x300/?rainforest,amazon',
      videoUrl:
          'https://youglish.com/pronounce/rainforest%20lungs%20of%20Earth/english/us'),
  BuiltInCard(
      front: 'I switched to green energy at home',
      back: 'Я перешёл на зелёную энергию дома',
      pronunciation: 'ай суичт ту грин энэрджи эт хоум',
      transcription: '/aɪ swɪtʃt tə ɡriːn ˈenərdʒi æt hoʊm/',
      example: 'Solar panels on the roof. I switched to green energy at home.',
      notes: 'Энергия',
      imageUrl: 'https://source.unsplash.com/400x300/?solar,panels',
      videoUrl:
          'https://youglish.com/pronounce/switched%20to%20green%20energy/english/us'),
  BuiltInCard(
      front: 'Every small action makes a difference',
      back: 'Каждое маленькое действие имеет значение',
      pronunciation: 'эври смол экшэн мэйкс э дифэрэнс',
      transcription: '/ˈevri smɔːl ˈækʃən meɪks ə ˈdɪfrəns/',
      example: 'Do not feel helpless. Every small action makes a difference.',
      notes: 'Мотивация',
      imageUrl: 'https://source.unsplash.com/400x300/?action,difference',
      videoUrl:
          'https://youglish.com/pronounce/every%20small%20action/english/us'),
  BuiltInCard(
      front: 'We must leave a better planet for future generations',
      back: 'Мы должны оставить лучшую планету будущим поколениям',
      pronunciation: 'уи маст лив э бэтэр плэнэт фор фьючэр джэнэрэйшэнз',
      transcription:
          '/wiː mʌst liːv ə ˈbetər ˈplænɪt fər ˈfjuːtʃər ˌdʒenəˈreɪʃənz/',
      example:
          'This is our responsibility. We must leave a better planet for future generations.',
      notes: 'Ответственность',
      imageUrl: 'https://source.unsplash.com/400x300/?future,earth',
      videoUrl:
          'https://youglish.com/pronounce/better%20planet%20future%20generations/english/us'),
]);

const _ukSet17 = BuiltInSet(name: 'Environment', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'Climate change is a global crisis',
      back: 'Зміна клімату — глобальна криза',
      pronunciation: 'клаймэт чэйндж из э глоубэл крайсис',
      transcription: '/ˈklaɪmɪt tʃeɪndʒ ɪz ə ˈɡloʊbl ˈkraɪsɪs/',
      example: 'We must act now. Climate change is a global crisis.',
      notes: 'Екологія',
      imageUrl: 'https://source.unsplash.com/400x300/?climate,change',
      videoUrl:
          'https://youglish.com/pronounce/climate%20change%20global%20crisis/english/us'),
  BuiltInCard(
      front: 'I try to reduce my carbon footprint',
      back: 'Я намагаюся зменшити свій вуглецевий слід',
      pronunciation: 'ай трай ту ридьюс май карбэн футпринт',
      transcription: '/aɪ traɪ tə rɪˈdjuːs maɪ ˈkɑːrbən ˈfʊtprɪnt/',
      example:
          'By cycling and eating less meat. I try to reduce my carbon footprint.',
      notes: 'Екологія',
      imageUrl: 'https://source.unsplash.com/400x300/?carbon,footprint',
      videoUrl: 'https://youglish.com/pronounce/carbon%20footprint/english/us'),
  BuiltInCard(
      front: 'We should use renewable energy',
      back: 'Ми повинні використовувати відновлювану енергію',
      pronunciation: 'уи шуд юз ринюэбэл энэрджи',
      transcription: '/wiː ʃʊd juːz rɪˈnjuːəbl ˈenərdʒi/',
      example:
          'Solar and wind power are the future. We should use renewable energy.',
      notes: 'Енергетика',
      imageUrl: 'https://source.unsplash.com/400x300/?renewable,solar',
      videoUrl: 'https://youglish.com/pronounce/renewable%20energy/english/us'),
  BuiltInCard(
      front: 'Plastic pollution is destroying oceans',
      back: 'Пластикове забруднення знищує океани',
      pronunciation: 'пластик полюшэн из дистройинг оушэнз',
      transcription: '/ˈplæstɪk pəˈluːʃən ɪz dɪˈstrɔɪɪŋ ˈoʊʃənz/',
      example:
          'Millions of animals die each year. Plastic pollution is destroying oceans.',
      notes: 'Забруднення',
      imageUrl: 'https://source.unsplash.com/400x300/?plastic,ocean',
      videoUrl:
          'https://youglish.com/pronounce/plastic%20pollution%20oceans/english/us'),
  BuiltInCard(
      front: 'I recycle my waste',
      back: 'Я сортую сміття',
      pronunciation: 'ай рисайкэл май уэйст',
      transcription: '/aɪ rɪˈsaɪkl maɪ weɪst/',
      example:
          'Glass, paper, and plastic separately. I recycle my waste every week.',
      notes: 'Переробка',
      imageUrl: 'https://source.unsplash.com/400x300/?recycling,bins',
      videoUrl: 'https://youglish.com/pronounce/recycle%20waste/english/us'),
  BuiltInCard(
      front: 'Deforestation is threatening biodiversity',
      back: 'Вирубка лісів загрожує біорізноманіттю',
      pronunciation: 'дифорэстэйшэн из срэтэнинг байоудайвёрсити',
      transcription: '/ˌdiːˌfɒrɪˈsteɪʃən ɪz ˈθretnɪŋ ˌbaɪoʊdaɪˈvɜːrsɪti/',
      example:
          'Thousands of species are at risk. Deforestation is threatening biodiversity.',
      notes: 'Ліси',
      imageUrl: 'https://source.unsplash.com/400x300/?deforestation,forest',
      videoUrl:
          'https://youglish.com/pronounce/deforestation%20biodiversity/english/us'),
  BuiltInCard(
      front: 'I bring my own shopping bags',
      back: 'Я приношу власні сумки для покупок',
      pronunciation: 'ай бринг май оун шопинг бэгз',
      transcription: '/aɪ brɪŋ maɪ oʊn ˈʃɒpɪŋ bæɡz/',
      example: 'To avoid plastic waste. I bring my own shopping bags.',
      notes: 'Екопривички',
      imageUrl: 'https://source.unsplash.com/400x300/?reusable,bag',
      videoUrl:
          'https://youglish.com/pronounce/own%20shopping%20bags/english/us'),
  BuiltInCard(
      front: 'The polar ice caps are melting',
      back: 'Полярні льодові шапки тануть',
      pronunciation: 'дэ поулэр айс кэпс ар мэлтинг',
      transcription: '/ðə ˈpoʊlər aɪs kæps ɑːr ˈmeltɪŋ/',
      example:
          'Sea levels are rising as a result. The polar ice caps are melting.',
      notes: 'Потепління',
      imageUrl: 'https://source.unsplash.com/400x300/?polar,ice',
      videoUrl:
          'https://youglish.com/pronounce/polar%20ice%20caps%20melting/english/us'),
  BuiltInCard(
      front: 'We need to protect endangered species',
      back: 'Нам необхідно захищати зникаючі види',
      pronunciation: 'уи нид ту протэкт индэйнджэрд спишиз',
      transcription: '/wiː niːd tə prəˈtekt ɪnˈdeɪndʒərd ˈspiːʃiːz/',
      example:
          'Tigers and elephants are at risk. We need to protect endangered species.',
      notes: 'Тварини',
      imageUrl: 'https://source.unsplash.com/400x300/?endangered,species',
      videoUrl:
          'https://youglish.com/pronounce/protect%20endangered%20species/english/us'),
  BuiltInCard(
      front: 'Air pollution causes health problems',
      back: 'Забруднення повітря спричиняє проблеми зі здоров\'ям',
      pronunciation: 'эр полюшэн козэз хэлс проблэмз',
      transcription: '/ɛr pəˈluːʃən kɔːzɪz helθ ˈprɒbləmz/',
      example:
          'Especially in big cities. Air pollution causes health problems.',
      notes: 'Забруднення',
      imageUrl: 'https://source.unsplash.com/400x300/?air,pollution',
      videoUrl:
          'https://youglish.com/pronounce/air%20pollution%20health/english/us'),
  BuiltInCard(
      front: 'I eat less meat to help the planet',
      back: 'Я їм менше м\'яса заради планети',
      pronunciation: 'ай ит лэс мит ту хэлп дэ плэнэт',
      transcription: '/aɪ iːt les miːt tə help ðə ˈplænɪt/',
      example:
          'Livestock farming is a major emitter. I eat less meat to help the planet.',
      notes: 'Харчування',
      imageUrl: 'https://source.unsplash.com/400x300/?vegan,plant',
      videoUrl:
          'https://youglish.com/pronounce/eat%20less%20meat%20planet/english/us'),
  BuiltInCard(
      front: 'Electric cars are better for the environment',
      back: 'Електричні автомобілі кращі для навколишнього середовища',
      pronunciation: 'илэктрик карз ар бэтэр фор дэ инвайрэнмэнт',
      transcription: '/ɪˈlektrɪk kɑːrz ɑːr ˈbetər fər ðə ɪnˈvaɪrənmənt/',
      example:
          'Zero direct emissions. Electric cars are better for the environment.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?electric,car',
      videoUrl:
          'https://youglish.com/pronounce/electric%20cars%20environment/english/us'),
  BuiltInCard(
      front: 'Water scarcity affects millions',
      back: 'Нестача води торкається мільйонів',
      pronunciation: 'уотэр скэрсити эфэктс милионз',
      transcription: '/ˈwɔːtər ˈskɛrsɪti əˈfekts ˈmɪliənz/',
      example:
          'Especially in Africa and Asia. Water scarcity affects millions.',
      notes: 'Вода',
      imageUrl: 'https://source.unsplash.com/400x300/?water,scarcity',
      videoUrl: 'https://youglish.com/pronounce/water%20scarcity/english/us'),
  BuiltInCard(
      front: 'I use a reusable water bottle',
      back: 'Я використовую багаторазову пляшку для води',
      pronunciation: 'ай юз э риюзэбэл уотэр ботэл',
      transcription: '/aɪ juːz ə ˌriːˈjuːzəbl ˈwɔːtər ˈbɒtl/',
      example: 'To avoid single-use plastic. I use a reusable water bottle.',
      notes: 'Екопривички',
      imageUrl: 'https://source.unsplash.com/400x300/?reusable,bottle',
      videoUrl:
          'https://youglish.com/pronounce/reusable%20water%20bottle/english/us'),
  BuiltInCard(
      front: 'Governments must invest in green technology',
      back: 'Уряди повинні інвестувати в зелені технології',
      pronunciation: 'гавэрнмэнтс маст инвэст ин грин тэкнолэджи',
      transcription: '/ˈɡʌvərnmənts mʌst ɪnˈvest ɪn ɡriːn tekˈnɒlədʒi/',
      example:
          'It is the only way forward. Governments must invest in green technology.',
      notes: 'Політика',
      imageUrl: 'https://source.unsplash.com/400x300/?green,technology',
      videoUrl: 'https://youglish.com/pronounce/green%20technology/english/us'),
  BuiltInCard(
      front: 'I walk or cycle instead of driving',
      back: 'Замість машини я ходжу пішки або їжджу на велосипеді',
      pronunciation: 'ай уок ор сайкэл инстэд эв драйвинг',
      transcription: '/aɪ wɔːk ɔːr ˈsaɪkl ɪnˈsted əv ˈdraɪvɪŋ/',
      example: 'For short distances. I walk or cycle instead of driving.',
      notes: 'Транспорт',
      imageUrl: 'https://source.unsplash.com/400x300/?walk,cycle',
      videoUrl: 'https://youglish.com/pronounce/walk%20or%20cycle/english/us'),
  BuiltInCard(
      front: 'The rainforest is the lungs of the Earth',
      back: 'Тропічний ліс — легені Землі',
      pronunciation: 'дэ рэйнфорэст из дэ лангз эв дэ ёрс',
      transcription: '/ðə ˈreɪnfɒrɪst ɪz ðə lʌŋz əv ðə ɜːrθ/',
      example: 'We must preserve it. The rainforest is the lungs of the Earth.',
      notes: 'Метафора',
      imageUrl: 'https://source.unsplash.com/400x300/?rainforest,amazon',
      videoUrl:
          'https://youglish.com/pronounce/rainforest%20lungs%20of%20Earth/english/us'),
  BuiltInCard(
      front: 'I switched to green energy at home',
      back: 'Я перейшов на зелену енергію вдома',
      pronunciation: 'ай суичт ту грин энэрджи эт хоум',
      transcription: '/aɪ swɪtʃt tə ɡriːn ˈenərdʒi æt hoʊm/',
      example: 'Solar panels on the roof. I switched to green energy at home.',
      notes: 'Енергія',
      imageUrl: 'https://source.unsplash.com/400x300/?solar,panels',
      videoUrl:
          'https://youglish.com/pronounce/switched%20to%20green%20energy/english/us'),
  BuiltInCard(
      front: 'Every small action makes a difference',
      back: 'Кожна маленька дія має значення',
      pronunciation: 'эври смол экшэн мэйкс э дифэрэнс',
      transcription: '/ˈevri smɔːl ˈækʃən meɪks ə ˈdɪfrəns/',
      example: 'Do not feel helpless. Every small action makes a difference.',
      notes: 'Мотивація',
      imageUrl: 'https://source.unsplash.com/400x300/?action,difference',
      videoUrl:
          'https://youglish.com/pronounce/every%20small%20action/english/us'),
  BuiltInCard(
      front: 'We must leave a better planet for future generations',
      back: 'Ми повинні залишити кращу планету майбутнім поколінням',
      pronunciation: 'уи маст лив э бэтэр плэнэт фор фьючэр джэнэрэйшэнз',
      transcription:
          '/wiː mʌst liːv ə ˈbetər ˈplænɪt fər ˈfjuːtʃər ˌdʒenəˈreɪʃənz/',
      example:
          'This is our responsibility. We must leave a better planet for future generations.',
      notes: 'Відповідальність',
      imageUrl: 'https://source.unsplash.com/400x300/?future,earth',
      videoUrl:
          'https://youglish.com/pronounce/better%20planet%20future%20generations/english/us'),
]);

// ============================================================
// 18 — Health & Medicine (A2)
// ============================================================

const _ruSet18 = BuiltInSet(name: 'Health & Medicine', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I have a sore throat',
      back: 'У меня болит горло',
      pronunciation: 'ай хэв э сор сроут',
      transcription: '/aɪ hæv ə sɔːr θroʊt/',
      example: 'I cannot speak properly. I have a sore throat.',
      notes: 'Симптомы',
      imageUrl: 'https://source.unsplash.com/400x300/?sore,throat',
      videoUrl: 'https://youglish.com/pronounce/sore%20throat/english/us'),
  BuiltInCard(
      front: 'I need to see a doctor',
      back: 'Мне нужно обратиться к врачу',
      pronunciation: 'ай нид ту си э доктор',
      transcription: '/aɪ niːd tə siː ə ˈdɒktər/',
      example: 'This pain has lasted three days. I need to see a doctor.',
      notes: 'Медицина',
      imageUrl: 'https://source.unsplash.com/400x300/?doctor,visit',
      videoUrl: 'https://youglish.com/pronounce/see%20a%20doctor/english/us'),
  BuiltInCard(
      front: 'I have a high temperature',
      back: 'У меня высокая температура',
      pronunciation: 'ай хэв э хай тэмпэрэчэр',
      transcription: '/aɪ hæv ə haɪ ˈtempərətʃər/',
      example: 'I feel really unwell. I have a high temperature.',
      notes: 'Симптомы',
      imageUrl: 'https://source.unsplash.com/400x300/?temperature,fever',
      videoUrl: 'https://youglish.com/pronounce/high%20temperature/english/us'),
  BuiltInCard(
      front: 'Take this medicine twice a day',
      back: 'Принимайте это лекарство два раза в день',
      pronunciation: 'тэйк дис мэдисин туайс э дэй',
      transcription: '/teɪk ðɪs ˈmedɪsɪn twaɪs ə deɪ/',
      example: 'The doctor said so. Take this medicine twice a day.',
      notes: 'Лечение',
      imageUrl: 'https://source.unsplash.com/400x300/?medicine,pills',
      videoUrl:
          'https://youglish.com/pronounce/medicine%20twice%20a%20day/english/us'),
  BuiltInCard(
      front: 'I am allergic to penicillin',
      back: 'У меня аллергия на пенициллин',
      pronunciation: 'ай эм элёрджик ту пэнисилин',
      transcription: '/aɪ æm əˈlɜːrdʒɪk tə ˌpenɪˈsɪlɪn/',
      example: 'Please check before prescribing. I am allergic to penicillin.',
      notes: 'Аллергия',
      imageUrl: 'https://source.unsplash.com/400x300/?allergy,medicine',
      videoUrl:
          'https://youglish.com/pronounce/allergic%20to%20penicillin/english/us'),
  BuiltInCard(
      front: 'I need to make an appointment',
      back: 'Мне нужно записаться на приём',
      pronunciation: 'ай нид ту мэйк эн эпойнтмэнт',
      transcription: '/aɪ niːd tə meɪk ən əˈpɔɪntmənt/',
      example: 'The pain is getting worse. I need to make an appointment.',
      notes: 'Запись',
      imageUrl: 'https://source.unsplash.com/400x300/?appointment,clinic',
      videoUrl:
          'https://youglish.com/pronounce/make%20an%20appointment/english/us'),
  BuiltInCard(
      front: 'She broke her arm',
      back: 'Она сломала руку',
      pronunciation: 'ши броук хэр арм',
      transcription: '/ʃiː broʊk hɜːr ɑːrm/',
      example: 'She fell off her bike. She broke her arm.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?broken,arm',
      videoUrl: 'https://youglish.com/pronounce/broke%20her%20arm/english/us'),
  BuiltInCard(
      front: 'I feel dizzy',
      back: 'У меня кружится голова',
      pronunciation: 'ай фил дизи',
      transcription: '/aɪ fiːl ˈdɪzi/',
      example: 'I should sit down. I feel dizzy.',
      notes: 'Симптомы',
      imageUrl: 'https://source.unsplash.com/400x300/?dizzy,sick',
      videoUrl: 'https://youglish.com/pronounce/feel%20dizzy/english/us'),
  BuiltInCard(
      front: 'I have been prescribed antibiotics',
      back: 'Мне прописали антибиотики',
      pronunciation: 'ай хэв бин прискрайбд антибайотикс',
      transcription: '/aɪ hæv bɪn prɪˈskraɪbd ˌæntɪbaɪˈɒtɪks/',
      example: 'For the infection. I have been prescribed antibiotics.',
      notes: 'Лечение',
      imageUrl: 'https://source.unsplash.com/400x300/?antibiotics,prescription',
      videoUrl:
          'https://youglish.com/pronounce/prescribed%20antibiotics/english/us'),
  BuiltInCard(
      front: 'The waiting room is full',
      back: 'Зал ожидания полон',
      pronunciation: 'дэ уэйтинг рум из фул',
      transcription: '/ðə ˈweɪtɪŋ ruːm ɪz fʊl/',
      example: 'We might wait an hour. The waiting room is full.',
      notes: 'Клиника',
      imageUrl: 'https://source.unsplash.com/400x300/?waiting,room',
      videoUrl:
          'https://youglish.com/pronounce/waiting%20room%20full/english/us'),
  BuiltInCard(
      front: 'I need stitches',
      back: 'Мне нужны швы',
      pronunciation: 'ай нид ститчэз',
      transcription: '/aɪ niːd ˈstɪtʃɪz/',
      example: 'The cut is quite deep. I need stitches.',
      notes: 'Скорая',
      imageUrl: 'https://source.unsplash.com/400x300/?stitches,wound',
      videoUrl: 'https://youglish.com/pronounce/need%20stitches/english/us'),
  BuiltInCard(
      front: 'My blood pressure is too high',
      back: 'У меня слишком высокое давление',
      pronunciation: 'май блад прэшэр из ту хай',
      transcription: '/maɪ blʌd ˈpreʃər ɪz tuː haɪ/',
      example: 'The doctor is worried. My blood pressure is too high.',
      notes: 'Здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?blood,pressure',
      videoUrl:
          'https://youglish.com/pronounce/blood%20pressure%20high/english/us'),
  BuiltInCard(
      front: 'I need to get a blood test',
      back: 'Мне нужно сдать анализ крови',
      pronunciation: 'ай нид ту гет э блад тэст',
      transcription: '/aɪ niːd tə ɡet ə blʌd test/',
      example: 'The doctor ordered it. I need to get a blood test.',
      notes: 'Диагностика',
      imageUrl: 'https://source.unsplash.com/400x300/?blood,test',
      videoUrl: 'https://youglish.com/pronounce/blood%20test/english/us'),
  BuiltInCard(
      front: 'He recovered quickly',
      back: 'Он быстро поправился',
      pronunciation: 'хи рикавэрд куикли',
      transcription: '/hiː rɪˈkʌvərd ˈkwɪkli/',
      example: 'Thanks to the medication. He recovered quickly.',
      notes: 'Выздоровление',
      imageUrl: 'https://source.unsplash.com/400x300/?recovery,health',
      videoUrl:
          'https://youglish.com/pronounce/recovered%20quickly/english/us'),
  BuiltInCard(
      front: 'I have a headache',
      back: 'У меня болит голова',
      pronunciation: 'ай хэв э хэдэйк',
      transcription: '/aɪ hæv ə ˈhedeɪk/',
      example: 'I need some paracetamol. I have a headache.',
      notes: 'Симптомы',
      imageUrl: 'https://source.unsplash.com/400x300/?headache,pain',
      videoUrl:
          'https://youglish.com/pronounce/have%20a%20headache/english/us'),
  BuiltInCard(
      front: 'The pharmacy is open until midnight',
      back: 'Аптека работает до полуночи',
      pronunciation: 'дэ фармэси из оупэн антил миднайт',
      transcription: '/ðə ˈfɑːrməsi ɪz ˈoʊpən ənˈtɪl ˈmɪdnaɪt/',
      example: 'Good, I can still go. The pharmacy is open until midnight.',
      notes: 'Аптека',
      imageUrl: 'https://source.unsplash.com/400x300/?pharmacy,open',
      videoUrl: 'https://youglish.com/pronounce/pharmacy%20open/english/us'),
  BuiltInCard(
      front: 'I twisted my ankle',
      back: 'Я вывихнул лодыжку',
      pronunciation: 'ай туистид май энкэл',
      transcription: '/aɪ ˈtwɪstɪd maɪ ˈæŋkl/',
      example: 'While running in the park. I twisted my ankle.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?ankle,injury',
      videoUrl:
          'https://youglish.com/pronounce/twisted%20my%20ankle/english/us'),
  BuiltInCard(
      front: 'I have been feeling under the weather',
      back: 'Я чувствую себя неважно',
      pronunciation: 'ай хэв бин филинг андэр дэ уэзэр',
      transcription: '/aɪ hæv bɪn ˈfiːlɪŋ ˈʌndər ðə ˈweðər/',
      example: 'Nothing serious I hope. I have been feeling under the weather.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?unwell,sick',
      videoUrl:
          'https://youglish.com/pronounce/feeling%20under%20the%20weather/english/us'),
  BuiltInCard(
      front: 'You should rest and drink plenty of fluids',
      back: 'Вам нужно отдыхать и пить много жидкости',
      pronunciation: 'ю шуд рэст энд дринк плэнти эв флюидз',
      transcription: '/juː ʃʊd rest ænd drɪŋk ˈplenti əv ˈfluːɪdz/',
      example:
          'The classic advice for a cold. You should rest and drink plenty of fluids.',
      notes: 'Совет',
      imageUrl: 'https://source.unsplash.com/400x300/?rest,fluids',
      videoUrl:
          'https://youglish.com/pronounce/rest%20and%20drink%20fluids/english/us'),
  BuiltInCard(
      front: 'I had an operation last year',
      back: 'В прошлом году мне сделали операцию',
      pronunciation: 'ай хэд эн опэрэйшэн ласт йир',
      transcription: '/aɪ hæd ən ˌɒpəˈreɪʃən lɑːst jɪr/',
      example: 'On my knee. I had an operation last year.',
      notes: 'Операция',
      imageUrl: 'https://source.unsplash.com/400x300/?operation,surgery',
      videoUrl:
          'https://youglish.com/pronounce/had%20an%20operation/english/us'),
]);

const _ukSet18 = BuiltInSet(name: 'Health & Medicine', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I have a sore throat',
      back: 'У мене болить горло',
      pronunciation: 'ай хэв э сор сроут',
      transcription: '/aɪ hæv ə sɔːr θroʊt/',
      example: 'I cannot speak properly. I have a sore throat.',
      notes: 'Симптоми',
      imageUrl: 'https://source.unsplash.com/400x300/?sore,throat',
      videoUrl: 'https://youglish.com/pronounce/sore%20throat/english/us'),
  BuiltInCard(
      front: 'I need to see a doctor',
      back: 'Мені потрібно звернутися до лікаря',
      pronunciation: 'ай нид ту си э доктор',
      transcription: '/aɪ niːd tə siː ə ˈdɒktər/',
      example: 'This pain has lasted three days. I need to see a doctor.',
      notes: 'Медицина',
      imageUrl: 'https://source.unsplash.com/400x300/?doctor,visit',
      videoUrl: 'https://youglish.com/pronounce/see%20a%20doctor/english/us'),
  BuiltInCard(
      front: 'I have a high temperature',
      back: 'У мене висока температура',
      pronunciation: 'ай хэв э хай тэмпэрэчэр',
      transcription: '/aɪ hæv ə haɪ ˈtempərətʃər/',
      example: 'I feel really unwell. I have a high temperature.',
      notes: 'Симптоми',
      imageUrl: 'https://source.unsplash.com/400x300/?temperature,fever',
      videoUrl: 'https://youglish.com/pronounce/high%20temperature/english/us'),
  BuiltInCard(
      front: 'Take this medicine twice a day',
      back: 'Приймайте цей препарат двічі на день',
      pronunciation: 'тэйк дис мэдисин туайс э дэй',
      transcription: '/teɪk ðɪs ˈmedɪsɪn twaɪs ə deɪ/',
      example: 'The doctor said so. Take this medicine twice a day.',
      notes: 'Лікування',
      imageUrl: 'https://source.unsplash.com/400x300/?medicine,pills',
      videoUrl:
          'https://youglish.com/pronounce/medicine%20twice%20a%20day/english/us'),
  BuiltInCard(
      front: 'I am allergic to penicillin',
      back: 'У мене алергія на пеніцилін',
      pronunciation: 'ай эм элёрджик ту пэнисилин',
      transcription: '/aɪ æm əˈlɜːrdʒɪk tə ˌpenɪˈsɪlɪn/',
      example: 'Please check before prescribing. I am allergic to penicillin.',
      notes: 'Алергія',
      imageUrl: 'https://source.unsplash.com/400x300/?allergy,medicine',
      videoUrl:
          'https://youglish.com/pronounce/allergic%20to%20penicillin/english/us'),
  BuiltInCard(
      front: 'I need to make an appointment',
      back: 'Мені потрібно записатися на прийом',
      pronunciation: 'ай нид ту мэйк эн эпойнтмэнт',
      transcription: '/aɪ niːd tə meɪk ən əˈpɔɪntmənt/',
      example: 'The pain is getting worse. I need to make an appointment.',
      notes: 'Запис',
      imageUrl: 'https://source.unsplash.com/400x300/?appointment,clinic',
      videoUrl:
          'https://youglish.com/pronounce/make%20an%20appointment/english/us'),
  BuiltInCard(
      front: 'She broke her arm',
      back: 'Вона зламала руку',
      pronunciation: 'ши броук хэр арм',
      transcription: '/ʃiː broʊk hɜːr ɑːrm/',
      example: 'She fell off her bike. She broke her arm.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?broken,arm',
      videoUrl: 'https://youglish.com/pronounce/broke%20her%20arm/english/us'),
  BuiltInCard(
      front: 'I feel dizzy',
      back: 'У мене паморочиться голова',
      pronunciation: 'ай фил дизи',
      transcription: '/aɪ fiːl ˈdɪzi/',
      example: 'I should sit down. I feel dizzy.',
      notes: 'Симптоми',
      imageUrl: 'https://source.unsplash.com/400x300/?dizzy,sick',
      videoUrl: 'https://youglish.com/pronounce/feel%20dizzy/english/us'),
  BuiltInCard(
      front: 'I have been prescribed antibiotics',
      back: 'Мені прописали антибіотики',
      pronunciation: 'ай хэв бин прискрайбд антибайотикс',
      transcription: '/aɪ hæv bɪn prɪˈskraɪbd ˌæntɪbaɪˈɒtɪks/',
      example: 'For the infection. I have been prescribed antibiotics.',
      notes: 'Лікування',
      imageUrl: 'https://source.unsplash.com/400x300/?antibiotics,prescription',
      videoUrl:
          'https://youglish.com/pronounce/prescribed%20antibiotics/english/us'),
  BuiltInCard(
      front: 'The waiting room is full',
      back: 'Зал очікування повний',
      pronunciation: 'дэ уэйтинг рум из фул',
      transcription: '/ðə ˈweɪtɪŋ ruːm ɪz fʊl/',
      example: 'We might wait an hour. The waiting room is full.',
      notes: 'Клініка',
      imageUrl: 'https://source.unsplash.com/400x300/?waiting,room',
      videoUrl:
          'https://youglish.com/pronounce/waiting%20room%20full/english/us'),
  BuiltInCard(
      front: 'I need stitches',
      back: 'Мені потрібні шви',
      pronunciation: 'ай нид ститчэз',
      transcription: '/aɪ niːd ˈstɪtʃɪz/',
      example: 'The cut is quite deep. I need stitches.',
      notes: 'Швидка',
      imageUrl: 'https://source.unsplash.com/400x300/?stitches,wound',
      videoUrl: 'https://youglish.com/pronounce/need%20stitches/english/us'),
  BuiltInCard(
      front: 'My blood pressure is too high',
      back: 'У мене занадто високий тиск',
      pronunciation: 'май блад прэшэр из ту хай',
      transcription: '/maɪ blʌd ˈpreʃər ɪz tuː haɪ/',
      example: 'The doctor is worried. My blood pressure is too high.',
      notes: 'Здоров\'я',
      imageUrl: 'https://source.unsplash.com/400x300/?blood,pressure',
      videoUrl:
          'https://youglish.com/pronounce/blood%20pressure%20high/english/us'),
  BuiltInCard(
      front: 'I need to get a blood test',
      back: 'Мені потрібно здати аналіз крові',
      pronunciation: 'ай нид ту гет э блад тэст',
      transcription: '/aɪ niːd tə ɡet ə blʌd test/',
      example: 'The doctor ordered it. I need to get a blood test.',
      notes: 'Діагностика',
      imageUrl: 'https://source.unsplash.com/400x300/?blood,test',
      videoUrl: 'https://youglish.com/pronounce/blood%20test/english/us'),
  BuiltInCard(
      front: 'He recovered quickly',
      back: 'Він швидко одужав',
      pronunciation: 'хи рикавэрд куикли',
      transcription: '/hiː rɪˈkʌvərd ˈkwɪkli/',
      example: 'Thanks to the medication. He recovered quickly.',
      notes: 'Одужання',
      imageUrl: 'https://source.unsplash.com/400x300/?recovery,health',
      videoUrl:
          'https://youglish.com/pronounce/recovered%20quickly/english/us'),
  BuiltInCard(
      front: 'I have a headache',
      back: 'У мене болить голова',
      pronunciation: 'ай хэв э хэдэйк',
      transcription: '/aɪ hæv ə ˈhedeɪk/',
      example: 'I need some paracetamol. I have a headache.',
      notes: 'Симптоми',
      imageUrl: 'https://source.unsplash.com/400x300/?headache,pain',
      videoUrl:
          'https://youglish.com/pronounce/have%20a%20headache/english/us'),
  BuiltInCard(
      front: 'The pharmacy is open until midnight',
      back: 'Аптека працює до півночі',
      pronunciation: 'дэ фармэси из оупэн антил миднайт',
      transcription: '/ðə ˈfɑːrməsi ɪz ˈoʊpən ənˈtɪl ˈmɪdnaɪt/',
      example: 'Good, I can still go. The pharmacy is open until midnight.',
      notes: 'Аптека',
      imageUrl: 'https://source.unsplash.com/400x300/?pharmacy,open',
      videoUrl: 'https://youglish.com/pronounce/pharmacy%20open/english/us'),
  BuiltInCard(
      front: 'I twisted my ankle',
      back: 'Я вивихнув щиколотку',
      pronunciation: 'ай туистид май энкэл',
      transcription: '/aɪ ˈtwɪstɪd maɪ ˈæŋkl/',
      example: 'While running in the park. I twisted my ankle.',
      notes: 'Травма',
      imageUrl: 'https://source.unsplash.com/400x300/?ankle,injury',
      videoUrl:
          'https://youglish.com/pronounce/twisted%20my%20ankle/english/us'),
  BuiltInCard(
      front: 'I have been feeling under the weather',
      back: 'Я почуваюся не дуже добре',
      pronunciation: 'ай хэв бин филинг андэр дэ уэзэр',
      transcription: '/aɪ hæv bɪn ˈfiːlɪŋ ˈʌndər ðə ˈweðər/',
      example: 'Nothing serious I hope. I have been feeling under the weather.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?unwell,sick',
      videoUrl:
          'https://youglish.com/pronounce/feeling%20under%20the%20weather/english/us'),
  BuiltInCard(
      front: 'You should rest and drink plenty of fluids',
      back: 'Вам потрібно відпочивати і пити багато рідини',
      pronunciation: 'ю шуд рэст энд дринк плэнти эв флюидз',
      transcription: '/juː ʃʊd rest ænd drɪŋk ˈplenti əv ˈfluːɪdz/',
      example:
          'The classic advice for a cold. You should rest and drink plenty of fluids.',
      notes: 'Порада',
      imageUrl: 'https://source.unsplash.com/400x300/?rest,fluids',
      videoUrl:
          'https://youglish.com/pronounce/rest%20and%20drink%20fluids/english/us'),
  BuiltInCard(
      front: 'I had an operation last year',
      back: 'Минулого року мені зробили операцію',
      pronunciation: 'ай хэд эн опэрэйшэн ласт йир',
      transcription: '/aɪ hæd ən ˌɒpəˈreɪʃən lɑːst jɪr/',
      example: 'On my knee. I had an operation last year.',
      notes: 'Операція',
      imageUrl: 'https://source.unsplash.com/400x300/?operation,surgery',
      videoUrl:
          'https://youglish.com/pronounce/had%20an%20operation/english/us'),
]);
// END OF PART 5

// ============================================================
// 19 — Future Plans & Dreams (B1)
// ============================================================

const _ruSet19 =
    BuiltInSet(name: 'Future Plans & Dreams', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'I plan to move abroad next year',
      back: 'Я планирую переехать за границу в следующем году',
      pronunciation: 'ай плэн ту мув эброд нэкст йир',
      transcription: '/aɪ plæn tə muːv əˈbrɔːd nekst jɪr/',
      example: 'I have been saving up for it. I plan to move abroad next year.',
      notes: 'Планы',
      imageUrl: 'https://source.unsplash.com/400x300/?moving,abroad',
      videoUrl: 'https://youglish.com/pronounce/move%20abroad/english/us'),
  BuiltInCard(
      front: 'I would love to start my own business',
      back: 'Я бы с удовольствием открыл собственный бизнес',
      pronunciation: 'ай вуд лав ту старт май оун бизнэс',
      transcription: '/aɪ wʊd lʌv tə stɑːrt maɪ oʊn ˈbɪznɪs/',
      example:
          'A small café maybe. I would love to start my own business one day.',
      notes: 'Мечты',
      imageUrl: 'https://source.unsplash.com/400x300/?business,dream',
      videoUrl:
          'https://youglish.com/pronounce/start%20my%20own%20business/english/us'),
  BuiltInCard(
      front: 'I am saving up to buy a house',
      back: 'Я коплю деньги на покупку дома',
      pronunciation: 'ай эм сэйвинг ап ту бай э хаус',
      transcription: '/aɪ æm ˈseɪvɪŋ ʌp tə baɪ ə haʊs/',
      example: 'It will take a few more years. I am saving up to buy a house.',
      notes: 'Цели',
      imageUrl: 'https://source.unsplash.com/400x300/?house,savings',
      videoUrl:
          'https://youglish.com/pronounce/saving%20up%20to%20buy%20a%20house/english/us'),
  BuiltInCard(
      front: 'I hope to get promoted this year',
      back: 'Я надеюсь получить повышение в этом году',
      pronunciation: 'ай хоуп ту гет промоутид дис йир',
      transcription: '/aɪ hoʊp tə ɡet prəˈmoʊtɪd ðɪs jɪr/',
      example: 'I have worked really hard. I hope to get promoted this year.',
      notes: 'Карьера',
      imageUrl: 'https://source.unsplash.com/400x300/?promotion,office',
      videoUrl:
          'https://youglish.com/pronounce/hope%20to%20get%20promoted/english/us'),
  BuiltInCard(
      front: 'My dream is to travel the world',
      back: 'Моя мечта — объездить весь мир',
      pronunciation: 'май дрим из ту трэвэл дэ уэрлд',
      transcription: '/maɪ driːm ɪz tə ˈtrævl ðə wɜːrld/',
      example:
          'Every continent, every culture. My dream is to travel the world.',
      notes: 'Мечты',
      imageUrl: 'https://source.unsplash.com/400x300/?travel,world',
      videoUrl:
          'https://youglish.com/pronounce/travel%20the%20world/english/us'),
  BuiltInCard(
      front: 'I intend to learn a new language',
      back: 'Я намерен выучить новый язык',
      pronunciation: 'ай интэнд ту лёрн э ню лэнгуидж',
      transcription: '/aɪ ɪnˈtend tə lɜːrn ə njuː ˈlæŋɡwɪdʒ/',
      example:
          'Portuguese is next on my list. I intend to learn a new language.',
      notes: 'Цели',
      imageUrl: 'https://source.unsplash.com/400x300/?language,learning',
      videoUrl:
          'https://youglish.com/pronounce/learn%20a%20new%20language/english/us'),
  BuiltInCard(
      front: 'I am thinking of going back to university',
      back: 'Я думаю о возвращении в университет',
      pronunciation: 'ай эм синкинг эв гоуинг бэк ту юниверсити',
      transcription: '/aɪ æm ˈθɪŋkɪŋ əv ˈɡoʊɪŋ bæk tə ˌjuːnɪˈvɜːrsɪti/',
      example:
          'To do a Master\'s degree. I am thinking of going back to university.',
      notes: 'Образование',
      imageUrl: 'https://source.unsplash.com/400x300/?university,masters',
      videoUrl:
          'https://youglish.com/pronounce/going%20back%20to%20university/english/us'),
  BuiltInCard(
      front: 'I want to retire early',
      back: 'Я хочу выйти на пенсию пораньше',
      pronunciation: 'ай уонт ту ритайр ёрли',
      transcription: '/aɪ wɒnt tə rɪˈtaɪər ˈɜːrli/',
      example: 'By the time I am fifty. I want to retire early.',
      notes: 'Финансы',
      imageUrl: 'https://source.unsplash.com/400x300/?retire,beach',
      videoUrl: 'https://youglish.com/pronounce/retire%20early/english/us'),
  BuiltInCard(
      front: 'I hope to have a family someday',
      back: 'Я надеюсь когда-нибудь создать семью',
      pronunciation: 'ай хоуп ту хэв э фэмили самдэй',
      transcription: '/aɪ hoʊp tə hæv ə ˈfæmɪli ˈsʌmdeɪ/',
      example: 'Not yet, but one day. I hope to have a family someday.',
      notes: 'Жизнь',
      imageUrl: 'https://source.unsplash.com/400x300/?family,future',
      videoUrl:
          'https://youglish.com/pronounce/have%20a%20family%20someday/english/us'),
  BuiltInCard(
      front: 'I am planning to run a marathon',
      back: 'Я планирую пробежать марафон',
      pronunciation: 'ай эм плэнинг ту ран э марэсон',
      transcription: '/aɪ æm ˈplænɪŋ tə rʌn ə ˈmærəθɒn/',
      example: 'In the spring. I am planning to run a marathon.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?marathon,run',
      videoUrl:
          'https://youglish.com/pronounce/planning%20to%20run%20a%20marathon/english/us'),
  BuiltInCard(
      front: 'I would like to write a book',
      back: 'Я хотел бы написать книгу',
      pronunciation: 'ай вуд лайк ту райт э бук',
      transcription: '/aɪ wʊd laɪk tə raɪt ə bʊk/',
      example:
          'A novel based on my life. I would like to write a book one day.',
      notes: 'Творчество',
      imageUrl: 'https://source.unsplash.com/400x300/?writing,book',
      videoUrl: 'https://youglish.com/pronounce/write%20a%20book/english/us'),
  BuiltInCard(
      front: 'I plan to volunteer abroad',
      back: 'Я планирую волонтёрствовать за рубежом',
      pronunciation: 'ай плэн ту волэнтир эброд',
      transcription: '/aɪ plæn tə ˌvɒlənˈtɪr əˈbrɔːd/',
      example: 'In Africa or South America. I plan to volunteer abroad.',
      notes: 'Волонтёрство',
      imageUrl: 'https://source.unsplash.com/400x300/?volunteer,abroad',
      videoUrl: 'https://youglish.com/pronounce/volunteer%20abroad/english/us'),
  BuiltInCard(
      front: 'I am aiming to save more money',
      back: 'Я стремлюсь копить больше денег',
      pronunciation: 'ай эм эймин ту сэйв мор мани',
      transcription: '/aɪ æm ˈeɪmɪŋ tə seɪv mɔːr ˈmʌni/',
      example: 'Starting from this month. I am aiming to save more money.',
      notes: 'Финансы',
      imageUrl: 'https://source.unsplash.com/400x300/?savings,money',
      videoUrl:
          'https://youglish.com/pronounce/aiming%20to%20save%20money/english/us'),
  BuiltInCard(
      front: 'I hope to make a difference in the world',
      back: 'Я надеюсь изменить мир к лучшему',
      pronunciation: 'ай хоуп ту мэйк э дифэрэнс ин дэ уэрлд',
      transcription: '/aɪ hoʊp tə meɪk ə ˈdɪfrəns ɪn ðə wɜːrld/',
      example:
          'Through my work in education. I hope to make a difference in the world.',
      notes: 'Ценности',
      imageUrl: 'https://source.unsplash.com/400x300/?impact,world',
      videoUrl:
          'https://youglish.com/pronounce/make%20a%20difference%20in%20the%20world/english/us'),
  BuiltInCard(
      front: 'My goal is to become fluent in English',
      back: 'Моя цель — свободно говорить по-английски',
      pronunciation: 'май гоул из ту бикам флюэнт ин инглиш',
      transcription: '/maɪ ɡoʊl ɪz tə bɪˈkʌm ˈfluːənt ɪn ˈɪŋɡlɪʃ/',
      example: 'I practise every day. My goal is to become fluent in English.',
      notes: 'Язык',
      imageUrl: 'https://source.unsplash.com/400x300/?english,fluent',
      videoUrl:
          'https://youglish.com/pronounce/become%20fluent%20in%20English/english/us'),
  BuiltInCard(
      front: 'I would love to live by the sea',
      back: 'Я бы с удовольствием жил у моря',
      pronunciation: 'ай вуд лав ту лив бай дэ си',
      transcription: '/aɪ wʊd lʌv tə lɪv baɪ ðə siː/',
      example: 'A house with an ocean view. I would love to live by the sea.',
      notes: 'Жизнь',
      imageUrl: 'https://source.unsplash.com/400x300/?sea,house',
      videoUrl:
          'https://youglish.com/pronounce/live%20by%20the%20sea/english/us'),
  BuiltInCard(
      front: 'I am considering a career change',
      back: 'Я рассматриваю смену карьеры',
      pronunciation: 'ай эм консидэринг э кариэр чэйндж',
      transcription: '/aɪ æm kənˈsɪdərɪŋ ə kəˈrɪər tʃeɪndʒ/',
      example: 'After ten years in finance. I am considering a career change.',
      notes: 'Карьера',
      imageUrl: 'https://source.unsplash.com/400x300/?career,change',
      videoUrl: 'https://youglish.com/pronounce/career%20change/english/us'),
  BuiltInCard(
      front: 'I plan to adopt a healthier lifestyle',
      back: 'Я планирую вести более здоровый образ жизни',
      pronunciation: 'ай плэн ту эдопт э хэлсиэр лайфстайл',
      transcription: '/aɪ plæn tə əˈdɒpt ə ˈhelθiər ˈlaɪfstaɪl/',
      example:
          'More exercise, less stress. I plan to adopt a healthier lifestyle.',
      notes: 'Здоровье',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,lifestyle',
      videoUrl:
          'https://youglish.com/pronounce/healthier%20lifestyle/english/us'),
  BuiltInCard(
      front: 'One day I will climb a mountain',
      back: 'Однажды я поднимусь на гору',
      pronunciation: 'уан дэй ай уил клайм э маунтэн',
      transcription: '/wʌn deɪ aɪ wɪl klaɪm ə ˈmaʊntɪn/',
      example: 'Kilimanjaro is on my list. One day I will climb a mountain.',
      notes: 'Приключения',
      imageUrl: 'https://source.unsplash.com/400x300/?mountain,climb',
      videoUrl:
          'https://youglish.com/pronounce/climb%20a%20mountain/english/us'),
  BuiltInCard(
      front: 'I am working towards my goals every day',
      back: 'Я каждый день работаю над достижением своих целей',
      pronunciation: 'ай эм уёркинг тоуордз май гоулз эври дэй',
      transcription: '/aɪ æm ˈwɜːrkɪŋ təˈwɔːrdz maɪ ɡoʊlz ˈevri deɪ/',
      example: 'Small steps add up. I am working towards my goals every day.',
      notes: 'Мотивация',
      imageUrl: 'https://source.unsplash.com/400x300/?goals,progress',
      videoUrl:
          'https://youglish.com/pronounce/working%20towards%20goals/english/us'),
]);

const _ukSet19 =
    BuiltInSet(name: 'Future Plans & Dreams', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'I plan to move abroad next year',
      back: 'Я планую переїхати за кордон наступного року',
      pronunciation: 'ай плэн ту мув эброд нэкст йир',
      transcription: '/aɪ plæn tə muːv əˈbrɔːd nekst jɪr/',
      example: 'I have been saving up for it. I plan to move abroad next year.',
      notes: 'Плани',
      imageUrl: 'https://source.unsplash.com/400x300/?moving,abroad',
      videoUrl: 'https://youglish.com/pronounce/move%20abroad/english/us'),
  BuiltInCard(
      front: 'I would love to start my own business',
      back: 'Я б із задоволенням відкрив власний бізнес',
      pronunciation: 'ай вуд лав ту старт май оун бизнэс',
      transcription: '/aɪ wʊd lʌv tə stɑːrt maɪ oʊn ˈbɪznɪs/',
      example:
          'A small café maybe. I would love to start my own business one day.',
      notes: 'Мрії',
      imageUrl: 'https://source.unsplash.com/400x300/?business,dream',
      videoUrl:
          'https://youglish.com/pronounce/start%20my%20own%20business/english/us'),
  BuiltInCard(
      front: 'I am saving up to buy a house',
      back: 'Я коплю гроші на купівлю будинку',
      pronunciation: 'ай эм сэйвинг ап ту бай э хаус',
      transcription: '/aɪ æm ˈseɪvɪŋ ʌp tə baɪ ə haʊs/',
      example: 'It will take a few more years. I am saving up to buy a house.',
      notes: 'Цілі',
      imageUrl: 'https://source.unsplash.com/400x300/?house,savings',
      videoUrl:
          'https://youglish.com/pronounce/saving%20up%20to%20buy%20a%20house/english/us'),
  BuiltInCard(
      front: 'I hope to get promoted this year',
      back: 'Я сподіваюся отримати підвищення цього року',
      pronunciation: 'ай хоуп ту гет промоутид дис йир',
      transcription: '/aɪ hoʊp tə ɡet prəˈmoʊtɪd ðɪs jɪr/',
      example: 'I have worked really hard. I hope to get promoted this year.',
      notes: 'Кар\'єра',
      imageUrl: 'https://source.unsplash.com/400x300/?promotion,office',
      videoUrl:
          'https://youglish.com/pronounce/hope%20to%20get%20promoted/english/us'),
  BuiltInCard(
      front: 'My dream is to travel the world',
      back: 'Моя мрія — об\'їздити весь світ',
      pronunciation: 'май дрим из ту трэвэл дэ уэрлд',
      transcription: '/maɪ driːm ɪz tə ˈtrævl ðə wɜːrld/',
      example:
          'Every continent, every culture. My dream is to travel the world.',
      notes: 'Мрії',
      imageUrl: 'https://source.unsplash.com/400x300/?travel,world',
      videoUrl:
          'https://youglish.com/pronounce/travel%20the%20world/english/us'),
  BuiltInCard(
      front: 'I intend to learn a new language',
      back: 'Я маю намір вивчити нову мову',
      pronunciation: 'ай интэнд ту лёрн э ню лэнгуидж',
      transcription: '/aɪ ɪnˈtend tə lɜːrn ə njuː ˈlæŋɡwɪdʒ/',
      example:
          'Portuguese is next on my list. I intend to learn a new language.',
      notes: 'Цілі',
      imageUrl: 'https://source.unsplash.com/400x300/?language,learning',
      videoUrl:
          'https://youglish.com/pronounce/learn%20a%20new%20language/english/us'),
  BuiltInCard(
      front: 'I am thinking of going back to university',
      back: 'Я думаю про повернення до університету',
      pronunciation: 'ай эм синкинг эв гоуинг бэк ту юниверсити',
      transcription: '/aɪ æm ˈθɪŋkɪŋ əv ˈɡoʊɪŋ bæk tə ˌjuːnɪˈvɜːrsɪti/',
      example:
          "To do a Master's degree. I am thinking of going back to university.",
      notes: 'Освіта',
      imageUrl: 'https://source.unsplash.com/400x300/?university,masters',
      videoUrl:
          'https://youglish.com/pronounce/going%20back%20to%20university/english/us'),
  BuiltInCard(
      front: 'I want to retire early',
      back: 'Я хочу вийти на пенсію раніше',
      pronunciation: 'ай уонт ту ритайр ёрли',
      transcription: '/aɪ wɒnt tə rɪˈtaɪər ˈɜːrli/',
      example: 'By the time I am fifty. I want to retire early.',
      notes: 'Фінанси',
      imageUrl: 'https://source.unsplash.com/400x300/?retire,beach',
      videoUrl: 'https://youglish.com/pronounce/retire%20early/english/us'),
  BuiltInCard(
      front: 'I hope to have a family someday',
      back: 'Я сподіваюся колись створити сім\'ю',
      pronunciation: 'ай хоуп ту хэв э фэмили самдэй',
      transcription: '/aɪ hoʊp tə hæv ə ˈfæmɪli ˈsʌmdeɪ/',
      example: 'Not yet, but one day. I hope to have a family someday.',
      notes: 'Життя',
      imageUrl: 'https://source.unsplash.com/400x300/?family,future',
      videoUrl:
          'https://youglish.com/pronounce/have%20a%20family%20someday/english/us'),
  BuiltInCard(
      front: 'I am planning to run a marathon',
      back: 'Я планую пробігти марафон',
      pronunciation: 'ай эм плэнинг ту ран э марэсон',
      transcription: '/aɪ æm ˈplænɪŋ tə rʌn ə ˈmærəθɒn/',
      example: 'In the spring. I am planning to run a marathon.',
      notes: 'Спорт',
      imageUrl: 'https://source.unsplash.com/400x300/?marathon,run',
      videoUrl:
          'https://youglish.com/pronounce/planning%20to%20run%20a%20marathon/english/us'),
  BuiltInCard(
      front: 'I would like to write a book',
      back: 'Я хотів би написати книгу',
      pronunciation: 'ай вуд лайк ту райт э бук',
      transcription: '/aɪ wʊd laɪk tə raɪt ə bʊk/',
      example:
          'A novel based on my life. I would like to write a book one day.',
      notes: 'Творчість',
      imageUrl: 'https://source.unsplash.com/400x300/?writing,book',
      videoUrl: 'https://youglish.com/pronounce/write%20a%20book/english/us'),
  BuiltInCard(
      front: 'I plan to volunteer abroad',
      back: 'Я планую волонтерити за кордоном',
      pronunciation: 'ай плэн ту волэнтир эброд',
      transcription: '/aɪ plæn tə ˌvɒlənˈtɪr əˈbrɔːd/',
      example: 'In Africa or South America. I plan to volunteer abroad.',
      notes: 'Волонтерство',
      imageUrl: 'https://source.unsplash.com/400x300/?volunteer,abroad',
      videoUrl: 'https://youglish.com/pronounce/volunteer%20abroad/english/us'),
  BuiltInCard(
      front: 'I am aiming to save more money',
      back: 'Я прагну заощаджувати більше грошей',
      pronunciation: 'ай эм эймин ту сэйв мор мани',
      transcription: '/aɪ æm ˈeɪmɪŋ tə seɪv mɔːr ˈmʌni/',
      example: 'Starting from this month. I am aiming to save more money.',
      notes: 'Фінанси',
      imageUrl: 'https://source.unsplash.com/400x300/?savings,money',
      videoUrl:
          'https://youglish.com/pronounce/aiming%20to%20save%20money/english/us'),
  BuiltInCard(
      front: 'I hope to make a difference in the world',
      back: 'Я сподіваюся змінити світ на краще',
      pronunciation: 'ай хоуп ту мэйк э дифэрэнс ин дэ уэрлд',
      transcription: '/aɪ hoʊp tə meɪk ə ˈdɪfrəns ɪn ðə wɜːrld/',
      example:
          'Through my work in education. I hope to make a difference in the world.',
      notes: 'Цінності',
      imageUrl: 'https://source.unsplash.com/400x300/?impact,world',
      videoUrl:
          'https://youglish.com/pronounce/make%20a%20difference%20in%20the%20world/english/us'),
  BuiltInCard(
      front: 'My goal is to become fluent in English',
      back: 'Моя мета — вільно говорити англійською',
      pronunciation: 'май гоул из ту бикам флюэнт ин инглиш',
      transcription: '/maɪ ɡoʊl ɪz tə bɪˈkʌm ˈfluːənt ɪn ˈɪŋɡlɪʃ/',
      example: 'I practise every day. My goal is to become fluent in English.',
      notes: 'Мова',
      imageUrl: 'https://source.unsplash.com/400x300/?english,fluent',
      videoUrl:
          'https://youglish.com/pronounce/become%20fluent%20in%20English/english/us'),
  BuiltInCard(
      front: 'I would love to live by the sea',
      back: 'Я б із задоволенням жив біля моря',
      pronunciation: 'ай вуд лав ту лив бай дэ си',
      transcription: '/aɪ wʊd lʌv tə lɪv baɪ ðə siː/',
      example: 'A house with an ocean view. I would love to live by the sea.',
      notes: 'Життя',
      imageUrl: 'https://source.unsplash.com/400x300/?sea,house',
      videoUrl:
          'https://youglish.com/pronounce/live%20by%20the%20sea/english/us'),
  BuiltInCard(
      front: 'I am considering a career change',
      back: 'Я розглядаю зміну кар\'єри',
      pronunciation: 'ай эм консидэринг э кариэр чэйндж',
      transcription: '/aɪ æm kənˈsɪdərɪŋ ə kəˈrɪər tʃeɪndʒ/',
      example: 'After ten years in finance. I am considering a career change.',
      notes: 'Кар\'єра',
      imageUrl: 'https://source.unsplash.com/400x300/?career,change',
      videoUrl: 'https://youglish.com/pronounce/career%20change/english/us'),
  BuiltInCard(
      front: 'I plan to adopt a healthier lifestyle',
      back: 'Я планую вести більш здоровий спосіб життя',
      pronunciation: 'ай плэн ту эдопт э хэлсиэр лайфстайл',
      transcription: '/aɪ plæn tə əˈdɒpt ə ˈhelθiər ˈlaɪfstaɪl/',
      example:
          'More exercise, less stress. I plan to adopt a healthier lifestyle.',
      notes: 'Здоров\'я',
      imageUrl: 'https://source.unsplash.com/400x300/?healthy,lifestyle',
      videoUrl:
          'https://youglish.com/pronounce/healthier%20lifestyle/english/us'),
  BuiltInCard(
      front: 'One day I will climb a mountain',
      back: 'Одного дня я піднімуся на гору',
      pronunciation: 'уан дэй ай уил клайм э маунтэн',
      transcription: '/wʌn deɪ aɪ wɪl klaɪm ə ˈmaʊntɪn/',
      example: 'Kilimanjaro is on my list. One day I will climb a mountain.',
      notes: 'Пригоди',
      imageUrl: 'https://source.unsplash.com/400x300/?mountain,climb',
      videoUrl:
          'https://youglish.com/pronounce/climb%20a%20mountain/english/us'),
  BuiltInCard(
      front: 'I am working towards my goals every day',
      back: 'Я щодня працюю над досягненням своїх цілей',
      pronunciation: 'ай эм уёркинг тоуордз май гоулз эври дэй',
      transcription: '/aɪ æm ˈwɜːrkɪŋ təˈwɔːrdz maɪ ɡoʊlz ˈevri deɪ/',
      example: 'Small steps add up. I am working towards my goals every day.',
      notes: 'Мотивація',
      imageUrl: 'https://source.unsplash.com/400x300/?goals,progress',
      videoUrl:
          'https://youglish.com/pronounce/working%20towards%20goals/english/us'),
]);

// ============================================================
// 20 — Character & Emotions (B1)
// ============================================================

const _ruSet20 =
    BuiltInSet(name: 'Character & Emotions', langCode: 'ru', cards: [
  BuiltInCard(
      front: 'She is very open-minded',
      back: 'Она очень открытая',
      pronunciation: 'ши из вэри оупэн-майндид',
      transcription: '/ʃiː ɪz ˈveri ˈoʊpən ˈmaɪndɪd/',
      example: 'She accepts all ideas. She is very open-minded.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?openminded,people',
      videoUrl: 'https://youglish.com/pronounce/open-minded/english/us'),
  BuiltInCard(
      front: 'I felt overwhelmed with emotion',
      back: 'Я был переполнен эмоциями',
      pronunciation: 'ай фэлт овэруэлмд уид имоушэн',
      transcription: '/aɪ felt ˌoʊvərˈwelmd wɪð ɪˈmoʊʃən/',
      example: 'When I heard the news. I felt overwhelmed with emotion.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?emotion,overwhelmed',
      videoUrl:
          'https://youglish.com/pronounce/overwhelmed%20with%20emotion/english/us'),
  BuiltInCard(
      front: 'He is reliable and trustworthy',
      back: 'Он надёжный и заслуживающий доверия',
      pronunciation: 'хи из рилайэбэл энд трастуёрди',
      transcription: '/hiː ɪz rɪˈlaɪəbl ænd ˈtrʌstwɜːrði/',
      example: 'He always keeps his word. He is reliable and trustworthy.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?reliable,trust',
      videoUrl:
          'https://youglish.com/pronounce/reliable%20and%20trustworthy/english/us'),
  BuiltInCard(
      front: 'I get anxious in large crowds',
      back: 'В больших толпах я тревожусь',
      pronunciation: 'ай гет энкшэс ин ладж краудз',
      transcription: '/aɪ ɡet ˈæŋkʃəs ɪn lɑːrdʒ kraʊdz/',
      example:
          'Concerts and festivals are hard. I get anxious in large crowds.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?anxious,crowd',
      videoUrl:
          'https://youglish.com/pronounce/anxious%20in%20large%20crowds/english/us'),
  BuiltInCard(
      front: 'She is incredibly empathetic',
      back: 'Она невероятно чуткая',
      pronunciation: 'ши из инкрэдибли эмпэсэтик',
      transcription: '/ʃiː ɪz ɪnˈkredɪbli emˈpæθɪtɪk/',
      example:
          'She always understands how I feel. She is incredibly empathetic.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?empathy,caring',
      videoUrl: 'https://youglish.com/pronounce/empathetic/english/us'),
  BuiltInCard(
      front: 'I felt a sense of pride',
      back: 'Я почувствовал гордость',
      pronunciation: 'ай фэлт э сэнс эв прайд',
      transcription: '/aɪ felt ə sens əv praɪd/',
      example: 'When I finished the race. I felt a sense of pride.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?pride,achievement',
      videoUrl: 'https://youglish.com/pronounce/sense%20of%20pride/english/us'),
  BuiltInCard(
      front: 'He tends to be quite stubborn',
      back: 'Он склонен быть довольно упрямым',
      pronunciation: 'хи тэндз ту би куайт стабэрн',
      transcription: '/hiː tendz tə biː kwaɪt ˈstʌbərn/',
      example: 'He never changes his mind. He tends to be quite stubborn.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?stubborn,determined',
      videoUrl: 'https://youglish.com/pronounce/quite%20stubborn/english/us'),
  BuiltInCard(
      front: 'I was relieved to hear the news',
      back: 'Я был облегчён, услышав эту новость',
      pronunciation: 'ай уоз риливд ту хир дэ ньюз',
      transcription: '/aɪ wɒz rɪˈliːvd tə hɪr ðə njuːz/',
      example: 'The operation was a success. I was relieved to hear the news.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?relief,good%20news',
      videoUrl:
          'https://youglish.com/pronounce/relieved%20to%20hear%20the%20news/english/us'),
  BuiltInCard(
      front: 'She is naturally optimistic',
      back: 'Она от природы оптимистична',
      pronunciation: 'ши из нэчэрэли оптимистик',
      transcription: '/ʃiː ɪz ˈnætʃərəli ˌɒptɪˈmɪstɪk/',
      example: 'She always sees the bright side. She is naturally optimistic.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?optimistic,happy',
      videoUrl:
          'https://youglish.com/pronounce/naturally%20optimistic/english/us'),
  BuiltInCard(
      front: 'I felt disappointed with the result',
      back: 'Я был разочарован результатом',
      pronunciation: 'ай фэлт дисэпойнтид уид дэ ризалт',
      transcription: '/aɪ felt ˌdɪsəˈpɔɪntɪd wɪð ðə rɪˈzʌlt/',
      example: 'I expected better. I felt disappointed with the result.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?disappointed,sad',
      videoUrl:
          'https://youglish.com/pronounce/disappointed%20with%20result/english/us'),
  BuiltInCard(
      front: 'He has a great sense of humour',
      back: 'У него отличное чувство юмора',
      pronunciation: 'хи хэз э грэйт сэнс эв хьюмэр',
      transcription: '/hiː hæz ə ɡreɪt sens əv ˈhjuːmər/',
      example:
          'He always makes everyone laugh. He has a great sense of humour.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?humour,laugh',
      videoUrl:
          'https://youglish.com/pronounce/sense%20of%20humour/english/us'),
  BuiltInCard(
      front: 'I was moved to tears',
      back: 'Я был растроган до слёз',
      pronunciation: 'ай уоз мувд ту тирз',
      transcription: '/aɪ wɒz muːvd tə tɪrz/',
      example: 'The ending of the film was beautiful. I was moved to tears.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?tears,moved',
      videoUrl: 'https://youglish.com/pronounce/moved%20to%20tears/english/us'),
  BuiltInCard(
      front: 'She can be quite introverted',
      back: 'Она может быть довольно замкнутой',
      pronunciation: 'ши кэн би куайт интровёртид',
      transcription: '/ʃiː kæn biː kwaɪt ˈɪntrəvɜːrtɪd/',
      example: 'She prefers small groups. She can be quite introverted.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?introverted,alone',
      videoUrl:
          'https://youglish.com/pronounce/quite%20introverted/english/us'),
  BuiltInCard(
      front: 'I felt a rush of excitement',
      back: 'Меня охватило волнение',
      pronunciation: 'ай фэлт э раш эв эксайтмэнт',
      transcription: '/aɪ felt ə rʌʃ əv ɪkˈsaɪtmənt/',
      example: 'Before getting on stage. I felt a rush of excitement.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?excitement,energy',
      videoUrl:
          'https://youglish.com/pronounce/rush%20of%20excitement/english/us'),
  BuiltInCard(
      front: 'He is very ambitious',
      back: 'Он очень амбициозный',
      pronunciation: 'хи из вэри эмбишэс',
      transcription: '/hiː ɪz ˈveri æmˈbɪʃəs/',
      example: 'He wants to reach the top. He is very ambitious.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?ambitious,success',
      videoUrl: 'https://youglish.com/pronounce/very%20ambitious/english/us'),
  BuiltInCard(
      front: 'I tend to worry too much',
      back: 'Я склонен слишком много беспокоиться',
      pronunciation: 'ай тэнд ту уёри ту мач',
      transcription: '/aɪ tend tə ˈwʌri tuː mʌtʃ/',
      example: 'About things I cannot control. I tend to worry too much.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?worry,stress',
      videoUrl: 'https://youglish.com/pronounce/tend%20to%20worry/english/us'),
  BuiltInCard(
      front: 'She is generous to a fault',
      back: 'Она чрезмерно щедрая',
      pronunciation: 'ши из джэнэрэс ту э фолт',
      transcription: '/ʃiː ɪz ˈdʒenərəs tə ə fɔːlt/',
      example: 'She gives everything away. She is generous to a fault.',
      notes: 'Идиома',
      imageUrl: 'https://source.unsplash.com/400x300/?generous,giving',
      videoUrl:
          'https://youglish.com/pronounce/generous%20to%20a%20fault/english/us'),
  BuiltInCard(
      front: 'I felt guilty about what I said',
      back: 'Я чувствовал вину за то, что сказал',
      pronunciation: 'ай фэлт гилти эбаут уот ай сэд',
      transcription: '/aɪ felt ˈɡɪlti əˈbaʊt wɒt aɪ sed/',
      example: 'I should have been kinder. I felt guilty about what I said.',
      notes: 'Эмоции',
      imageUrl: 'https://source.unsplash.com/400x300/?guilty,regret',
      videoUrl: 'https://youglish.com/pronounce/felt%20guilty/english/us'),
  BuiltInCard(
      front: 'He is patient and calm under pressure',
      back: 'Он терпелив и спокоен под давлением',
      pronunciation: 'хи из пэйшэнт энд кам андэр прэшэр',
      transcription: '/hiː ɪz ˈpeɪʃənt ænd kɑːm ˈʌndər ˈpreʃər/',
      example:
          'Nothing ever rattles him. He is patient and calm under pressure.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?calm,patient',
      videoUrl:
          'https://youglish.com/pronounce/calm%20under%20pressure/english/us'),
  BuiltInCard(
      front: 'I am deeply grateful for your help',
      back: 'Я глубоко благодарен за вашу помощь',
      pronunciation: 'ай эм диплы грэйтфул фор йор хэлп',
      transcription: '/aɪ æm ˈdiːpli ˈɡreɪtfʊl fər jɔːr help/',
      example:
          'You really made a difference. I am deeply grateful for your help.',
      notes: 'Благодарность',
      imageUrl: 'https://source.unsplash.com/400x300/?grateful,thankful',
      videoUrl: 'https://youglish.com/pronounce/deeply%20grateful/english/us'),
]);

const _ukSet20 =
    BuiltInSet(name: 'Character & Emotions', langCode: 'uk', cards: [
  BuiltInCard(
      front: 'She is very open-minded',
      back: 'Вона дуже відкрита',
      pronunciation: 'ши из вэри оупэн-майндид',
      transcription: '/ʃiː ɪz ˈveri ˈoʊpən ˈmaɪndɪd/',
      example: 'She accepts all ideas. She is very open-minded.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?openminded,people',
      videoUrl: 'https://youglish.com/pronounce/open-minded/english/us'),
  BuiltInCard(
      front: 'I felt overwhelmed with emotion',
      back: 'Мене переповнили емоції',
      pronunciation: 'ай фэлт овэруэлмд уид имоушэн',
      transcription: '/aɪ felt ˌoʊvərˈwelmd wɪð ɪˈmoʊʃən/',
      example: 'When I heard the news. I felt overwhelmed with emotion.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?emotion,overwhelmed',
      videoUrl:
          'https://youglish.com/pronounce/overwhelmed%20with%20emotion/english/us'),
  BuiltInCard(
      front: 'He is reliable and trustworthy',
      back: 'Він надійний і заслуговує на довіру',
      pronunciation: 'хи из рилайэбэл энд трастуёрди',
      transcription: '/hiː ɪz rɪˈlaɪəbl ænd ˈtrʌstwɜːrði/',
      example: 'He always keeps his word. He is reliable and trustworthy.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?reliable,trust',
      videoUrl:
          'https://youglish.com/pronounce/reliable%20and%20trustworthy/english/us'),
  BuiltInCard(
      front: 'I get anxious in large crowds',
      back: 'У великих натовпах я тривожуся',
      pronunciation: 'ай гет энкшэс ин ладж краудз',
      transcription: '/aɪ ɡet ˈæŋkʃəs ɪn lɑːrdʒ kraʊdz/',
      example:
          'Concerts and festivals are hard. I get anxious in large crowds.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?anxious,crowd',
      videoUrl:
          'https://youglish.com/pronounce/anxious%20in%20large%20crowds/english/us'),
  BuiltInCard(
      front: 'She is incredibly empathetic',
      back: 'Вона неймовірно чуйна',
      pronunciation: 'ши из инкрэдибли эмпэсэтик',
      transcription: '/ʃiː ɪz ɪnˈkredɪbli emˈpæθɪtɪk/',
      example:
          'She always understands how I feel. She is incredibly empathetic.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?empathy,caring',
      videoUrl: 'https://youglish.com/pronounce/empathetic/english/us'),
  BuiltInCard(
      front: 'I felt a sense of pride',
      back: 'Я відчув гордість',
      pronunciation: 'ай фэлт э сэнс эв прайд',
      transcription: '/aɪ felt ə sens əv praɪd/',
      example: 'When I finished the race. I felt a sense of pride.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?pride,achievement',
      videoUrl: 'https://youglish.com/pronounce/sense%20of%20pride/english/us'),
  BuiltInCard(
      front: 'He tends to be quite stubborn',
      back: 'Він схильний бути досить впертим',
      pronunciation: 'хи тэндз ту би куайт стабэрн',
      transcription: '/hiː tendz tə biː kwaɪt ˈstʌbərn/',
      example: 'He never changes his mind. He tends to be quite stubborn.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?stubborn,determined',
      videoUrl: 'https://youglish.com/pronounce/quite%20stubborn/english/us'),
  BuiltInCard(
      front: 'I was relieved to hear the news',
      back: 'Я зітхнув з полегшенням почувши новину',
      pronunciation: 'ай уоз риливд ту хир дэ ньюз',
      transcription: '/aɪ wɒz rɪˈliːvd tə hɪr ðə njuːz/',
      example: 'The operation was a success. I was relieved to hear the news.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?relief,good%20news',
      videoUrl:
          'https://youglish.com/pronounce/relieved%20to%20hear%20the%20news/english/us'),
  BuiltInCard(
      front: 'She is naturally optimistic',
      back: 'Вона від природи оптимістична',
      pronunciation: 'ши из нэчэрэли оптимистик',
      transcription: '/ʃiː ɪz ˈnætʃərəli ˌɒptɪˈmɪstɪk/',
      example: 'She always sees the bright side. She is naturally optimistic.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?optimistic,happy',
      videoUrl:
          'https://youglish.com/pronounce/naturally%20optimistic/english/us'),
  BuiltInCard(
      front: 'I felt disappointed with the result',
      back: 'Я був розчарований результатом',
      pronunciation: 'ай фэлт дисэпойнтид уид дэ ризалт',
      transcription: '/aɪ felt ˌdɪsəˈpɔɪntɪd wɪð ðə rɪˈzʌlt/',
      example: 'I expected better. I felt disappointed with the result.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?disappointed,sad',
      videoUrl:
          'https://youglish.com/pronounce/disappointed%20with%20result/english/us'),
  BuiltInCard(
      front: 'He has a great sense of humour',
      back: 'У нього чудове почуття гумору',
      pronunciation: 'хи хэз э грэйт сэнс эв хьюмэр',
      transcription: '/hiː hæz ə ɡreɪt sens əv ˈhjuːmər/',
      example:
          'He always makes everyone laugh. He has a great sense of humour.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?humour,laugh',
      videoUrl:
          'https://youglish.com/pronounce/sense%20of%20humour/english/us'),
  BuiltInCard(
      front: 'I was moved to tears',
      back: 'Мене зворушило до сліз',
      pronunciation: 'ай уоз мувд ту тирз',
      transcription: '/aɪ wɒz muːvd tə tɪrz/',
      example: 'The ending of the film was beautiful. I was moved to tears.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?tears,moved',
      videoUrl: 'https://youglish.com/pronounce/moved%20to%20tears/english/us'),
  BuiltInCard(
      front: 'She can be quite introverted',
      back: 'Вона може бути досить замкненою',
      pronunciation: 'ши кэн би куайт интровёртид',
      transcription: '/ʃiː kæn biː kwaɪt ˈɪntrəvɜːrtɪd/',
      example: 'She prefers small groups. She can be quite introverted.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?introverted,alone',
      videoUrl:
          'https://youglish.com/pronounce/quite%20introverted/english/us'),
  BuiltInCard(
      front: 'I felt a rush of excitement',
      back: 'Мене охопило хвилювання',
      pronunciation: 'ай фэлт э раш эв эксайтмэнт',
      transcription: '/aɪ felt ə rʌʃ əv ɪkˈsaɪtmənt/',
      example: 'Before getting on stage. I felt a rush of excitement.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?excitement,energy',
      videoUrl:
          'https://youglish.com/pronounce/rush%20of%20excitement/english/us'),
  BuiltInCard(
      front: 'He is very ambitious',
      back: 'Він дуже амбітний',
      pronunciation: 'хи из вэри эмбишэс',
      transcription: '/hiː ɪz ˈveri æmˈbɪʃəs/',
      example: 'He wants to reach the top. He is very ambitious.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?ambitious,success',
      videoUrl: 'https://youglish.com/pronounce/very%20ambitious/english/us'),
  BuiltInCard(
      front: 'I tend to worry too much',
      back: 'Я схильний занадто багато хвилюватися',
      pronunciation: 'ай тэнд ту уёри ту мач',
      transcription: '/aɪ tend tə ˈwʌri tuː mʌtʃ/',
      example: 'About things I cannot control. I tend to worry too much.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?worry,stress',
      videoUrl: 'https://youglish.com/pronounce/tend%20to%20worry/english/us'),
  BuiltInCard(
      front: 'She is generous to a fault',
      back: 'Вона надмірно щедра',
      pronunciation: 'ши из джэнэрэс ту э фолт',
      transcription: '/ʃiː ɪz ˈdʒenərəs tə ə fɔːlt/',
      example: 'She gives everything away. She is generous to a fault.',
      notes: 'Ідіома',
      imageUrl: 'https://source.unsplash.com/400x300/?generous,giving',
      videoUrl:
          'https://youglish.com/pronounce/generous%20to%20a%20fault/english/us'),
  BuiltInCard(
      front: 'I felt guilty about what I said',
      back: 'Я відчував провину за те, що сказав',
      pronunciation: 'ай фэлт гилти эбаут уот ай сэд',
      transcription: '/aɪ felt ˈɡɪlti əˈbaʊt wɒt aɪ sed/',
      example: 'I should have been kinder. I felt guilty about what I said.',
      notes: 'Емоції',
      imageUrl: 'https://source.unsplash.com/400x300/?guilty,regret',
      videoUrl: 'https://youglish.com/pronounce/felt%20guilty/english/us'),
  BuiltInCard(
      front: 'He is patient and calm under pressure',
      back: 'Він терплячий і спокійний під тиском',
      pronunciation: 'хи из пэйшэнт энд кам андэр прэшэр',
      transcription: '/hiː ɪz ˈpeɪʃənt ænd kɑːm ˈʌndər ˈpreʃər/',
      example:
          'Nothing ever rattles him. He is patient and calm under pressure.',
      notes: 'Характер',
      imageUrl: 'https://source.unsplash.com/400x300/?calm,patient',
      videoUrl:
          'https://youglish.com/pronounce/calm%20under%20pressure/english/us'),
  BuiltInCard(
      front: 'I am deeply grateful for your help',
      back: 'Я глибоко вдячний за вашу допомогу',
      pronunciation: 'ай эм диплы грэйтфул фор йор хэлп',
      transcription: '/aɪ æm ˈdiːpli ˈɡreɪtfʊl fər jɔːr help/',
      example:
          'You really made a difference. I am deeply grateful for your help.',
      notes: 'Вдячність',
      imageUrl: 'https://source.unsplash.com/400x300/?grateful,thankful',
      videoUrl: 'https://youglish.com/pronounce/deeply%20grateful/english/us'),
]);

// ============================================================
// ФИНАЛЬНЫЙ СПИСОК — все 40 наборов
// ============================================================

const List<BuiltInSet> builtInSets = [
  _ruSet01,
  _ukSet01,
  _ruSet02,
  _ukSet02,
  _ruSet03,
  _ukSet03,
  _ruSet04,
  _ukSet04,
  _ruSet05,
  _ukSet05,
  _ruSet06,
  _ukSet06,
  _ruSet07,
  _ukSet07,
  _ruSet08,
  _ukSet08,
  _ruSet09,
  _ukSet09,
  _ruSet10,
  _ukSet10,
  _ruSet11,
  _ukSet11,
  _ruSet12,
  _ukSet12,
  _ruSet13,
  _ukSet13,
  _ruSet14,
  _ukSet14,
  _ruSet15,
  _ukSet15,
  _ruSet16,
  _ukSet16,
  _ruSet17,
  _ukSet17,
  _ruSet18,
  _ukSet18,
  _ruSet19,
  _ukSet19,
  _ruSet20,
  _ukSet20,
];
// END OF PART 6 — ФАЙЛ ЗАВЕРШЁН
