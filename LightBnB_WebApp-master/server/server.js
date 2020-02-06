const database = require('./database');
const apiRoutes = require('./apiRoutes');
const userRoutes = require('./userRoutes');

const path = require('path');

const express = require('express');
const cookieSession = require('cookie-session');
const bodyParser = require('body-parser');

// CUSTOM

const browserSync = require('browser-sync');

const app = express();

app.use(cookieSession({
  name: 'session',
  keys: ['key1']
}));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// /api/endpoints
const apiRouter = express.Router();
apiRoutes(apiRouter, database);
app.use('/api', apiRouter);

// /user/endpoints
const userRouter = express.Router();
userRoutes(userRouter, database);
app.use('/users', userRouter);

app.use(express.static(path.join(__dirname, '../public')));

app.get("/test", (req, res) => {
  res.send("🤗");
});

const port = process.env.PORT || 8080; 
app.listen(port, (err) => {
  browserSync({
    open: false,
    proxy: 'http://localhost:' + port,
    files: ["public/**/*.*"],
    injectChanges: true,
    watchOptions: {
      usePolling: true
    },
    notify: true
  });
  console.log(`Now listening on port ${port} ✨`);
});