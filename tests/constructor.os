#Использовать autumn
#Использовать ".."
#Использовать asserts
#Использовать fs

Перем ТекущийКаталог;

Процедура ПередЗапускомТеста() Экспорт	
	ТекущийКаталог = ТекущийКаталог();
	КаталогИнициализацииПриложения = "tests/tmp";
	ФС.ОбеспечитьПустойКаталог(КаталогИнициализацииПриложения);
	УстановитьТекущийКаталог(ОбъединитьПути(ТекущийКаталог(), КаталогИнициализацииПриложения));
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	УстановитьТекущийКаталог(ТекущийКаталог);
КонецПроцедуры

&Тест
Процедура ИнициализацияКаталогаПриложения() Экспорт

	// Дано
	ФС.ОбеспечитьПустойКаталог("testapp");
	Поделка = Новый Поделка();
	Поделка.ЗапуститьПриложение();
	КонструкторВебПриложений = Поделка.НайтиЖелудь("КонструкторВебПриложений");
	
	// Когда
	КонструкторВебПриложений.ПроинициализироватьКаталог("testapp");

	// Тогда
	Ожидаем.Что(ФС.ФайлСуществует("testapp/autumn-properties.json")).Равно(Истина);
	Ожидаем.Что(ФС.КаталогСуществует("testapp/controls")).Равно(Истина);
	Ожидаем.Что(ФС.КаталогСуществует("testapp/files")).Равно(Истина);
	Ожидаем.Что(ФС.КаталогСуществует("testapp/view")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/controls/ОсновнойКонтрол.os")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/view/about.html")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/view/contact.html")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/view/index.html")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/view/main.html")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/files/wine_and_acorns.jpg")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/.vscode/launch.json")).Равно(Истина);
	Ожидаем.Что(ФС.ФайлСуществует("testapp/ОтладкаПриложения.os")).Равно(Истина);

КонецПроцедуры