Jekyll::Hooks.register :site, :after_init do |site|
  awards_data = SiteData::AwardsData.new(site)
  awards_params = awards_data.create_params

  new_awards_data = awards_data.generate(awards_params)
  awards_data.update(awards_params, new_awards_data)

  awards_summary = SiteData::AwardsSummary.new(site)
  awards_summary.generate
end
