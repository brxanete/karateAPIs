Feature: Karate Basic Todos

  Background:
    # Define la URL base para las pruebas de todos
    * url 'http://localhost:8080/api/todos'

    # Scenario: Get all todos
    # Establece la URL para obtener todos los todos
    # Given url 'http://localhost:8080/api/todos'
    # Realiza una petición GET
    # When method Get
    # Verifica que el estado de la respuesta sea 200 (OK)
    # Then status 200

  Scenario: Basic todos flow

    # Create a single todo
    # Define la solicitud para crear un nuevo todo
    Given request { title: 'FirstTask', complete: false}
    # Realiza una petición POST para crear el nuevo todo
    When method Post
    # Verifica que la respuesta tenga un estado 200 (OK)
    Then status 200
    # Verifica que la respuesta coincida con el formato esperado
    And match response == { id: '#string', title: 'FirstTask', complete: false }


    # Extrae el ID del nuevo todo de la respuesta
    * def id = response.id
    # Extrae el título del nuevo todo
    * def title = response.title
    # Extrae el estado de completado del nuevo todo
    * def status = response.complete
    # Imprime el ID del nuevo todo en la consola
    * print "value of ID: " + id

    # Get a single todo
    # Establece la ruta usando el ID del todo creado anteriormente
    Given path id
    # Realiza una petición GET para obtener el todo específico
    When method Get
    # Verifica que la respuesta tenga un estado 200 (OK)
    Then status 200
    # Verifica que la respuesta coincida con el formato esperado del todo
    And match response == { id: '#(id)', title: 'FirstTask', complete: false }

   
    * def todo2 = 
    """
    {
        "title": 'SecondTask',
        "complete": false
    }
    """

    * def todo3 = 
    """
    {
        "title": 'ThirdTask',
        "complete": false
    }
    """


    # Create a second single todo
    Given request todo2
    Then status 200
    And header Content-Type =  "application/json"
    When method Post
    Then status 200
     And match response.title == 'SecondTask'



     # Get all todos
     When method Get
     Then status 200 
     * def  FirstTask = response[0]
     * match FirstTask.title == 'FirstTask'
     * match FirstTask.complete == false
     * def SecondTask = response[1]
    * match SecondTask.complete == false
    * match SecondTask.title == 'SecondTask'



    # Update a First todo
    Given path id
    And request { title: 'FirstTask', complete: true}
    When method Put
    Then status 200
    And match response == { id: '#(id)', title: 'FirstTask', complete: true }


    # Update a Second todo 
    Given path id
    And request { title: 'SecondTask', complete: true}
    When method Put
    Then status 200
    And match response == { id: '#(id)', title: 'SecondTask', complete: true }


    


    


    




    



    


    



    
    



























