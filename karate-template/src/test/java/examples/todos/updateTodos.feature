@hola
Feature: Second Feature file for Todos

  Background: 
    * url apiUrl

     
  Scenario: Update and delete Todos

    * def taskName = 'MyFirstTask'

    # Create a single todo
    Given request { title: '#(taskName)', complete: false}
    When method Post
    Then status 200
    And match response == { id: '#string', title: '#(taskName)', complete: false }
    * def id = response.id

    
  
    # Update a First todo
    * def updatedTaskName = 'FirstTask' 
    Given path id
    And request { title: '#(updatedTaskName)', complete: true}
    When method Put
    Then status 200
    And match response == { id: '#(id)', title: '#(updatedTaskName)', complete: true }
    
    # Delete a todo
    Given path id
    When method delete
    Then status 200
  
