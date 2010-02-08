# language en
Feature:
  In order test authlogic on may site
  As a simple link click and filling form
  I want that would all be well

  Scenario:
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given am on "the homepage"
    Then I should see "Регистрация"
    When I follow "Регистрация"
    Then I should be on "new user"
    When I fill in "user[login]" with "diman@ya.ru"
    When I fill in "user[nick]" with "nick"
    When I fill in "user[password]" with "root00"
    When I fill in "user[password_confirmation]" with "root00"
    When I press "Зарегистрироваться"
    Then I should see "Пользователь с такой электронной почтой уже существует"
    Then I should see "Пользователь с таким псевдонимом уже существует"

    Given am on "new user"
    When I fill in "user[login]" with "diman2@ya.ru"
    When I fill in "user[nick]" with "nick2"
    When I fill in "user[password]" with "root00"
    When I fill in "user[password_confirmation]" with "root00"
    When I press "Зарегистрироваться"

    Given am on "new user"
    When I fill in "user[login]" with "diman3@ya.ru"
    When I fill in "user[nick]" with "nick3"
    When I fill in "user[password]" with "root00"
    When I fill in "user[password_confirmation]" with "root00"
    When I attach the file "/public/images/avatar2.jpg" to "user[avatar]"
    When I press "Зарегистрироваться"

    Then I should be on "the homepage"
    When I follow "Выйти"
    Then I should be on "the homepage"
    When I should see "Регистрация"

