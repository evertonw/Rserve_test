use Statistics::RserveClient::Connection;




my $cnx = new Statistics::RserveClient::Connection('localhost');

  

#@result = $cnx->evalString(qq!table <- read.table("C:/Users/Everton Elliott/Documents/RPERL/Rserve_test/data_freq.txt.out" , header=T, row.names=2);!);

@result = $cnx->evalString(qq!saveAsPng <- TRUE!);

# A quick google on "Everglades data csv" and you can find this dataset
# of High Accuracy Elevation Data (HEAD) for the Everglades:

#   http://sofia.usgs.gov/exchange/desmond/desmondelev.html

# We will pick the bigger of the CSV files and read it in as a 'dataframe'.


# ------- READING IN DATA FROM A URL -------------------------------------------

@result = $cnx->evalString(qq!cat("Reading in large Everglades file ...")!);
print "$result[0]\n";

@result = $cnx->evalString(qq!everglades_df <-read.csv("C:/Users/Everton Elliott/Documents/RPERL/Rserve_test/HAED_v01_full.csv", header=T, dec=".",sep=",")!);
#@result = $cnx->evalString(qq!everglades_df <- read.csv(con)!);
@result = $cnx->evalString(qq!everglades_df <-read.csv("HAED_v01_full.csv", header=T, dec=".",sep=",")!);

@result = $cnx->evalString(qq!cat("Completed Reading in large Everglades file ...")!);
print "$result[0]\n";

# ------- QUICK LOOK AT A DATAFRAME --------------------------------------------

@result = $cnx->evalString(qq!dim(everglades_df)!);
print "@result\n";

# Nice! 57,395 records with 8 variables each.

# Now let's get an overview of the structure of this dataframe.

@result = $cnx->evalString(qq!str(everglades_df)!);
print "@result\n" ;
# We have some 'factors' (aka 'categorical variables'):
#   SUR_METHOD, SUR_FILE, SUR_INFO, VEG_FS, Quad_Name
#
# And we have some 'numerics':
#   ELEV_M, X_UTM, Y_UTM

# Let's pull out and rename the variables that are likely to be interesting.
