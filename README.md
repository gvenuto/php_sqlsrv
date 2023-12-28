# Dockerfile for PHP and Apache with Microsoft SQL Server Support

This Dockerfile sets up a PHP and Apache environment with added support for Microsoft SQL Server. It utilizes the webdevops/php-apache image based on PHP 8.2.

## Prerequisites

Before building the image, make sure you have Docker installed on your system.

## Instructions

Follow these steps to build and run the Docker image:

1. Copy the contents of this Dockerfile into a file named `Dockerfile`.
2. Open a terminal and navigate to the directory containing the `Dockerfile`.
3. Run the following command to build the Docker image:

    ```bash
    docker build -t your_image_name .
    ```

4. Once the image is built, you can run a container:

    ```bash
    docker run -p 80:80 -d your_image_name
    ```

Replace `your_image_name` with the desired name for your Docker image.

## Features

This Dockerfile includes the following features:

- Installs Microsoft ODBC Driver 17 for SQL Server.
- Installs Microsoft SQL Server command-line tools.
- Installs necessary dependencies for SQL Server connectivity.
- Configures the locale to use UTF-8 encoding.
- Installs the SQL Server extensions for PHP using `pecl`.
- Configures PHP to load the SQL Server extensions.

## Configuration

The Dockerfile makes the following configuration changes:

- Adds Microsoft GPG key for package verification.
- Adds Microsoft package repository to `apt` sources.
- Updates the package list and installs required packages.
- Modifies OpenSSL configuration to use TLSv1.0 and set the cipher string, suitable for environments without SSL certificates and typically used in insecure, local environments.

## Note

Ensure that you replace `your_image_name` with a meaningful name for your Docker image.

Feel free to customize this Dockerfile according to your specific requirements.
