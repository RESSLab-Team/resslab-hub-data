# Resslab Hub Data

This repository contains the DB underlying [RESSLAB Hub](https://resslab-hub.epfl.ch/). The `main` branch points to the website in production, the `test` branch points to the [test deployement](https://resslab-hub-test.epfl.ch/). See [RESSLAB Hub's repository](https://github.com/RESSLab-Team/resslab-hub).  
Automated data upload pipeline is still under active development and testing. 

## Data documentation

### Data dictionaries
Data dictionaries are available as CSVs in each tab's folder, e.g. `steel_braces_data_dictionary.csv`. They contain:
- column_name : column name all lowercase, no spaces
- type : choose type among : `Numeric` (general type for numbers), `DecimalFloat` (floating-point number with high precision), `SmallInteger` (integer smaller than 30 000),  `BigInteger` (big integer, e.g 10^9),  `Integer` (any integer), `String` (text), `Date` (date in format dd.mm.yyyy. If date is a year only, make it integer - eventually will update to [ISO format](https://fr.wikipedia.org/wiki/ISO_8601)), `Boolean` (yes/no)
- example_value (optional) : sample value for this column 
- symbol (optional) : symbol in markdown format, for automated documentation generation
- description : plain text description of the column, for future users
- unit (optional) : units acceptable. None if unitless. 
- nullable : True if this column accepts NA. (Clarify distinction NA/NR for the user).

### File naming conventions 
Currently documented only for [Connections DB](https://github.com/RESSLab-Team/resslab-hub-data/blob/main/connections/README.md)


## Data validation
# Data Validation Process Guide

This guide explains how to add, modify, or delete data in the repository while ensuring data quality through our automated validation system.

## Prerequisites

1. A GitHub account
2. Basic understanding of Git (clone, commit, push)
3. Access to the repository

## Process Overview

1. Fork/Clone the repository
2. Create a new branch
3. Make your changes
4. Submit a Pull Request (PR)
5. Wait for validation checks
6. Address any validation issues
7. Get approval and merge

## Detailed Steps

### 1. Prepare Your Working Environment

```bash
#Clone the repository
git clone <repository-url>
cd <repository-name>
#Create a new branch
git checkout -b data/your-changes-description
```


### 2. Making Changes

You can modify data in any of these directories:
- `braces/`
- `columns/`
- `connections/`
- `hss_columns/`
- `material/`
- `residual_stresses/`

### Important Note About Commits

When making changes:
- You can make multiple commits while working on your changes
- The validation pipeline will check the total diff between your branch and the base branch
- All commits will and must be squashed during the PR merge
- The CI pipeline on 'main' uses only the final squashed commit for validation (diff between HEAD~1 and HEAD)

This means you can:
- Make frequent small commits as you work
- Iterate and fix validation issues with new commits
- Not worry about keeping a "clean" commit history

But remember:
- The PR must be set to "Squash and merge" when merging
- The final squashed commit message should clearly describe all changes


#### Adding New Data
1. Open the relevant CSV file
2. Add your new row(s) following the existing format
3. Ensure all mandatory fields (nullable=false in data dictionary) are filled
4. Use "NA" (not empty cells) for missing values in nullable fields

#### Modifying Existing Data
1. Locate the row(s) you want to modify
2. Make your changes while maintaining the correct format
3. Document your changes in the commit message

#### Deleting Data
1. Remove the relevant row(s)
2. Ensure referential integrity is maintained
3. Document the reason for deletion in the commit message

### 3. Commit and Push Changes

```bash
#Stage your changes
git add path/to/modified/file.csv
#Commit with a descriptive message
git commit -m "data: add/modify/delete [brief description] \
Detailed explanation of changes \
Reference to source documents if applicable"
#Push to your branch
git push origin data/your-changes-description
```

### 4. Create a Pull Request

1. Go to GitHub repository
2. Click "New Pull Request"
3. Select your branch
4. Fill in the PR template
5. Add relevant labels
6. Submit the PR

### 5. Validation Process

The automated validation will check:
- CSV format integrity
- Data types correctness
- Required fields presence
- Value ranges and constraints
- Cross-references integrity

If validation fails:
1. Check the GitHub Actions tab for detailed error messages
2. Make necessary corrections in your branch
3. Push the updates
4. Validation will run automatically again

### 6. Common Validation Errors and Solutions

| Error | Solution |
|-------|----------|
| "Invalid data type" | Check the data_dictionary.csv for correct type |
| "Missing required field" | Ensure all non-nullable fields have values |
| "Value out of range" | Verify the value meets the specified constraints |
| "Invalid format" | Ensure dates, numbers, etc. follow the required format |
| "NA in non-nullable field" | Provide a valid value for mandatory fields |

### 7. Best Practices

1. **One Change Per PR**: Keep changes focused and related
2. **Documentation**: 
   - Reference source documents
   - Explain significant changes
   - Note any special considerations
3. **Data Quality**:
   - Double-check values before submitting
   - Use consistent units
   - Follow naming conventions
4. **Communication**:
   - Respond to reviewer comments promptly
   - Ask questions if validation errors are unclear

### 8. Getting Help

- Check the data dictionary for field specifications
- Review existing data for examples
- Open an issue for questions
- Contact repository maintainers for clarification

## Notes

- The validation process is automatic and runs on every PR
- All changes must pass validation before merging
- Reviewers may request additional changes even if validation passes
- Keep PR discussions focused on the data changes


## Process to compress & upload data

```bash
tar --exclude-vcs -czf data.tar.gz *

# all
curl -L http://127.0.0.1:8000/upload/?type=all -F file=@data.tar.gz -u user:changeit

# all-brace
curl -L http://127.0.0.1:8000/upload/?type=all-brace -F file=@data.tar.gz -u user:changeit
```

