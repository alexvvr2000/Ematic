from __future__ import annotations

from typing import List
from setuptools import setup, find_packages

classifiers: List[str] = [
    "Operating System :: Microsoft :: Windows :: Windows 10",
    "License :: OSI Approved :: MIT License",
    "Programming Language :: Python :: 3",
]

requisitos: List[str] = [lib.replace("\n","") for lib in open("requisitos_sis.txt", "r").readlines()]

setup(
    name="Ematic",
    description="Adminstracion de usuarios y envio de reportes",
    long_description=open("./README.md").read(),
    author="Alejandro Valenzuela Rivera",
    author_email="alejandrovalenzuela051@gmail.com",
    License="MIT",
    classifiers=classifiers,
    packages=find_packages(),
    install_requires=requisitos
)
