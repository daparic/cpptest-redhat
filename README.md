### Description

This Docker container image has both [Parasoft C/C++test Professional](https://docs.parasoft.com/display/CPPTESTPROEC20231) and [Parasoft C/C++test Standard](https://docs.parasoft.com/display/CPPTEST20231) tools installed 
under `/opt/parasoft/` folder inside the container:

- /opt/parasoft/cpptest-professional/cpptest/ (Professional)
- /opt/parasoft/cpptest-standard/cpptest/ (Standard)

### Build Image

```
git clone https://github.com/daparic/cpptest-redhat
cd cpptest-redhat/
docker build -t cpptest-redhat .
```

### Run a container from image

```
docker run -it --rm cpptest-redhat bash
ls -l /opt/parasoft/
```

### Additional Reference

- https://hub.docker.com/r/parasoft/cpptest
