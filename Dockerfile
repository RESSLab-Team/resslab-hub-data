# The data repo packed as an image. Nothing runs here, it only carries the CSV
# files. In the hub's k8s cluster an init container copies /data into a shared
# volume, then the backend image uploads it to the database (see the
# resslab-hub-upload-data CronJob in the enack8s-app-config repo).
#
# alpine, not scratch: the init container needs a shell and cp.
FROM alpine:3.20

COPY . /data
