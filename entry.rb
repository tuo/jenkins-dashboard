require 'rubygems'
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
require 'dashboard.rb'
require 'jenkins-remote-api'


while true
  ci_infos = Jenkins::Dashboard::YmlReader.parse(File.expand_path(File.dirname(__FILE__) + "/config.yml"))
  result_html = ""

  begin
    ci_infos.each do | ci_info |
      jobs_name  = ci_info[:jobs_name]
      ci_address = ci_info[:ci_address]

      jenkins_ci = Ci::Jenkins.new(ci_address)

      jobs_name = (jobs_name.nil? || jobs_name.empty?) ? jenkins_ci.list_all_job_names : jobs_name

      jobs_description = jenkins_ci.jobs_description

      jobs_description.each do |job_description|
        job_name = job_description[:name]
        if jobs_name.include? jobs_name
          clz = job_description[:status]
          worker = "[worker]"
          result_html <<  "<article class=\"#{clz}\" worker=\"#{worker}\"><header><h1>#{job_name}</h1></header></article>"
        end
      end
    end
    result_html << "<article class=\"message\" worker=\"[worker]\"><h1>#{Time.now.strftime("%Y-%m-%d at %I:%M:%S %p")}</h1></article>"
    result_html << "\n<script type=\"text/javascript\" src=\"build-controller.js\"></script>\n"
    File.open("local_dashboard_part.html", 'w') {|f| f.write(result_html) }
  rescue Exception=>e
    p "----cannot acess the dash html..........."  << e.inspect
    open("local_dashboard_part.html", 'w') { |f|
      f.puts "<h1> Oooooooooooooops</h1> \n<h4>Error on reading ci infos. Try again..........</h4>"
    }
  end
  p "----retrieving from dashboard.html, and wait 8 seconds ................"
  sleep 8
end
