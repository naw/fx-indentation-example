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

6. `bundle exec rake db:schema:load db:migrate` ([0a4f9d](https://github.com/naw/fx-indentation-example/commit/0a4f9d9c199b994d387eb2327fd715f5d05cdb40))

7. repeat step 6, each time 6 new spaces are added. ([052f76](https://github.com/naw/fx-indentation-example/commit/052f76a8818b566928636a72cab59ba4371f741d))

8. Switch `fx` to my patched version ([459314](https://github.com/naw/fx-indentation-example/commit/459314a79531ac39a524f949d377cb09afe116f5))

9. repeat step 6, each time nothing is added (NO DIFF, because schema.rb does not change)
