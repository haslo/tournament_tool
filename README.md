Tournament Tool
===

What is it?
---

* A tournament management software for TOs - definitely for Android:Netrunner, but extendable (and will probably be extended early for X-Wing and MtG)
* An automatic pairing system for Swiss rounds and the cut to top X
* A mobile-friendly and showscreen-friendly ranking list and schedule view
* A little bit of an anonymized statistics view for TOs and interested parties

Deployment
---

The application is not prepared for deployment yet. Will probably be deployable on Heroku.

Development with Ruby, Rails
---

This application started out using Ruby 2.2 Preview 1 and Rails 4.2 Beta 1.

`.ruby-version` and `.ruby-gemset` point to reasonable values. So when you have RVM, just...

```sh
rvm install 2.2-preview1
cd <repository>
bundle install
```

...and you're ready to run with `rails s`. If you want to have IPv4 bindings (and thus be able to use QR codes locally), please use `rails s -b 0.0.0.0`.

Test Suite
---

RSpec in `/spec` and Cucumber in `/features`. Run either one with its binary, or the suite with `rake` (it's the default task).

Used Tools
---

In addition to the gems in the `Gemfile`:

* https://developer.android.com/design/style/typography.html
* http://www.fontsquirrel.com/
* https://github.com/MWDelaney/Netrunner-Icon-Font

ToDo
---

Lots of stuff - almost everything, in fact. Links:

* http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/ and https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
* https://github.com/zumbrunnen/betastore/commit/7fabe1e6917ecb7c05ce5df4fc212da1fc0ef087
