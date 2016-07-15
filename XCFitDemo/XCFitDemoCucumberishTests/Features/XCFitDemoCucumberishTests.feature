Feature: Cucumberish Demo


Scenario: Cucumberish

Given the app is running
When I click on the hello button
Then I should see "WelCome"


Scenario Outline: Test

Given the app is running
When I click on the hello button
Then I should see "<message>"

Examples: Message
| message |
| WelCome |
| WelCome |

