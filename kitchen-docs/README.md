kitchen-docs Cookbook
=====================
This cookbook installs the Test Kitchen documentation on a server behind a firewall.  Proxy access will be required to get to GitHub.

The server starts in the background on port 11899 by default.  If running in Test Kitchen, the default port that Middleman starts on (4567) is forwarded to port 11899 (see .kitchen.yml). Security groups/firewalls must be opened to view the site.  Some HTML elements appear to be unavailable, not sure why.  Access to rubygems.org is assumed, include gems cookbook to overwrite /root/.gemrc if using a custom source.

Requirements
==============
*Package requirements include:*

libxml2

libxml2-devel

libxslt-devel

gcc-c++

ruby-devel

git

nc (purely for testing proxy)

*Gem requirements include:*

bootstrap-sass

bundler

middleman

middleman-livereload (optional)

middleman-syntax

pry

redcarpet

slim

therubyracer (consider replacing with better JavaScript runtime, like node)


Attributes
----------
See attributes/default.rb

Usage
-----
Ensure the kitchen-docs cookbook is available on the Chef Server or locally.  Ensure the git package is available on the system.
#### kitchen-docs::default

Include `kitchen-docs` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[kitchen-docs]"
  ]
}
```

Testing
-------
Full ServerSpec coverage has been added for this cookbook in ~/kitchen-docs/test/integration/serverspec/server_spec.rb.  To execute the tests, run 'kitchen verify [BOX_NAME]'. 

Contributing
------------
Wanna help?

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Dave Tashner 2015
