// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetManagedCollection on Isar {
  IsarCollection<Managed> get manageds => getCollection();
}

const ManagedSchema = CollectionSchema(
  name: 'Managed',
  schema:
      '{"name":"Managed","idName":"id","properties":[{"name":"description","type":"String"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'description': 0, 'title': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _managedGetId,
  setId: _managedSetId,
  getLinks: _managedGetLinks,
  attachLinks: _managedAttachLinks,
  serializeNative: _managedSerializeNative,
  deserializeNative: _managedDeserializeNative,
  deserializePropNative: _managedDeserializePropNative,
  serializeWeb: _managedSerializeWeb,
  deserializeWeb: _managedDeserializeWeb,
  deserializePropWeb: _managedDeserializePropWeb,
  version: 3,
);

int? _managedGetId(Managed object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _managedSetId(Managed object, int id) {
  object.id = id;
}

List<IsarLinkBase> _managedGetLinks(Managed object) {
  return [];
}

void _managedSerializeNative(
    IsarCollection<Managed> collection,
    IsarRawObject rawObj,
    Managed object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.description;
  final _description = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_description.length) as int;
  final value1 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _description);
  writer.writeBytes(offsets[1], _title);
}

Managed _managedDeserializeNative(IsarCollection<Managed> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Managed();
  object.description = reader.readString(offsets[0]);
  object.id = id;
  object.title = reader.readString(offsets[1]);
  return object;
}

P _managedDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _managedSerializeWeb(
    IsarCollection<Managed> collection, Managed object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Managed _managedDeserializeWeb(
    IsarCollection<Managed> collection, dynamic jsObj) {
  final object = Managed();
  object.description = IsarNative.jsObjectGet(jsObj, 'description') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  return object;
}

P _managedDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _managedAttachLinks(IsarCollection col, int id, Managed object) {}

extension ManagedQueryWhereSort on QueryBuilder<Managed, Managed, QWhere> {
  QueryBuilder<Managed, Managed, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ManagedQueryWhere on QueryBuilder<Managed, Managed, QWhereClause> {
  QueryBuilder<Managed, Managed, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Managed, Managed, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Managed, Managed, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Managed, Managed, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension ManagedQueryFilter
    on QueryBuilder<Managed, Managed, QFilterCondition> {
  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Managed, Managed, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ManagedQueryLinks
    on QueryBuilder<Managed, Managed, QFilterCondition> {}

extension ManagedQueryWhereSortBy on QueryBuilder<Managed, Managed, QSortBy> {
  QueryBuilder<Managed, Managed, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ManagedQueryWhereSortThenBy
    on QueryBuilder<Managed, Managed, QSortThenBy> {
  QueryBuilder<Managed, Managed, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Managed, Managed, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ManagedQueryWhereDistinct
    on QueryBuilder<Managed, Managed, QDistinct> {
  QueryBuilder<Managed, Managed, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Managed, Managed, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Managed, Managed, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension ManagedQueryProperty
    on QueryBuilder<Managed, Managed, QQueryProperty> {
  QueryBuilder<Managed, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Managed, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Managed, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
