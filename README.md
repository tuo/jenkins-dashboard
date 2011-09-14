Jenkins Dashboard
=============

A project aims at help you show status of build in blue(building), red(failure), green(success) box on jenkins. 

Why
-------

It's very important to radiate build status on jenkins(passively). So that everybody in the team can just raise your head
a little bit and take a look at the builds on screen(it could be in big TV),whether it is red/blue/green. Also it borrows very similar metaphor from Test Driven Development rhythm. Red color box means that build is failed, someonebody in the team may need to take a look at it;Green means "yep, success";Blue means that build currently is building; Grey means that build is aborted or disabled.

![Prototype](http://tuohuang.thoughtworkers.org/wp-content/uploads/2011/09/jenkins-dashboard.jpg "Optional title")

Installation
-----------

    git clone git://github.com/tuo/jenkins-dashboard.git
		cd jenkins-dashboard
		gem install bundler
		bundle install


	Then open config.yml to add your jenkins ci address and jobs name you want to show on dashboard like following:
	
		-
		    :ci_address: http://ci.jruby.org/view/Ruboto/
		    :jobs_name: [ruboto-core, ruboto-core_pads]
		
	Then run from command line: 
		open main.html -a safari
		ruby entry.rb
		

Contribute
------------
This project is still working in progress.
Want to contribute? Email to: clarkhtse@gmail.com