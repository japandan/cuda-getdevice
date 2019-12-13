# cuda-getdevice
reports cuda gpu specs

Compile these c programs with the following command.  Ommit the -arch flag if you are not sure wha

nvcc -o getDevice.total ./getDevice.total.cu -run

SAMPLE OUTPUT:

Device Number: 0
  Device name: Quadro P400
  CUDA Cores: 256
  Architecture: Pascal
  Memory Clock Rate (GHz): 2
  Memory Bus Width (bits): 64
  Peak Memory Bandwidth (GB/s): 32.080000

Device Number: 1
  Device name: Tesla K10.G2.8GB
  CUDA Cores: 1,536  Architecture: Kepler  Memory Clock Rate (GHz): 2  Memory Bus Width (bits): 256  Peak Memory Bandwidth (GB/s): 160.000000Device Number: 2  Device name: Tesla K10.G2.8GB  CUDA Cores: 1,536  Architecture: Kepler  Memory Clock Rate (GHz): 2  Memory Bus Width (bits): 256  Peak Memory Bandwidth (GB/s): 160.000000Total CUDA Cores: 3,328
