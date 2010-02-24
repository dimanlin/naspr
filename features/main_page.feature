# language: en
Feature: see main page
  In order to test main page
  I want to see main page

  Scenario: Go to main page
    Given there is a user with the login "diman@ya.ru" and the password "root00" and the password_confirmation "root00" and the nick "nick"
    Given there is a debate with the header "debates_1" and the user_id "1" and the message "message_1" and the rules "1"

    Given there is a content with the name "Реклама" and the header "Реклама" and the text "Реклама" and the urlname "advertising" and the permalink "*" and the title "Реклама на naspr.ru"
    Given there is a content with the name "Правила публикации" and the header "Правила публикации" and the text "Правила публикации" and the urlname "rules" and the permalink "new_debate" and the title "Реклама на naspr.ru"

    Given am on "the homepage"

