// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
      name: json['name'] as String?,
      faqs: (json['faqs'] as List<dynamic>?)
          ?.map((e) => Faqs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'name': instance.name,
      'faqs': instance.faqs,
    };

Faqs _$FaqsFromJson(Map<String, dynamic> json) => Faqs(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FaqsToJson(Faqs instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
