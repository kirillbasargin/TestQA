﻿#language: ru

@tree

Функционал: заполнение поля Оранизация в Заказе покупателя 

Как Тестировщик я хочу
проверить создание заполнение оранизации заказа покупателя
чтобы заполнить поле, если оно не заполнено   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: заполнение поля Оранизация в Заказе покупателя
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '5'   | 'Клиент и поставщик' |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	Если элемент формы с именем "Company" присутствует на форме Тогда
		Если элемент формы с именем "Company" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
			И в таблице "List" я перехожу к строке
				| 'Код' | 'Наименование'           |
				| '1'   | 'Собственная компания 1' |			
			Когда открылось окно 'Организации'
			И в таблице "List" я выбираю текущую строку
		Иначе
			Тогда я вызываю исключение "Организация заполнена!"
			

		