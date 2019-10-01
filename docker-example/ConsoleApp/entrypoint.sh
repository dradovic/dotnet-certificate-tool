#!/usr/bin/env bash

usage()
{
    echo "Please enter the following arguments: \
    --cert_filepath: pfx certificate file path. \
    --cert_password: pfx certificate password. \
    --cert_thumbprint: certification thumbprint."
}

cert_filepath=""
cert_password=""
cert_thumbprint=""

while [[ "$1" != "" ]]; do
    case $1 in
        --cert_filepath )         shift
                                cert_filepath=$1
                                ;;
        --cert_password )       shift
                                cert_password=$1
                                ;;
        --cert_thumbprint )     shift
                                cert_thumbprint=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo ${cert_filepath}

./certificate-tool add -f ${cert_filepath} -t ${cert_thumbprint} -p ${cert_password}

dotnet ./ConsoleApp.dll