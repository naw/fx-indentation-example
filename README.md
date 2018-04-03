Steps to reproduce:

1. `rails new hippo --database=postgresql`
2. edit gemfile to add fx, `bundle install`
3. `bundle exec rails generate fx:function square`
4. edit the function definition file
5. `bundle exec rake db:create db:migrate` (this writes the initial function definition to schema.rb)

-----

Up to this point, everything is fine. However, if we use `db:schema:load`, fx will
read the function definition from schema.rb and recreate the function with 6 spaces
within the function definition itself.

Then whenever the schema is dumped again, such as after running `db:migrate` for other
migrations, the function definition will be written to schema.rb with the internal
spaces as well as the formatting spaces, for a total of 12 spaces:

6. `bundle exec rake db:schema:load db:migrate`

7. repeat step 6, each time 6 new spaces are added.
