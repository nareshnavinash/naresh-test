require_relative "../locators/all_weather_strategy.rb"
require_relative "../libraries/driver.rb"

module Pages
    
        class All_Weather_Strategy < Locators::All_Weather_Strategy
            
            def initialize(driver)
                super()
                @driver = driver
            end

            def is_all_weather_strategy_page_displayed?
                @ALL_WEATHER_STRATEGY_HEADER.wait_for_element(40)
            end

            def click_customise_portfolio
                @CUSTOMISE_PORTFOLIO.click
            end

            def is_customise_button_displayed?
                @CUSTOMISE.wait_for_element(40)
            end

            def click_customise_button
                @CUSTOMISE.click
            end
            
            def move_html_slider(move_slider_for,expected_value)
                result = false
                initial_slider_value = SLIDER_VALUE_FOR(move_slider_for).text
                expected_slider_value = expected_value
                on_click_and_hold_value = 49
                move_slider_from_click_and_hold = expected_value - on_click_and_hold_value
                for i in 1...30
                    SLIDER_FOR(move_slider_for).drag_and_drop_by(move_slider_from_click_and_hold,0)
                    sleep 1
                    slider_value = SLIDER_VALUE_FOR(move_slider_for).text.gsub!(/[^0-9]/, '').to_i
                    if slider_value == expected_value
                        result = true
                        break
                    end
                    move_slider_from_click_and_hold = move_slider_from_click_and_hold + 1
                end
                # Second try when the first try fails with more negative precision
                move_slider_from_click_and_hold = expected_value - on_click_and_hold_value - 5
                if result != true
                    for i in 1...30
                        SLIDER_FOR(move_slider_for).drag_and_drop_by(move_slider_from_click_and_hold,0)
                        sleep 1
                        slider_value = SLIDER_VALUE_FOR(move_slider_for).text
                        if slider_value == expected_value
                            result = true
                            break
                        end
                        move_slider_from_click_and_hold = move_slider_from_click_and_hold + 1
                    end
                end
                return result
            end

            def get_slider_value(value_for)
                return SLIDER_VALUE_FOR(value_for).text.gsub!(/[^0-9]/, '').to_i
            end

            def click_rebalance_button
                @REBALANCE.click
            end

            def is_rebalance_is_applied_properly?
                flag = false
                for i in 1...30 # to iterate and check the text for every 1 second
                    sleep 1
                    allocation_text = @ALLOCATION_TEXT.text
                    if allocation_text.include? "100"
                        flag = true
                        break
                    end
                end
                return flag
            end

            def click_invest_button
                @INVEST.click
            end

            def does_reset_button_is_displayed?
                @RESET.wait_for_element(30)
            end

            def add_new_stock(constituent,stock_name)
                ADD_STOCK(constituent).wait_for_element(30)
                ADD_STOCK(constituent).click
                ADD_STOCK_BUTTON_FOR(stock_name).wait_for_element(5)
                ADD_STOCK_BUTTON_FOR(stock_name).move_and_click
                sleep 1 # to wait until the entry gets added in portfolio
                @DONE.click
                sleep 1 # to wait until the popup graphic gets closed
            end

            def does_new_stock_added_to_constituent(constituent,stock_name)
                STOCK_LISTED_IN_CUSTOMIZE_PAGE(constituent,stock_name).wait_for_element(30)
            end
        end
end
