Jekyll::Hooks.register :site, :after_init do |site|
  puts "--------------------"
  puts "starting awards updates..."
  awards_data = SiteData::AwardsData.new(site)
  awards_params = awards_data.create_params

  new_awards_data = awards_data.generate(awards_params)
  awards_data.update(awards_params, new_awards_data)

  # Duplicate above, but for portfolio
  puts "--------------------"
  puts "starting portfolio updates..."
  portfolio_data = SiteData::PortfolioData.new(site)
  portfolio_params = portfolio_data.create_params

  new_portfolio_data = portfolio_data.generate(portfolio_params)
  portfolio_data.update(portfolio_params, new_portfolio_data)

  puts "--------------------"
  puts "starting awards summary updates..."
  awards_summary = SiteData::AwardsSummary.new(site)
  awards_summary.generate

  puts "--------------------"
  puts "updating program directors..."
  program_directors = SiteData::ProgramDirectors.new(site)
  program_directors.generate

end
