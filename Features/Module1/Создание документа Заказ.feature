﻿#language: ru

@tree

Функционал:  Проверка расчета суммы строки документа Заказ при изменении цены или количества в этой строке
	Как Менеджер по продажам я хочу чтобы сумма продажи товара в строке при изменении количества и цены вычислялась правильно   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: создание документа Заказ

* Объявление переменной для суммирования
	И Я запоминаю в переменную "$СуммаСтрок$" значение 0

* Открытие формы создания документа
	И Я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

* Добавление строки 1 для проверки изменения суммы
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000002' | 'Сапоги'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '24,00'
	И в таблице "Товары" я завершаю редактирование строки
	Когда в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда в таблице "Товары" поле с именем 'ТоварыСумма' имеет значение '48,00'

* Запоминание в переменные данных строки 1
	И я запоминаю значение поля с именем "ТоварыСумма" таблицы "Товары" как "$ВремСумма$"
	И я запоминаю значение выражения 'Число(Формат($ВремСумма$, "ЧДЦ=2"))' в переменную "$ВремСумма$"
	И я запоминаю значение выражения 'Число($СуммаСтрок$ + $ВремСумма$)' в переменную "СуммаСтрок"
	И я удаляю переменную 'ВремСумма'

* Добавление строки 2 для проверки изменения суммы
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Босоножки'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10,50'
	И в таблице "Товары" я завершаю редактирование строки
	Когда в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда в таблице "Товары" поле с именем 'ТоварыСумма' имеет значение '52,50'
	И в таблице "Товары" я завершаю редактирование строки
	Когда в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда в таблице "Товары" поле с именем 'ТоварыСумма' имеет значение '10,50'

* Запоминание в переменные данных строки 2	
	И я запоминаю значение поля с именем "ТоварыСумма" таблицы "Товары" как "$ВремСумма$"
	И я запоминаю значение выражения 'Число(Формат($ВремСумма$, "ЧДЦ=2"))' в переменную "$ВремСумма$"
	И я запоминаю значение выражения 'Число($СуммаСтрок$ + $ВремСумма$)' в переменную "СуммаСтрок"
	И я удаляю переменную 'ВремСумма'

* Добавление строки 3 для проверки добавления услуги
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '20'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда в таблице "Товары" поле с именем 'ТоварыСумма' имеет значение '20,00'
	И в таблице "Товары" я завершаю редактирование строки

* Запоминание в переменные данных строки 3	
	И я запоминаю значение поля с именем "ТоварыСумма" таблицы "Товары" как "$ВремСумма$"
	И я запоминаю значение выражения 'Число(Формат($ВремСумма$, "ЧДЦ=2"))' в переменную "$ВремСумма$"
	И я запоминаю значение выражения 'Число($СуммаСтрок$ + $ВремСумма$)' в переменную "СуммаСтрок"
	И я удаляю переменную 'ВремСумма'

* Проверка итоговой суммы
	Тогда элемент формы с именем "ТоварыИтогСумма" стал равен '$СуммаСтрок$'

* Проверка падения при попытке ввода в поле Количество для услуги	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
	Когда Проверяю шаги на Исключение:
		|'Когда в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1''|
	//Когда в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	Тогда в таблице "Товары" поле с именем 'ТоварыКоличество' имеет значение ''
	И в таблице "Товары" я завершаю редактирование строки
	И я закрываю сеанс текущего клиента тестирования	