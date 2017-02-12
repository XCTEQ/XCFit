Feature: Test

Scenario: Single Test

Given the app is running
When I tap the "Click" button
Then I should see menu with "0" items

Scenario Outline: test with Examples

Given the app is running
When I tap the "Click" button
Then I should see menu with "<count>" items

Examples: Test
| count |
|  0    |
|  0    |
