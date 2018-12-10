1. Install RVM in the machine and do 'gem install bundler' in the folder path "../We_Invest_Automation_Suite"
2. Then give 'bundle install'
3. Required package will be installed from Gemfile
4. Now run the test by 'rspec spec/we_invest_model_portfolio.rb --format html > results/last_run.html'.
5. Normal html report will be in 'results/last_run.html'
6. Allure report can be get by giving following command lines
	a. 'allure genereate reports/allure'
	b. 'allure report open'
7. To run in headless mode uncomment the line '-headless' in 'run_parameters.yml' file