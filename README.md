# Домашнее задание к занятию «Управляющие конструкции в коде Terraform» - Сергей Ситкарёв

## Задание 1

Изучите проект.

Заполните файл personal.auto.tfvars.

Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.

Примечание. Если у вас не активирован preview-доступ к функционалу «Группы безопасности» в Yandex Cloud, запросите доступ у поддержки облачного провайдера. Обычно его выдают в течение 24-х часов.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.

![Задание1](https://github.com/SSitkarev/terraform-03/blob/main/img/1.jpg)

## Задание 2

Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. 

Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/2-1.jpg)

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/3.jpg)

Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ с именами "main" и "replica" разных по cpu/ram/disk , используя мета-аргумент for_each loop.
При желании внесите в переменную все возможные параметры.
ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1. 

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/5.jpg)

Используйте для обеих ВМ одну общую переменную типа list(object({ vm_name=string, cpu=number, ram=number, disk=number })). 

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/4.jpg)

Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/6.jpg)

Инициализируйте проект, выполните код.

![Задание2](https://github.com/SSitkarev/terraform-03/blob/main/img/7.jpg)

## Задание 3

Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .

Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . 
Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

![Задание3](https://github.com/SSitkarev/terraform-03/blob/main/img/8.jpg)

![Задание3](https://github.com/SSitkarev/terraform-03/blob/main/img/9.jpg)

## Задание 4

В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. 
Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
Инвентарь должен содержать 3 группы [webservers], [databases], [storage] и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
Выполните код. Приложите скриншот получившегося файла.

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/10.jpg)

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/11.jpg)

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/12.jpg)

## Доработка

Действительно, после удаления count при создании виртуалки storage потребовалось переписать ansible template.

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/14.jpg)

Инфраструктура запустилась 

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/13.jpg)

Сгенерированный inventory-файл

![Задание4](https://github.com/SSitkarev/terraform-03/blob/main/img/15.jpg)