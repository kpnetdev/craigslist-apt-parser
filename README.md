craigslist-apt-parser
=====================
Can you improve upon Craigslist's UI? Of course you can! Do you love parsing nokogiri objects? Of course you don't!

Here's a quick little ruby method that returns a hash of all the useful listing fields.

###Instructions
Just fire up `irb` (or `pry`), require `getit.rb`, and run `#make_listing`, passing it the Craigslist URL as a string:

```sh
pry -r ./getit.rb
```
```ruby
pry(main)> make_listing "[some craigslist apt. rental listing]"
```
