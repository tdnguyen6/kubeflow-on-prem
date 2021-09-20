#!/usr/bin/env python
import os
from os import path
import subprocess
from typing import Text

base_path = "apps/default"


def outfile(infile):
    return infile.replace("jsonnet", "yaml")


for dirpath, dirnames, filenames in os.walk(base_path):
    for filename in [
        f
        for f in filenames
        if (f.endswith(".jsonnet") or f.endswith(".yml") or f.endswith(".yaml"))
    ]:
        input_file = path.join(dirpath, filename)
        if filename.endswith(".jsonnet"):
            res = subprocess.run(
                args=[
                    "java",
                    "-jar",
                    "/usr/local/bin/sjsonnet",
                    "-J",
                    "/home/tidu/repos/jsonnet-lib-gen/gen/github.com/jsonnet-libs",
                    "-J",
                    "/home/tidu/repos/kubeflow-on-prem",
                    "--yaml-out",
                    "-n",
                    "2",
                    input_file,
                ],
                capture_output=True,
                text=True,
            )
            print(res.stdout.strip())
        else:
            with open(input_file, "r") as _file:
                print(_file.read())
        print("---")
