# giso-compiler
Docker compilation environment for giso program  


# Create a compilation container
```sudo docker run -tid --net=host -v /home/test:/root --name giso-build giso-compile /bin/bash```  
```sudo docker exec -ti giso-build /bin/bash```  


# Build the program
```cd /root/giso/build```  
```./build.sh e2000d```  

