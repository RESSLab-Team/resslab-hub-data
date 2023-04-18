# resslab-hub-data

## `Connections` Database

---

[Connections Database README](https://github.com/RESSLab-Team/resslab-hub-data/blob/main/connections/README.md): Data Type Convention, File Naming Convention, Database Variable Description

## Compress & upload data

```bash
tar --exclude-vcs -czf data.tar.gz *
curl -L http://127.0.0.1:8000/upload/?type=all -F file=@data.tar.gz -u user:changeit
```
