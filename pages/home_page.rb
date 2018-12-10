require_relative "../locators/home_page.rb"
require_rel "../libraries/driver.rb"

module Pages

        class Home_Page < Locators::Home_Page
            
            def initialize(driver)
                super()
                @driver = driver
            end

            def is_home_page_displayed?
                @INVESTMENT_THEMES.wait_for_element(40)
            end

            def click_explore_investment_ideas
                @INVESTMENT_THEMES.click
            end

            def is_recomended_portfolio_value_is_displayed?
                @RECOMENDED_PORTFOLIOS.wait_for_element(30)
            end

            def is_other_portfolio_value_is_displayed?
                @OTHER_PORTFOLIOS.wait_for_element(30)
            end

            def get_current_recomended_portfolio_value
                @RECOMENDED_PORTFOLIOS.wait_for_element(5)
                text = @RECOMENDED_PORTFOLIOS.text
                return text.gsub!(/[^0-9]/, '')
            end

            def get_current_other_portfolio_value
                @OTHER_PORTFOLIOS.wait_for_element(5)
                text = @OTHER_PORTFOLIOS.text
                return text.gsub!(/[^0-9]/, '')
            end

            def get_current_recomended_portfolio_value_in_mobile
                @RECOMENDED_PORTFOLIOS_MOBILE.wait_for_element(5)
                text = @RECOMENDED_PORTFOLIOS_MOBILE.text
                return text.gsub!(/[^0-9]/, '')
            end

            def get_current_other_portfolio_value_in_mobile
                @OTHER_PORTFOLIOS_MOBILE.wait_for_element(5)
                text = @OTHER_PORTFOLIOS_MOBILE.text
                return text.gsub!(/[^0-9]/, '')
            end

        end
end
