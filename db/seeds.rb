['all', Rails.env].each do |env|
  seed_file = "#{Rails.root}/db/seeds/#{env}.rb"
  if File.exists?(seed_file)
    puts "Loading seed data for #{env}"
    require seed_file
  end
end
