module Driver
	class Driver
		
		attr_accessor :driver
    	@driver = nil
    	@run_data = YAML.load_file("#{__dir__}/../run_parameters.yml")


    	def initialize(browser = @run_data['browser'])
	      begin
	        open_browser(browser)
	      rescue Exception => e
	        puts e.message
	        open_browser(browser)
	      end
	    end

	    def self.open_browser(browser = @run_data['browser'])

	    	case browser

	    	when 'chrome'
	    		switches = @run_data['switches']
	    		dimensions = @run_data['dimensions']

	    		options = Selenium::WebDriver::Chrome::Options.new
	    		switches.map { |k| options.add_argument(k) }

	    		@driver = Selenium::WebDriver.for(:chrome, options: options)

	    		target_size = Selenium::WebDriver::Dimension.new(dimensions["horizontal"], dimensions["vertical"])
      			@driver.manage.window.size = target_size
      			
	    		@driver.manage.timeouts.implicit_wait = @run_data['implicit_wait']
	    		return @driver

	    	else
	    		raise "#{browser} -- unknown browser, specify a valid browser"
			end

	    end

	    def self.get(url)
	      @driver.get(url)
	    end

		def self.get_driver
			return @driver
		end

		def self.resize_to(horizontal,vertical)
			@driver.manage.window.resize_to(horizontal,vertical)
		end

		def self.get_current_screen_resolution
			size = @driver.manage.window.size
			horizontal = size.to_s.split("=")[1].split(',')[0]
			vertical = size.to_s.split("=")[2].split('>')[0]
			return "#{horizontal} X #{vertical}"
		end

	end
end
