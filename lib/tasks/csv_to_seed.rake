# encoding: utf-8
require 'csv' 

# rake csv_to_seed[db/seeds/bif_list_50k_first.csv,db/seeds/bif_list_50k_last.csv]

desc 'Import CSV file into a seed_fu formatted text file'
task :csv_to_seed, [:filename, :filename2] => :environment do |task,args|


File.open('db/fixtures/word.rb', 'a') do |f| 
	f.write("# -*- encoding : utf-8 -*-")
	f.write("\n")
	f.write("Word.seed(:id,")
	f.write("\n")
end

file_array  = [args[:filename], args[:filename2]]
firstline=0
keys = {}
	file_array.each do |file|

		CSV.foreach(file) do |row|
			if (firstline==0)
				keys = row
				firstline=1
			next	
			end

			params = {}

			keys.each_with_index do |key,i|
				params[key] = row[i]
				#puts params
			end

			a_new_hash = params.inject({}) do |h, (k, v)| 
				case 
					when k == "id"
						h[k] = v.to_i; h 
					when k == "rank"
						h[k] = v.to_i; h 
					when k == "frequency"
						h[k] = v.to_i; h 
					when k == "sum_frequency"
						h[k] = v.to_i; h
					when k == "coca_spoken_freq"
						h[k] = v.to_i; h
					when k == "coca_fiction_freq"
						h[k] = v.to_i; h
					when k == "coca_magazines_freq"
						h[k] = v.to_i; h
					when k == "coca_newspapers_freq"
						h[k] = v.to_i; h	
					when k == "sat" && v == "TRUE"
						h[k] = true; h
					when k == "sat" && v == "FALSE"
						h[k] = false; h
					when k == "gre" && v == "TRUE"
						h[k] = true; h
					when k == "gre" && v == "FALSE"
						h[k] = false; h										
					else
						h[k] = v; h 
				end
			end

			mappings = {"id" => :id, "rank" => :rank, "word" => :word, "lemma" => :lemma, "pos" => :pos, "pos_long" => :pos_long, "english_definition" => :english_definition, "frequency" => :frequency, "sum_frequency" => :sum_frequency, "coca_spoken_freq" => :coca_spoken_freq, "coca_fiction_freq" => :coca_fiction_freq, "coca_magazines_freq" => :coca_magazines_freq, "coca_newspapers_freq" => :coca_newspapers_freq, "sat" => :sat, "gre" => :gre}

			final_hash = Hash[a_new_hash.map {|k, v| [mappings[k], v] }]

			File.open('db/fixtures/word.rb', 'a') do |f| 
				f.write(final_hash)
				f.write(",")
				f.write("\n")
			end
		end
	end
	
	File.open('db/fixtures/word.rb', 'a') do |f| 
			f.write(")")
	end
end