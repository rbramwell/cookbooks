default[:kitchen][:chef][:url] = "https://s3.amazonaws.com/singlestone/binaries/chefdk-0.3.0-1.x86_64.rpm"
default[:kitchen][:chef][:package] = "/tmp/chef.rpm"

default[:kitchen][:javascript][:runtime][:url] = "http://nodejs.org/dist/v0.10.35/node-v0.10.35-linux-x64.tar.gz"
default[:kitchen][:javascript][:runtime][:package] = "/tmp/node.tar.gz"

default[:kitchen][:docs][:repo] = "https://github.com/test-kitchen/kitchen-docs.git"

default[:kitchen][:packages] = [ "git", "ruby-devel", "gcc-c++" ]

default[:gem_hash] = {
	"bootstrap-sass" => {
		version: "3.3.1.0",
		extension: "gem"
	},
	"bundler" => {
		version: "1.7.12",
		extension: "gem"
	},
	"markdown-server" => {
		version: "0.1.1",
		extension: "gem"
	},
	"middleman" => {
		version: "3.3.7",
		extension: "gem"
	},
	"middleman-livereload" => {
		version: "3.4.2",
		extension: "gem"
	},
	"middleman-syntax" => {
		version: "2.0.0",
		extension: "gem"
	},
	"pry" => {
		version: "0.10.1",
		extension: "gem"
	},
	"redcarpet" => {
		version: "3.2.2",
		extension: "gem"
	},
	"slim" => {
		version: "3.0.1",
		extension: "gem"
	},
	"therubyracer" => {
		version: "0.12.1",
		extension: "gem"
	}
}