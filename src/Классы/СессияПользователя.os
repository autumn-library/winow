Перем ДатаСоздания;
Перем Идентификатор;
Перем Данные Экспорт;
Перем Логин Экспорт;

&Желудь
&Характер("Компанейский")
&ОсобоеОбращение(ОтключитьВсеНапильники = Истина)
Процедура ПриСозданииОбъекта()
	Данные = Новый Соответствие();
	ДатаСоздания = ТекущаяДата();
	Идентификатор = СтрЗаменить(Новый УникальныйИдентификатор(), "-", "");
	Логин = "";
КонецПроцедуры

Функция ДатаСоздания() Экспорт
	Возврат ДатаСоздания;
КонецФункции

Функция Идентификатор() Экспорт
	Возврат Идентификатор;
КонецФункции

Функция ЗначенияПараметровДляТочкиМаршрута() Экспорт
	Результат = Новый Соответствие();
	Результат.Вставить("Сессия", ЭтотОбъект);
	Результат.Вставить("Логин", Логин);
	Результат.Вставить("ДанныеСессии", Данные);

	Возврат Результат;
КонецФункции