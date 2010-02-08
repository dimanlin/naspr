Feature: create debate
  In order to test create debate
  I want to create debate

  Scenario: Go to main page
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Контакты" and the header "Контакты" and the text "Контакты" and the urlname "contact" and the permalink "*"
    Given there is a content with the name "О проекте" and the header "Заголовок О проекте" and the text "Текст о проекте" and the urlname "about" and the permalink "*"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate"

    Given am on "the homepage"

    Then I should see "Создать своё мнение"
    Then I follow "Создать своё мнение"
    Then I should be on "new debates"
    When I fill in "debate[header]" with "my new debate"
    When I fill in "debate[message]" with "asdasdasdasd"
    When I check "debate[rules]"
    When I check "debate[alert]"
    When I press "Создать спор"
    Then I should be on "the homepage"
    Then I should see "my new debate"

    Then I should see "Создать своё мнение"
    Then I follow "Создать своё мнение"
    Then I should be on "new debates"
    When I fill in "debate[header]" with ""
    When I fill in "debate[message]" with ""
    When I press "Создать спор"
    Then I should be on "the debates"
    Then I should see "Поле 'Тема' не может быть пустым"
    Then I should see "Поле 'Почему вы так думаете' не может быть пустым"
    Then I should see "Вы должны быть согласны с правилами сервиса."

