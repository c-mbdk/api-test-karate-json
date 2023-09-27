Feature: negative testing for valid and invalid inputs

Background:
    * url 'https://jsonplaceholder.typicode.com/posts'

Scenario Outline: verify no data returned from GET request with illegal valid value in query parameters
    Given param userId = `${testuservalue}`
    When method get
    Then match response == []

    Examples:
        | testuservalue |
        | 34599         |
        | 8954515       |
        | trusty        |

Scenario Outline: verify requests are unsuccessful with invalid value in HTTP header: Host
Given header Host = `${hostValues}`
When method get
Then match responseStatus != 200

Examples:
    | hostValues |
    | keep-awake |
    | newHost    |
    | 1789       |



Scenario Outline: verify POST method is unsupported for dynamic endpoint
    Given path `${newPath}`
    And request { "userId": '#(newUserId)', "title": '#(newTitle)', "body": '#(newBody)'}
    When method post
    Then match response == {}

    Examples:
        | newPath | newUserId | newTitle | newBody |
        | 88      | 13        | "newone" | "no"    |
        | 2       | 1         | "newfone"| "no$pe" |
        | 3       | 9         | "neone"  | "nei(n" |


