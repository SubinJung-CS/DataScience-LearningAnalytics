# CSC8631_MOOC

## Getting Started
Before loading a project, running `setwd('Type Path Here')` is required with
the file path. Instead of this you can simply click the 'Session' in the task bar
at the top left and 'Set working directory' -> 'Choose Directory' to find the location
of your file.

After that, you need to run the following two lines of R code (This is already written in both analysis.R and CSC8631_MOOC_report.Rmd):

	library('ProjectTemplate')
	load.project()

After you enter the second line of code, you'll see a series of automated
messages as ProjectTemplate goes about doing its work. This work involves:


* Reading in the global configuration file contained in `config`.
* Loading any R packages you listed in the configuration file.
* Reading in any datasets stored in `data` or `cache`.
* Preprocessing your data using the files in the `munge` directory.

NB: The library installation may be required, then use `install.packages('Type Library Name Here')` to install the libraries which are in `config\golbal.dcf`.

## File Guidance
This project has some main files that you should have a look:


- `analysis.R`: This file is in `src` directory and you can find the structure of plots/graphs.
- `01-A.R`: This file is in `munge` directory and includes a preprocessing on dataset.
- `CSC8631_MOOC_report.Rmd`: This file is located in `reports` directory and have a content of main report. 
- `CSC8631_Reflective Report.pdf`: This file is located in `reports` directory and have a content of reflective report. 

## About
This project uses CRISP-DM to structure the investigation and ProjectTemplate to structure the analysis. The details can be found in the report.
