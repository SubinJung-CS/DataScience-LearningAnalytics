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
Learning Analytics is becoming one of the important subjects for Data Science. It is often recognised as the measurement of collection, analysis and reporting the data of learners and their surroundings. Especially, the main purpose of learning analytics focuses on delivering shared insights and finding efficient method of measuring engagement of learners. 

The massive open online course (MOOC) dataset, called “Cyber Security: Safety At Home, Online, and in Life”, is collected from its online method provider FutureLearn. It has been collected by 7 runs of online course and contains the learners’ progress and their profiles. 

The main objectives of this project is understanding who the main client base is and comprehending their needs in order to enabling to provide learners more essential learning materials. Examples of related business questions could be “What is the background/job of learners and does it affect to the engagement of course?” and “What is the average time to complete the course for learners and why?”

Especially, the project uses CRISP-DM to structure the investigation and ProjectTemplate to structure the analysis. The details can be found in the report.
