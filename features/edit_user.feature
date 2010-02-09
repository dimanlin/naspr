Feature: create comment
  In order test to auth
  I want to auth

  Scenario: Auth
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Контакты" and the header "Контакты" and the text "Контакты" and the urlname "contact" and the permalink "*"
    Given there is a content with the name "О проекте" and the header "Заголовок О проекте" and the text "Текст о проекте" and the urlname "about" and the permalink "*"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate"

    Given am on "the homepage"
    Then I follow "Войти"
    Then I fill in "user_session[login]" with "diman@ya.ru"
    Then I fill in "user_session[password]" with "root00"
    When I press "login"
    Then I should be on "the homepage"
    Then I should not see "Войти"
    Then I should see "Выйти"

    Then I follow "Редактировать профиль"
    When I attach the file "/public/images/avatar.jpg" to "user[avatar]"
    When I press "Сохранить"
    Then I should be on "the homepage"

