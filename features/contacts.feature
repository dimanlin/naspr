Feature: create comment
  In order to test create contacts
  I want to create contacts

  Scenario: Create comment
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick" and the master "true"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Реклама" and the header "Реклама" and the text "Реклама" and the urlname "advertising" and the permalink "*" and the title "Реклама на naspr.ru"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate" and the title "Реклама на naspr.ru"

    Given am on "the homepage"
    Then I follow "Контакты"
    When I press "Отправить"
    Then I should see "Имя не может быть пустым"
    Then I should see "Email не может быть пустым"
    Then I should see "Email имеет неверное значение"
    Then I should see "Обращение не может быть пустым"

    When I fill in "contact[from]" with "Andrey"
    When I fill in "contact[email]" with "diman@ya.ru"
    When I fill in "contact[message]" with "messages"
    When I press "Отправить"
    Then I should see "Сообщение было успешно отправленно"

    Given am on "the homepage"
    Then I follow "Войти"
    Then I fill in "user_session[login]" with "diman@ya.ru"
    Then I fill in "user_session[password]" with "root00"
    When I press "login"
    Then I should be on "the homepage"
    Then I follow "Админка"

    Then I follow "Contacts"
    Then I follow "Andrey"
    Then I should see "messages"
    Then I follow "List"
    Then I follow "Delete"
    Then I should see "Контакт был удалён"

