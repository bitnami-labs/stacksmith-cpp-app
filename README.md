
[![View in Stacksmith](https://img.shields.io/badge/view_in-stacksmith-00437B.svg)](https://stacksmith.bitnami.com/p/bitnami-public/apps/6f5953e0-1339-0137-c43e-62163b9b011a)

# C/C++ application: Simple Web Server

This is an example to show how to package a C++ web server application using [Bitnami Stacksmith](stacksmith.bitnami.com).

The application is taken from [https://github.com/eidheim/Simple-Web-Server](https://github.com/eidheim/Simple-Web-Server) repository and has the SSL/TLS support disabled to avoid issues with building inside CentOS 7 container.

## Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Create a new application and select the _Generic application (no pre-installed runtime)_ stack template.
3. Select the targets you are interested on (AWS, Kubernetes,...)
4. Upload the [http_examples](../../releases/download/v1.0.0/http_examples) file (which can be found in [releases](../../releases) for the project.
5. Upload the [_build.sh_](stacksmith/user-scripts/build.sh) script from the [_stacksmith/user-scripts/_](stacksmith/user-scripts/) folder.
6. Upload the [_run.sh_](stacksmith/user-scripts/run.sh) script from the [_stacksmith/user-scripts/_](stacksmith/user-scripts/) folder.
7. Click the <kbd>Create</kbd> button.
8. Launch it in [AWS](https://stacksmith.bitnami.com/support/quickstart-aws), [Azure](https://stacksmith.bitnami.com/support/quickstart-azure) or download the helm chart to run it in [Kubernetes](https://stacksmith.bitnami.com/support/quickstart-k8s)
9. Access your application: http://IP for AWS or http://IP:8080 for Kubernetes and Azure

## Scripts

There application requires a build script that sets up the application and a run script that starts it.

### build.sh

This script takes care of copying the application binary and creating an index`.html` file: Basically, it does:

* Copying of the application binary to `/opt/app`
* Ensure the binary has `0755` permissions and is executable
* Creates `/opt/app/web` folder with a sample `index.html` file

### run.sh

This script takes care of starting the application by performing the following:

* Change working directory to `/opt/app`
* Start the application binary

## Packaging the application from source code

The _http_examples_ file can also be created by building the application in the [_app/_](app/) folder.

The provided [build-with-docker.sh](build-with-docker.sh) script compiles the application using a CentOS 7 docker image. The output _http_examples_ binary is placed in the root folder of this repository after the build has succeeded.
