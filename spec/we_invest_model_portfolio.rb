require 'spec_helper'
require_relative "../libraries/driver.rb"
require_relative "../pages/all_weather_strategy.rb"
require_relative "../pages/final_page.rb"
require_relative "../pages/home_page.rb"
require_relative "../pages/investment_ideas_page.rb"

describe "We Invest Model Portfolio" do
    before(:all) do |e|
      @driver = Driver::Driver.open_browser
      @driver_home_page = Pages::Home_Page.new(@driver)
      @driver_investment_ideas_page = Pages::Investment_Ideas_Page.new(@driver)
      @driver_all_weather_strategy_page = Pages::All_Weather_Strategy.new(@driver)
      @driver_final_page = Pages::Final_Page.new(@driver)
      @run_data = YAML.load_file("#{__dir__}/../run_parameters.yml")
      @test_data = YAML.load_file("#{__dir__}/../test-data/test_data_model_portfolio.yml")
      @model_protfolio = @test_data["model_protfolio"]
      @test1_data = @test_data["model_protfolio_test1"]
      @test2_data = @test_data["model_protfolio_test2"]
      @test3_data = @test_data["model_protfolio_test3"]
    end

    before(:each) do
      @driver.get(@model_protfolio['url']) # refreshing to home page
    end

    after(:all) do
      @driver.quit
    end

    after(:each) do |e|
      #when ever there is a failure screen shot will be saved in the specified path with unique name.
      unless e.exception.nil?
          begin
            e.attach_file('Driver 1', File.new(@driver.save_screenshot(File.join(Dir.pwd, "results/#{UUID.new.generate}.png"))))
          rescue Exception => e
            puts e.message
            puts e.backtrace
          end
      end
    end

    it "1. In model portfolio -> All Weather strategy -> Customize Portfolio -> Change SPDR S&P 500 ETF TRUST SPY US EQUITY value to 50 -> Invest -> verify the value of SPDR in next page" do |e|
      
      e.step "Does home page is displayed?" do
        expect(@driver_home_page.is_home_page_displayed?).to eql true
      end
      e.step "Does 'All Weather Strategy' is displayed on clicking the 'Explore investment ideas' ?" do
        @driver_home_page.click_explore_investment_ideas
        expect(@driver_investment_ideas_page.is_investment_ideas_page_displayed?).to eql true
      end
      e.step "Does 'All Weather Strategy' page is displayed?" do
        @driver_investment_ideas_page.click_all_weather_strategy
        expect(@driver_all_weather_strategy_page.is_all_weather_strategy_page_displayed?).to eql true
      end
      e.step "Does 'Customise' option is displayed after clicking on 'Customise_portfolio' button" do
        @driver_all_weather_strategy_page.click_customise_portfolio
        expect(@driver_all_weather_strategy_page.is_customise_button_displayed?).to eql true
      end
      e.step "Does the options become editable on clicking Customise button and reset button is displayed?" do
        @driver_all_weather_strategy_page.click_customise_button
        expect(@driver_all_weather_strategy_page.does_reset_button_is_displayed?).to eql true
      end
      e.step "Does the slider value for '#{@test1_data['equity_name']}' is changed to 50%" do
        @driver_all_weather_strategy_page.move_html_slider("#{@test1_data['equity_name']}",@test1_data['slider_value'])
        expect(@driver_all_weather_strategy_page.get_slider_value("#{@test1_data['equity_name']}")).to eql @test1_data['slider_value']
      end
      e.step "Does 'Rebalance' is applied properly?'" do
        @driver_all_weather_strategy_page.click_rebalance_button
        expect(@driver_all_weather_strategy_page.is_rebalance_is_applied_properly?).to eql true
      end
      e.step "Does 'Invest' is applied properly?" do
        @driver_all_weather_strategy_page.click_invest_button
        expect(@driver_final_page.is_final_page_displayed?).to eql true
      end
      e.step "Does the value for '#{@test1_data['equity_name']}' is displayed correctly in the last page?" do
        equity_name_in_final_page = "#{@test1_data['equity_name']}".split(" ")[0]
        expect(@driver_final_page.get_display_value_in_final_page_for(equity_name_in_final_page)).to eql @test1_data['slider_value']
      end

    end
    
    it "2. In model portfolio -> All Weather strategy -> Customize Portfolio -> Add a stock BT Group plc -> verify if the stock added to portfolio" do |e|

      e.step "Does home page is displayed?" do
        expect(@driver_home_page.is_home_page_displayed?).to eql true
      end
      e.step "Does 'All Weather Strategy' is displayed on clicking the 'Explore investment ideas' ?" do
        @driver_home_page.click_explore_investment_ideas
        expect(@driver_investment_ideas_page.is_investment_ideas_page_displayed?).to eql true
      end
      e.step "Does 'All Weather Strategy' page is displayed?" do
        @driver_investment_ideas_page.click_all_weather_strategy
        expect(@driver_all_weather_strategy_page.is_all_weather_strategy_page_displayed?).to eql true
      end
      e.step "Does 'Customise' option is displayed after clicking on 'Customise_portfolio' button" do
        @driver_all_weather_strategy_page.click_customise_portfolio
        expect(@driver_all_weather_strategy_page.is_customise_button_displayed?).to eql true
      end
      e.step "Does the options become editable on clicking Customise button and reset button is displayed?" do
        @driver_all_weather_strategy_page.click_customise_button
        expect(@driver_all_weather_strategy_page.does_reset_button_is_displayed?).to eql true
      end
      e.step "Add the #{@test2_data['stock_name']} stock to the portfolio?" do
        @driver_all_weather_strategy_page.add_new_stock("#{@test2_data['constituent']}","#{@test2_data['stock_name']}")
      end
      e.step "Does the added stock is listed in Customise portfolio page" do
        expect(@driver_all_weather_strategy_page.does_new_stock_added_to_constituent("#{@test2_data['constituent']}","#{@test2_data['stock_name']}")).to eql true
      end
      e.step "Does 'Rebalance' is applied properly?'" do
        @driver_all_weather_strategy_page.click_rebalance_button
        expect(@driver_all_weather_strategy_page.is_rebalance_is_applied_properly?).to eql true
      end
      e.step "Does 'Invest' is applied properly?" do
        @driver_all_weather_strategy_page.click_invest_button
        expect(@driver_final_page.is_final_page_displayed?).to eql true
      end
      
    end

    it "3. Verify the recomendations and choices values in normal browser size -> verify the same values at mobile resolution" do |e|

      e.step "Does home page is displayed?" do
        expect(@driver_home_page.is_home_page_displayed?).to eql true
      end
      e.step "Does recomendations and choices values are present in the home page?" do
        expect(@driver_home_page.is_recomended_portfolio_value_is_displayed?).to eql true
        expect(@driver_home_page.is_other_portfolio_value_is_displayed?).to eql true
      end
      e.step "Get the value of recomendations and choice from the display" do
        @recomendation_value = @driver_home_page.get_current_recomended_portfolio_value
        @choice_value = @driver_home_page.get_current_other_portfolio_value
      end
      e.step "Resize the browser" do
        Driver::Driver.resize_to(@test3_data['screen_horizontal'],@test3_data['screen_vertical'])
      end
      e.step "Get the current screen resolution and verify with the given value" do
        @screen_size_after_change = Driver::Driver.get_current_screen_resolution
        expect(@screen_size_after_change).to eql "400 X #{@test3_data['screen_vertical']}" # since chrome driver's horizontal resolution is not reduced less than 400
      end
      e.step "Get the value of recomendations and choice from the display after resize" do
        @recomendation_value_after_change_in_screen = @driver_home_page.get_current_recomended_portfolio_value_in_mobile
        @choice_value_after_change_in_screen = @driver_home_page.get_current_other_portfolio_value_in_mobile
      end
      e.step "Validate the values after and before change in screen resolution" do
        expect(@recomendation_value_after_change_in_screen).to eql @recomendation_value
        expect(@choice_value_after_change_in_screen).to eql @choice_value
      end

    end




end
