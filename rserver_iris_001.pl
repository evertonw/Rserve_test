use Statistics::RserveClient::Connection;


#use strict;
#use warnings;


my @lines;
my $line;
my @result ;
my @results1 ;
my @results2 ;
my @results3 ;
my @results4 ;

my $cnx = new Statistics::RserveClient::Connection('localhost');
print("connect.....\n");
@result1=$cnx->evalString("testData <- data.frame(Sepal.Length=5.0, Sepal.Width=3.6, Petal.Length=1.4, Petal.Width=0.2)");
print("1.\n");
@result2=$cnx->evalString("testPred <- predict(iris_ctree, newdata = testData)");
print("2.\n");
@result3=$cnx->evalString("testData$prediction <- testPred");
print("3.\n");
@result4= $cnx->evalString("str(testData)");
print("4.\n");
print "result4 = ", @result4, "\n";  

#
@result5 = $cnx->evalString("x='Hello, world!'; x");
print "results5 = ", $result5[0], "\n";  
@result6 = $cnx->evalString("x");
print "results6 = ", $result6[0], "\n";  

