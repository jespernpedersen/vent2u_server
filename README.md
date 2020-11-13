* Installation of server

** 1. Clone git repositiory
Close the git repository to your desktop. Uusing terminal, go to the directory
where you want the repository and run the command
`git clone https://github.com/jespernpedersen/vent2u_server.git`

** 2. Install dependencies
Go into the project directory(in the terminal) and run
`npm install`

** 3. Import database
Go into phpmyadmin, select the database, click on import and import database (temporary until we put
the database in a server)

** 4. Run the server
You can run the server by running, in the terminal, the command
`node index.js`

** 5. Execute a call
Execute an api call to the database with postman or soapui to test.
If using postman, import the library in this repository to be easier to start. Remember to update the library 
everytime you create a new endpoint


* Making API Calls

** Endpoints
`[GET] http://localhost:8080/vent2u/rooms/
[GET] http://localhost:8080/vent2u/rooms/[id]
[GET] http://localhost:8080/vent2u/vent/
[GET] http://localhost:8080/vent2u/vent/[id]
[PUT] http://localhost:8080/vent2u/vents/`

*** planned
[POST] http://localhost:8080/vent2u/user/login
[GET] http://localhost:8080/vent2u/user/logout

[GET] http://localhost:8080/vent2u/class
[GET] http://localhost:8080/vent2u/class/[id]
[GET] http://localhost:8080/vent2u/class/[id]/students

[GET] http://localhost:8080/vent2u/vent
[GET] http://localhost:8080/vent2u/vent/[id]
[POST] http://localhost:8080/vent2u/vent/[id]/claim
[UPDATE] http://localhost:8080/vent2u/vent/[id]/assign/[user_id]
[UPDATE] http://localhost:8080/vent2u/vent/[id]/temperature/[value]
[UPDATE] http://localhost:8080/vent2u/vent/[id]/humidity/[value]

[UPDATE] http://localhost:8080/vent2u/claimrequest/[id]
