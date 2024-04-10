# A parallel framework on hybrid architectures for raster-based geospatial cellular automata models
Geospatial cellular automata (Geo-CA) models have encountered challenges in computing efficiency and scalability when conducting large-scale land use change simulation applications. Parallel computing has proven to be effective to address these challenges. We propose a parallel framework on hybrid parallel computing architectures applicable for raster-based Geo-CA models to enhance their computing efficiency and scalability while maintaining simulation accuracy. The framework can parallelize both land use transition rule mining and land use change simulation.  
The framework was employed to parallelize MCCA, a modern and widely-used Geo-CA model, as an example. We provide the executable program of the parallel version of MCCA here, along with test data and usage instructions.  

## 1. mcMCCA
Mixed Cell Cellullar Automata ([MCCA](https://github.com/HPSCIL/Mixed_Cell_Cellullar_Automata.git)) is an up-to-date and widely-used Geo-CA model. The parallelized model of MCCA is named mcMCCA.   
mcMCCA consists of two modules: one for land use transition rule mining (named mcLEAS) and the other for land use change simulation (named mcCARS). In the transition rule mining module, the transition suitability maps are predicted using land use expansion map and the driving factors of land use changes. In the land use change simulation module, land use data and the predicted transition suitability maps are employed to simulate future land use maps. mcMCCA and MCCA maintain the same input data standards. For further details on data standards, please refer to the introduction of MCCA ([MCCA](https://github.com/HPSCIL/Mixed_Cell_Cellullar_Automata.git)). Additionally, mcMCCA introduces additional data requirements:
- All data should be in GeoTIFF format (using .tif or .TIF as the file name extension).
- All GeoTIFF files should have the same geographic extent, Coordinate Reference System (CRS), number of cells, and resolution.

## 2. The running environment
mcMCCA and mcMCCA are compiled and run in the following environment:
- Operating System: Ubuntu 20.04.3 LTS ([ubuntu-20.04.3-desktop-amd64.iso](http://lt.releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso))  
The third-party libraries we use for compilation include:
- OpenMPI: 2.1.6 ([openmpi-4.0.4.tar.gz](https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.4.tar.gz))
- CUDA: 11.4 ([cuda-11.4](https://developer.nvidia.com/cuda-11-4-0-download-archive))
- GDAL: 1.11.5 ([gdal-1.11.5.tar.gz](http://download.osgeo.org/gdal/1.11.5/gdal-1.11.5.tar.gz))
- TIFF: 4.1.0 ([tiff-4.1.0.tar.gz](https://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz))  
It is recommended to execute mcMCCA in the same runtime environment; otherwise, some third-party libraries may be missing. You can create an issue to report problems in this repository, or contact Mr. Zhewei Liang (liangzw@cug.edu.cn) for further support.  

## 3. File structure
Folder "mcMCCA" contains the program and sample data for mcMCCA, including three subfolders:
- mcMCCA_RFR/:      The program for land use transition rule mining module
  - mcMCCA_RFR:     The executable program
  - parameters.txt: Parameter file
  - runRFR.sh:      Shell file to run the program
- mcMCCA_simulate/: The program for land use change simulation module
  - mcMCCA:         The executable program
  - parameters.txt: Parameter file
  - runmcMCCA.sh:   Shell file to run the program
- Data/:            Test data
  - DrivingFactor/: The driving factors of land use changes
  - LULCs/:         Land use maps and land expansion map
  - OpenWater.tif:  water body data of Wuhan city,  as "conversion constrains" 

## 4. To run
0. You need to use [MCCA](https://github.com/HPSCIL/Mixed_Cell_Cellullar_Automata.git) for data preprocessing.
1. Edit the parameter file, primarily adjusting the data paths to match those on your computer.
2. If you are running it on a single computer, use the following command to run the shell script file:  
- $ ./runXXX.sh  
3. If you are running it on a computing cluster, you may edit the shell script file to match your hardware environment, such as the number of computing nodes and available devices on each node. Then, run the shell script file (using a Slurm platform as an example):  
- $ sbatch ./runXXX.sh
