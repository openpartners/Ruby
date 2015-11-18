irb(main):001:0> PI = 3.14
=> 3.14
irb(main):002:0> PI = 3
(irb):2: warning: already initialized constant PI
(irb):1: warning: previous definition of PI was here
=> 3

# Imiona Class to prawie jak Stałe
irb(main):003:0> Item
NameError: uninitialized constant Item
	from (irb):3
	from /home/openpartners/.rbenv/versions/2.2.3/bin/irb:11:in `<main>'

irb(main):004:0> class Item; end
=> nil
irb(main):005:0> Item
=> Item

