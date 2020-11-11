* Routes

** How to create routes
1. To set new endpoints, create a new file called `[fileName].routes.js` in the directory app/routes;
2. Edit the file routes/vent2u.routes.jss and add a new `require(./[fileName].routes);` to add your file
to the app routing system;
3. Create the endpoints in your file;

*** NOTE: use the PATH constant to setup a path for the application. To do this, just add 
`const settings = require("../shared/constants");` to your routes file, inside the module. To access it, simply
use settings.PATH.