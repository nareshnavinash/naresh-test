require_relative "../locators/final_page.rb"
require_relative "../libraries/driver.rb"

module Pages
        class Final_Page < Locators::Final_Page
            
            def initialize(driver)
                super()
                @driver = driver
            end

            def is_final_page_displayed?
                @SUMMARY_PAGE_HEADER.wait_for_element(40)
            end

            def get_display_value_in_final_page_for(value_for)
                EQUITY_VALUE_FOR(value_for).text.to_i 
            end

        end
end
