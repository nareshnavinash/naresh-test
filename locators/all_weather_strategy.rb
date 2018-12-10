# require_rel "../pages/*.rb"
require_rel "../libraries/locator_identifier.rb"

module Locators
	class All_Weather_Strategy
		
		attr_accessor :ALL_WEATHER_STRATEGY_HEADER
		attr_accessor :CUSTOMISE_PORTFOLIO
		attr_accessor :CUSTOMISE
		attr_accessor :REBALANCE
		attr_accessor :ALLOCATION_TEXT
		attr_accessor :INVEST
		attr_accessor :RESET
		attr_accessor :ADD_STOCK
		attr_accessor :DONE


		def initialize
			@ALL_WEATHER_STRATEGY_HEADER = Locator::Identifier.new(:xpath,"//div[@class='row model-portfolio-name']//div[contains(text() [normalize-space()],'ALL WEATHER STRATEGY')]")
			@CUSTOMISE_PORTFOLIO = Locator::Identifier.new(:xpath,"//a[contains(@class,'btn-customize-portfolio')]")
			@CUSTOMISE = Locator::Identifier.new(:xpath,"//a[contains(@class,'model-portfolio-btn')][text()='Customise']")
			@REBALANCE = Locator::Identifier.new(:xpath,"//a[contains(@class,'model-portfolio-btn')][text()='Rebalance']")
			@ALLOCATION_TEXT = Locator::Identifier.new(:xpath,"//div[contains(@class,'constituents-table-header')]//div[contains(@class,'text-center')]")
			@INVEST = Locator::Identifier.new(:xpath,"//a[contains(@class,'model-portfolio-btn')][text()='Invest Now']")
			@RESET = Locator::Identifier.new(:xpath,"//a[contains(@class,'model-portfolio-btn')][text()='Reset']")
			@DONE = Locator::Identifier.new(:xpath,"//div[@class='modal fade in']//button[text()='Done']")
		end

		def ADD_STOCK(identifier)
			@ADD_STOCK = Locator::Identifier.new(:xpath,"//div[contains(@class,'portfolio-constituents')]//div[contains(text(),'#{identifier}')]/parent::div/div[contains(@class,'add-stock')]")
		end

		def ADD_STOCK_BUTTON_FOR(identifier)
			@ADD_STOCK_BUTTON_FOR = Locator::Identifier.new(:xpath,"//div[@class='modal fade in']//div[contains(@class,'modal-body')]//a[contains(text(),'#{identifier}')]/parent::div/parent::div//button[text()='Add Stock']")
		end

		def STOCK_LISTED_IN_CUSTOMIZE_PAGE(constituent,stock_name)
			@STOCK_LISTED_IN_CUSTOMIZE_PAGE = Locator::Identifier.new(:xpath,"//div[text()='#{constituent}']/parent::div/parent::div/parent::div//a[text()='#{stock_name}']/parent::div/parent::div[contains(@class,'constituent-row')]")
		end
		
		def SLIDER_FOR(identifier)
			@SLIDER_FOR = Locator::Identifier.new(:xpath,"//div[contains(@class,'constituent-row')]//a[contains(text()[normalize-space()],'#{identifier}')]/parent::div/parent::div//input") # sample xpath Locator::Identifier.new(:xpath,"//div[text()=#{identifier}]") 
		end

		def SLIDER_VALUE_FOR(identifier)
			@SLIDER_VALUE_FOR = Locator::Identifier.new(:xpath,"//div[contains(@class,'constituent-row')]//a[contains(text()[normalize-space()],'#{identifier}')]/parent::div/parent::div//div[@class='col-md-3']")
		end

		
	end
end
