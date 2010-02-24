Feature: create comment
  In order test to auth
  I want to auth

  Scenario: Auth
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Реклама" and the header "Реклама" and the text "Реклама" and the urlname "advertising" and the permalink "*" and the title "Реклама на naspr.ru"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate" and the title "Реклама на naspr.ru"

    Given am on "the homepage"
    Then I follow "Войти"
    Then I fill in "user_session[login]" with "diman@ya.ru"
    Then I fill in "user_session[password]" with "root00"
    When I press "login"
    Then I should be on "the homepage"
    Then I should not see "Войти"
    Then I should see "Выйти"
    Then I follow "Выйти"
    Then I should be on "the homepage"

    Then I follow "Войти"
    When I press "login"
    Then I should see "Форма пуста."

    Then I fill in "user_session[login]" with "wrongdiman@ya.ru"
    When I press "login"
    Then I should see "Пароль не может быть пустым"

    Then I fill in "user_session[login]" with "wrongdiman@ya.ru"
    Then I fill in "user_session[password]" with "wrongroot00"
    When I press "login"
    Then I should see "Логин неправельный"

    Then I fill in "user_session[login]" with "diman@ya.ru"
    Then I fill in "user_session[password]" with "wrongroot00"
    When I press "login"
    Then I should see "Пароль неправельный"

    Then I fill in "user_session[login]" with ""
    Then I fill in "user_session[password]" with "wrongroot00"
    When I press "login"
    Then I should see "Логин не может быть пустым"

    Then I fill in "user_session[login]" with "diman@ya.ru"
    When I press "login"
    Then I should see "Пароль не может быть пустым"

