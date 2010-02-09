Feature: Search
  In order Search
  I want Search

  Scenario: Search
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Контакты" and the header "Контакты" and the text "Контакты" and the urlname "contact" and the permalink "*"
    Given there is a content with the name "О проекте" and the header "Заголовок О проекте" and the text "Текст о проекте" and the urlname "about" and the permalink "*"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate"

    Given the Sphinx indexes are updated

    Given am on "the homepage"
    When I fill in "text" with "debates_1"
    When I press "Поиск"
    Then I should be on "the debate search"
    Then I should see "debates_1"
    Then I should see "message_1"

