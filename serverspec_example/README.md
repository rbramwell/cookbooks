serverspec_example Cookbook
===========================
This cookbook is designed purely as an example for Serverspec tests.  It installs Jenkins and Apache along with a few dependencies and provides support for automatically running Serverspec tests via Test Kitchen. Test Kitchen will automatically forward ports 8080 and 80 from the test virtual machine to 9000 and 9001 on the host so that Jenkins and Apache are visible. 


Requirements
------------
To run the example, make sure Xcode command line tools, Git, Vagrant, and VirtualBox are installed.  Then, install the test-kitchen and kitchen-vagrant RubyGems.

e.g.
#### packages
- `Xcode command line tools`
- `git`
- `Vagrant`
- `VirtualBox`

#### gems
- `test-kitchen`
- `kitchen-vagrant`



Attributes
----------
TODO: Refactor cookbook to use attributes.

Usage
-----
#### serverspec_example::default

Just run `kitchen verify` from the serverspec_example root and wait.  Run `kitchen destroy` to clean up the test instance.

License and Authors
-------------------
Authors: Dave Tashner 2015

