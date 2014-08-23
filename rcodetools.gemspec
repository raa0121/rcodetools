PKG_REVISION = ".2"
$:.unshift "lib" if File.directory? "lib"
require 'rcodetools/xmpfilter'
require 'rake/testtask'
include Rcodetools
RCT_VERSION  = XMPFilter::VERSION
PKG_FILES = FileList[
  "bin/xmpfilter", "bin/rct-*", "bin/ruby-toggle-file", "bin/rbtest",
"lib/**/*.rb",
"CHANGES", "rcodetools.*", "icicles-rcodetools.el", "anything-rcodetools.el",
"README", "README.*", "THANKS", 
"Rakefile", "Rakefile.method_analysis",
"setup.rb",
"test/**/*.rb","test/**/*.taf"
]
Gem::Specification.new do |s|
  s.name = "rcodetools"
  s.version = RCT_VERSION + PKG_REVISION
  s.summary = "rcodetools is a collection of Ruby code manipulation tools"
  s.description = <<EOF
rcodetools is a collection of Ruby code manipulation tools. 
It includes xmpfilter and editor-independent Ruby development helper tools,
as well as emacs and vim interfaces.

Currently, rcodetools comprises:
* xmpfilter: Automagic Test::Unit assertions/RSpec expectations and code annotations
* rct-complete: Accurate method/class/constant etc. completions
* rct-doc: Document browsing and code navigator
* rct-meth-args: Precise method info (meta-prog. aware) and TAGS generation
EOF
  s.files = PKG_FILES.to_a
  s.require_path = 'lib'
  s.author = "rubikitch and Mauricio Fernandez"
  s.email = %{"rubikitch" <rubikitch@ruby-lang.org>, "Mauricio Fernandez" <mfp@acm.org>}
  s.homepage = "http://eigenclass.org/hiki.rb?rcodetools"
  s.bindir = "bin"
  s.executables = %w[rct-complete rct-doc xmpfilter rct-meth-args ruby-toggle-file rct-fork]
  s.has_rdoc = true
  s.extra_rdoc_files = %w[README]
  s.rdoc_options << "--main" << "README" << "--title" << 'rcodetools'
  s.test_files = Dir["test/test_*.rb"]
  s.license = 'Ruby'
  s.post_install_message = <<EOF

==============================================================================

rcodetools will work better if you use it along with FastRI, an alternative to
the standard 'ri' documentation browser which features intelligent searching,
better RubyGems integration, vastly improved performance, remote queries via
DRb... You can find it at http://eigenclass.org/hiki.rb?fastri and it is also
available in RubyGems format:

gem install fastri

Read README.emacs and README.vim for information on how to integrate
rcodetools in your editor.

==============================================================================

EOF

end
