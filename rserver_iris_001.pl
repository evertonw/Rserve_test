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
my @results5 ;
my @results6 ;
my @results7 ;
my @results8 ;

my $cnx = new Statistics::RserveClient::Connection('localhost');
print("connect.....\n");
@result1=$cnx->evalString("testData <- data.frame(Sepal.Length=5.0, Sepal.Width=3.6, Petal.Length=1.4, Petal.Width=0.2)"); # setosa
@result5= $cnx->evalString("toString(testData)");
print "result5.0 = ", $result5[0], "\n";  
print "result5.1 = ", $result5[1], "\n";  
@result4= $cnx->evalString("capture.output(print(testData))");
print "result4 = ", $result4[0], "\n";  
print "result4 = ", $result4[1], "\n";  
print "result4 = ", $result4[2], "\n";  
print("1.\n");
@result2=$cnx->evalString("testPred <- predict(iris_ctree, newdata = testData)");
print("2.\n");
@result3=$cnx->evalString("testData$prediction <- testPred");
print("3.\n");
@result4= $cnx->evalString("capture.output(print(testData))");
print("4.\n");
print "result4 = ", $result4[0], "\n";  
print "result4 = ", $result4[1], "\n";  
print "result4 = ", $result4[2], "\n";  
#
@result5= $cnx->evalString("toString(testData)");
print("5.\n");
print "result5.0 = ", $result5[0], "\n";  
print "result5.1 = ", $result5[1], "\n";  
#
@result6= $cnx->evalString("toString(testData$prediction)");
print("6.\n");
print "prediction result6.0 = ", $result6[0], "\n";  
print "prediction result6.1 = ", $result6[1], "\n";  
#
@result7 = $cnx->evalString("x='Hello, world!'; x");
print "results6 = ", $result7[0], "\n";  
@result8 = $cnx->evalString("x");
print "results7 = ", $result8[0], "\n";  

