class AddSecretKey < ActiveRecord::Migration
  def change
    add_column :posts, :edit_key, :string, default: rand(36**8).to_s(36)
  end
end


### works to generate a random key
# (('a'..'z').to_a.sample(5) + (0..9).to_a.sample(3)).shuffle.join

### or, from stack overflow
# rand(36**8).to_s(36)
# it create random number from 0 to power(36,len), then convert it to base-36
# string (that is 0-9 and a-z)
