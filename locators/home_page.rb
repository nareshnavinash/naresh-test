# require_relative "../pages/home_page.rb"
require_relative "../libraries/locator_identifier.rb"

module Locators
	class Home_Page
		
		attr_accessor :INVESTMENT_THEMES
		attr_accessor :EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE
		attr_accessor :RECOMENDED_PORTFOLIOS
		attr_accessor :OTHER_PORTFOLIOS
		attr_accessor :RECOMENDED_PORTFOLIOS_MOBILE
		attr_accessor :OTHER_PORTFOLIOS_MOBILE

		def initialize
			@INVESTMENT_THEMES = Locator::Identifier.new(:xpath,"//nav[contains(@class,'navbar')]//a[contains(@href,'model-portfolio')]")
			@EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE = Locator::Identifier.new(:xpath,"//div[@class='model-portfolio-name'][contains(text(),'All Weather Strategy')]/parent::div/parent::div//a[contains(@href,'weather_portfolio')]")
			@RECOMENDED_PORTFOLIOS = Locator::Identifier.new(:xpath,"//ul[contains(@class,'model-portfolio-navs')]//a[contains(@href,'#selected-model-portfolios')]")
			@OTHER_PORTFOLIOS = Locator::Identifier.new(:xpath,"//ul[contains(@class,'model-portfolio-navs')]//a[contains(@href,'#remaining-model-portfolios')]")
			@RECOMENDED_PORTFOLIOS_MOBILE = Locator::Identifier.new(:xpath,"//ul[contains(@class,'model-portfolio-navs mobile')]//a[contains(@href,'#selected-model-portfolios')]")
			@OTHER_PORTFOLIOS_MOBILE = Locator::Identifier.new(:xpath,"//ul[contains(@class,'model-portfolio-navs mobile')]//a[contains(@href,'#remaining-model-portfolios')]")
		end
		

		
	end
end
