use Statistics::RserveClient::Connection;

my $cnx = new Statistics::RserveClient::Connection('localhost');
my @result = $cnx->evalString("x='Hello, world!'; x");
print("$result[0]\n") 
