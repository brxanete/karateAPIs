Feature: Helper to reset all todos

  Scenario: Reset all todos 
    
    # Clear all todo
    Given url 'http://localhost:8080/api/reset'
    When method Get
    Then status 200
    And match response == { deleted: '#number' }
    * def numberDeleted = response.deleted
    * print 'Number of task deleted: ' + numberDeleted 

    



