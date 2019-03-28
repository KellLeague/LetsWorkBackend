const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const port = 3003;

 const usersRouter = require('./routes/users');
 const postsRouter = require('./routes/posts');
 const commentsRouter = require('./routes/comments');


// MIDDLEWARE NEEDED
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

// users routes
app.use('/users', usersRouter);
app.use('/posts', postsRouter);
app.use('/comments', commentsRouter);


app.use((err, req, res, next) => {
  res.status(400).json({error: err.toString()});
});

app.listen(port, () => {
  console.log('API is running on Port: '+port);
});


// app.get('/ping', (req,res) => {
// res.status(200);
// res.json({'pong': true});
// });

// const port = process.env.PORT || 5001;
// app.listen(port, () => {
// console.log(`listening to port ${port}`);
// })