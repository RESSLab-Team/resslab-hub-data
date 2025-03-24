# RESSLAB Hub Data Change Request

## Description of Changes
<!-- Please provide a brief description of the changes made in this pull request. -->
<!-- You can use the GitHub AI-generated description by adding the following line: -->
<!-- @copilot-generated-description -->

## Checklist for Data Validation Process


- [ ] I have forked or cloned the repository.
- [ ] I have created a new branch for my changes.
- [ ] I have made my changes in the appropriate CSV files.
- [ ] I have filled in all mandatory fields as per the data dictionary.
- [ ] I have used "NA" for missing values in nullable fields.
- [ ] I have ensured that all data types are correct according to the data dictionary.
- [ ] I have maintained referential integrity when deleting data.
- [ ] I have documented my changes in the commit message.
- [ ] I have followed the best practices for data quality and documentation.


## File Naming Convention Compliance
<!-- For connections database and other data categories -->

- [ ] I have followed the correct file naming convention:
  - For single author: `{Author's last name}_{Date}_{Specimen's designation}.csv`
  - For two authors: `{First author's last name}_and_{Second author's last name}_{Date}_{Specimen's designation}.csv`
  - For more than two authors: `{First author's last name}_et_al_{Date}_{Specimen's designation}.csv`
- [ ] I have used the correct date format (Year of publication, e.g., `2023`)
- [ ] I have maintained consistent specimen designation across related files

## Data Format Compliance

- [ ] All CSV files use UTF-8 encoding
- [ ] All CSV files use comma (,) as separator
- [ ] All dates follow the required format (dd.mm.yyyy or integer for year-only values)
- [ ] All numerical values use appropriate precision and units as specified in the data dictionary
- [ ] I have verified my changes against the data dictionary for the relevant data category

## [OPTIONAL] Validation Testing

- [ ] I have run local validation testing using:

## GitHub Copilot Insights
<!-- @copilot-generated-summary -->

## Additional Notes
<!-- Please include any additional information or context that may be helpful for reviewers. -->