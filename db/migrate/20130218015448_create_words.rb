class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|

 	  t.integer :rank
 	  t.string :word
 	  t.string :lemma
 	  t.string :pos
 	  t.string :pos_long
 	  t.text :english_definition
 	  t.integer :frequency
 	  t.integer :sum_frequency
 	  t.integer :coca_spoken_freq
 	  t.integer :coca_fiction_freq
 	  t.integer :coca_magazines_freq
 	  t.integer :coca_newspapers_freq
 	  t.boolean :sat
 	  t.boolean :gre

      t.timestamps
    end
  end
end
