# language: ru

# Тестовые данные:
  # $user user
  # $password pass
  # $Наименование Гро-Мишель
  # $Тип Фрукт
  # $Экзотический 1

@Список_товаров
@DB
Функция: Добавление товара в БД

  Сценарий: Проверка добавления товара в БД

    Дано к БД выполнено подключение "H2" с параметрами:
      | field        | value       |
      | Пользователь | #{user}     |
      | Пароль       | #{password} |

    Когда к БД выполняется запрос "Список товаров"
    Тогда количество элементов коллекции "Список товаров" равно "4"

    * к БД выполняется запрос "Добавление Товара" c параметрами:
      | field         | value           |
      | Идентификатор | 5               |
      | Наименование  | #{Наименование} |
      | Тип           | #{Тип}          |
      | Экзотический  | #{Экзотический} |

    * к БД выполняется запрос "Список товаров"
    Тогда количество элементов коллекции "Список товаров" равно "5"

    Также выбран элемент коллекции "Список товаров" с индексом "4"
    И значение поля "Наименование" равно "#{Наименование}"
    И значение поля "Тип" равно "#{Тип}"
    И значение поля "Экзотический" равно "#{Экзотический}"

    * к БД выполняется запрос "Удаление товара" c параметрами:
      | field         | value |
      | Идентификатор | 5     |
    * закрыто подключение к БД