Feature: New user registration
  Visit login form and registration form.
  Filling registration form from several several tries.
  Filling registration form from first try.

  Background: New user visit login form and go to registration
    When I am on the home page
    And I click "Заявка на членство в ВГО «Адреналін»"
    Then I have to see "Заявка на членство в ВГО «Адреналін»"
    And I have to see "Особисті данні"

  Scenario: Register from first try
    When I fill in "Прізвище" with "Иванов"
    And I fill in "Ім'я" with "Петр"
    And I fill in "По-Батькові" with "Сидорович"

    And I select date "25/Травень/1989" in "Дата народження"
    And I fill in "Поштова адреса" with "Киев, проспект Мира, 245, 4"
    And I fill in "Коментар" with "Разнорабочий"

    And I fill in "Адреса електронної скриньки" with "ivanow_kreativ@mail.com" and set checkbox "Отримувати повідомлення"

    And I fill in "Пароль" with "1q2w3e4r"
    And I fill in "Підтвердження паролю" with "1q2w3e4r"

    And I fill in "ICQ#" with "634452876" and set checkbox "Отримувати повідомлення"
    And I fill in "Skype" with "petya.kiev.skype" and set checkbox "Отримувати повідомлення"
    And I fill in "Номер телефону" with "380993213451" and set checkbox "Отримувати СМС"

    And I select "Найближчий до Вас осередок «Адреналіну»" to "Київ"

    And I set checkbox "Я, що заповнив анкету, Громадянин України, прошу прийняти мене до членів Всеукраїнської громадської організації «Адреналін». Мені відомо, що інформація, що буде надіслано даним повідомленням, є конфіденційною та використовуватиметься лише для заповнення документів Всеукраїнської громадської організації «Адреналін», пов'язаних з моєю участю в ВГО «Адреналін» або в турі чи іншому заході, організованому ВГО «Адреналін». Я ознайомлений із статутом Всеукраїнської громадської організації «Адреналін» та добровільно погоджуюсь на збір наданої мною інформації, її зберігання і використання. Погоджуюсь з правилами користування карткою «I`m Adrenalin»."

    When I press "Зберегти"
    Then I have to see "Шановний Петр Сидорович, заявку на членство в ВГО «Адреналін» прийнято."