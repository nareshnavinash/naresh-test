# require_rel "../pages/"
require_rel "../libraries/locator_identifier.rb"

module Locators
	class Final_Page
		
		attr_accessor :SUMMARY_PAGE_HEADER

		def initialize
			@SUMMARY_PAGE_HEADER = Locator::Identifier.new(:xpath,"//h3[contains(text()[normalize-space()],'our recommended investment plan and all the details you')]")
		end

		def EQUITY_VALUE_FOR(identifier)
			@EQUITY_VALUE_FOR = Locator::Identifier.new(:xpath,"//ul[contains(@class,'constituent-list')]//span[contains(text(),'#{identifier}')]/parent::div/parent::div/div[3]/span[1]") 
		end
		
	end
end
