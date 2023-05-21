Feature: Signup new user

  Background: Preconditions
    *def dataGenerator = Java.type('helpers/DataGenerator')
    Given url apiUrl

    Scenario: New User Signup
      *def randomEmail = dataGenerator.getRandomEmail()
     *def randomUserName = dataGenerator.getRandomUserName()

      Given def UserData ={email":"KarateQaUser1@test.com","username":"User123"}


       Given path 'users'
       And  request
        """
          {
          "user":{
          "email": #(randomEmail),
          "password":"Happy1",
          "username":#(randomUserName)
                }
          }
        """
       When method post
       Then status 200
