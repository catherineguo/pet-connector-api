# PetConnector - Back End
My second project is a full-stack web app that allows pet owners to create and save checklists to share with pet sitters.

- Deployed back end: https://floating-lake-10570.herokuapp.com/
- Front end repo: https://github.com/catherineguo/pet-connector-client
- Deployed front end: https://catherineguo.github.io/pet-connector-client/

Technologies used in this project: Ruby on Rails, PostgreSQL, JavaScript, Handlebars, jQuery, AJAX, Bootstrap, Sass

## How it works
To use PetConnector, you'll need to create an account. Once you have an account, you can simply click "New Checklist" to create a new checklist. Your checklists are automatically saved so you can view and edit them later. You can also delete checklists that you don't need anymore by clicking the "Delete" button beneath the checklist you want to remove.

It's that simple!

## Planning
This is the first project where I needed to plan out my database structure. For the MVP, the basic structure was a one-to-many relationship between users and checklists. Users can have many checklists, but checklists can only belong to one user.

The ERD for v1 (MVP) and v2 can be found here: https://drive.google.com/file/d/1i-K7VBbt5BNulT7pb41s9Y8UOVBeTW2_/view?usp=sharing

To view the wireframes and user stories for this project, please refer to the front end repo: https://github.com/catherineguo/pet-connector-client

## Development
Ruby on Rails makes it easy to get a server up and running thanks to its many helpful methods and libraries. I didn't take advantage of the `scaffold` method, though, because I wanted to try building the checklists routes and ChecklistsController through Behavior Driven Development (BDD) using RSpec. If you look through the `/spec` folder in this repository, you will find the `checklists_spec` files within the "requests", "routing", "controllers", and "models" folders.

The General Assembly API template provides a ProtectedController class that I used for my ChecklistsController to require authentication before executing CRUD actions.

## Future Updates
- Add v2 database: checklist items table. Somehow make the items table provide suggestions to the user about what to put in their checklists if something is repeated over and over.
- Enable some form of sharing the checklist: email, export to PDF, copy to clipboard?
