# resslab-tools-data

## Commands

```bash
# remove prefix
for file in prefix*; do mv "$file" "${file#prefix}";done;

# remove suffix
for file in *suffix.csv; do mv "$file" "${file%suffix.csv}.csv";done;
```
