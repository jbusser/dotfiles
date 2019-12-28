# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your ~/.bash_profile:

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
