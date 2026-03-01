// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DecksTable extends Decks with TableInfo<$DecksTable, Deck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceLanguageMeta =
      const VerificationMeta('sourceLanguage');
  @override
  late final GeneratedColumn<String> sourceLanguage = GeneratedColumn<String>(
      'source_language', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _targetLanguageMeta =
      const VerificationMeta('targetLanguage');
  @override
  late final GeneratedColumn<String> targetLanguage = GeneratedColumn<String>(
      'target_language', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _totalCardsMeta =
      const VerificationMeta('totalCards');
  @override
  late final GeneratedColumn<int> totalCards = GeneratedColumn<int>(
      'total_cards', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masteredCardsMeta =
      const VerificationMeta('masteredCards');
  @override
  late final GeneratedColumn<int> masteredCards = GeneratedColumn<int>(
      'mastered_cards', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastStudiedAtMeta =
      const VerificationMeta('lastStudiedAt');
  @override
  late final GeneratedColumn<DateTime> lastStudiedAt =
      GeneratedColumn<DateTime>('last_studied_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        sourceLanguage,
        targetLanguage,
        totalCards,
        masteredCards,
        createdAt,
        lastStudiedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decks';
  @override
  VerificationContext validateIntegrity(Insertable<Deck> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('source_language')) {
      context.handle(
          _sourceLanguageMeta,
          sourceLanguage.isAcceptableOrUnknown(
              data['source_language']!, _sourceLanguageMeta));
    } else if (isInserting) {
      context.missing(_sourceLanguageMeta);
    }
    if (data.containsKey('target_language')) {
      context.handle(
          _targetLanguageMeta,
          targetLanguage.isAcceptableOrUnknown(
              data['target_language']!, _targetLanguageMeta));
    } else if (isInserting) {
      context.missing(_targetLanguageMeta);
    }
    if (data.containsKey('total_cards')) {
      context.handle(
          _totalCardsMeta,
          totalCards.isAcceptableOrUnknown(
              data['total_cards']!, _totalCardsMeta));
    }
    if (data.containsKey('mastered_cards')) {
      context.handle(
          _masteredCardsMeta,
          masteredCards.isAcceptableOrUnknown(
              data['mastered_cards']!, _masteredCardsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_studied_at')) {
      context.handle(
          _lastStudiedAtMeta,
          lastStudiedAt.isAcceptableOrUnknown(
              data['last_studied_at']!, _lastStudiedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deck(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      sourceLanguage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}source_language'])!,
      targetLanguage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_language'])!,
      totalCards: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_cards'])!,
      masteredCards: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mastered_cards'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastStudiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_studied_at']),
    );
  }

  @override
  $DecksTable createAlias(String alias) {
    return $DecksTable(attachedDatabase, alias);
  }
}

class Deck extends DataClass implements Insertable<Deck> {
  final int id;
  final String name;
  final String? description;
  final String sourceLanguage;
  final String targetLanguage;
  final int totalCards;
  final int masteredCards;
  final DateTime createdAt;
  final DateTime? lastStudiedAt;
  const Deck(
      {required this.id,
      required this.name,
      this.description,
      required this.sourceLanguage,
      required this.targetLanguage,
      required this.totalCards,
      required this.masteredCards,
      required this.createdAt,
      this.lastStudiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['source_language'] = Variable<String>(sourceLanguage);
    map['target_language'] = Variable<String>(targetLanguage);
    map['total_cards'] = Variable<int>(totalCards);
    map['mastered_cards'] = Variable<int>(masteredCards);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastStudiedAt != null) {
      map['last_studied_at'] = Variable<DateTime>(lastStudiedAt);
    }
    return map;
  }

  DecksCompanion toCompanion(bool nullToAbsent) {
    return DecksCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sourceLanguage: Value(sourceLanguage),
      targetLanguage: Value(targetLanguage),
      totalCards: Value(totalCards),
      masteredCards: Value(masteredCards),
      createdAt: Value(createdAt),
      lastStudiedAt: lastStudiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStudiedAt),
    );
  }

  factory Deck.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deck(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sourceLanguage: serializer.fromJson<String>(json['sourceLanguage']),
      targetLanguage: serializer.fromJson<String>(json['targetLanguage']),
      totalCards: serializer.fromJson<int>(json['totalCards']),
      masteredCards: serializer.fromJson<int>(json['masteredCards']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastStudiedAt: serializer.fromJson<DateTime?>(json['lastStudiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sourceLanguage': serializer.toJson<String>(sourceLanguage),
      'targetLanguage': serializer.toJson<String>(targetLanguage),
      'totalCards': serializer.toJson<int>(totalCards),
      'masteredCards': serializer.toJson<int>(masteredCards),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastStudiedAt': serializer.toJson<DateTime?>(lastStudiedAt),
    };
  }

  Deck copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          String? sourceLanguage,
          String? targetLanguage,
          int? totalCards,
          int? masteredCards,
          DateTime? createdAt,
          Value<DateTime?> lastStudiedAt = const Value.absent()}) =>
      Deck(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        sourceLanguage: sourceLanguage ?? this.sourceLanguage,
        targetLanguage: targetLanguage ?? this.targetLanguage,
        totalCards: totalCards ?? this.totalCards,
        masteredCards: masteredCards ?? this.masteredCards,
        createdAt: createdAt ?? this.createdAt,
        lastStudiedAt:
            lastStudiedAt.present ? lastStudiedAt.value : this.lastStudiedAt,
      );
  Deck copyWithCompanion(DecksCompanion data) {
    return Deck(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      sourceLanguage: data.sourceLanguage.present
          ? data.sourceLanguage.value
          : this.sourceLanguage,
      targetLanguage: data.targetLanguage.present
          ? data.targetLanguage.value
          : this.targetLanguage,
      totalCards:
          data.totalCards.present ? data.totalCards.value : this.totalCards,
      masteredCards: data.masteredCards.present
          ? data.masteredCards.value
          : this.masteredCards,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastStudiedAt: data.lastStudiedAt.present
          ? data.lastStudiedAt.value
          : this.lastStudiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Deck(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceLanguage: $sourceLanguage, ')
          ..write('targetLanguage: $targetLanguage, ')
          ..write('totalCards: $totalCards, ')
          ..write('masteredCards: $masteredCards, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastStudiedAt: $lastStudiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, sourceLanguage,
      targetLanguage, totalCards, masteredCards, createdAt, lastStudiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deck &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sourceLanguage == this.sourceLanguage &&
          other.targetLanguage == this.targetLanguage &&
          other.totalCards == this.totalCards &&
          other.masteredCards == this.masteredCards &&
          other.createdAt == this.createdAt &&
          other.lastStudiedAt == this.lastStudiedAt);
}

class DecksCompanion extends UpdateCompanion<Deck> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> sourceLanguage;
  final Value<String> targetLanguage;
  final Value<int> totalCards;
  final Value<int> masteredCards;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastStudiedAt;
  const DecksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceLanguage = const Value.absent(),
    this.targetLanguage = const Value.absent(),
    this.totalCards = const Value.absent(),
    this.masteredCards = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
  });
  DecksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String sourceLanguage,
    required String targetLanguage,
    this.totalCards = const Value.absent(),
    this.masteredCards = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
  })  : name = Value(name),
        sourceLanguage = Value(sourceLanguage),
        targetLanguage = Value(targetLanguage);
  static Insertable<Deck> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sourceLanguage,
    Expression<String>? targetLanguage,
    Expression<int>? totalCards,
    Expression<int>? masteredCards,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastStudiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sourceLanguage != null) 'source_language': sourceLanguage,
      if (targetLanguage != null) 'target_language': targetLanguage,
      if (totalCards != null) 'total_cards': totalCards,
      if (masteredCards != null) 'mastered_cards': masteredCards,
      if (createdAt != null) 'created_at': createdAt,
      if (lastStudiedAt != null) 'last_studied_at': lastStudiedAt,
    });
  }

  DecksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? sourceLanguage,
      Value<String>? targetLanguage,
      Value<int>? totalCards,
      Value<int>? masteredCards,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastStudiedAt}) {
    return DecksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      targetLanguage: targetLanguage ?? this.targetLanguage,
      totalCards: totalCards ?? this.totalCards,
      masteredCards: masteredCards ?? this.masteredCards,
      createdAt: createdAt ?? this.createdAt,
      lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sourceLanguage.present) {
      map['source_language'] = Variable<String>(sourceLanguage.value);
    }
    if (targetLanguage.present) {
      map['target_language'] = Variable<String>(targetLanguage.value);
    }
    if (totalCards.present) {
      map['total_cards'] = Variable<int>(totalCards.value);
    }
    if (masteredCards.present) {
      map['mastered_cards'] = Variable<int>(masteredCards.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastStudiedAt.present) {
      map['last_studied_at'] = Variable<DateTime>(lastStudiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceLanguage: $sourceLanguage, ')
          ..write('targetLanguage: $targetLanguage, ')
          ..write('totalCards: $totalCards, ')
          ..write('masteredCards: $masteredCards, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastStudiedAt: $lastStudiedAt')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, CardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<int> deckId = GeneratedColumn<int>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES decks (id) ON DELETE CASCADE'));
  static const VerificationMeta _frontTextMeta =
      const VerificationMeta('frontText');
  @override
  late final GeneratedColumn<String> frontText = GeneratedColumn<String>(
      'front_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _backTextMeta =
      const VerificationMeta('backText');
  @override
  late final GeneratedColumn<String> backText = GeneratedColumn<String>(
      'back_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frontImagePathMeta =
      const VerificationMeta('frontImagePath');
  @override
  late final GeneratedColumn<String> frontImagePath = GeneratedColumn<String>(
      'front_image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backImagePathMeta =
      const VerificationMeta('backImagePath');
  @override
  late final GeneratedColumn<String> backImagePath = GeneratedColumn<String>(
      'back_image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frontAudioPathMeta =
      const VerificationMeta('frontAudioPath');
  @override
  late final GeneratedColumn<String> frontAudioPath = GeneratedColumn<String>(
      'front_audio_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backAudioPathMeta =
      const VerificationMeta('backAudioPath');
  @override
  late final GeneratedColumn<String> backAudioPath = GeneratedColumn<String>(
      'back_audio_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frontVideoUrlMeta =
      const VerificationMeta('frontVideoUrl');
  @override
  late final GeneratedColumn<String> frontVideoUrl = GeneratedColumn<String>(
      'front_video_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backVideoUrlMeta =
      const VerificationMeta('backVideoUrl');
  @override
  late final GeneratedColumn<String> backVideoUrl = GeneratedColumn<String>(
      'back_video_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pronunciationMeta =
      const VerificationMeta('pronunciation');
  @override
  late final GeneratedColumn<String> pronunciation = GeneratedColumn<String>(
      'pronunciation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transcriptionMeta =
      const VerificationMeta('transcription');
  @override
  late final GeneratedColumn<String> transcription = GeneratedColumn<String>(
      'transcription', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exampleMeta =
      const VerificationMeta('example');
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
      'example', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _easinessFactorMeta =
      const VerificationMeta('easinessFactor');
  @override
  late final GeneratedColumn<int> easinessFactor = GeneratedColumn<int>(
      'easiness_factor', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(250));
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _nextReviewDateMeta =
      const VerificationMeta('nextReviewDate');
  @override
  late final GeneratedColumn<DateTime> nextReviewDate =
      GeneratedColumn<DateTime>('next_review_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastReviewedAtMeta =
      const VerificationMeta('lastReviewedAt');
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>('last_reviewed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _correctCountMeta =
      const VerificationMeta('correctCount');
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
      'correct_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _incorrectCountMeta =
      const VerificationMeta('incorrectCount');
  @override
  late final GeneratedColumn<int> incorrectCount = GeneratedColumn<int>(
      'incorrect_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isMasteredMeta =
      const VerificationMeta('isMastered');
  @override
  late final GeneratedColumn<bool> isMastered = GeneratedColumn<bool>(
      'is_mastered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_mastered" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        deckId,
        frontText,
        backText,
        frontImagePath,
        backImagePath,
        frontAudioPath,
        backAudioPath,
        frontVideoUrl,
        backVideoUrl,
        pronunciation,
        transcription,
        example,
        notes,
        easinessFactor,
        repetitions,
        interval,
        nextReviewDate,
        lastReviewedAt,
        correctCount,
        incorrectCount,
        isMastered,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<CardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('front_text')) {
      context.handle(_frontTextMeta,
          frontText.isAcceptableOrUnknown(data['front_text']!, _frontTextMeta));
    } else if (isInserting) {
      context.missing(_frontTextMeta);
    }
    if (data.containsKey('back_text')) {
      context.handle(_backTextMeta,
          backText.isAcceptableOrUnknown(data['back_text']!, _backTextMeta));
    } else if (isInserting) {
      context.missing(_backTextMeta);
    }
    if (data.containsKey('front_image_path')) {
      context.handle(
          _frontImagePathMeta,
          frontImagePath.isAcceptableOrUnknown(
              data['front_image_path']!, _frontImagePathMeta));
    }
    if (data.containsKey('back_image_path')) {
      context.handle(
          _backImagePathMeta,
          backImagePath.isAcceptableOrUnknown(
              data['back_image_path']!, _backImagePathMeta));
    }
    if (data.containsKey('front_audio_path')) {
      context.handle(
          _frontAudioPathMeta,
          frontAudioPath.isAcceptableOrUnknown(
              data['front_audio_path']!, _frontAudioPathMeta));
    }
    if (data.containsKey('back_audio_path')) {
      context.handle(
          _backAudioPathMeta,
          backAudioPath.isAcceptableOrUnknown(
              data['back_audio_path']!, _backAudioPathMeta));
    }
    if (data.containsKey('front_video_url')) {
      context.handle(
          _frontVideoUrlMeta,
          frontVideoUrl.isAcceptableOrUnknown(
              data['front_video_url']!, _frontVideoUrlMeta));
    }
    if (data.containsKey('back_video_url')) {
      context.handle(
          _backVideoUrlMeta,
          backVideoUrl.isAcceptableOrUnknown(
              data['back_video_url']!, _backVideoUrlMeta));
    }
    if (data.containsKey('pronunciation')) {
      context.handle(
          _pronunciationMeta,
          pronunciation.isAcceptableOrUnknown(
              data['pronunciation']!, _pronunciationMeta));
    }
    if (data.containsKey('transcription')) {
      context.handle(
          _transcriptionMeta,
          transcription.isAcceptableOrUnknown(
              data['transcription']!, _transcriptionMeta));
    }
    if (data.containsKey('example')) {
      context.handle(_exampleMeta,
          example.isAcceptableOrUnknown(data['example']!, _exampleMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('easiness_factor')) {
      context.handle(
          _easinessFactorMeta,
          easinessFactor.isAcceptableOrUnknown(
              data['easiness_factor']!, _easinessFactorMeta));
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    }
    if (data.containsKey('next_review_date')) {
      context.handle(
          _nextReviewDateMeta,
          nextReviewDate.isAcceptableOrUnknown(
              data['next_review_date']!, _nextReviewDateMeta));
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
          _lastReviewedAtMeta,
          lastReviewedAt.isAcceptableOrUnknown(
              data['last_reviewed_at']!, _lastReviewedAtMeta));
    }
    if (data.containsKey('correct_count')) {
      context.handle(
          _correctCountMeta,
          correctCount.isAcceptableOrUnknown(
              data['correct_count']!, _correctCountMeta));
    }
    if (data.containsKey('incorrect_count')) {
      context.handle(
          _incorrectCountMeta,
          incorrectCount.isAcceptableOrUnknown(
              data['incorrect_count']!, _incorrectCountMeta));
    }
    if (data.containsKey('is_mastered')) {
      context.handle(
          _isMasteredMeta,
          isMastered.isAcceptableOrUnknown(
              data['is_mastered']!, _isMasteredMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deck_id'])!,
      frontText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}front_text'])!,
      backText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_text'])!,
      frontImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}front_image_path']),
      backImagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_image_path']),
      frontAudioPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}front_audio_path']),
      backAudioPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_audio_path']),
      frontVideoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}front_video_url']),
      backVideoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_video_url']),
      pronunciation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pronunciation']),
      transcription: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transcription']),
      example: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      easinessFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easiness_factor'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      nextReviewDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_review_date']),
      lastReviewedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_reviewed_at']),
      correctCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_count'])!,
      incorrectCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}incorrect_count'])!,
      isMastered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_mastered'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class CardData extends DataClass implements Insertable<CardData> {
  final int id;
  final int deckId;
  final String frontText;
  final String backText;
  final String? frontImagePath;
  final String? backImagePath;
  final String? frontAudioPath;
  final String? backAudioPath;
  final String? frontVideoUrl;
  final String? backVideoUrl;
  final String? pronunciation;
  final String? transcription;
  final String? example;
  final String? notes;
  final int easinessFactor;
  final int repetitions;
  final int interval;
  final DateTime? nextReviewDate;
  final DateTime? lastReviewedAt;
  final int correctCount;
  final int incorrectCount;
  final bool isMastered;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CardData(
      {required this.id,
      required this.deckId,
      required this.frontText,
      required this.backText,
      this.frontImagePath,
      this.backImagePath,
      this.frontAudioPath,
      this.backAudioPath,
      this.frontVideoUrl,
      this.backVideoUrl,
      this.pronunciation,
      this.transcription,
      this.example,
      this.notes,
      required this.easinessFactor,
      required this.repetitions,
      required this.interval,
      this.nextReviewDate,
      this.lastReviewedAt,
      required this.correctCount,
      required this.incorrectCount,
      required this.isMastered,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deck_id'] = Variable<int>(deckId);
    map['front_text'] = Variable<String>(frontText);
    map['back_text'] = Variable<String>(backText);
    if (!nullToAbsent || frontImagePath != null) {
      map['front_image_path'] = Variable<String>(frontImagePath);
    }
    if (!nullToAbsent || backImagePath != null) {
      map['back_image_path'] = Variable<String>(backImagePath);
    }
    if (!nullToAbsent || frontAudioPath != null) {
      map['front_audio_path'] = Variable<String>(frontAudioPath);
    }
    if (!nullToAbsent || backAudioPath != null) {
      map['back_audio_path'] = Variable<String>(backAudioPath);
    }
    if (!nullToAbsent || frontVideoUrl != null) {
      map['front_video_url'] = Variable<String>(frontVideoUrl);
    }
    if (!nullToAbsent || backVideoUrl != null) {
      map['back_video_url'] = Variable<String>(backVideoUrl);
    }
    if (!nullToAbsent || pronunciation != null) {
      map['pronunciation'] = Variable<String>(pronunciation);
    }
    if (!nullToAbsent || transcription != null) {
      map['transcription'] = Variable<String>(transcription);
    }
    if (!nullToAbsent || example != null) {
      map['example'] = Variable<String>(example);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['easiness_factor'] = Variable<int>(easinessFactor);
    map['repetitions'] = Variable<int>(repetitions);
    map['interval'] = Variable<int>(interval);
    if (!nullToAbsent || nextReviewDate != null) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate);
    }
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    map['correct_count'] = Variable<int>(correctCount);
    map['incorrect_count'] = Variable<int>(incorrectCount);
    map['is_mastered'] = Variable<bool>(isMastered);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      deckId: Value(deckId),
      frontText: Value(frontText),
      backText: Value(backText),
      frontImagePath: frontImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(frontImagePath),
      backImagePath: backImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(backImagePath),
      frontAudioPath: frontAudioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(frontAudioPath),
      backAudioPath: backAudioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backAudioPath),
      frontVideoUrl: frontVideoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(frontVideoUrl),
      backVideoUrl: backVideoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(backVideoUrl),
      pronunciation: pronunciation == null && nullToAbsent
          ? const Value.absent()
          : Value(pronunciation),
      transcription: transcription == null && nullToAbsent
          ? const Value.absent()
          : Value(transcription),
      example: example == null && nullToAbsent
          ? const Value.absent()
          : Value(example),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      easinessFactor: Value(easinessFactor),
      repetitions: Value(repetitions),
      interval: Value(interval),
      nextReviewDate: nextReviewDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReviewDate),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      correctCount: Value(correctCount),
      incorrectCount: Value(incorrectCount),
      isMastered: Value(isMastered),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardData(
      id: serializer.fromJson<int>(json['id']),
      deckId: serializer.fromJson<int>(json['deckId']),
      frontText: serializer.fromJson<String>(json['frontText']),
      backText: serializer.fromJson<String>(json['backText']),
      frontImagePath: serializer.fromJson<String?>(json['frontImagePath']),
      backImagePath: serializer.fromJson<String?>(json['backImagePath']),
      frontAudioPath: serializer.fromJson<String?>(json['frontAudioPath']),
      backAudioPath: serializer.fromJson<String?>(json['backAudioPath']),
      frontVideoUrl: serializer.fromJson<String?>(json['frontVideoUrl']),
      backVideoUrl: serializer.fromJson<String?>(json['backVideoUrl']),
      pronunciation: serializer.fromJson<String?>(json['pronunciation']),
      transcription: serializer.fromJson<String?>(json['transcription']),
      example: serializer.fromJson<String?>(json['example']),
      notes: serializer.fromJson<String?>(json['notes']),
      easinessFactor: serializer.fromJson<int>(json['easinessFactor']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      interval: serializer.fromJson<int>(json['interval']),
      nextReviewDate: serializer.fromJson<DateTime?>(json['nextReviewDate']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      incorrectCount: serializer.fromJson<int>(json['incorrectCount']),
      isMastered: serializer.fromJson<bool>(json['isMastered']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deckId': serializer.toJson<int>(deckId),
      'frontText': serializer.toJson<String>(frontText),
      'backText': serializer.toJson<String>(backText),
      'frontImagePath': serializer.toJson<String?>(frontImagePath),
      'backImagePath': serializer.toJson<String?>(backImagePath),
      'frontAudioPath': serializer.toJson<String?>(frontAudioPath),
      'backAudioPath': serializer.toJson<String?>(backAudioPath),
      'frontVideoUrl': serializer.toJson<String?>(frontVideoUrl),
      'backVideoUrl': serializer.toJson<String?>(backVideoUrl),
      'pronunciation': serializer.toJson<String?>(pronunciation),
      'transcription': serializer.toJson<String?>(transcription),
      'example': serializer.toJson<String?>(example),
      'notes': serializer.toJson<String?>(notes),
      'easinessFactor': serializer.toJson<int>(easinessFactor),
      'repetitions': serializer.toJson<int>(repetitions),
      'interval': serializer.toJson<int>(interval),
      'nextReviewDate': serializer.toJson<DateTime?>(nextReviewDate),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'correctCount': serializer.toJson<int>(correctCount),
      'incorrectCount': serializer.toJson<int>(incorrectCount),
      'isMastered': serializer.toJson<bool>(isMastered),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CardData copyWith(
          {int? id,
          int? deckId,
          String? frontText,
          String? backText,
          Value<String?> frontImagePath = const Value.absent(),
          Value<String?> backImagePath = const Value.absent(),
          Value<String?> frontAudioPath = const Value.absent(),
          Value<String?> backAudioPath = const Value.absent(),
          Value<String?> frontVideoUrl = const Value.absent(),
          Value<String?> backVideoUrl = const Value.absent(),
          Value<String?> pronunciation = const Value.absent(),
          Value<String?> transcription = const Value.absent(),
          Value<String?> example = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          int? easinessFactor,
          int? repetitions,
          int? interval,
          Value<DateTime?> nextReviewDate = const Value.absent(),
          Value<DateTime?> lastReviewedAt = const Value.absent(),
          int? correctCount,
          int? incorrectCount,
          bool? isMastered,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CardData(
        id: id ?? this.id,
        deckId: deckId ?? this.deckId,
        frontText: frontText ?? this.frontText,
        backText: backText ?? this.backText,
        frontImagePath:
            frontImagePath.present ? frontImagePath.value : this.frontImagePath,
        backImagePath:
            backImagePath.present ? backImagePath.value : this.backImagePath,
        frontAudioPath:
            frontAudioPath.present ? frontAudioPath.value : this.frontAudioPath,
        backAudioPath:
            backAudioPath.present ? backAudioPath.value : this.backAudioPath,
        frontVideoUrl:
            frontVideoUrl.present ? frontVideoUrl.value : this.frontVideoUrl,
        backVideoUrl:
            backVideoUrl.present ? backVideoUrl.value : this.backVideoUrl,
        pronunciation:
            pronunciation.present ? pronunciation.value : this.pronunciation,
        transcription:
            transcription.present ? transcription.value : this.transcription,
        example: example.present ? example.value : this.example,
        notes: notes.present ? notes.value : this.notes,
        easinessFactor: easinessFactor ?? this.easinessFactor,
        repetitions: repetitions ?? this.repetitions,
        interval: interval ?? this.interval,
        nextReviewDate:
            nextReviewDate.present ? nextReviewDate.value : this.nextReviewDate,
        lastReviewedAt:
            lastReviewedAt.present ? lastReviewedAt.value : this.lastReviewedAt,
        correctCount: correctCount ?? this.correctCount,
        incorrectCount: incorrectCount ?? this.incorrectCount,
        isMastered: isMastered ?? this.isMastered,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CardData copyWithCompanion(CardsCompanion data) {
    return CardData(
      id: data.id.present ? data.id.value : this.id,
      deckId: data.deckId.present ? data.deckId.value : this.deckId,
      frontText: data.frontText.present ? data.frontText.value : this.frontText,
      backText: data.backText.present ? data.backText.value : this.backText,
      frontImagePath: data.frontImagePath.present
          ? data.frontImagePath.value
          : this.frontImagePath,
      backImagePath: data.backImagePath.present
          ? data.backImagePath.value
          : this.backImagePath,
      frontAudioPath: data.frontAudioPath.present
          ? data.frontAudioPath.value
          : this.frontAudioPath,
      backAudioPath: data.backAudioPath.present
          ? data.backAudioPath.value
          : this.backAudioPath,
      frontVideoUrl: data.frontVideoUrl.present
          ? data.frontVideoUrl.value
          : this.frontVideoUrl,
      backVideoUrl: data.backVideoUrl.present
          ? data.backVideoUrl.value
          : this.backVideoUrl,
      pronunciation: data.pronunciation.present
          ? data.pronunciation.value
          : this.pronunciation,
      transcription: data.transcription.present
          ? data.transcription.value
          : this.transcription,
      example: data.example.present ? data.example.value : this.example,
      notes: data.notes.present ? data.notes.value : this.notes,
      easinessFactor: data.easinessFactor.present
          ? data.easinessFactor.value
          : this.easinessFactor,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      interval: data.interval.present ? data.interval.value : this.interval,
      nextReviewDate: data.nextReviewDate.present
          ? data.nextReviewDate.value
          : this.nextReviewDate,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      incorrectCount: data.incorrectCount.present
          ? data.incorrectCount.value
          : this.incorrectCount,
      isMastered:
          data.isMastered.present ? data.isMastered.value : this.isMastered,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardData(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('frontText: $frontText, ')
          ..write('backText: $backText, ')
          ..write('frontImagePath: $frontImagePath, ')
          ..write('backImagePath: $backImagePath, ')
          ..write('frontAudioPath: $frontAudioPath, ')
          ..write('backAudioPath: $backAudioPath, ')
          ..write('frontVideoUrl: $frontVideoUrl, ')
          ..write('backVideoUrl: $backVideoUrl, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('transcription: $transcription, ')
          ..write('example: $example, ')
          ..write('notes: $notes, ')
          ..write('easinessFactor: $easinessFactor, ')
          ..write('repetitions: $repetitions, ')
          ..write('interval: $interval, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('correctCount: $correctCount, ')
          ..write('incorrectCount: $incorrectCount, ')
          ..write('isMastered: $isMastered, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        deckId,
        frontText,
        backText,
        frontImagePath,
        backImagePath,
        frontAudioPath,
        backAudioPath,
        frontVideoUrl,
        backVideoUrl,
        pronunciation,
        transcription,
        example,
        notes,
        easinessFactor,
        repetitions,
        interval,
        nextReviewDate,
        lastReviewedAt,
        correctCount,
        incorrectCount,
        isMastered,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardData &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.frontText == this.frontText &&
          other.backText == this.backText &&
          other.frontImagePath == this.frontImagePath &&
          other.backImagePath == this.backImagePath &&
          other.frontAudioPath == this.frontAudioPath &&
          other.backAudioPath == this.backAudioPath &&
          other.frontVideoUrl == this.frontVideoUrl &&
          other.backVideoUrl == this.backVideoUrl &&
          other.pronunciation == this.pronunciation &&
          other.transcription == this.transcription &&
          other.example == this.example &&
          other.notes == this.notes &&
          other.easinessFactor == this.easinessFactor &&
          other.repetitions == this.repetitions &&
          other.interval == this.interval &&
          other.nextReviewDate == this.nextReviewDate &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.correctCount == this.correctCount &&
          other.incorrectCount == this.incorrectCount &&
          other.isMastered == this.isMastered &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CardsCompanion extends UpdateCompanion<CardData> {
  final Value<int> id;
  final Value<int> deckId;
  final Value<String> frontText;
  final Value<String> backText;
  final Value<String?> frontImagePath;
  final Value<String?> backImagePath;
  final Value<String?> frontAudioPath;
  final Value<String?> backAudioPath;
  final Value<String?> frontVideoUrl;
  final Value<String?> backVideoUrl;
  final Value<String?> pronunciation;
  final Value<String?> transcription;
  final Value<String?> example;
  final Value<String?> notes;
  final Value<int> easinessFactor;
  final Value<int> repetitions;
  final Value<int> interval;
  final Value<DateTime?> nextReviewDate;
  final Value<DateTime?> lastReviewedAt;
  final Value<int> correctCount;
  final Value<int> incorrectCount;
  final Value<bool> isMastered;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.frontText = const Value.absent(),
    this.backText = const Value.absent(),
    this.frontImagePath = const Value.absent(),
    this.backImagePath = const Value.absent(),
    this.frontAudioPath = const Value.absent(),
    this.backAudioPath = const Value.absent(),
    this.frontVideoUrl = const Value.absent(),
    this.backVideoUrl = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.transcription = const Value.absent(),
    this.example = const Value.absent(),
    this.notes = const Value.absent(),
    this.easinessFactor = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.interval = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.incorrectCount = const Value.absent(),
    this.isMastered = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required int deckId,
    required String frontText,
    required String backText,
    this.frontImagePath = const Value.absent(),
    this.backImagePath = const Value.absent(),
    this.frontAudioPath = const Value.absent(),
    this.backAudioPath = const Value.absent(),
    this.frontVideoUrl = const Value.absent(),
    this.backVideoUrl = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.transcription = const Value.absent(),
    this.example = const Value.absent(),
    this.notes = const Value.absent(),
    this.easinessFactor = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.interval = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.incorrectCount = const Value.absent(),
    this.isMastered = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : deckId = Value(deckId),
        frontText = Value(frontText),
        backText = Value(backText);
  static Insertable<CardData> custom({
    Expression<int>? id,
    Expression<int>? deckId,
    Expression<String>? frontText,
    Expression<String>? backText,
    Expression<String>? frontImagePath,
    Expression<String>? backImagePath,
    Expression<String>? frontAudioPath,
    Expression<String>? backAudioPath,
    Expression<String>? frontVideoUrl,
    Expression<String>? backVideoUrl,
    Expression<String>? pronunciation,
    Expression<String>? transcription,
    Expression<String>? example,
    Expression<String>? notes,
    Expression<int>? easinessFactor,
    Expression<int>? repetitions,
    Expression<int>? interval,
    Expression<DateTime>? nextReviewDate,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? correctCount,
    Expression<int>? incorrectCount,
    Expression<bool>? isMastered,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (frontText != null) 'front_text': frontText,
      if (backText != null) 'back_text': backText,
      if (frontImagePath != null) 'front_image_path': frontImagePath,
      if (backImagePath != null) 'back_image_path': backImagePath,
      if (frontAudioPath != null) 'front_audio_path': frontAudioPath,
      if (backAudioPath != null) 'back_audio_path': backAudioPath,
      if (frontVideoUrl != null) 'front_video_url': frontVideoUrl,
      if (backVideoUrl != null) 'back_video_url': backVideoUrl,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (transcription != null) 'transcription': transcription,
      if (example != null) 'example': example,
      if (notes != null) 'notes': notes,
      if (easinessFactor != null) 'easiness_factor': easinessFactor,
      if (repetitions != null) 'repetitions': repetitions,
      if (interval != null) 'interval': interval,
      if (nextReviewDate != null) 'next_review_date': nextReviewDate,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (correctCount != null) 'correct_count': correctCount,
      if (incorrectCount != null) 'incorrect_count': incorrectCount,
      if (isMastered != null) 'is_mastered': isMastered,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? deckId,
      Value<String>? frontText,
      Value<String>? backText,
      Value<String?>? frontImagePath,
      Value<String?>? backImagePath,
      Value<String?>? frontAudioPath,
      Value<String?>? backAudioPath,
      Value<String?>? frontVideoUrl,
      Value<String?>? backVideoUrl,
      Value<String?>? pronunciation,
      Value<String?>? transcription,
      Value<String?>? example,
      Value<String?>? notes,
      Value<int>? easinessFactor,
      Value<int>? repetitions,
      Value<int>? interval,
      Value<DateTime?>? nextReviewDate,
      Value<DateTime?>? lastReviewedAt,
      Value<int>? correctCount,
      Value<int>? incorrectCount,
      Value<bool>? isMastered,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CardsCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      frontText: frontText ?? this.frontText,
      backText: backText ?? this.backText,
      frontImagePath: frontImagePath ?? this.frontImagePath,
      backImagePath: backImagePath ?? this.backImagePath,
      frontAudioPath: frontAudioPath ?? this.frontAudioPath,
      backAudioPath: backAudioPath ?? this.backAudioPath,
      frontVideoUrl: frontVideoUrl ?? this.frontVideoUrl,
      backVideoUrl: backVideoUrl ?? this.backVideoUrl,
      pronunciation: pronunciation ?? this.pronunciation,
      transcription: transcription ?? this.transcription,
      example: example ?? this.example,
      notes: notes ?? this.notes,
      easinessFactor: easinessFactor ?? this.easinessFactor,
      repetitions: repetitions ?? this.repetitions,
      interval: interval ?? this.interval,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      isMastered: isMastered ?? this.isMastered,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<int>(deckId.value);
    }
    if (frontText.present) {
      map['front_text'] = Variable<String>(frontText.value);
    }
    if (backText.present) {
      map['back_text'] = Variable<String>(backText.value);
    }
    if (frontImagePath.present) {
      map['front_image_path'] = Variable<String>(frontImagePath.value);
    }
    if (backImagePath.present) {
      map['back_image_path'] = Variable<String>(backImagePath.value);
    }
    if (frontAudioPath.present) {
      map['front_audio_path'] = Variable<String>(frontAudioPath.value);
    }
    if (backAudioPath.present) {
      map['back_audio_path'] = Variable<String>(backAudioPath.value);
    }
    if (frontVideoUrl.present) {
      map['front_video_url'] = Variable<String>(frontVideoUrl.value);
    }
    if (backVideoUrl.present) {
      map['back_video_url'] = Variable<String>(backVideoUrl.value);
    }
    if (pronunciation.present) {
      map['pronunciation'] = Variable<String>(pronunciation.value);
    }
    if (transcription.present) {
      map['transcription'] = Variable<String>(transcription.value);
    }
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (easinessFactor.present) {
      map['easiness_factor'] = Variable<int>(easinessFactor.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (nextReviewDate.present) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (incorrectCount.present) {
      map['incorrect_count'] = Variable<int>(incorrectCount.value);
    }
    if (isMastered.present) {
      map['is_mastered'] = Variable<bool>(isMastered.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('frontText: $frontText, ')
          ..write('backText: $backText, ')
          ..write('frontImagePath: $frontImagePath, ')
          ..write('backImagePath: $backImagePath, ')
          ..write('frontAudioPath: $frontAudioPath, ')
          ..write('backAudioPath: $backAudioPath, ')
          ..write('frontVideoUrl: $frontVideoUrl, ')
          ..write('backVideoUrl: $backVideoUrl, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('transcription: $transcription, ')
          ..write('example: $example, ')
          ..write('notes: $notes, ')
          ..write('easinessFactor: $easinessFactor, ')
          ..write('repetitions: $repetitions, ')
          ..write('interval: $interval, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('correctCount: $correctCount, ')
          ..write('incorrectCount: $incorrectCount, ')
          ..write('isMastered: $isMastered, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReviewHistoryTable extends ReviewHistory
    with TableInfo<$ReviewHistoryTable, ReviewHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES cards (id) ON DELETE CASCADE'));
  static const VerificationMeta _qualityMeta =
      const VerificationMeta('quality');
  @override
  late final GeneratedColumn<int> quality = GeneratedColumn<int>(
      'quality', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeSpentSecondsMeta =
      const VerificationMeta('timeSpentSeconds');
  @override
  late final GeneratedColumn<int> timeSpentSeconds = GeneratedColumn<int>(
      'time_spent_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reviewedAtMeta =
      const VerificationMeta('reviewedAt');
  @override
  late final GeneratedColumn<DateTime> reviewedAt = GeneratedColumn<DateTime>(
      'reviewed_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cardId, quality, timeSpentSeconds, reviewedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_history';
  @override
  VerificationContext validateIntegrity(Insertable<ReviewHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(_qualityMeta,
          quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta));
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    if (data.containsKey('time_spent_seconds')) {
      context.handle(
          _timeSpentSecondsMeta,
          timeSpentSeconds.isAcceptableOrUnknown(
              data['time_spent_seconds']!, _timeSpentSecondsMeta));
    } else if (isInserting) {
      context.missing(_timeSpentSecondsMeta);
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
          _reviewedAtMeta,
          reviewedAt.isAcceptableOrUnknown(
              data['reviewed_at']!, _reviewedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      quality: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quality'])!,
      timeSpentSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_spent_seconds'])!,
      reviewedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reviewed_at'])!,
    );
  }

  @override
  $ReviewHistoryTable createAlias(String alias) {
    return $ReviewHistoryTable(attachedDatabase, alias);
  }
}

class ReviewHistoryData extends DataClass
    implements Insertable<ReviewHistoryData> {
  final int id;
  final int cardId;
  final int quality;
  final int timeSpentSeconds;
  final DateTime reviewedAt;
  const ReviewHistoryData(
      {required this.id,
      required this.cardId,
      required this.quality,
      required this.timeSpentSeconds,
      required this.reviewedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_id'] = Variable<int>(cardId);
    map['quality'] = Variable<int>(quality);
    map['time_spent_seconds'] = Variable<int>(timeSpentSeconds);
    map['reviewed_at'] = Variable<DateTime>(reviewedAt);
    return map;
  }

  ReviewHistoryCompanion toCompanion(bool nullToAbsent) {
    return ReviewHistoryCompanion(
      id: Value(id),
      cardId: Value(cardId),
      quality: Value(quality),
      timeSpentSeconds: Value(timeSpentSeconds),
      reviewedAt: Value(reviewedAt),
    );
  }

  factory ReviewHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewHistoryData(
      id: serializer.fromJson<int>(json['id']),
      cardId: serializer.fromJson<int>(json['cardId']),
      quality: serializer.fromJson<int>(json['quality']),
      timeSpentSeconds: serializer.fromJson<int>(json['timeSpentSeconds']),
      reviewedAt: serializer.fromJson<DateTime>(json['reviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardId': serializer.toJson<int>(cardId),
      'quality': serializer.toJson<int>(quality),
      'timeSpentSeconds': serializer.toJson<int>(timeSpentSeconds),
      'reviewedAt': serializer.toJson<DateTime>(reviewedAt),
    };
  }

  ReviewHistoryData copyWith(
          {int? id,
          int? cardId,
          int? quality,
          int? timeSpentSeconds,
          DateTime? reviewedAt}) =>
      ReviewHistoryData(
        id: id ?? this.id,
        cardId: cardId ?? this.cardId,
        quality: quality ?? this.quality,
        timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
        reviewedAt: reviewedAt ?? this.reviewedAt,
      );
  ReviewHistoryData copyWithCompanion(ReviewHistoryCompanion data) {
    return ReviewHistoryData(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      quality: data.quality.present ? data.quality.value : this.quality,
      timeSpentSeconds: data.timeSpentSeconds.present
          ? data.timeSpentSeconds.value
          : this.timeSpentSeconds,
      reviewedAt:
          data.reviewedAt.present ? data.reviewedAt.value : this.reviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewHistoryData(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('quality: $quality, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cardId, quality, timeSpentSeconds, reviewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewHistoryData &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.quality == this.quality &&
          other.timeSpentSeconds == this.timeSpentSeconds &&
          other.reviewedAt == this.reviewedAt);
}

class ReviewHistoryCompanion extends UpdateCompanion<ReviewHistoryData> {
  final Value<int> id;
  final Value<int> cardId;
  final Value<int> quality;
  final Value<int> timeSpentSeconds;
  final Value<DateTime> reviewedAt;
  const ReviewHistoryCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.quality = const Value.absent(),
    this.timeSpentSeconds = const Value.absent(),
    this.reviewedAt = const Value.absent(),
  });
  ReviewHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int cardId,
    required int quality,
    required int timeSpentSeconds,
    this.reviewedAt = const Value.absent(),
  })  : cardId = Value(cardId),
        quality = Value(quality),
        timeSpentSeconds = Value(timeSpentSeconds);
  static Insertable<ReviewHistoryData> custom({
    Expression<int>? id,
    Expression<int>? cardId,
    Expression<int>? quality,
    Expression<int>? timeSpentSeconds,
    Expression<DateTime>? reviewedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (quality != null) 'quality': quality,
      if (timeSpentSeconds != null) 'time_spent_seconds': timeSpentSeconds,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
    });
  }

  ReviewHistoryCompanion copyWith(
      {Value<int>? id,
      Value<int>? cardId,
      Value<int>? quality,
      Value<int>? timeSpentSeconds,
      Value<DateTime>? reviewedAt}) {
    return ReviewHistoryCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      quality: quality ?? this.quality,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      reviewedAt: reviewedAt ?? this.reviewedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (quality.present) {
      map['quality'] = Variable<int>(quality.value);
    }
    if (timeSpentSeconds.present) {
      map['time_spent_seconds'] = Variable<int>(timeSpentSeconds.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewHistoryCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('quality: $quality, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String key;
  final String value;
  final DateTime updatedAt;
  const Setting(
      {required this.id,
      required this.key,
      required this.value,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Setting copyWith(
          {int? id, String? key, String? value, DateTime? updatedAt}) =>
      Setting(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String value,
    this.updatedAt = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt}) {
    return SettingsCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DailyStatsTable extends DailyStats
    with TableInfo<$DailyStatsTable, DailyStatsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cardsStudiedMeta =
      const VerificationMeta('cardsStudied');
  @override
  late final GeneratedColumn<int> cardsStudied = GeneratedColumn<int>(
      'cards_studied', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _correctAnswersMeta =
      const VerificationMeta('correctAnswers');
  @override
  late final GeneratedColumn<int> correctAnswers = GeneratedColumn<int>(
      'correct_answers', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _incorrectAnswersMeta =
      const VerificationMeta('incorrectAnswers');
  @override
  late final GeneratedColumn<int> incorrectAnswers = GeneratedColumn<int>(
      'incorrect_answers', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timeSpentMinutesMeta =
      const VerificationMeta('timeSpentMinutes');
  @override
  late final GeneratedColumn<int> timeSpentMinutes = GeneratedColumn<int>(
      'time_spent_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sessionsCountMeta =
      const VerificationMeta('sessionsCount');
  @override
  late final GeneratedColumn<int> sessionsCount = GeneratedColumn<int>(
      'sessions_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        cardsStudied,
        correctAnswers,
        incorrectAnswers,
        timeSpentMinutes,
        sessionsCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_stats';
  @override
  VerificationContext validateIntegrity(Insertable<DailyStatsData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('cards_studied')) {
      context.handle(
          _cardsStudiedMeta,
          cardsStudied.isAcceptableOrUnknown(
              data['cards_studied']!, _cardsStudiedMeta));
    }
    if (data.containsKey('correct_answers')) {
      context.handle(
          _correctAnswersMeta,
          correctAnswers.isAcceptableOrUnknown(
              data['correct_answers']!, _correctAnswersMeta));
    }
    if (data.containsKey('incorrect_answers')) {
      context.handle(
          _incorrectAnswersMeta,
          incorrectAnswers.isAcceptableOrUnknown(
              data['incorrect_answers']!, _incorrectAnswersMeta));
    }
    if (data.containsKey('time_spent_minutes')) {
      context.handle(
          _timeSpentMinutesMeta,
          timeSpentMinutes.isAcceptableOrUnknown(
              data['time_spent_minutes']!, _timeSpentMinutesMeta));
    }
    if (data.containsKey('sessions_count')) {
      context.handle(
          _sessionsCountMeta,
          sessionsCount.isAcceptableOrUnknown(
              data['sessions_count']!, _sessionsCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyStatsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyStatsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      cardsStudied: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cards_studied'])!,
      correctAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_answers'])!,
      incorrectAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}incorrect_answers'])!,
      timeSpentMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_spent_minutes'])!,
      sessionsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sessions_count'])!,
    );
  }

  @override
  $DailyStatsTable createAlias(String alias) {
    return $DailyStatsTable(attachedDatabase, alias);
  }
}

class DailyStatsData extends DataClass implements Insertable<DailyStatsData> {
  final int id;
  final DateTime date;
  final int cardsStudied;
  final int correctAnswers;
  final int incorrectAnswers;
  final int timeSpentMinutes;
  final int sessionsCount;
  const DailyStatsData(
      {required this.id,
      required this.date,
      required this.cardsStudied,
      required this.correctAnswers,
      required this.incorrectAnswers,
      required this.timeSpentMinutes,
      required this.sessionsCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['cards_studied'] = Variable<int>(cardsStudied);
    map['correct_answers'] = Variable<int>(correctAnswers);
    map['incorrect_answers'] = Variable<int>(incorrectAnswers);
    map['time_spent_minutes'] = Variable<int>(timeSpentMinutes);
    map['sessions_count'] = Variable<int>(sessionsCount);
    return map;
  }

  DailyStatsCompanion toCompanion(bool nullToAbsent) {
    return DailyStatsCompanion(
      id: Value(id),
      date: Value(date),
      cardsStudied: Value(cardsStudied),
      correctAnswers: Value(correctAnswers),
      incorrectAnswers: Value(incorrectAnswers),
      timeSpentMinutes: Value(timeSpentMinutes),
      sessionsCount: Value(sessionsCount),
    );
  }

  factory DailyStatsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyStatsData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      cardsStudied: serializer.fromJson<int>(json['cardsStudied']),
      correctAnswers: serializer.fromJson<int>(json['correctAnswers']),
      incorrectAnswers: serializer.fromJson<int>(json['incorrectAnswers']),
      timeSpentMinutes: serializer.fromJson<int>(json['timeSpentMinutes']),
      sessionsCount: serializer.fromJson<int>(json['sessionsCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'cardsStudied': serializer.toJson<int>(cardsStudied),
      'correctAnswers': serializer.toJson<int>(correctAnswers),
      'incorrectAnswers': serializer.toJson<int>(incorrectAnswers),
      'timeSpentMinutes': serializer.toJson<int>(timeSpentMinutes),
      'sessionsCount': serializer.toJson<int>(sessionsCount),
    };
  }

  DailyStatsData copyWith(
          {int? id,
          DateTime? date,
          int? cardsStudied,
          int? correctAnswers,
          int? incorrectAnswers,
          int? timeSpentMinutes,
          int? sessionsCount}) =>
      DailyStatsData(
        id: id ?? this.id,
        date: date ?? this.date,
        cardsStudied: cardsStudied ?? this.cardsStudied,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        timeSpentMinutes: timeSpentMinutes ?? this.timeSpentMinutes,
        sessionsCount: sessionsCount ?? this.sessionsCount,
      );
  DailyStatsData copyWithCompanion(DailyStatsCompanion data) {
    return DailyStatsData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      cardsStudied: data.cardsStudied.present
          ? data.cardsStudied.value
          : this.cardsStudied,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
      incorrectAnswers: data.incorrectAnswers.present
          ? data.incorrectAnswers.value
          : this.incorrectAnswers,
      timeSpentMinutes: data.timeSpentMinutes.present
          ? data.timeSpentMinutes.value
          : this.timeSpentMinutes,
      sessionsCount: data.sessionsCount.present
          ? data.sessionsCount.value
          : this.sessionsCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyStatsData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('cardsStudied: $cardsStudied, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('incorrectAnswers: $incorrectAnswers, ')
          ..write('timeSpentMinutes: $timeSpentMinutes, ')
          ..write('sessionsCount: $sessionsCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, cardsStudied, correctAnswers,
      incorrectAnswers, timeSpentMinutes, sessionsCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyStatsData &&
          other.id == this.id &&
          other.date == this.date &&
          other.cardsStudied == this.cardsStudied &&
          other.correctAnswers == this.correctAnswers &&
          other.incorrectAnswers == this.incorrectAnswers &&
          other.timeSpentMinutes == this.timeSpentMinutes &&
          other.sessionsCount == this.sessionsCount);
}

class DailyStatsCompanion extends UpdateCompanion<DailyStatsData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> cardsStudied;
  final Value<int> correctAnswers;
  final Value<int> incorrectAnswers;
  final Value<int> timeSpentMinutes;
  final Value<int> sessionsCount;
  const DailyStatsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.cardsStudied = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.incorrectAnswers = const Value.absent(),
    this.timeSpentMinutes = const Value.absent(),
    this.sessionsCount = const Value.absent(),
  });
  DailyStatsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.cardsStudied = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.incorrectAnswers = const Value.absent(),
    this.timeSpentMinutes = const Value.absent(),
    this.sessionsCount = const Value.absent(),
  }) : date = Value(date);
  static Insertable<DailyStatsData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? cardsStudied,
    Expression<int>? correctAnswers,
    Expression<int>? incorrectAnswers,
    Expression<int>? timeSpentMinutes,
    Expression<int>? sessionsCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (cardsStudied != null) 'cards_studied': cardsStudied,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (incorrectAnswers != null) 'incorrect_answers': incorrectAnswers,
      if (timeSpentMinutes != null) 'time_spent_minutes': timeSpentMinutes,
      if (sessionsCount != null) 'sessions_count': sessionsCount,
    });
  }

  DailyStatsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? cardsStudied,
      Value<int>? correctAnswers,
      Value<int>? incorrectAnswers,
      Value<int>? timeSpentMinutes,
      Value<int>? sessionsCount}) {
    return DailyStatsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      cardsStudied: cardsStudied ?? this.cardsStudied,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      timeSpentMinutes: timeSpentMinutes ?? this.timeSpentMinutes,
      sessionsCount: sessionsCount ?? this.sessionsCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (cardsStudied.present) {
      map['cards_studied'] = Variable<int>(cardsStudied.value);
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<int>(correctAnswers.value);
    }
    if (incorrectAnswers.present) {
      map['incorrect_answers'] = Variable<int>(incorrectAnswers.value);
    }
    if (timeSpentMinutes.present) {
      map['time_spent_minutes'] = Variable<int>(timeSpentMinutes.value);
    }
    if (sessionsCount.present) {
      map['sessions_count'] = Variable<int>(sessionsCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyStatsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('cardsStudied: $cardsStudied, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('incorrectAnswers: $incorrectAnswers, ')
          ..write('timeSpentMinutes: $timeSpentMinutes, ')
          ..write('sessionsCount: $sessionsCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DecksTable decks = $DecksTable(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $ReviewHistoryTable reviewHistory = $ReviewHistoryTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $DailyStatsTable dailyStats = $DailyStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [decks, cards, reviewHistory, settings, dailyStats];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('decks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('cards', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('cards',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('review_history', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$DecksTableCreateCompanionBuilder = DecksCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  required String sourceLanguage,
  required String targetLanguage,
  Value<int> totalCards,
  Value<int> masteredCards,
  Value<DateTime> createdAt,
  Value<DateTime?> lastStudiedAt,
});
typedef $$DecksTableUpdateCompanionBuilder = DecksCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String> sourceLanguage,
  Value<String> targetLanguage,
  Value<int> totalCards,
  Value<int> masteredCards,
  Value<DateTime> createdAt,
  Value<DateTime?> lastStudiedAt,
});

final class $$DecksTableReferences
    extends BaseReferences<_$AppDatabase, $DecksTable, Deck> {
  $$DecksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardsTable, List<CardData>> _cardsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cards,
          aliasName: $_aliasNameGenerator(db.decks.id, db.cards.deckId));

  $$CardsTableProcessedTableManager get cardsRefs {
    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.deckId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DecksTableFilterComposer extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceLanguage => $composableBuilder(
      column: $table.sourceLanguage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetLanguage => $composableBuilder(
      column: $table.targetLanguage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get masteredCards => $composableBuilder(
      column: $table.masteredCards, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> cardsRefs(
      Expression<bool> Function($$CardsTableFilterComposer f) f) {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DecksTableOrderingComposer
    extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceLanguage => $composableBuilder(
      column: $table.sourceLanguage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetLanguage => $composableBuilder(
      column: $table.targetLanguage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get masteredCards => $composableBuilder(
      column: $table.masteredCards,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$DecksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get sourceLanguage => $composableBuilder(
      column: $table.sourceLanguage, builder: (column) => column);

  GeneratedColumn<String> get targetLanguage => $composableBuilder(
      column: $table.targetLanguage, builder: (column) => column);

  GeneratedColumn<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => column);

  GeneratedColumn<int> get masteredCards => $composableBuilder(
      column: $table.masteredCards, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt, builder: (column) => column);

  Expression<T> cardsRefs<T extends Object>(
      Expression<T> Function($$CardsTableAnnotationComposer a) f) {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DecksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DecksTable,
    Deck,
    $$DecksTableFilterComposer,
    $$DecksTableOrderingComposer,
    $$DecksTableAnnotationComposer,
    $$DecksTableCreateCompanionBuilder,
    $$DecksTableUpdateCompanionBuilder,
    (Deck, $$DecksTableReferences),
    Deck,
    PrefetchHooks Function({bool cardsRefs})> {
  $$DecksTableTableManager(_$AppDatabase db, $DecksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> sourceLanguage = const Value.absent(),
            Value<String> targetLanguage = const Value.absent(),
            Value<int> totalCards = const Value.absent(),
            Value<int> masteredCards = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastStudiedAt = const Value.absent(),
          }) =>
              DecksCompanion(
            id: id,
            name: name,
            description: description,
            sourceLanguage: sourceLanguage,
            targetLanguage: targetLanguage,
            totalCards: totalCards,
            masteredCards: masteredCards,
            createdAt: createdAt,
            lastStudiedAt: lastStudiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required String sourceLanguage,
            required String targetLanguage,
            Value<int> totalCards = const Value.absent(),
            Value<int> masteredCards = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastStudiedAt = const Value.absent(),
          }) =>
              DecksCompanion.insert(
            id: id,
            name: name,
            description: description,
            sourceLanguage: sourceLanguage,
            targetLanguage: targetLanguage,
            totalCards: totalCards,
            masteredCards: masteredCards,
            createdAt: createdAt,
            lastStudiedAt: lastStudiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DecksTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({cardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cardsRefs) db.cards],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardsRefs)
                    await $_getPrefetchedData<Deck, $DecksTable, CardData>(
                        currentTable: table,
                        referencedTable:
                            $$DecksTableReferences._cardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DecksTableReferences(db, table, p0).cardsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.deckId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DecksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DecksTable,
    Deck,
    $$DecksTableFilterComposer,
    $$DecksTableOrderingComposer,
    $$DecksTableAnnotationComposer,
    $$DecksTableCreateCompanionBuilder,
    $$DecksTableUpdateCompanionBuilder,
    (Deck, $$DecksTableReferences),
    Deck,
    PrefetchHooks Function({bool cardsRefs})>;
typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  required int deckId,
  required String frontText,
  required String backText,
  Value<String?> frontImagePath,
  Value<String?> backImagePath,
  Value<String?> frontAudioPath,
  Value<String?> backAudioPath,
  Value<String?> frontVideoUrl,
  Value<String?> backVideoUrl,
  Value<String?> pronunciation,
  Value<String?> transcription,
  Value<String?> example,
  Value<String?> notes,
  Value<int> easinessFactor,
  Value<int> repetitions,
  Value<int> interval,
  Value<DateTime?> nextReviewDate,
  Value<DateTime?> lastReviewedAt,
  Value<int> correctCount,
  Value<int> incorrectCount,
  Value<bool> isMastered,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  Value<int> deckId,
  Value<String> frontText,
  Value<String> backText,
  Value<String?> frontImagePath,
  Value<String?> backImagePath,
  Value<String?> frontAudioPath,
  Value<String?> backAudioPath,
  Value<String?> frontVideoUrl,
  Value<String?> backVideoUrl,
  Value<String?> pronunciation,
  Value<String?> transcription,
  Value<String?> example,
  Value<String?> notes,
  Value<int> easinessFactor,
  Value<int> repetitions,
  Value<int> interval,
  Value<DateTime?> nextReviewDate,
  Value<DateTime?> lastReviewedAt,
  Value<int> correctCount,
  Value<int> incorrectCount,
  Value<bool> isMastered,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CardsTableReferences
    extends BaseReferences<_$AppDatabase, $CardsTable, CardData> {
  $$CardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecksTable _deckIdTable(_$AppDatabase db) =>
      db.decks.createAlias($_aliasNameGenerator(db.cards.deckId, db.decks.id));

  $$DecksTableProcessedTableManager get deckId {
    final $_column = $_itemColumn<int>('deck_id')!;

    final manager = $$DecksTableTableManager($_db, $_db.decks)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_deckIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ReviewHistoryTable, List<ReviewHistoryData>>
      _reviewHistoryRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.reviewHistory,
              aliasName:
                  $_aliasNameGenerator(db.cards.id, db.reviewHistory.cardId));

  $$ReviewHistoryTableProcessedTableManager get reviewHistoryRefs {
    final manager = $$ReviewHistoryTableTableManager($_db, $_db.reviewHistory)
        .filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reviewHistoryRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontText => $composableBuilder(
      column: $table.frontText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backText => $composableBuilder(
      column: $table.backText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontImagePath => $composableBuilder(
      column: $table.frontImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backImagePath => $composableBuilder(
      column: $table.backImagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontAudioPath => $composableBuilder(
      column: $table.frontAudioPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backAudioPath => $composableBuilder(
      column: $table.backAudioPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontVideoUrl => $composableBuilder(
      column: $table.frontVideoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backVideoUrl => $composableBuilder(
      column: $table.backVideoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pronunciation => $composableBuilder(
      column: $table.pronunciation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transcription => $composableBuilder(
      column: $table.transcription, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get example => $composableBuilder(
      column: $table.example, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get easinessFactor => $composableBuilder(
      column: $table.easinessFactor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get interval => $composableBuilder(
      column: $table.interval, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextReviewDate => $composableBuilder(
      column: $table.nextReviewDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get incorrectCount => $composableBuilder(
      column: $table.incorrectCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMastered => $composableBuilder(
      column: $table.isMastered, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$DecksTableFilterComposer get deckId {
    final $$DecksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableFilterComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> reviewHistoryRefs(
      Expression<bool> Function($$ReviewHistoryTableFilterComposer f) f) {
    final $$ReviewHistoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reviewHistory,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReviewHistoryTableFilterComposer(
              $db: $db,
              $table: $db.reviewHistory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontText => $composableBuilder(
      column: $table.frontText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backText => $composableBuilder(
      column: $table.backText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontImagePath => $composableBuilder(
      column: $table.frontImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backImagePath => $composableBuilder(
      column: $table.backImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontAudioPath => $composableBuilder(
      column: $table.frontAudioPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backAudioPath => $composableBuilder(
      column: $table.backAudioPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontVideoUrl => $composableBuilder(
      column: $table.frontVideoUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backVideoUrl => $composableBuilder(
      column: $table.backVideoUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pronunciation => $composableBuilder(
      column: $table.pronunciation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transcription => $composableBuilder(
      column: $table.transcription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get example => $composableBuilder(
      column: $table.example, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get easinessFactor => $composableBuilder(
      column: $table.easinessFactor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get interval => $composableBuilder(
      column: $table.interval, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextReviewDate => $composableBuilder(
      column: $table.nextReviewDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctCount => $composableBuilder(
      column: $table.correctCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get incorrectCount => $composableBuilder(
      column: $table.incorrectCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMastered => $composableBuilder(
      column: $table.isMastered, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$DecksTableOrderingComposer get deckId {
    final $$DecksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableOrderingComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get frontText =>
      $composableBuilder(column: $table.frontText, builder: (column) => column);

  GeneratedColumn<String> get backText =>
      $composableBuilder(column: $table.backText, builder: (column) => column);

  GeneratedColumn<String> get frontImagePath => $composableBuilder(
      column: $table.frontImagePath, builder: (column) => column);

  GeneratedColumn<String> get backImagePath => $composableBuilder(
      column: $table.backImagePath, builder: (column) => column);

  GeneratedColumn<String> get frontAudioPath => $composableBuilder(
      column: $table.frontAudioPath, builder: (column) => column);

  GeneratedColumn<String> get backAudioPath => $composableBuilder(
      column: $table.backAudioPath, builder: (column) => column);

  GeneratedColumn<String> get frontVideoUrl => $composableBuilder(
      column: $table.frontVideoUrl, builder: (column) => column);

  GeneratedColumn<String> get backVideoUrl => $composableBuilder(
      column: $table.backVideoUrl, builder: (column) => column);

  GeneratedColumn<String> get pronunciation => $composableBuilder(
      column: $table.pronunciation, builder: (column) => column);

  GeneratedColumn<String> get transcription => $composableBuilder(
      column: $table.transcription, builder: (column) => column);

  GeneratedColumn<String> get example =>
      $composableBuilder(column: $table.example, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get easinessFactor => $composableBuilder(
      column: $table.easinessFactor, builder: (column) => column);

  GeneratedColumn<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => column);

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReviewDate => $composableBuilder(
      column: $table.nextReviewDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt, builder: (column) => column);

  GeneratedColumn<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => column);

  GeneratedColumn<int> get incorrectCount => $composableBuilder(
      column: $table.incorrectCount, builder: (column) => column);

  GeneratedColumn<bool> get isMastered => $composableBuilder(
      column: $table.isMastered, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DecksTableAnnotationComposer get deckId {
    final $$DecksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableAnnotationComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> reviewHistoryRefs<T extends Object>(
      Expression<T> Function($$ReviewHistoryTableAnnotationComposer a) f) {
    final $$ReviewHistoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reviewHistory,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReviewHistoryTableAnnotationComposer(
              $db: $db,
              $table: $db.reviewHistory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardsTable,
    CardData,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (CardData, $$CardsTableReferences),
    CardData,
    PrefetchHooks Function({bool deckId, bool reviewHistoryRefs})> {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> deckId = const Value.absent(),
            Value<String> frontText = const Value.absent(),
            Value<String> backText = const Value.absent(),
            Value<String?> frontImagePath = const Value.absent(),
            Value<String?> backImagePath = const Value.absent(),
            Value<String?> frontAudioPath = const Value.absent(),
            Value<String?> backAudioPath = const Value.absent(),
            Value<String?> frontVideoUrl = const Value.absent(),
            Value<String?> backVideoUrl = const Value.absent(),
            Value<String?> pronunciation = const Value.absent(),
            Value<String?> transcription = const Value.absent(),
            Value<String?> example = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> easinessFactor = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int> interval = const Value.absent(),
            Value<DateTime?> nextReviewDate = const Value.absent(),
            Value<DateTime?> lastReviewedAt = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> incorrectCount = const Value.absent(),
            Value<bool> isMastered = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            deckId: deckId,
            frontText: frontText,
            backText: backText,
            frontImagePath: frontImagePath,
            backImagePath: backImagePath,
            frontAudioPath: frontAudioPath,
            backAudioPath: backAudioPath,
            frontVideoUrl: frontVideoUrl,
            backVideoUrl: backVideoUrl,
            pronunciation: pronunciation,
            transcription: transcription,
            example: example,
            notes: notes,
            easinessFactor: easinessFactor,
            repetitions: repetitions,
            interval: interval,
            nextReviewDate: nextReviewDate,
            lastReviewedAt: lastReviewedAt,
            correctCount: correctCount,
            incorrectCount: incorrectCount,
            isMastered: isMastered,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int deckId,
            required String frontText,
            required String backText,
            Value<String?> frontImagePath = const Value.absent(),
            Value<String?> backImagePath = const Value.absent(),
            Value<String?> frontAudioPath = const Value.absent(),
            Value<String?> backAudioPath = const Value.absent(),
            Value<String?> frontVideoUrl = const Value.absent(),
            Value<String?> backVideoUrl = const Value.absent(),
            Value<String?> pronunciation = const Value.absent(),
            Value<String?> transcription = const Value.absent(),
            Value<String?> example = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> easinessFactor = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int> interval = const Value.absent(),
            Value<DateTime?> nextReviewDate = const Value.absent(),
            Value<DateTime?> lastReviewedAt = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> incorrectCount = const Value.absent(),
            Value<bool> isMastered = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CardsCompanion.insert(
            id: id,
            deckId: deckId,
            frontText: frontText,
            backText: backText,
            frontImagePath: frontImagePath,
            backImagePath: backImagePath,
            frontAudioPath: frontAudioPath,
            backAudioPath: backAudioPath,
            frontVideoUrl: frontVideoUrl,
            backVideoUrl: backVideoUrl,
            pronunciation: pronunciation,
            transcription: transcription,
            example: example,
            notes: notes,
            easinessFactor: easinessFactor,
            repetitions: repetitions,
            interval: interval,
            nextReviewDate: nextReviewDate,
            lastReviewedAt: lastReviewedAt,
            correctCount: correctCount,
            incorrectCount: incorrectCount,
            isMastered: isMastered,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CardsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({deckId = false, reviewHistoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reviewHistoryRefs) db.reviewHistory
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (deckId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.deckId,
                    referencedTable: $$CardsTableReferences._deckIdTable(db),
                    referencedColumn:
                        $$CardsTableReferences._deckIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reviewHistoryRefs)
                    await $_getPrefetchedData<CardData, $CardsTable,
                            ReviewHistoryData>(
                        currentTable: table,
                        referencedTable:
                            $$CardsTableReferences._reviewHistoryRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardsTableReferences(db, table, p0)
                                .reviewHistoryRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardsTable,
    CardData,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (CardData, $$CardsTableReferences),
    CardData,
    PrefetchHooks Function({bool deckId, bool reviewHistoryRefs})>;
typedef $$ReviewHistoryTableCreateCompanionBuilder = ReviewHistoryCompanion
    Function({
  Value<int> id,
  required int cardId,
  required int quality,
  required int timeSpentSeconds,
  Value<DateTime> reviewedAt,
});
typedef $$ReviewHistoryTableUpdateCompanionBuilder = ReviewHistoryCompanion
    Function({
  Value<int> id,
  Value<int> cardId,
  Value<int> quality,
  Value<int> timeSpentSeconds,
  Value<DateTime> reviewedAt,
});

final class $$ReviewHistoryTableReferences extends BaseReferences<_$AppDatabase,
    $ReviewHistoryTable, ReviewHistoryData> {
  $$ReviewHistoryTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards
      .createAlias($_aliasNameGenerator(db.reviewHistory.cardId, db.cards.id));

  $$CardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReviewHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewHistoryTable> {
  $$ReviewHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quality => $composableBuilder(
      column: $table.quality, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt, builder: (column) => ColumnFilters(column));

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReviewHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewHistoryTable> {
  $$ReviewHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quality => $composableBuilder(
      column: $table.quality, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt, builder: (column) => ColumnOrderings(column));

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableOrderingComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReviewHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewHistoryTable> {
  $$ReviewHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt, builder: (column) => column);

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReviewHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReviewHistoryTable,
    ReviewHistoryData,
    $$ReviewHistoryTableFilterComposer,
    $$ReviewHistoryTableOrderingComposer,
    $$ReviewHistoryTableAnnotationComposer,
    $$ReviewHistoryTableCreateCompanionBuilder,
    $$ReviewHistoryTableUpdateCompanionBuilder,
    (ReviewHistoryData, $$ReviewHistoryTableReferences),
    ReviewHistoryData,
    PrefetchHooks Function({bool cardId})> {
  $$ReviewHistoryTableTableManager(_$AppDatabase db, $ReviewHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> cardId = const Value.absent(),
            Value<int> quality = const Value.absent(),
            Value<int> timeSpentSeconds = const Value.absent(),
            Value<DateTime> reviewedAt = const Value.absent(),
          }) =>
              ReviewHistoryCompanion(
            id: id,
            cardId: cardId,
            quality: quality,
            timeSpentSeconds: timeSpentSeconds,
            reviewedAt: reviewedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int cardId,
            required int quality,
            required int timeSpentSeconds,
            Value<DateTime> reviewedAt = const Value.absent(),
          }) =>
              ReviewHistoryCompanion.insert(
            id: id,
            cardId: cardId,
            quality: quality,
            timeSpentSeconds: timeSpentSeconds,
            reviewedAt: reviewedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReviewHistoryTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$ReviewHistoryTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$ReviewHistoryTableReferences._cardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ReviewHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReviewHistoryTable,
    ReviewHistoryData,
    $$ReviewHistoryTableFilterComposer,
    $$ReviewHistoryTableOrderingComposer,
    $$ReviewHistoryTableAnnotationComposer,
    $$ReviewHistoryTableCreateCompanionBuilder,
    $$ReviewHistoryTableUpdateCompanionBuilder,
    (ReviewHistoryData, $$ReviewHistoryTableReferences),
    ReviewHistoryData,
    PrefetchHooks Function({bool cardId})>;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  required String key,
  required String value,
  Value<DateTime> updatedAt,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SettingsCompanion(
            id: id,
            key: key,
            value: value,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            required String value,
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            id: id,
            key: key,
            value: value,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()>;
typedef $$DailyStatsTableCreateCompanionBuilder = DailyStatsCompanion Function({
  Value<int> id,
  required DateTime date,
  Value<int> cardsStudied,
  Value<int> correctAnswers,
  Value<int> incorrectAnswers,
  Value<int> timeSpentMinutes,
  Value<int> sessionsCount,
});
typedef $$DailyStatsTableUpdateCompanionBuilder = DailyStatsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> cardsStudied,
  Value<int> correctAnswers,
  Value<int> incorrectAnswers,
  Value<int> timeSpentMinutes,
  Value<int> sessionsCount,
});

class $$DailyStatsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get incorrectAnswers => $composableBuilder(
      column: $table.incorrectAnswers,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeSpentMinutes => $composableBuilder(
      column: $table.timeSpentMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount, builder: (column) => ColumnFilters(column));
}

class $$DailyStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get incorrectAnswers => $composableBuilder(
      column: $table.incorrectAnswers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeSpentMinutes => $composableBuilder(
      column: $table.timeSpentMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount,
      builder: (column) => ColumnOrderings(column));
}

class $$DailyStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied, builder: (column) => column);

  GeneratedColumn<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers, builder: (column) => column);

  GeneratedColumn<int> get incorrectAnswers => $composableBuilder(
      column: $table.incorrectAnswers, builder: (column) => column);

  GeneratedColumn<int> get timeSpentMinutes => $composableBuilder(
      column: $table.timeSpentMinutes, builder: (column) => column);

  GeneratedColumn<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount, builder: (column) => column);
}

class $$DailyStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyStatsTable,
    DailyStatsData,
    $$DailyStatsTableFilterComposer,
    $$DailyStatsTableOrderingComposer,
    $$DailyStatsTableAnnotationComposer,
    $$DailyStatsTableCreateCompanionBuilder,
    $$DailyStatsTableUpdateCompanionBuilder,
    (
      DailyStatsData,
      BaseReferences<_$AppDatabase, $DailyStatsTable, DailyStatsData>
    ),
    DailyStatsData,
    PrefetchHooks Function()> {
  $$DailyStatsTableTableManager(_$AppDatabase db, $DailyStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> cardsStudied = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> incorrectAnswers = const Value.absent(),
            Value<int> timeSpentMinutes = const Value.absent(),
            Value<int> sessionsCount = const Value.absent(),
          }) =>
              DailyStatsCompanion(
            id: id,
            date: date,
            cardsStudied: cardsStudied,
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers,
            timeSpentMinutes: timeSpentMinutes,
            sessionsCount: sessionsCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            Value<int> cardsStudied = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> incorrectAnswers = const Value.absent(),
            Value<int> timeSpentMinutes = const Value.absent(),
            Value<int> sessionsCount = const Value.absent(),
          }) =>
              DailyStatsCompanion.insert(
            id: id,
            date: date,
            cardsStudied: cardsStudied,
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers,
            timeSpentMinutes: timeSpentMinutes,
            sessionsCount: sessionsCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyStatsTable,
    DailyStatsData,
    $$DailyStatsTableFilterComposer,
    $$DailyStatsTableOrderingComposer,
    $$DailyStatsTableAnnotationComposer,
    $$DailyStatsTableCreateCompanionBuilder,
    $$DailyStatsTableUpdateCompanionBuilder,
    (
      DailyStatsData,
      BaseReferences<_$AppDatabase, $DailyStatsTable, DailyStatsData>
    ),
    DailyStatsData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DecksTableTableManager get decks =>
      $$DecksTableTableManager(_db, _db.decks);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$ReviewHistoryTableTableManager get reviewHistory =>
      $$ReviewHistoryTableTableManager(_db, _db.reviewHistory);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$DailyStatsTableTableManager get dailyStats =>
      $$DailyStatsTableTableManager(_db, _db.dailyStats);
}

