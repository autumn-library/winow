#Использовать autumn
#Использовать ".."
#Использовать asserts

&Тест
Процедура ПроверкаОбработчиковШаблона() Экспорт
	
	// Дано
	ПодключитьСценарий("tests/mock/мокПередОбработкойОтображения.os", "мокПередОбработкойОтображения");
	ПодключитьСценарий("tests/mock/мокПослеОбработкиОтображения.os", "мокПослеОбработкиОтображения");
	ПодключитьСценарий("tests/mock/мокПослеОбработкиОтображения2.os", "мокПослеОбработкиОтображения2");
	Поделка = Новый Поделка();
	Поделка.ПросканироватьКаталог("tests/mock/");
	Поделка.ЗапуститьПриложение();
	ТекстШаблона = "@до{{Модель}}@после@конец";
	Параметры = Новый Массив();
	Параметры.Добавить(ТекстШаблона);
	Шаблон = Поделка.НайтиЖелудь("Шаблон", Параметры);

	// Когда
	Результат = Шаблон.СформироватьТекст("2");

	//Тогда
	Ожидаем.Что(Результат).Равно("123!");

КонецПроцедуры
