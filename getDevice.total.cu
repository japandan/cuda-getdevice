#include <stdio.h>
#include <string>
#include <iostream>
#include <locale.h>   

using namespace std; //no longer require std:: prefix for string functions
 
int getSPcores(cudaDeviceProp devProp, std::string& arch)
{  
    int cores = 0;
    int mp = devProp.multiProcessorCount;
    arch="unknown";

    switch (devProp.major){
     case 2: // Fermi
      arch="Fermi";
      if (devProp.minor == 1) cores = mp * 48;
      else cores = mp * 32;
      break;
     case 3: // Kepler
      arch="Kepler";
      cores = mp * 192;
      break;
     case 5: // Maxwell
      arch="Maxwell";
      cores = mp * 128;
      break;
     case 6: // Pascal
      arch="Pascal";
      if (devProp.minor == 1) cores = mp * 128;
      else if (devProp.minor == 0) cores = mp * 64;
      else printf("Unknown device type\n");
      break;
     case 7: // Volta and Turing
      arch="Volta|Turing";
      if ((devProp.minor == 0) || (devProp.minor == 5)) cores = mp * 64;
      else printf("Unknown device type\n");
      break;
     default:
      printf("Unknown device type\n"); 
      break;
      }
    return cores;
}



int main() {

  setlocale(LC_NUMERIC, ""); //adds comma for big numbers in printf


  string arch("undefined");
  cudaDeviceProp prop;
  int nDevices;
  int totalCores=0;
  int cudaCores=0;
  cudaGetDeviceCount(&nDevices);

  for (int i = 0; i < nDevices; i++) {
    cudaGetDeviceProperties(&prop, i);
    printf("Device Number: %d\n", i);
    printf("  Device name: %s\n", prop.name);
    cudaCores=getSPcores(prop, arch);
    printf("  CUDA Cores: %'d\n", cudaCores);
    totalCores=totalCores+cudaCores;
    cout<< "  Architecture: "+arch+"\n";
    printf("  Memory Clock Rate (GHz): %d\n",
           prop.memoryClockRate/1000000);
    printf("  Memory Bus Width (bits): %d\n",
           prop.memoryBusWidth);
    printf("  Peak Memory Bandwidth (GB/s): %f\n\n",
           2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);


  }

    printf("Total CUDA Cores: %'d\n", totalCores);
}
