### Database Profile Example

##### --------- Install the package

remotes::install_github("OHDSI/DbDiagnostics")

# Call the library
library(DbDiagnostics)

# Turn off the connection pane to speed up run time
options(connectionObserver = NULL)

# Set up connectionDetails to connect to the database
connectionDetails <- DatabaseConnector::createConnectionDetails(
	dbms = "postgresql",
	server = "localhost/synthea",
	user = "postgres",
	password = Sys.getenv("POSTGRES_PW"),
	pathToDriver = ""
)

# The schema where your CDM-structured data are housed
cdmDatabaseSchema <- ""

# The schema where your achilles results are or will be housed
resultsDatabaseSchema <- ""

# The schema where your vocabulary tables are housed, typically the same as the cdmDatabaseSchema
vocabDatabaseSchema <- cdmDatabaseSchema

# A unique, identifiable name for your database
cdmSourceName <- ""

# The folder where your results should be written
outputFolder <- ""

# The version of the OMOP CDM you are currently on, v5.3 and v5.4 are supported.
cdmVersion <- "5.4"

# Whether the function should append existing Achilles tables or create new ones
appendAchilles <- FALSE

# The schema where any missing achilles analyses should be written. Only set if appendAchilles = FALSE
writeTo <- ""

# Whether to round to the 10s or 100s place. Valid inputs are 10 or 100, default is 10.
roundTo <- 10

# Vector of concepts to exclude from the output. Note: No patient-level data is pulled as part of the package or included as part of the output
excludedConcepts <- c()

# Whether the DQD should be run as part of the profile exercise
addDQD <- FALSE

# execute the database profile function
DbDiagnostics::executeDbProfile(connectionDetails = connectionDetails,
																cdmDatabaseSchema = cdmDatabaseSchema,
																resultsDatabaseSchema = resultsDatabaseSchema,
																writeTo = writeTo,
																vocabDatabaseSchema = vocabDatabaseSchema,
																cdmSourceName = cdmSourceName,
																outputFolder = outputFolder,
																cdmVersion = cdmVersion,
																appendAchilles = appendAchilles,
																roundTo = roundTo,
																excludedConcepts = excludedConcepts,
																addDQD = addDQD
)
