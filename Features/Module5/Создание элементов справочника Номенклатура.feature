﻿#language: ru

@tree

Функционал: создание элементов справочника Номенклатура 

Как Тестировщик я хочу
проверить создание элементов справочника номенклатура средствами VA
чтобы выполинть генерацию произвольных элементов справочника   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание элементов справочника Номенклатура 
	И я закрываю все окна клиентского приложения
	И Я запоминаю в переменную "Шаг" значение 0
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Item_" + $Шаг$' в переменную "Наименование"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                           		| 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'          | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Items?ref=" + СтрЗаменить(Новый UUID, "-","")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$Наименование$'  		| ''                 | ''               | ''               |          |          |          |          |         |
