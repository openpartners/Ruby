# C F v r

argv = ARGV
n = argv[0].to_i

def fibonacci_r(n)
   n <= 1 ? n :  fibonacci_r( n - 1 ) + fibonacci_r( n - 2 ) 
end
p fibonacci_r( n )