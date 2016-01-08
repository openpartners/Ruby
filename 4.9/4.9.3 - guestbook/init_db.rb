require 'sequel'

DB = Sequel.sqlite "database.db" 
# jeśli plik nie będzie istniał to zostanie utworzony
DB.create_table :posts do
    primary_key :id
    String :author
    Text :content
    DataTime :create_at
end

posts = DB[:posts]

posts.insert author: "Batman",
    content: "Hello",
    create_at: Time.now - 5
    
posts.insert author: "Scorpion",
    content: "Come over her!",
    create_at: Time.now