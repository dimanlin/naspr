Feature: create debate
  In order to test create debate
  I want to create debate

  Scenario: Go to main page
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Реклама" and the header "Реклама" and the text "Реклама" and the urlname "advertising" and the permalink "*" and the title "Реклама на naspr.ru"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate" and the title "Реклама на naspr.ru"

    Given am on "the homepage"

    Then I should see "Создать своё мнение"
    Then I follow "Создать своё мнение"
    Then I should be on "new debates"
    When I fill in "debate[header]" with "my new debate"
    When I fill in "debate[message]" with "asdasdasdasd"
    When I check "debate[rules]"
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

