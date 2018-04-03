class CreateFunctionSquare < ActiveRecord::Migration[5.0]
  def change
    create_function :square
  end
end
