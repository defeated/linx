# load fixtures into database before each scenario
Before do
  ActiveRecord::Fixtures.reset_cache

  fixtures_folder = File.join Rails.root, 'spec', 'fixtures'
  fixtures_yaml   = File.join fixtures_folder, '*.yml'
  fixtures = Dir[fixtures_yaml].map do |f|
    File.basename f, '.yml'
  end

  ActiveRecord::Fixtures.create_fixtures fixtures_folder, fixtures
end
