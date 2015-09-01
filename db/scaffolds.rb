# Scaffolds used in migration, model, controller, etc. creation.
# Stored here for historical purposes.

rails g scaffold hero first_name:string{100} last_name:string{100} title:string bio:text created_by:integer:index updated_by:integer:index
rails g scaffold hero_schedule scheduled_on:date hero:references created_by:integer:index updated_by:integer:index