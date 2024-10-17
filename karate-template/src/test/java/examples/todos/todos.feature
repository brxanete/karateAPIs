Feature: Karate Basic Todos

  Background:
    * url 'http://localhost:8080/api/todos'


  Scenario: Get all todos
    Given url 'http://localhost:8080/api/todos'
    When method Get
    Then status 200

  #  Scenario: Create a todos
  #    Given url 'http://localhost:8080/api/todos'
  #    When method Post
  #    Then status 200

  Scenario: Basic todos flow
    # Create a single todos
    Given request { title: 'FirstTask', complete: false}
    When method Post
    Then status 200
    And match response == { id: '#string', title: 'FirstTask', complete: false }
    * def id = response.id
    * def title = response.title
    * def status = response.complete
    * print "value of ID: " + id














