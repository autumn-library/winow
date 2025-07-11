&Пластилин Перем Перечисления;

&Желудь
Процедура ПриСозданииОбъекта()
КонецПроцедуры

Функция ДвоичныеДанныеОтвета(Ответ) Экспорт


	ПосчитатьИДобавитьРазмерКонтента(Ответ);
	ДобавитьЗаголовокЗакрытияСоединения(Ответ);


	МассивОтвета = Новый Массив();

	МассивОтвета.Добавить(ПолучитьШапкуОтвета(Ответ));

	ДобавитьВМассивСоответствиеКакСтроки(МассивОтвета, Ответ.Заголовки);

	Для Каждого Кука из Ответ.Куки.ПолучитьМассивСтрокКук() Цикл
		МассивОтвета.Добавить(Кука);
	КонецЦикла;

	МассивОтвета.Добавить(Перечисления.Разделитель);

	ТекстСтатусИЗаголовки = СтрСоединить(МассивОтвета, Перечисления.Разделитель);
	
	ДвоичныеДанныеТекстСтатусИЗаголовки = ПолучитьДвоичныеДанныеИзСтроки(ТекстСтатусИЗаголовки, "utf-8");

	МассивДвоичныхДанных = Новый Массив();

	МассивДвоичныхДанных.Добавить(ДвоичныеДанныеТекстСтатусИЗаголовки);

	Если ЗначениеЗаполнено(Ответ.ТелоДвоичныеДанные) Тогда
		МассивДвоичныхДанных.Добавить(Ответ.ТелоДвоичныеДанные);

	ИначеЕсли ЗначениеЗаполнено(Ответ.ТелоТекст) Тогда
		МассивДвоичныхДанных.Добавить(ПолучитьДвоичныеДанныеИзСтроки(Ответ.ТелоТекст, "utf-8"));	
		
	КонецЕсли;

	ДвоичныеДанныеОтвета = СоединитьДвоичныеДанные(МассивДвоичныхДанных);

	Возврат ДвоичныеДанныеОтвета;
	
КонецФункции

Процедура ПосчитатьИДобавитьРазмерКонтента(Ответ)

	Если ЗначениеЗаполнено(Ответ.ТелоДвоичныеДанные) Тогда
		Размер = Ответ.ТелоДвоичныеДанные.Размер();
		Ответ.Заголовки.Вставить("content-length", Формат(Размер, "ЧГ=0"));
	ИначеЕсли ЗначениеЗаполнено(Ответ.ТелоТекст) Тогда
		Размер = ПолучитьДвоичныеДанныеИзСтроки(Ответ.ТелоТекст, "utf-8").Размер();	
		Ответ.Заголовки.Вставить("content-length", Формат(Размер, "ЧГ=0"));
    Иначе // BSLLS:EmptyCodeBlock-off
        // не добавляем заголовок.
	КонецЕсли;

КонецПроцедуры

Процедура ДобавитьЗаголовокЗакрытияСоединения(Ответ)
	Ответ.Заголовки.Вставить("connection", "close");
КонецПроцедуры

Процедура ДобавитьВМассивСоответствиеКакСтроки(Массив, Соответствие)
	Для Каждого КиЗ Из Соответствие Цикл
		Массив.Добавить(СтрШаблон("%1: %2", КиЗ.Ключ, КиЗ.Значение));	
	КонецЦикла
КонецПроцедуры

Функция ПолучитьШапкуОтвета(Ответ)
	Возврат СтрШаблон("HTTP/1.1 %1 %2", Ответ.СостояниеКод, Ответ.СостояниеТекст);	
КонецФункции
