require_relative "../locators/investment_ideas_page.rb"
require_rel "../libraries/driver.rb"

module Pages
    
        class Investment_Ideas_Page < Locators::Investment_Ideas_Page
            
            def initialize(driver)
                super()
                @driver = driver
            end

            def is_investment_ideas_page_displayed?
                @EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE.wait_for_element(40)
            end

            def click_all_weather_strategy
                @EXPLORE_INVESTMENT_IDEAS_FOR_ALL_WEATHER_PROFILE.click
            end

            
        end
end
