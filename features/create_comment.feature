Feature: create comment
  In order to test create comment
  I want to create comment

  Scenario: Create comment
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"
    Given am on "the homepage"

    Then I should see "debates_1"
    Then I follow "debates_1"
    Then I should see "debates_1"
    Then I should see "message_1"
    Then I should see "Голосовать"
    Then I follow "Голосовать"
    Then I should see "я за!"
    When I fill in "comment[message]" with "message for debate"
    When I choose "comment_voted_1"
    When I press "Отдать голос"
    Then I should see "Против"
    Then I should see "message for debate"

    Then I follow "Голосовать"
    Then I should see "я за!"
    When I press "Отдать голос"
    Then I should see "не может быть пустым"
    Then I should see "имеет непредусмотренное значение"

    Given am on "the homepage"
    When I fill in "comment[message]" with "from homepage message for debate"
    When I choose "comment_voted_0"
    When I press "Отдать голос"
    When I should see "from homepage message for debate"

    Given am on "the homepage"
    When I press "Отдать голос"
    Then I should see "не может быть пустым"
    Then I should see "имеет непредусмотренное значение"

    Given am on "the homepage"
    Then I follow "Все мнения"
    Then I should be on "debates"
    Then I should see "debates_1"
    Then I should see "message_1"
    When I fill in "comment[message]" with "from all comments message for debate"
    When I choose "comment_voted_0"
    When I press "Отдать голос"
    Then I should see "from all comments message for debate"

    Given am on "the homepage"
    Then I follow "Все мнения"
    Then I should be on "debates"
    Then I should see "debates_1"
    Then I should see "message_1"
    When I press "Отдать голос"
    Then I should see "не может быть пустым"
    Then I should see "имеет непредусмотренное значение"

