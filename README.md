# giso-compiler
Docker compilation environment for giso program  


# Create a compilation container
```sudo docker run -tid --net=host -v /home/test:/root --name giso-build 784432821/giso-compiler:v1.0.0 /bin/bash```  
```sudo docker exec -ti giso-build /bin/bash```  


# Build the program
```cd /root/giso/build```  
```./build.sh e2000d```  

