# Resslab Hub Data

This repository contains the DB underlying [RESSLAB Hub](https://resslab-hub.epfl.ch/). The `main` branch points to the website in production, the `test` branch points to the [test deployement](https://resslab-hub-test.epfl.ch/). See [RESSLAB Hub's repository](https://github.com/RESSLab-Team/resslab-hub).  
Automated data upload pipeline is still under active development and testing. 

## Data documentation

### Data dictionaries
Data dictionaries are available as CSVs in each tab's folder, e.g. `steel_braces_data_dictionary.csv`. They contain:
- column_name : column name all lowercase, no spaces
- type : choose type among : `Numeric` (general type for numbers), `DecimalFloat` (floating-point number with high precision), `SmallInteger` (integer smaller than 30 000),  `BigInteger` (big integer, e.g 10^9),  `Integer` (any integer), `String` (text), `Date` (date in format dd.mm.yyyy. If date is a year only, make it integer - eventually will update to [ISO format](https://fr.wikipedia.org/wiki/ISO_8601)), `Boolean` (binary as 1/0 or True/False)
- example_value (optional) : sample value for this column 
- symbol (optional) : symbol in markdown format, for automated documentation generation
- description : plain text description of the column, for future users
- unit (optional) : units acceptable. None if unitless. 
- nullable : True if this column accepts NA. (Clarify distinction NA/NR for the user).

### File naming conventions 
Currently documented only for [Connections DB](https://github.com/RESSLab-Team/resslab-hub-data/blob/main/connections/README.md)


## Process to compress & upload data

```bash
tar --exclude-vcs -czf data.tar.gz *

# all
curl -L http://127.0.0.1:8000/upload/?type=all -F file=@data.tar.gz -u user:changeit

# all-brace
curl -L http://127.0.0.1:8000/upload/?type=all-brace -F file=@data.tar.gz -u user:changeit
```

