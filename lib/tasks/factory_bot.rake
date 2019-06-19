namespace :factory_bot do
  desc "Verify that all FactoryBot factories are valid"
  task lint: :environment do
    if Rails.env.test?
      FactoryBot.lint
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV='test'")
      exit $?.exitstatus
    end
  end
end
