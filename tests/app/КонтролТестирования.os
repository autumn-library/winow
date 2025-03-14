&Пластилин
Перем МенеджерОтображений Экспорт;

&Пластилин
Перем МенеджерДоступа Экспорт;

&Пластилин
Перем Парсеры Экспорт;

&Контроллер("/tests")
Процедура ПриСозданииОбъекта()

КонецПроцедуры

&ТочкаМаршрута("checkup")
Процедура ПроверкаЗдоровья(Ответ) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = "ок";
КонецПроцедуры

&ТочкаМаршрута("getparams")
Процедура ПроверкаГетПараметров(Ответ, ПараметрыЗапросаИменные) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 И %2", ПараметрыЗапросаИменные["animal1"], ПараметрыЗапросаИменные["animal2"]);
КонецПроцедуры

&ТочкаМаршрута("getorderedparams")
Процедура ПроверкаУпорядоченныхГетПараметров(Ответ, ПараметрыЗапросаПорядковые) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 И %2", ПараметрыЗапросаПорядковые[0], ПараметрыЗапросаПорядковые[1]);
КонецПроцедуры

&ТочкаМаршрута("postparams")
Процедура ПроверкаПостТекста(Ответ, ТелоЗапроса) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	ПостПараметры = Парсеры.ПараметрыИзТекста(ТелоЗапроса);
	Ответ.ТелоТекст = СтрШаблон("%1 И %2", ПостПараметры["animal1"], ПостПараметры["animal2"]);
КонецПроцедуры

&ТочкаМаршрута("setcookie")
Процедура УстановитьКуку(Ответ, ПараметрыЗапросаИменные) Экспорт
	ИмяКуки = "pechenka";
	ЗначениеКуки = ПараметрыЗапросаИменные["pechenka"];
	ДатаИстечения = XMLЗначение(Тип("Дата"), ПараметрыЗапросаИменные["expires"]);
	НоваяКука = Ответ.Куки.Добавить(ИмяКуки, ЗначениеКуки);
	НоваяКука.ДатаИстечения = ДатаИстечения;
КонецПроцедуры

&ТочкаМаршрута("setsessiondata")
Процедура УстановитьДанныеСессии(Ответ, ДанныеСессии, ПараметрыЗапросаИменные) Экспорт
	ДанныеПользователя = ПараметрыЗапросаИменные["userdata"];
	ИмяПараметраСессии = "ДанныеПользователя";
	ДанныеСессии[ИмяПараметраСессии] = ДанныеПользователя;
КонецПроцедуры

&ТочкаМаршрута("readsessiondata")
Процедура ПрочитатьДанныеСессии(Ответ, ДанныеСессии) Экспорт
	ИмяПараметраСессии = "ДанныеПользователя";
	ЗначениеПараметраСессии  = ДанныеСессии[ИмяПараметраСессии];
	Ответ.ТелоТекст = ЗначениеПараметраСессии;
КонецПроцедуры

&ФинальныйШтрих
Процедура ПроинициализироватьРоли() Экспорт
	МенеджерДоступа.ДобавитьТокен("Пользователь", "111");
	МенеджерДоступа.ДобавитьРольЛогина("Пользователь", "Пользователи");
КонецПроцедуры

&ТочкаМаршрута("user")
&Роли("Пользователи")
Процедура Пользователь(Ответ) Экспорт

	Ответ.ТелоТекст = "Ок";

КонецПроцедуры

&ТочкаМаршрута("templateuri/{Ягода}/{Фрукт}/{Овощь}")
Процедура ШаблонныеПараметрыПути(Ответ, Фрукт, Овощь, Ягода) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 %2 %3", Ягода, Фрукт, Овощь);
КонецПроцедуры

&ТочкаМаршрута("calc/plus/{Число1}/{Число2}")
Процедура ШаблонныеПараметрыСложение(Ответ, Число1, Число2) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = Число(Число1) + Число(Число2);
КонецПроцедуры

&ТочкаМаршрута("calc/minus/{Число1}/{Число2}")
Процедура ШаблонныеПараметрыВычитание(Ответ, Число1, Число2) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = Число(Число1) - Число(Число2);
КонецПроцедуры

&ТочкаМаршрута("calc/{Число1}/multiply/{Число2}")
Процедура ШаблонныеПараметрыУмножение(Ответ, Число1, Число2) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = Число(Число1) * Число(Число2);
КонецПроцедуры

&ТочкаМаршрута("calc/{Число1}/devide/{Число2}")
Процедура ШаблонныеПараметрыДеление(Ответ, Число1, Число2) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = Число(Число1) / Число(Число2);
КонецПроцедуры

&ТочкаМаршрута("getparamsbyname")
Процедура ПроверкаГетПараметровПоИмени(Ответ, ИмяКошки, ИмяСобаки) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 И %2", "ИмяКошки=" + ИмяКошки, "ИмяСобаки=" + ИмяСобаки);
КонецПроцедуры

&ТочкаМаршрута("postjsonbody")
Процедура ПроверкаПостЗапросаКакОбъект(Ответ, ТелоЗапросОбъект, ЗаголовкиЗапроса) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 %2", ТелоЗапросОбъект.Имя, ТелоЗапросОбъект.Фамилия);
КонецПроцедуры

&ТочкаМаршрута("postformbody")
Процедура ПроверкаПостЗапросаКакФорма(Ответ, Имя, Фамилия) Экспорт
	Ответ.УстановитьТипКонтента("txt");
	Ответ.ТелоТекст = СтрШаблон("%1 %2", Имя, Фамилия);
КонецПроцедуры