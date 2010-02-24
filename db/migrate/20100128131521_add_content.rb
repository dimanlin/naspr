class AddContent < ActiveRecord::Migration
  def self.up

    Content.create(:header => "Реклама", :name => "Реклама", :text =>"Реклама на сайт пока не принимается.", :urlname => "advertising", :permalink => "*", :title => "Реклама")

    Content.create(:header => "Правила публикации спора", :name => "Правила публикации спора", :text =>"Раздел находится в стадии разработки", :urlname => "rules", :permalink => "new_debate", :title => "Правила публикации")
  end

  def self.down
    Content.delete_all
  end
end

