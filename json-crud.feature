Feature: test CRUD functionality

Background: 
    * url 'https://jsonplaceholder.typicode.com/posts'

Scenario: verify successful GET request (all posts)
    Given request
    When method get
    Then status 200
    And match response != []

Scenario Outline: verify successful POST request
    Given request { "userId": '#(newUserValue)', "title": '#(newTitleValue)', "body": '#(newBodyValue)' }
    When method post
    Then status 201
    And match response.title == newTitleValue

    Examples:
        | newUserValue | newTitleValue | newBodyValue                                                                |
        | 1            | "New Post 121"| "This is the new body for the post. It looks like this. It is not too long" |
        | 3            | "N£w${`}` 121"| "This is the very extra new po$tfor . !t looks like this. It's short"       |
        | 13           | "N)w${`}` 161"| "This is a bit shorter `${}` !t looks like this. It's also short"           |
        

Scenario Outline: verify successful PATCH request
    Given path '1'
    And request { title: '#(new_title)'}
    When method patch
    Then status 200
    And match response.title == new_title

    Examples:
        | new_title             |
        | "updated test title"  |
        | "upda!ed te$t t]tle"  |
        | "up*a!ed te$t t]t1e"  |


Scenario Outline: verify successful PUT request
    Given path '1'
    And request { userId: '#(updatedUserId)', title: '#(updatedTitle)', body: '#(updatedBody)'}
    When method put
    Then status 200
    And match response.body == updatedBody

    Examples:
        | updatedUserId | updatedTitle  | updatedBody                                                                 |
        | 1             | "New Post 121"| "This is the new body for the post. It looks like this. It is not too long" |
        | 3             | "N£w${`}` 121"| "This is the very extra new po$tfor . !t looks like this. It's short"       |
        | 13            | "N)w${`}` 161"| "This is a bit shorter `${}` !t looks like this. It's also short"           |

Scenario: verify successful DELETE request
    Given path '1'
    When method delete
    Then status 200
    And match response == {}
