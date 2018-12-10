require_rel "../pages/*.rb"
require_rel "../libraries/locator_identifier.rb"

module Locators
	class Investment_Ideas_Page
		
		attr_accessor :EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE

		def initialize
			@EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE = Locator::Identifier.new(:xpath,"//div[@class='model-portfolio-name'][contains(text(),'All Weather Strategy')]/parent::div/parent::div//a[contains(@href,'weather_portfolio')]")
		end
		

		
	end
end
