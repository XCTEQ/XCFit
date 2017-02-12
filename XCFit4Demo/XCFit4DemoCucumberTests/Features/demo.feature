Feature: Test 
Scenario: test 

Given the app is running 
When I launched an App
Then I should see menu with "0" items

Scenario Outline: test

Given the app is running
When I launched an App
Then I should see menu with "<count>" items

Examples: Test
| count |
|  0    |
|  0    |

