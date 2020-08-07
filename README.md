### Smart Pension Tech Test

### Run
```sh
$ git clone git@github.com:jaarnie/smart-pension-test.git
$ bundle install
$ ruby lib/run.rb
```


### Tests
```sh
$ rspec
```


### Approach
I started off by figuring out which gems I would need to deliver the code and settled on using 'terminal-table' to output the data in a nice way and opted for RSpec and Pry for testing/development.

I then went on to create the classes with empty but named methods and did a similar thing for the spec, writing out expectations in the 'it' block. Once I was happy with the general runthrough of how the program would work, I set about writing the tests and then writing the methods to sastisfy said tests.

### Thoughts

I haven't really done TDD before so this exercise was a good introduction into mapping out how the logic should work via test definitions rather than writing tests to fit the methods.
