class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      #id - default created by table (active record)
      #date time, created at updated at - default created by active record 
      t.string :title, null: false
      t.string :author
      t.text :content

      t.boolean :published, default:false
        #by default, not published
      t.datetime :published_at

      t.timestamps
    end
  end
end
