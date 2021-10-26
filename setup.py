from setuptools import setup, find_packages
import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name="dsp-metadata-gui",
    version="0.0.0",
    description="Python GUI tool to collect metadata for DSP projects.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/dasch-swiss/dsp-metadata-conversion",
    author="Balduin Landolt",
    author_email="balduin.landolt@dasch.swiss",
    license="Apache 2.0",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache 2.0",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.9.0",
    install_requires=[
    ],
    entry_points={
        "console_scripts": [
            "convert-metadata=src.converter.converter:cli",
        ],
    },
    include_package_data=True,
    zip_safe=False,
)
