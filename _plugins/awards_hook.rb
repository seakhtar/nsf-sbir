Jekyll::Hooks.register :site, :after_init do |site|
  puts "--------------------"
  puts "starting awards updates".yellow
  awards_data = SiteData::AwardsData.new(site)
  awards_params = awards_data.create_params

  new_awards_data = awards_data.generate(awards_params)
  awards_data.update(awards_params, new_awards_data)

  # Duplicate above, but for porfolio
  # puts "--------------------"
  # puts "starting portfolio updates"
  # portfolio_data = SiteData::PortfolioData.new(site)
  # portfolio_params = portfolio_data.create_params

  # new_portfolio_data = portfolio_data.generate(portfolio_params)
  # portfolio_data.update(portfolio_params, new_portfolio_data)


  # Duplicate above, but for topics
  puts "--------------------"
  puts "starting topics updates".yellow
  topics_data = SiteData::TopicsData.new(site)
  topics_params = topics_data.create_params

  new_topics_data = topics_data.generate(topics_params)
  topics_data.update(topics_params, new_topics_data)

  puts "--------------------"
  puts "starting awards summary updates".yellow
  awards_summary = SiteData::AwardsSummary.new(site)
  awards_summary.generate
end
