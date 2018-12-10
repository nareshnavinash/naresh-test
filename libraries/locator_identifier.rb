require_relative '../libraries/driver.rb'

module Locator
	class Identifier

		attr_accessor :how
    	attr_accessor :what


    	def initialize(how,what)
	      @how = how
	      @what = what
	      @run_data = YAML.load_file("#{__dir__}/../run_parameters.yml")
	    end

	    def click
	        Driver::Driver.get_driver.find_element(self.how,self.what).click
	    end

	    def move_and_click
	    	@driver = Driver::Driver.get_driver
			element = @driver.find_element(self.how,self.what)
			@driver.action.move_to(element).click.perform
		end

	    def wait_for_element(timeout=@run_data['implicit_wait'])
			Driver::Driver.get_driver.manage.timeouts.implicit_wait = timeout
			begin
				return Driver::Driver.get_driver.find_element(self.how,self.what).displayed?
			rescue
				Driver::Driver.get_driver.manage.timeouts.implicit_wait = @run_data['implicit_wait']
				return false
			ensure
				Driver::Driver.get_driver.manage.timeouts.implicit_wait = @run_data['implicit_wait']
			end
		end

		def enabled?(timeout=@run_data['implicit_wait'])
			Driver::Driver.get_driver.manage.timeouts.implicit_wait = timeout
			begin
				return Driver::Driver.get_driver.find_element(self.how,self.what).enabled?
			rescue
				Driver::Driver.get_driver.manage.timeouts.implicit_wait = @run_data['implicit_wait']
				return false
			ensure
				Driver::Driver.get_driver.manage.timeouts.implicit_wait = @run_data['implicit_wait']
			end
		end

		def execute_script(script)
			@driver = Driver::Driver.get_driver
			@driver.execute_script(script)
		end

		def send_keys(text)
			Driver::Driver.get_driver.find_element(self.how,self.what).send_keys text
		end

		def text
			return Driver::Driver.get_driver.find_element(self.how,self.what).text
		end

		def drag_and_drop_by(x_axis,y_axis)
			@driver = Driver::Driver.get_driver
			element = @driver.find_element(self.how,self.what)
			@driver.action.click_and_hold(element).perform
			@driver.action.drag_and_drop_by(element,x_axis,y_axis).perform
		end

		def click_and_hold
			@driver = Driver::Driver.get_driver
			element = @driver.find_element(self.how,self.what)
			@driver.action.click_and_hold(element).perform
		end


	end
end
