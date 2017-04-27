# README

## Chatr

Chatr is a messanging app that allows you to communicate with friends online through an easy to user interface. Just log in and start chatting!

Create a new group or join an existing group and start talking to your peers. You can edit group names and delete your messages but you can't edit your messages or delete your group.

## User Stories
* I'd like to message my friends through an online application
* The must be a secure login (encrypted password and authorization)
* I'd like to make new conversations
* I'd like to add my friends to those conversations

## Technologies

Ruby, Ruby on Rails, jQuery, Javascript, HTML, CSS, Postgresql

## Remaining Bugs

* Doesn't check for duplicate emails
	* active record validation
* Message box size and max size of all messages
	*	getting an error message when there is no messenger box on the page 
* User can create a group with no name

	reroute existing email
	disable turbolinks- longrun only load certain dates and others upon scroll
	show date of message 

This README would normally document whatever steps are necessary to get the
application up and running.

## Other
* local image
* model for groups
* table for groups
* removed turbolinks //= require turbolinks
* 'data-turbolinks-track': 'reload' 
* , 'data-turbolinks-track': 'reload' 
* click on enter for a new message and it scrolls, it should just stay in placlakdsf;lakdjfal;kdf


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

	  <%# CANCEL BUTTON link_to('Back to All Groups', groups_path, style: "margin: 1%;")%>

	# @group.users.include? current_user
	#authorize method in application Controller
	# is_member?
	# def 

    unless @group.memberships.include? current_user
      redirect_to group_path(@group)
    end
    
## UI improvements
* icons instead of edit and delete
* profile image or first letter of their name and make that a profile image
* create message box is dull
* message box: rounded corners
* consistency: CHATR
* line shit up, 
* default color for each user- editable?
* change font and make all font-color black