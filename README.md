# dsp-metadata-conversion
Python CLI for converting project metadata from JSON to RDF

## Installation

Install the converter using pip.

```bash
pip install dsp-metadata-conversion
```

## Usage

### CLI

After installing using pip, a command line entrypoint is installed in your local python environment.

> If using a virtual environment, the entry point will only be available when the environment is activated.

The entry point can be called with the command `convert-metadata`. This takes a required positional argument for the path of the file/directory to be converted. An optional flag `-d` marks the path as a directory which will be used for bulk conversion.

The script will read one or many JSON files, as specified in the path passed as the first argument, and convert it to three files: JSON-LD, Turtle and RDF-XML. These will be saved in the same directory as the JSON file is located. If the files already exist, they will be overwritten.

#### Help

Calling `convert-metadata -h` will show the program's help menu.

#### Example

To convert a single file, call

```bash
convert-metadata data/rosetta.json
```

To bulk convert all JSON files in a directory, call

```bash
convert-metadata data/ -d
```

### In python scripts

After installing via pip, the package can be imported as `converter`.

Example usage:

```python
# import the converter
from converter import converter

# read a JSON file
with open('data/rosetta.json', mode='r', encoding='utf-8') as f:
    json_data = f.read()

# convert JSON to a rdflib.Graph
graph = converter.convert_string(json_data, 'nope')

# print all subjects, predicates and objects in the graph
print("Graph:")
for s, p, o in graph:
    print(s, p, o)
```
