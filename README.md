# README

## Chatr

Chatr is a messanging app that allows you to communicate with friends online through an easy to user interface. Just log in and start chatting!

Create a new group or join an existing group and start talking to your peers. You can edit group names and delete your messages but you can't edit your messages or delete your group.

## User Stories
* I'd like to message my friends through an online application
* The must be a secure login (encrypted password and authorization)

## Technologies

Ruby, Ruby on Rails, jQuery, Javascript, HTML, CSS, Postgresql

## Remaining Bugs
* User can submit an empty message
* Doesn't check for duplicate emails
* Message box size and max size of all messages
	*	getting an error message when there is no messenger box on the page 

This README would normally document whatever steps are necessary to get the
application up and running.

## Other
* local image
* model for groups
* table for groups


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


User.first.groups

Group.first.users << User.first

Membership.first

Group.first.messages

Group.first.messages << @message

Group.first.messages

Group.second.messages

Message.first

