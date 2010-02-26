# language en
Feature:
  In order test recover password

  Scenario:
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick" and the id "1"

    Given am on "the homepage"
    Then I follow "Войти"
    Then I follow "Я забыл"
    When I press "recover"
    Then I should see "Вы должны указать свою электронную почту"

    When I fill in "email" with "diman@ya"
    When I press "recover"
    Then I should see "Пользователь с такой электронной почной не существует"

    When I fill in "email" with "diman@ya.ru"
    When I press "recover"
    Then I should see "Информация о смене пароля была высланна вам на почту"

    Given there is a user with the login "recover_diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "recover_nick" and the id "2"
    Given there is a recoverpassword with the user_id "2" and the key "876asd5f76x57x657zx65v7z6xc"

    Given am on "the wrong recover link"
    Then I should see "Произошла ошибка востановления пароля, не верный адрес востановления пароля"

    Given am on "the recoverpassword"
    When I press "submit"
    Then I should see "Введите новый пароль"

    When I fill in "user[password]" with "1111"
    When I fill in "user[password_confirmation]" with "1111"
    When I press "submit"
    Then I should see "Новый пароль был выслан вам на почту"

