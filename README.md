Post App API
====================
This is a bare-bones Rails app that mimics social news link sharing websites like HackerNews, ProductHunt, and Reddit. The styling is very minimal, as this is intended as an API endpoint for an Angular app.

Setup
====================
Only necessary before running the app for the first time. If you've already completed this step, continue to [Usage](https://github.com/Zhyliana/post_app_api#usage).

First we need to clone the repo. This is a private repo. To share with more users, please contact me for access at zhyliana@gmail.com.
```
$ git clone git@github.com:Zhyliana/post_app_api.git
```

Navigate to the project:
```
$ cd post_app_api 
```

Next, we need to setup dependencies. This custom take task will install all gems and setup the postgres database.
```
$ rake start_app
```

Usage
====================
On any browser, simply visit `localhost:3000` to see the Rails app homepage.

Features
====================

### Server features
- API end points ready for client usage using [`jbuilder`](https://github.com/rails/jbuilder).
- Editable users, posts, and comments
- Unit tests for all models
- A `postgreSQL` database

### Browser Features
- Nested comments
- Up/Down-votable Posts and Comments
- A user can create a new post, sub, and/or comment
- View all subs
- View an individual post along with its comments
- A user can register for an account
- A user can login and logout

Testing
====================

Spec files can be found under [`./spec/models`](https://github.com/Zhyliana/post_app_api/tree/master/spec/models).
Each model is tested using the [`rspec-rails`](https://github.com/rspec/rspec-rails) testing framework, in addition to the [`shoulda-matchers`](https://github.com/thoughtbot/shoulda-matchers) gem for its model validation and association testing methods.

To run all automated tests, simply run:
```bash
$ rake specs
```

Next Steps
====================
- Create a front-end client to consume the API
- UI for editing/deleting posts and comments
- OAuth handling via the front end

Questions
====================
To request access for additional users or if you have any installation questions, feel free to reach out to me at zhyliana@gmail.com.
