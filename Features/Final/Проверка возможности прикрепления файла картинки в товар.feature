﻿#language: ru

@tree

Функционал: Проверка возможности прикрепления файла картинки в товар

Как Тестировщик я хочу
проверить возможность прикрепления файла картинки в товар
чтобы добавление происходило без ошибок   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Проверка возможности прикрепления файла картинки в товар
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	И я нажимаю на кнопку с именем 'ФормаСоздать'	
	И Я запоминаю значение выражения '"Тест " + ТекущаяДата()' в переменную "Картинка_Тест"
	И в поле с именем 'Наименование' я ввожу текст '$Картинка_Тест$'	
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Файл (создание)'
	И в поле с именем 'Наименование' я ввожу текст '$Картинка_Тест$'
	И я выбираю файл "$КаталогПроекта$\Final\Test.jpg"	
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	Тогда открылось окно 'Файлы'	
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| '$Картинка_Тест$' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
